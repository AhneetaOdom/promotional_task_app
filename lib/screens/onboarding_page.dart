import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotional_task3/widgets/reusable_widgets/button_widget.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/utils/constants/images.dart';
import 'package:promotional_task3/utils/constants/size.dart';
import 'create_account_page.dart';

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
            Image.asset(AppImages.onboardingImage),
            RichText(
              textAlign: TextAlign.center,
              softWrap: true,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome To Life Organise',
                    style: TextStyle(
                        color: black,
                        fontSize: AppSize.fontSizeXlg,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  TextSpan(
                    text: ' Task App ',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: AppSize.fontSizeXlg,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                        color: black,
                        fontSize: AppSize.fontSizeXlg,
                        fontWeight: AppSize.fontWeightBold),
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
                style: TextStyle(color: black, fontSize: AppSize.fontSizeMd),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              
              child: ButtonWidget(
                text: 'Continue',
                clickButton: () {
                  Get.off( const CreateAccountPage());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const CreateAccountPage()),
                  // );
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have An Account?',
                  style: TextStyle(
                      fontSize: AppSize.fontSizeSm,
                      fontWeight: AppSize.fontWeightNormal),
                ),
                Text(
                  ' Create Account',
                  style: TextStyle(
                      fontSize: AppSize.fontSizeSm,
                      fontWeight: AppSize.fontWeightNormal),
                ),
              ],
            )
          ]),
    ));
  }
}
