import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotional_task3/screens/home_page.dart';

class CreateAccountController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      passwordController;
  var name = '';
  var email = '';
  var password = '';
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

// Name validation
  String? validateName(String value) {
    if (value.isEmpty || value.length <= 4) {
      return 'Name Must contain more than 4 characters';
    }
    return null;
  }

// Email validation
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an Email Address';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a Valid Email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String value) {
    if (value.isEmpty || value.length <= 8) {
      return 'Password must Contain atleast 8 characters';
    }
    return null;
  }

  void submit() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    Get.off(const Home());
  }
}

// Text(
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
