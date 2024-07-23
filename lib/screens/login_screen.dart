import 'package:app_one/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (child:Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
          //svg image
            SvgPicture.asset('assets/ic_instagram.svg',color:primaryColor,height: 64,),
            const SizedBox(height: 64),
            //text input field for email

            //text input field for Passsword

            //button login

            //transitioning to signing up
          ],
        ),
      ),

      ),
    );
  }
}
