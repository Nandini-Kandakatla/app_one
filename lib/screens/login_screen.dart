
import 'package:app_one/screens/signup_screen.dart';
import 'package:app_one/utils/colors.dart';
import 'package:app_one/utils/global_variables.dart';
import 'package:app_one/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/auth_methods.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../widgets/text_field_input.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email:_emailController.text,
      password: _passwordController.text,
    );

    if(res=="success"){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
          const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }else{
      //
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignup(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context)=> const SignupScreen(),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (child:Container(
        padding:MediaQuery.of(context).size.width>webScreenSize
            ?  EdgeInsets.symmetric(
            horizontal:MediaQuery.of(context).size.width/3)
            : const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
          Flexible(flex:2, child:Container()),
          //svg image
            SvgPicture.asset('assets/ic_instagram.svg',color:primaryColor,height: 64,),
            const SizedBox(height: 70),

            //text input field for email
             TextFieldInput(
               hintText: 'Enter your email',
               textInputType: TextInputType.emailAddress,
               textEditingController: _emailController,
             ),
          const SizedBox(
            height:30,
           ),
            //text input field for Passsword
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(
              height:30,
            ),
            //button login
            InkWell(
              onTap: loginUser,
              child: Container(
              width:double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical:12 ),
              decoration: const ShapeDecoration(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4),
                    ),
                  ),
              color: Colors.blue),
              child: _isLoading ?const Center(
                child:CircularProgressIndicator(
                  color:primaryColor,
                ),
              )
              : const Text('Log In'),
            ),
            ),
            const SizedBox(
                height:12,
            ),
            Flexible(flex:2,child:Container(),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
        Container(
       padding:const EdgeInsets.symmetric(
         vertical: 8,
           ),
       child: const Text("Don't have an account?"),
           ),
           GestureDetector(
             onTap: navigateToSignup ,
             child: Container(
                 padding:const EdgeInsets.symmetric(
                   vertical: 8,
                 ),
                 child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
             ),
           ),
   ],
 )
            //transitioning to signing up
          ],
        ),
      ),

      ),
    );
  }
}
