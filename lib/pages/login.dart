import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/main_page.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nisnController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showPass = false;
  Widget passIcon = Icon(
    Icons.remove_red_eye_outlined,
    color: iconColor,
  );

  void onPressLogin() {
    if (nisnController.text == '') {
      messageInfo(context, message: 'input Your NISN');
      return;
    }

    if (passController.text == '') {
      messageInfo(context, message: 'input your password');
      return;
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MainPage();
      },
    ));
  }

  void showHidePass() {
    if (showPass == false) {
      setState(() {
        showPass = true;
        passIcon = Icon(
          Icons.remove_red_eye_outlined,
          color: iconColor,
        );
      });
    } else {
      setState(() {
        showPass = false;
        passIcon = Icon(
          Icons.remove_red_eye,
          color: iconColor,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      useAppbar: false,
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      webDefault: buildBody(),
      webLarge: buildBody(),
      webMedium: buildBody(),
      webSmall: buildBody(),
      webXLarge: buildBody(),
      webXSmall: buildBody(),
    );
  }

  buildBody({
    bool? web,
    bool? webSmall,
    bool? webMedium,
    bool? webLarge,
  }) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVer50,
            spaceVer50,
            spaceVer50,
            boldText(
              text: 'Login',
              size: 25,
            ),
            spaceVer20,
            regularText(
              text: 'NO NISIN',
            ),
            spaceVer10,
            field(
              controller: nisnController,
              hintText: 'no NISN',
            ),
            spaceVer20,
            regularText(
              text: 'Password',
            ),
            spaceVer10,
            field(
              controller: passController,
              hintText: '********',
              obscureText: showPass,
              maxLines: 1,
              suffix: GestureDetector(
                onTap: () {
                  showHidePass();
                },
                child: passIcon,
              ),
            ),
            spaceVer50,
            spaceVer20,
            Container(
              width: double.infinity,
              height: 50,
              child: normalButton(
                child: boldText(
                  text: 'Login',
                ),
                onPressed: () {
                  onPressLogin();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
