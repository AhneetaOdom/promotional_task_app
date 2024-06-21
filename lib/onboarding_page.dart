import 'package:flutter/material.dart';
import 'package:promotional_task3/button_widget.dart';
import 'package:promotional_task3/create_account_page.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/onboarding1.png'),
            RichText(
              textAlign: TextAlign.center,
              softWrap: true,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome To Life Organise',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Task App ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 79, 121, 192),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
              child: Text(
                'This application Will Help You Organise every little task in your life.',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: ButtonWidget(
                text: 'Continue',
                clickButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccountPage()),
                  );
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have An Account?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Text(' Create Account',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
            )
          ]),
    ));
  }
}
