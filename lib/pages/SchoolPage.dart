import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'School',
      automaticallyImplyLeading: true,
      actions: [
        popUpMenuSchool(type: 'School'),
      ],
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

  buildBody() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spaceVer10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(text: 'SMK Islamiyah Ciawi', size: 23),
          ),
          spaceVer5,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText(
                  text: '12 RPL A',
                  size: 18,
                ),
                regularText(
                  text: '2020 - 2023',
                  color: mainColor,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: regularText(
              text: 'Angkatan 19',
              size: 18,
              color: mainColor,
            ),
          ),
          spaceVer20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(text: 'Homeroom Teacher', size: 16),
          ),
          MyListTile(
            contentPadding: EdgeInsets.only(
              left: 20,
            ),
            leading: CircleAvatar(
              backgroundColor: textColor,
            ),
            tittle: 'Jokowi',
            subTittle: 'Tech Math Lesson',
            trailling: popUpMenuSchool(type: 'Teacher'),
          ),
          spaceVer20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(text: 'Your Friend', size: 16),
          ),
          ListView.builder(
            itemCount: 14,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                leading: CircleAvatar(
                  backgroundColor: textColor,
                ),
                title: boldText(
                  text: 'Elon Musk',
                ),
                subtitle: regularText(
                  text: 'ClassMate',
                  color: mainColor,
                ),
                trailing: popUpMenuSchool(type: 'Friends'),
              );
            },
          ),
        ],
      ),
    );
  }

  popUpMenuSchool({String? type}) {
    return popUpMenu(
      context,
      onSelected: (value) {
        if (value == 1) {
          print('Contact');
        } else if (value == 2) {
          print('Block');
        } else if (value == 3) {
          print('Report');
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.call_outlined,
                color: bodyColor,
              ),
              spaceHor10,
              boldText(
                text: 'Contact $type',
                color: bodyColor,
              )
            ],
          ),
        ),
        // PopupMenuItem(
        //   value: 2,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.block,
        //         color: bodyColor,
        //       ),
        //       spaceVer20,
        //       boldText(
        //         text: 'Block $type',
        //         color: bodyColor,
        //       )
        //     ],
        //   ),
        // ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(
                Icons.flag_outlined,
                color: bodyColor,
              ),
              spaceHor10,
              boldText(
                text: 'Report $type',
                color: bodyColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
