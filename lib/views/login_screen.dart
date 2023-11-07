import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../constants/colors.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: brown,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "To Do",
          style: TextStyle(color: brown),
        ),
        backgroundColor: lightBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "To Do",
              style: TextStyle(
                  fontSize: 30, color: lightBlack, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            textField("Email addresse or phone number ", userController),
            const SizedBox(
              height: 10,
            ),
            textField("Password ", passwordController),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtonView(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  txt: "Login",
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButtonView(
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    txt: "Signup")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
