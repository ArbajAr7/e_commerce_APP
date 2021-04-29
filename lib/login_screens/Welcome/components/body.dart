import 'package:flutter/material.dart';
import 'package:DamiStyle/login_screens/Login/login_screen.dart';
import 'package:DamiStyle/login_screens/Welcome/components/background.dart';
import 'package:DamiStyle/login_components/rounded_button.dart';
import 'package:DamiStyle/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:DamiStyle/social_icon.dart';
import 'package:DamiStyle/login_screens/Login/emaillogin.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO DAMISTYLE",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
            Text(
              "LOGIN/SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/call.svg",
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
