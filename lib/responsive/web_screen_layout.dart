import 'package:app_one/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page=0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
    setState(() {
      _page=page;
    });

  }
  void onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg', color: primaryColor, height: 32,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: _page ==0?primaryColor:secondaryColor,
            ),
            onPressed: () =>navigationTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: _page ==1?primaryColor:secondaryColor,
            ),
            onPressed: () =>navigationTapped(1),
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: _page ==2?primaryColor:secondaryColor,
            ),
            onPressed: () =>navigationTapped(2),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _page ==3?primaryColor:secondaryColor,
            ),
            onPressed: () =>navigationTapped(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: _page ==4?primaryColor:secondaryColor,
            ),
            onPressed: ()=>navigationTapped(4),
          ),
        ],
      ),
      body:PageView(
        physics: const NeverScrollableScrollPhysics(),
        children:homeScreenItems,
        controller: pageController,
        onPageChanged:onPageChanged ,
      )
    );

  }
}
