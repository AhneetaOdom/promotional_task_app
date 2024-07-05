import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/size.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.textName,
    required this.textDescription,
    required this.time,
    required this.press,
  });

  final String textName, textDescription, time;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.mediumDefaultSpace),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 1.5),
                          shape: BoxShape.circle),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.smallDefaultSpace,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                            fontSize: AppSize.fontSizeXs,
                            fontWeight: AppSize.fontWeightNormal,
                            color: grey50),
                      ),
                      Text(
                        textName,
                        style: const TextStyle(
                            fontSize: AppSize.fontSizeXs,
                            fontWeight: AppSize.fontWeightNormal,
                            color: grey),
                      ),
                      Text(
                        textDescription,
                        style: const TextStyle(
                            fontSize: AppSize.fontSizeSm,
                            fontWeight: AppSize.fontWeightBold),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.edit_note_outlined,
                        color: grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.smallDefaultSpace,
                  ),
                  GestureDetector(
                    onTap: press,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.delete_outlined,
                        color: grey,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
