import 'package:app_one/responsive/mobile_screen_layout.dart';
import 'package:app_one/responsive/responsive_layout_screen.dart';
import 'package:app_one/responsive/web_screen_layout.dart';
import 'package:app_one/screens/login_screen.dart';
import 'package:app_one/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options:  const  FirebaseOptions(
        apiKey: 'AIzaSyCZwz59ULviyTsANhSJT0sJyApMukL0RgE',
        appId: '1:1054653541610:web:c222dbe770b5669805fb93',
        messagingSenderId: '1054653541610',
        projectId: 'instagram-3c5b6',
        storageBucket: 'instagram-3c5b6.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INSTAGRAM',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //home: const ResponsiveLayout(
      // mobileScreenLayout: MobileScreenLayout(),
      // webScreenLayout: WebScreenLayout(),
      // ),
      home: LoginScreen(),
    );
  }
}