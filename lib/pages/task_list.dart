import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/home_page.dart';
import 'package:absen_app/pages/home_work.dart';
import 'package:absen_app/pages/task_detail.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key, this.useAppBar});
  bool? useAppBar;

  @override
  State<TaskList> createState() => _TaskListState();
}

class Keys2 {
  static final key = GlobalKey<ScaffoldState>();
  static final defaultKey = GlobalKey<ScaffoldState>();
  static final handSetKey = GlobalKey<ScaffoldState>();
  static final tabletKey = GlobalKey<ScaffoldState>();
  static final webSmallKey = GlobalKey<ScaffoldState>();
  static final webXSmallKey = GlobalKey<ScaffoldState>();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      key: Keys2.key,
      defaultKey: Keys2.defaultKey,
      handSetKey: Keys2.handSetKey,
      tabletKey: Keys2.tabletKey,
      webSmallKey: Keys2.webSmallKey,
      webXSmallKey: Keys2.webXSmallKey,
      tittle: 'List Tasks',
      useAppbar: widget.useAppBar,
      automaticallyImplyLeading: false,
      // actions: [],
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      webDefault: buildBody(),
      webLarge: buildBody(),
      webMedium: buildBody(),
      webSmall: buildBody(),
      webXSmall: buildBody(),
      webXLarge: buildBody(),
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
          spaceVer10,
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeWork();
                },
              ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bodyColor,
                  boxShadow: [
                    BoxShadow(
                        color: textColor.withOpacity(0.10),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      boldText(
                        text: 'Homework',
                        color: textColor,
                        size: 20,
                      ),
                      spaceHor10,
                      regularText(
                        text: '(8)',
                        size: 18,
                        // color: mainColor,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.home_work_outlined,
                    size: 18,
                    color: mainColor,
                  ),
                ],
              ),
            ),
          ),
          // spaceVer10,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: MyListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TaskDetail();
                          },
                        ));
                      },
                      contentPadding: EdgeInsets.all(0),
                      tittle: 'MTK',
                      subTittle: '08:00 - 09:00',
                      trailling: popUpMenuTask(type: 'Task'),
                      taskText:
                          'Tugas untuk hari ini tolong buat kan saya kopi susu anget adem seger!',
                      taskContent: Container(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  popUpMenuTask({String? type}) {
    return popUpMenu(
      context,
      onSelected: (value) {
        if (value == 1) {
          print('Homework');
        } else if (value == 2) {
          print('Report');
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.home_work_outlined,
                color: bodyColor,
              ),
              spaceHor10,
              boldText(
                text: 'Set As Homework',
                color: bodyColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
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
