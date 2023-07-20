import 'dart:ui';

import 'package:absen_app/layout/header.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

//spacing

var spaceHor10 = SizedBox(
  width: 10,
);

var spaceHor20 = SizedBox(
  width: 20,
);

var spaceHor30 = SizedBox(
  width: 30,
);

var spaceHor40 = SizedBox(
  width: 40,
);

var spaceHor50 = SizedBox(
  width: 50,
);

var spaceVer5 = SizedBox(
  height: 5,
);

var spaceVer10 = SizedBox(
  height: 10,
);

var spaceVer20 = SizedBox(
  height: 20,
);

var spaceVer30 = SizedBox(
  height: 30,
);

var spaceVer40 = SizedBox(
  height: 40,
);

var spaceVer50 = SizedBox(
  height: 50,
);

//end spacing

//divider

var simpleDivider = Divider(
  height: 5,
  thickness: 2,
  color: textColor.withOpacity(0.10),
);

//end divider

//box shadow

var myShadow = BoxShadow(
  color: textColor.withOpacity(0.10),
  blurRadius: 5,
  spreadRadius: 2,
);

//end boxshadow

//responseive

bool isDesktop = false;

bool isDisplayDesktop(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.small;

/// Returns true if the window size is medium size. Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.small;
}

class DisplayScreen {
  BuildContext context;

  DisplayScreen(this.context) : assert(context != null);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}

int getItemCountPerRow(BuildContext context) {
  double minTileWidth = 200; //in your case
  double availableWidth = MediaQuery.of(context).size.width;

  int i = availableWidth ~/ minTileWidth;
  return i;
}

int getListItemCountPerRow(BuildContext context) {
  double minTileWidth = 300; //in your case
  double availableWidth = MediaQuery.of(context).size.width;

  int i = availableWidth ~/ minTileWidth;
  return i;
}

//responsive

//theme
ThemeData myTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}
//end theme

//scaffold
class DefaultScaffold extends StatefulWidget {
  DefaultScaffold({
    this.key,
    this.defaultKey,
    this.handSetKey,
    this.tabletKey,
    this.webSmallKey,
    this.webXSmallKey,
    this.body,
    this.mobileDefault,
    this.mobileHandset,
    this.mobileTablet,
    this.webDefault,
    this.webLarge,
    this.webMedium,
    this.webSmall,
    this.webXLarge,
    this.webXSmall,
    this.openDrawer,
    this.automaticallyImplyLeading,
    this.tittle,
    this.bottomNavigationBar,
    this.actions,
    this.floatingActionButton,
    this.useAppbar,
  });

  GlobalKey<ScaffoldState>? key;
  GlobalKey<ScaffoldState>? defaultKey;
  GlobalKey<ScaffoldState>? handSetKey;
  GlobalKey<ScaffoldState>? tabletKey;
  GlobalKey<ScaffoldState>? webSmallKey;
  GlobalKey<ScaffoldState>? webXSmallKey;
  Widget? body;
  Widget? mobileHandset;
  Widget? mobileTablet;
  Widget? mobileDefault;
  Widget? webDefault;
  Widget? webLarge;
  Widget? webSmall;
  Widget? webMedium;
  Widget? webXSmall;
  Widget? webXLarge;
  Function()? openDrawer;
  bool? automaticallyImplyLeading;
  String? tittle;
  Widget? bottomNavigationBar;
  List<Widget>? actions;
  Widget? floatingActionButton;
  bool? useAppbar;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder.custom(
      defaultBuilder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
      androidDelegate: androidLayout(openDrawer: widget.openDrawer),
      webDelegate: webLayout(openDrawer: widget.openDrawer),
    );
    // return Scaffold(
    //   appBar: Header(),
    //   body: Container(height: 1000),
    // );
  }

  AdaptiveLayoutDelegate? androidLayout({
    Function()? openDrawer,
  }) {
    return AdaptiveLayoutDelegateWithMinimallScreenType(
      defaultBuilder: (context, screen) {
        return mobileScaffold(
          context,
          key: widget.defaultKey,
          bottomNavigationBar: widget.bottomNavigationBar,
          floatingActionButton: widget.floatingActionButton,
          appBar: widget.useAppbar == false
              ? null
              : Header(
                  context,
                  tittle: widget.tittle,
                  automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  centerTitle: true,
                  actions: widget.actions != null
                      ? widget.actions
                      : [
                          IconButton(
                              onPressed: () {
                                print('open Drawer');
                                widget.defaultKey!.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: textColor,
                              ))
                        ],
                ),
          body: widget.mobileDefault,
        );
      },
      handset: (context, screen) {
        return mobileScaffold(
          context,
          key: widget.handSetKey,
          bottomNavigationBar: widget.bottomNavigationBar,
          floatingActionButton: widget.floatingActionButton,
          appBar: widget.useAppbar == false
              ? null
              : Header(
                  context,
                  tittle: widget.tittle,
                  automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  centerTitle: true,
                  actions: widget.actions != null
                      ? widget.actions
                      : [
                          IconButton(
                              // onPressed: openDrawer,
                              onPressed: () {
                                print('open Drawer');
                                widget.handSetKey!.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.more_vert_outlined,
                                color: iconColor,
                              ))
                        ],
                ),
          body: widget.mobileHandset,
        );
      },
      tablet: (context, screen) {
        return mobileScaffold(
          context,
          key: widget.tabletKey,
          bottomNavigationBar: widget.bottomNavigationBar,
          floatingActionButton: widget.floatingActionButton,
          appBar: widget.useAppbar == false
              ? null
              : Header(
                  context,
                  tittle: widget.tittle,
                  automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  centerTitle: true,
                  actions: widget.actions != null
                      ? widget.actions
                      : [
                          IconButton(
                              // onPressed: openDrawer,
                              onPressed: () {
                                print('open Drawer');
                                widget.tabletKey!.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: textColor,
                              ))
                        ],
                ),
          body: widget.mobileTablet,
        );
      },
    );
  }

  AdaptiveLayoutDelegate? webLayout({Function()? openDrawer}) {
    return AdaptiveLayoutDelegateWithScreenSize(
      defaultBuilder: (context, screen) {
        print('web default');
        return webScaffold(
          context,
          body: widget.webDefault,
          openDrawer: openDrawer,
        );
      },
      large: (context, screen) {
        print('web large');
        return webScaffold(
          context,
          body: widget.webLarge,
          openDrawer: openDrawer,
        );
      },
      medium: (context, screen) {
        print('web medium');
        return webScaffold(
          context,
          body: widget.webMedium,
          openDrawer: openDrawer,
        );
      },
      small: (context, screen) {
        print('web small');
        return webScaffold(
          context,
          key: widget.webSmallKey,
          body: widget.webSmall,
          openDrawer: () {
            print('open Drawer');
            widget.webSmallKey!.currentState!.openDrawer();
          },
        );
      },
      xLarge: (context, screen) {
        print('web xlarge');
        return webScaffold(
          context,
          body: widget.webXLarge,
          openDrawer: openDrawer,
        );
      },
      xSmall: (context, screen) {
        print('web xsmall');
        return webScaffold(
          context,
          key: widget.webXSmallKey,
          body: widget.webSmall,
          openDrawer: () {
            print('open Drawer');
            widget.webXSmallKey!.currentState!.openDrawer();
          },
        );
      },
    );
  }
}

