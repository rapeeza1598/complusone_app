import 'package:complusone_app/controller/controller.dart';
import 'package:complusone_app/extention/string_extention.dart';
import 'package:flutter/material.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fromKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  TextEditingController confirmNameController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailNameController.dispose();
    passwordNameController.dispose();
    confirmNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text("Create Account,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "Sign up to started!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                const Spacer(),
                const Center(
                  child: Image(
                      image: AssetImage('assets/Profile Interface-rafiki.png'),
                      height: 200),
                ),
                // const Spacer(
                //   flex: 3,
                // ),
                InputTextField(
                  title: 'Full Name',
                  textEditingController: fullNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (value.isValidName) {
                      return "Please is a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Email',
                  textEditingController: emailNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please is a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Password',
                  textEditingController: passwordNameController,
                  validation: (String? value) {
                    List<String> _validation = [];
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        _validation.add("Must contains 1 number");
                      }
                      if (!value.isValidPasswordHasCapitalLetter) {
                        _validation.add("Must contains 1 capital letter");
                      }
                      if (!value.isValidPasswordHasLowerCaseLetter) {
                        _validation.add("Must contains 1 lower case letter");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        _validation.add(
                            "Must contains 1 special character [! @ \$ % ]");
                      }
                    }
                    String msg = '';
                    if (_validation.isNotEmpty) {
                      for (var i = 0; i < _validation.length; i++) {
                        msg = msg + _validation[i];
                        if ((i + 1) != _validation.length) {
                          msg = "$msg\n";
                        }
                      }
                    }
                    return msg.isNotEmpty ? msg : null;
                  },
                  obsecureText: true,
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Confirm Password',
                  textEditingController: confirmNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (passwordNameController.text != value) {
                      return "Please is a valid email address";
                    }
                    return null;
                  },
                  obsecureText: true,
                ),
                const SizedBox(height: 10),
                // const Spacer(flex: 5),
                InputTextButton(
                  title: "Sign Up",
                  onClick: () {
                    if (_fromKey.currentState!.validate()) {
                      authController.singUp(
                          fullName: fullNameController.text,
                          email: emailNameController.text,
                          password: passwordNameController.text);
                    }
                  },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Back",
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm already a member, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
