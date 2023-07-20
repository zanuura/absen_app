import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/login.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'Settings',
      automaticallyImplyLeading: true,
      actions: [],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // spaceVer10,
          ProfileCard(),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.numbers,
              color: iconColor,
            ),
            title: boldText(text: 'Phone Number'),
            subtitle: regularText(text: '089698989112', color: mainColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.email_outlined,
              color: iconColor,
            ),
            title: boldText(text: 'Email'),
            subtitle: regularText(text: 'yourMail@mail.com', color: mainColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.password,
              color: iconColor,
            ),
            title: boldText(text: 'Password'),
            subtitle: regularText(text: '********', color: mainColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.help_outline_outlined,
              color: iconColor,
            ),
            title: boldText(text: 'Help'),
            subtitle: regularText(
                text: 'Help Center, contact us, privacy policy',
                color: mainColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return Login();
                },
              ));
            },
            leading: Icon(
              Icons.logout,
              color: iconColor,
            ),
            title: boldText(text: 'LogOut'),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          // spaceVer10,
        ],
      ),
    );
  }
}
