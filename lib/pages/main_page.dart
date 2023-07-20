import 'package:absen_app/layout/header.dart';
import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/SchoolPage.dart';
import 'package:absen_app/pages/home_page.dart';
import 'package:absen_app/pages/home_work.dart';
import 'package:absen_app/pages/profile_page.dart';
import 'package:absen_app/pages/schedule.dart';
import 'package:absen_app/pages/settings.dart';
import 'package:absen_app/pages/task_list.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? tabController;
  int activeTabIndex = 1;
  var menu;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    menu = profileTabMenu();
    tabController?.addListener(() {
      if (tabController!.index == 1) {
        menu = profileTabMenu();
        return menu;
      } else if (tabController!.index == 2) {
        menu = scheduleTabMenu();
        return menu;
      } else if (tabController!.index == 0) {
        menu = taskTabMenu();
        return menu;
      }
      return menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: bodyColor,
          appBar: Header(
            context,
            automaticallyImplyLeading: false,
            tittle: 'd o s',
            centerTitle: false,
            actions: [
              // popUpMenu(context),
              popUpMenu(
                context,
                onSelected: (value) {
                  if (value == 5) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Settings();
                      },
                    ));
                  } else if (value == 1) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage();
                      },
                    ));
                  } else if (value == 2) {
                    print('DateTime');
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColorLight: iconColor,
                            primaryColor: iconColor,
                            backgroundColor: bodyColor,
                            hintColor: mainColor,
                            hoverColor: mainColor,
                          ),
                          child: Container(
                            child: child,
                          ),
                        );
                      },
                    );
                  } else if (value == 3) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeWork();
                      },
                    ));
                  } else if (value == 4) {
                    print('School');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SchoolPage();
                      },
                    ));
                  }
                },
                itemBuilder: (context) {
                  return menu;
                },
              ),
            ],
            bottom: PreferredSize(
              child: TabBar(
                onTap: (value) {
                  print(value);
                },
                labelColor: textColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: borderColor,
                controller: tabController,
                unselectedLabelColor: mainColor,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  color: mainColor,
                ),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor),
                tabs: [
                  Tab(
                    text: 'Tasks',
                  ),
                  Tab(
                    text: 'Absent',
                  ),
                  Tab(
                    text: 'Schedule',
                  ),
                ],
              ),
              preferredSize: Size(
                double.infinity,
                40,
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              TaskList(
                useAppBar: false,
              ),
              HomePage(
                useAppBar: false,
              ),
              Schedule(
                useAppBar: false,
              ),
            ],
          ),
        );
      }),
    );
  }

  List<PopupMenuEntry<Object?>> profileTabMenu() {
    return [
      PopupMenuItem(
        value: 2,
        onTap: () {},
        child: boldText(
          text: 'DateTime',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 3,
        onTap: () {},
        child: boldText(
          text: 'Homework',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 4,
        onTap: () {},
        child: boldText(
          text: 'School',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 5,
        child: boldText(
          text: 'Settings',
          color: bodyColor,
        ),
      ),
      // PopupMenuItem(
      //   value: 2,
      //   onTap: () {},
      //   child: boldText(
      //     text: 'LogOut',
      //     color: bodyColor,
      //   ),
      // ),
    ];
  }

  List<PopupMenuEntry<Object?>> scheduleTabMenu() {
    return [
      PopupMenuItem(
        value: 1,
        child: boldText(
          text: 'Profile',
          color: bodyColor,
        ),
      ),

      PopupMenuItem(
        value: 3,
        onTap: () {},
        child: boldText(
          text: 'Homework',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 4,
        onTap: () {},
        child: boldText(
          text: 'School',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 5,
        child: boldText(
          text: 'Settings',
          color: bodyColor,
        ),
      ),
      // PopupMenuItem(
      //   value: 2,
      //   onTap: () {},
      //   child: boldText(
      //     text: 'LogOut',
      //     color: bodyColor,
      //   ),
      // ),
    ];
  }

  List<PopupMenuEntry<Object?>> taskTabMenu() {
    return [
      PopupMenuItem(
        value: 1,
        child: boldText(
          text: 'Profile',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 2,
        onTap: () {},
        child: boldText(
          text: 'DateTime',
          color: bodyColor,
        ),
      ),

      PopupMenuItem(
        value: 4,
        onTap: () {},
        child: boldText(
          text: 'School',
          color: bodyColor,
        ),
      ),
      PopupMenuItem(
        value: 5,
        child: boldText(
          text: 'Settings',
          color: bodyColor,
        ),
      ),
      // PopupMenuItem(
      //   value: 2,
      //   onTap: () {},
      //   child: boldText(
      //     text: 'LogOut',
      //     color: bodyColor,
      //   ),
      // ),
    ];
  }
}
