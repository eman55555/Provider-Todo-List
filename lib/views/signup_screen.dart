import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'components/user_info.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: brown,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "To Do",
          style: TextStyle(color: brown),
        ),
        backgroundColor: lightBlack,
      ),
      body: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.0, right: 12.0,
              //bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      "To Do",
                      style: TextStyle(
                          fontSize: 30,
                          color: lightBlack,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(
                    
                    "User Name",
                    userController,
                    Icon(
                      Icons.person,
                      color: lightBlack,
                    ),
                    TextInputType.name, false,
                    [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),]
                    //false
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                      "Email addresse or phone number",
                      emailController,
                      Icon(
                        Icons.email,
                        color: lightBlack,
                      ),
                      TextInputType.emailAddress,
                      false,
                      [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z || @ || . || 0-9]')),]
                      //  ,true
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    "Phone",
                    phoneController,
                    Icon(
                      Icons.phone,
                      color: lightBlack,
                    ),
                    TextInputType.phone, false,
                     [FilteringTextInputFormatter.allow(RegExp('[0-9]')),]
                    //false
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    "Password",
                    passwordController,
                    Icon(
                      Icons.password,
                      color: lightBlack,
                    ),

                    TextInputType.text, true,
                     [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z || 0-9]')),]
                    //false
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    "Location ",
                    locationController,
                    Icon(
                      Icons.maps_home_work,
                      color: lightBlack,
                    ),

                    TextInputType.name, false,
                     [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),]
                    //false
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButtonView(
                          pad: 18,
                          font: 19.0,
                          press: () {
                            //viewmodel.register(userController.text , passwordController.text);

                            if (!_formKey.currentState!.validate()) {
                              makeSnackBar(context,
                                  'Please Fill Empty Fields !', Colors.red);
                            } else {
                              _formKey.currentState!.save();
                              register(context, emailController.text.trim(),
                                  passwordController.text.trim());
                            }
                          },
                          txt: "Signup"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register(BuildContext context, String? email, String? password) async {
    //    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    //     email: email, password: password);
    // User user = userCredential.user;

    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (user != null) {
        makeSnackBar(context, "signed up Successfuly", lightBlue);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          makeSnackBar(
              context, "Anonymous accounts are not enabled", Colors.red);
          break;
        case "ERROR_WEAK_PASSWORD":
          makeSnackBar(context, "Your password is too weak", Colors.red);
          break;
        case "ERROR_INVALID_EMAIL":
          makeSnackBar(context, "Your email is invalid", Colors.red);
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          makeSnackBar(context, "Email is already in use on different account",
              Colors.red);
          break;
        case "ERROR_INVALID_CREDENTIAL":
          makeSnackBar(context, "Your email is invalid", Colors.red);
          break;

        default:
          makeSnackBar(context, e.message.toString(), Colors.red);
      }
    }
  }
}
