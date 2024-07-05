import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/controllers/create_account_controller.dart';
import 'package:promotional_task3/utils/constants/size.dart';
import 'package:promotional_task3/widgets/reusable_widgets/button_widget.dart';
import 'package:promotional_task3/widgets/reusable_widgets/secondary_button.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CreateAccountController());
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: controller.loginFormKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: AppSize.mediumDefaultSpace),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: AppSize.fontSizeLg,
                        fontWeight: AppSize.fontWeightBold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: AppSize.mediumDefaultSpace,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: AppSize.fontSizeMd,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.spaceBfrFields,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                    onSaved: (value) {
                      controller.name = value!;
                    },
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  const SizedBox(
                    height: AppSize.spaceBtwFields,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: AppSize.fontSizeMd,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.spaceBfrFields,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },

                    // password
                  ),
                  const SizedBox(
                    height: AppSize.spaceBtwFields,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: AppSize.fontSizeMd),
                  ),
                  const SizedBox(
                    height: AppSize.spaceBfrFields,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                  ),
                  const SizedBox(
                    height: AppSize.spaceBfrFields,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: black,
                        size: AppSize.fontSizeSm,
                      ),
                      Text(
                        'The password should have at least 8 charcters',
                        style: TextStyle(
                            fontSize: AppSize.fontSizeSm, color: black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.mediumDefaultSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'I accept',
                                style: TextStyle(
                                    fontSize: AppSize.fontSizeSm,
                                    color: black)),
                            TextSpan(
                              text: ' your terms and conditions',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: AppSize.fontSizeSm,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.toggle_on, color: primaryColor),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.mediumDefaultSpace,
                  ),
                  ButtonWidget(
                    text: 'Register',
                    clickButton: () {
                      controller.submit();
                    },
                  ),
                  const SizedBox(
                    height: AppSize.mediumDefaultSpace,
                  ),
                  const Center(
                    child: Text(
                      'Or Register With',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: AppSize.fontSizeXs, color: black),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.smallDefaultSpace,
                  ),
                  const SecondaryButton(),
                  const SizedBox(
                    height: AppSize.smallDefaultSpace,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont Have an Account?',
                        style: TextStyle(
                            fontSize: AppSize.fontSizeSm, color: black),
                      ),
                      Text(
                        ' Sign In',
                        style: TextStyle(
                            fontSize: AppSize.fontSizeSm,
                            fontWeight: AppSize.fontWeightBold),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

//Form validation using the default state management
// class CreateAccountPage extends StatefulWidget {
//   const CreateAccountPage({super.key});

//   @override
//   State<CreateAccountPage> createState() => _CreateAccountPageState();
// }

// class _CreateAccountPageState extends State<CreateAccountPage> {
//   final _formKey = GlobalKey<FormState>();
//   final isLoading = false;
//   void _submit() {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//     Get.off(HomePage());
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//             key: _formKey,
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//               child: ListView(
//                 children: [
//                   const SizedBox(height: AppSize.mediumDefaultSpace),
//                   const Text(
//                     "Create Account",
//                     style: TextStyle(
//                         fontSize: AppSize.fontSizeLg,
//                         fontWeight: AppSize.fontWeightBold),
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(
//                     height: AppSize.mediumDefaultSpace,
//                   ),
//                   const Text(
//                     "Name",
//                     style: TextStyle(
//                       fontSize: AppSize.fontSizeMd,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: AppSize.spaceBfrFields,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty || value.length <= 3) {
//                         return "Must have more than 4 characters ";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: AppSize.spaceBtwFields,
//                   ),
//                   const Text(
//                     "Email",
//                     style: TextStyle(
//                       fontSize: AppSize.fontSizeMd,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: AppSize.spaceBfrFields,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter an email address';
//                       } else if (!RegExp(
//                               r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                           .hasMatch(value)) {
//                         return 'Please input a valid email address';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: AppSize.spaceBtwFields,
//                   ),
//                   const Text(
//                     "Password",
//                     style: TextStyle(fontSize: AppSize.fontSizeMd),
//                   ),
//                   const SizedBox(
//                     height: AppSize.spaceBfrFields,
//                   ),
//                   TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty || value.length < 8) {
//                           return "Password must Contain atleast 8 characters";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       )),
//                   const SizedBox(
//                     height: AppSize.spaceBfrFields,
//                   ),
//                   const Row(
//                     children: [
//                       Icon(
//                         Icons.check_circle_outline_rounded,
//                         color: black,
//                         size: AppSize.fontSizeSm,
//                       ),
//                       Text(
//                         'The password should have at least 8 charcters',
//                         style: TextStyle(
//                             fontSize: AppSize.fontSizeSm, color: black),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: AppSize.mediumDefaultSpace,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       RichText(
//                         text: const TextSpan(
//                           children: [
//                             TextSpan(
//                                 text: 'I accept',
//                                 style: TextStyle(
//                                     fontSize: AppSize.fontSizeSm,
//                                     color: black)),
//                             TextSpan(
//                               text: ' your terms and conditions',
//                               style: TextStyle(
//                                 color: primaryColor,
//                                 fontSize: AppSize.fontSizeSm,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Icon(Icons.toggle_on, color: primaryColor),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: AppSize.mediumDefaultSpace,
//                   ),
//                   ButtonWidget(
//                     text: 'Register',
//                     clickButton: () {
//                       _submit();
//                     },
//                   ),
//                   const SizedBox(
//                     height: AppSize.mediumDefaultSpace,
//                   ),
//                   const Center(
//                     child: Text(
//                       'Or Register With',
//                       textAlign: TextAlign.center,
//                       style:
//                           TextStyle(fontSize: AppSize.fontSizeXs, color: black),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: AppSize.smallDefaultSpace,
//                   ),
//                   const SecondaryButton(),
//                   const SizedBox(
//                     height: AppSize.smallDefaultSpace,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Dont Have an Account?',
//                         style: TextStyle(
//                             fontSize: AppSize.fontSizeSm, color: black),
//                       ),
//                       Text(
//                         ' Sign In',
//                         style: TextStyle(
//                             fontSize: AppSize.fontSizeSm,
//                             fontWeight: AppSize.fontWeightBold),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
