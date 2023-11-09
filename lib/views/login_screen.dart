// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_hive_todolist/views/signup_screen.dart';
import '../constants/colors.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//final FirebaseAuth _auth = FirebaseAuth.instance;

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
                              // If the form is valid, display a Snackbar.
                              var snackBar = SnackBar(
                                content: Text(
                                  'Please Fill Empty Fields !',
                                  style: TextStyle(fontSize: 15),
                                ),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar,
                              );
                            } else {
                              _formKey.currentState!.save();
                              //  login(emailController.text.trim(), passwordController.text.trim());
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (Route<dynamic> route) => false);
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

  // Future login(String email, String password) async {
  //   //    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //   //     email: email, password: password);
  //   // User user = userCredential.user;

  //    await _auth.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   print("userCredential.user!");
  //   // print(userCredential.user!);
  //   // if (userCredential != null) {

  //   //     _success = true;
  //   //     _userEmail = userCredential.user!.email;
  //   // notifyListeners();
  //   // } else {
  //   //   setState(() {
  //   //     _success = true;
  //   //   });
  //   // }
  // }
}
