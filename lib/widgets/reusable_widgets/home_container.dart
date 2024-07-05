import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/utils/constants/size.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.total});

  final String text1;
  final String text2;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 20, top: 20, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primaryColor50),
              child: Text(
                text1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSize.mediumDefaultSpace),
            Text(
              text2,
              style: TextStyle(
                  color: grey50,
                  fontSize: AppSize.fontSizeXxs,
                  fontWeight: AppSize.fontWeightW400),
            ),
            const SizedBox(height: AppSize.mediumDefaultSpace),
            Text(
              total.toString(),
              style: const TextStyle(
                  color: black,
                  fontSize: AppSize.fontSizeBg,
                  fontWeight: AppSize.fontWeightBold),
            ),
          ],
        ),
      ),
    );
  }
}
