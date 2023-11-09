import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      false
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
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (Route<dynamic> route) => false);
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
}
