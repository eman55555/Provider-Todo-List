// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_hive_todolist/views/signup_screen.dart';
import '../constants/colors.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'components/user_info.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
//final FirebaseAuthException _auth = FirebaseAuthException();
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
        //   child: ConstrainedBox(
        // constraints: BoxConstraints(
        //   minWidth: MediaQuery.of(context).size.width,
        //   minHeight: MediaQuery.of(context).size.height,
        // ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 12.0,
                  left: 12.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "To Do",
                      style: TextStyle(
                          fontSize: 30,
                          color: lightBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textField(
                      "Email addresse  ",
                      emailController,
                      Icon(
                        Icons.email,
                        color: lightBlack,
                      ),
                      TextInputType.emailAddress,
                      false,
                       [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z || @ || . || 0-9]')),]
                      //  true
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textField(
                      "Password ",
                      passwordController,
                      Icon(
                        Icons.password,
                        color: lightBlack,
                      ),
                      TextInputType.text,
                      true,
                       [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z || 0-9]')),]
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
                            if (!_formKey.currentState!.validate()) {
                              makeSnackBar(context,
                                  'Please Fill Empty Fields !', Colors.red);
                            } else {
                              _formKey.currentState!.save();

                              login(context, emailController.text.trim(),
                                  passwordController.text.trim());
                            }
                          },
                          txt: "Login",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: new TextSpan(
                        text: 'havent aacount?',
                        style: new TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: bblue),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context, String? email, String? password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (user != null) {
        makeSnackBar(context, "logged in Successfuly", lightBlue);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          makeSnackBar(context, "the email address is not valid", Colors.red);
          break;

        case "user-disabled":
          makeSnackBar(
              context, "the given email has been disabled", Colors.red);
          break;

        case "user-not-found":
          makeSnackBar(
              context, "no user corresponding to the given email", Colors.red);
          break;

        case "wrong-password" || "INVALID_LOGIN_CREDENTIALS":
          makeSnackBar(context, "password or email is invalid", Colors.red);
          break;
        case "too_many_requets":
          makeSnackBar(
              context, "Too many requests. Try again later", Colors.red);
          break;

        default:
          makeSnackBar(context, "Invalid , Try Again Later", Colors.red);
      }
    }
  }
}
