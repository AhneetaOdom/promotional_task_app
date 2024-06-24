import 'package:flutter/material.dart';
import 'package:promotional_task3/home_page.dart';
import 'package:promotional_task3/secondary_button.dart';
import 'package:promotional_task3/button_widget.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length <= 3) {
                        return "Must have more than 4 characters ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value)) {
                        return 'Please input a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Password must Contain atleast 8 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.black26,
                          size: 14,
                        ),
                        Text(
                          'The password should have at least 8 charcters',
                          style: TextStyle(fontSize: 14, color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'I accept',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                              TextSpan(
                                text: ' your terms and conditions',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 79, 121, 192),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.toggle_on,
                          color: Color.fromARGB(255, 79, 121, 192),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    text: 'Register',
                    clickButton: () {
                      _submit();
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Center(
                      child: Text(
                        'Or Register With',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black26),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15),
                    child: SecondaryButton(),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont Have an Account?',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        ' Sign In',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
