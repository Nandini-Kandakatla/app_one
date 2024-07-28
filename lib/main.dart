import 'package:app_one/providers/user_provider.dart';
import 'package:app_one/responsive/mobile_screen_layout.dart';
import 'package:app_one/responsive/responsive_layout_screen.dart';
import 'package:app_one/responsive/web_screen_layout.dart';
import 'package:app_one/screens/login_screen.dart';
import 'package:app_one/screens/signup_screen.dart';
import 'package:app_one/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:provider/provider.dart'; // Add this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDo_yjepOnyx8nNm6WrCGbyi4mfOiSJwdk',
          appId: '1:1054653541610:web:c222dbe770b5669805fb93',
          messagingSenderId: '1054653541610',
          projectId: 'instagram-3c5b6',
          storageBucket: 'instagram-3c5b6.appspot.com',
        ),
      );
    } else if (Platform.isIOS) { // Use Platform.isIOS
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDo_yjepOnyx8nNm6WrCGbyi4mfOiSJwdk',
          appId: '1:1054653541610:ios:9acc5b0ae7c2ed1905fb93',
          messagingSenderId: '1054653541610',
          projectId: 'instagram-3c5b6',
          storageBucket: 'instagram-3c5b6.appspot.com',
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create:(_)=>UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'INSTAGRAM',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );

  }
}
