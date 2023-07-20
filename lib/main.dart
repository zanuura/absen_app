import 'package:absen_app/pages/home_page.dart';
import 'package:absen_app/pages/main_page.dart';
import 'package:absen_app/pages/splash.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Breakpoint(
      // breakpointData: BreakpointData(
      //   // Based on [ScreenSize] (xSmall , small , medium , large , xLarge)
      //   minSmallScreenWidth: 600,
      //   minMediumScreenWidth: 1024,
      //   minLargeScreenWidth: 1440,
      //   minXLargeScreenWidth: 1920,
      //   // Based on [ScreenType] (smallHandset , mediumHandset , largeHandset , smallTablet , largetablet , smallDesktop , mediumDesktop , largeDesktop)
      //   minMediumHandsetWith: 360,
      //   minLargeHandsetWith: 400,
      //   minSmallTabletWidth: 600,
      //   minLargeTabletWidth: 720,
      //   minSmallDesktopWidth: 1024,
      //   minMediumDesktopWidth: 1440,
      //   minLargeDesktopWidth: 1920,
      // ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'd o s',
        theme: myTheme(),
        // home: Scaffold(body: HomePage()),
        // home: MainPage(),
        home: Splash(),
      ),
    );
  }
}
