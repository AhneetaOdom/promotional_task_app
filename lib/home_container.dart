import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({super.key, required this.text1, required this.text2, required this.total});

  final String text1;
  final String text2;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue.shade50),
              child: Text(
                text1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            Text(
              text2,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 15),
            Text(
              total.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