Scaffold mobileScaffold(
  BuildContext context, {
  GlobalKey<ScaffoldState>? key,
  Widget? body,
  Function()? openDrawer,
  AppBar? appBar,
  Widget? bottomNavigationBar,
  Widget? floatingActionButton,
}) {
  return Scaffold(
    key: key,
    // endDrawer: myDrawer(context),
    drawer: myDrawer(context),
    backgroundColor: bodyColor,
    appBar: appBar,
    body: SingleChildScrollView(
      child: Column(
        children: [
          body == null ? Container() : body,
        ],
      ),
    ),
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
    resizeToAvoidBottomInset: false,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}

Scaffold webScaffold(
  BuildContext context, {
  GlobalKey<ScaffoldState>? key,
  Widget? body,
  AppBar? appBar,
  Function()? openDrawer,
}) {
  return Scaffold(
    key: key,
    endDrawer: myDrawer(context),
    backgroundColor: bodyColor,
    body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderUI(key: key, openDrawer: openDrawer),
          body == null ? Container() : body,
        ],
      ),
    ),
  );
}
//end scaffold

//text
Text mediumText(String text, color) {
  return Text(
    text,
    style: TextStyle(
      color: color == null ? textColor : color,
      fontSize: 16,
    ),
  );
}

Text regularText({
  String? text,
  Color? color,
  double? size,
  TextAlign? textAlign,
}) {
  return Text(
    text.toString(),
    textAlign: textAlign,
    style: TextStyle(
      color: color == null ? textColor : color,
      fontSize: size != null ? size : 14,
    ),
  );
}

Text boldText({String? text, Color? color, double? size}) {
  return Text(
    text.toString(),
    style: TextStyle(
      color: color == null ? textColor : color,
      fontSize: size != null ? size : 14,
      fontWeight: FontWeight.bold,
    ),
  );
}

//end text

//container
Container mContainer({Widget? child, double? height, double? width}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: bodyColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2)),
    child: child,
  );
}

//end container

//button

ElevatedButton normalButton({Function()? onPressed, Widget? child}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: buttonActiveColor,
      ),
      onPressed: onPressed,
      child: child);
}

ElevatedButton lineButton({Function()? onPressed, Widget? child}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: bodyColor,
      ),
      onPressed: onPressed,
      child: child);
}

//end buttons

//textfield

TextField field({
  TextEditingController? controller,
  String? hintText,
  Function(String)? onChanged,
  Function(String)? onSubmitted,
  Function()? onTap,
  bool readOnly = false,
  bool? enabled,
  TextInputType? keyboardType,
  Widget? suffix,
  bool obscureText = false,
  int? maxLines = null,
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    minLines: 1,
    maxLines: maxLines,
    maxLength: null,
    onSubmitted: onSubmitted,
    onTap: onTap,
    readOnly: readOnly,
    enabled: enabled,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
        hintText: hintText,
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide:
        //       BorderSide(color: borderColor.withOpacity(0.10), width: 1.5),
        // ),
        suffix: suffix,
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: borderColor.withOpacity(0.10), width: 2.5),
        )),
  );
}

//endTextField
