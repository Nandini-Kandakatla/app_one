import 'package:app_one/screens/add_post_screen.dart';
import 'package:app_one/screens/feed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

const webScreenSize=600;
List <Widget>homeScreenItems =[
  const FeedScreen(),
  SearchScreen(),
  const AddPostScreen(),
  const Text('notif'),
  ProfileScreen(
    uid:FirebaseAuth.instance.currentUser!.uid,
  ),
];
