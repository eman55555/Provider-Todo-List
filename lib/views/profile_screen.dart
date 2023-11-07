import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'components/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: lightBlack,
          title: Text(
            "My Profile",
            style: TextStyle(color: brown),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(color: lightBlue, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(70),
                    child: Image.asset('././assets/profile.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: 15,
              ),
              userInfoHeader(
                  "Eman Hamad",
                  Icon(
                    Icons.person,
                    color: brown,
                  )),

              userInfoHeader(
                  "emanhamad55555@gmail.com",
                  Icon(
                    Icons.email,
                    color: brown,
                  )),

              userInfoHeader(
                  "01273237056",
                  Icon(
                    Icons.phone,
                    color: brown,
                  )),
              userInfoHeader(
                  "Egypt",
                  Icon(
                    Icons.maps_home_work,
                    color: brown,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
