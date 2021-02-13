import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/widget/background_painter.dart';
import 'package:instagram_app/widget/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 75),
              width: 175,
              child: Text(
                'Welcome Back To BorderlessHR Assessment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            "assets/images/logo.svg",
            width: 100,
          ),
          SizedBox(height: 12),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 12),
          Text(
            'Developed by Chidiebere Chukwuma',
            style: TextStyle(fontSize: 7.3),
          ),
          Spacer(),
        ],
      );
}
