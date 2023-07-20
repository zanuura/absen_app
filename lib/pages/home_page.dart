import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/attendees_detail.dart';
import 'package:absen_app/pages/profile_page.dart';
import 'package:absen_app/pages/schedule.dart';
import 'package:absen_app/pages/task_list.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.useAppBar});
  bool? useAppBar;

  @override
  State<HomePage> createState() => _HomePageState();
}

class Keys {
  static final key = GlobalKey<ScaffoldState>();
  static final defaultKey = GlobalKey<ScaffoldState>();
  static final handSetKey = GlobalKey<ScaffoldState>();
  static final tabletKey = GlobalKey<ScaffoldState>();
  static final webSmallKey = GlobalKey<ScaffoldState>();
  static final webXSmallKey = GlobalKey<ScaffoldState>();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      key: Keys.key,
      defaultKey: Keys.defaultKey,
      handSetKey: Keys.handSetKey,
      tabletKey: Keys.tabletKey,
      webSmallKey: Keys.webSmallKey,
      webXSmallKey: Keys.webXSmallKey,
      // actions: [],
      useAppbar: widget.useAppBar,
      automaticallyImplyLeading: false,
      // openDrawer: () {
      //   print('open Drawer');
      //   // Keys.key.currentState!.openDrawer();
      //   Keys.handSetKey.currentState!.openDrawer();
      //   Keys.tabletKey.currentState!.openDrawer();
      //   Keys.defaultKey.currentState!.openDrawer();
      //   Keys.webSmallKey.currentState!.openDrawer();
      //   Keys.webXSmallKey.currentState!.openDrawer();
      // },
      mobileDefault: buildBody(web: false),
      mobileHandset: buildBody(web: false),
      mobileTablet: buildBody(web: false),
      webDefault: buildBody(web: true),
      webLarge: buildBody(web: true, webLarge: true),
      webMedium: buildBody(web: true, webMedium: true),
      webSmall: buildBody(web: true, webSmall: true),
      webXLarge: buildBody(web: true, webLarge: true),
      webXSmall: buildBody(web: true, webSmall: true),
    );
  }

  buildBody({
    bool? web,
    bool? webSmall,
    bool? webMedium,
    bool? webLarge,
  }) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 1000,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceVer10,
            ProfileCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
              web: web,
              webSmall: webSmall,
              webLarge: webLarge,
              webMedium: webMedium,
            ),
            // PageView.builder(
            //   itemCount: listTabs.length,
            //   controller: pageController,
            //   itemBuilder: (context, index) {
            //     return listTabs[index]['tab'];
            //   },
            // )

            attendeesTab(),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> listTabs = [
    {
      'id': 1,
      'bar': 'Schedule',
      'tab': Schedule(),
    },
    {
      'id': 2,
      'bar': 'Tasks',
      'tab': TaskList(),
    },
  ];

  attendeesTab() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
        position: index,
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendessDetail(),
                      )),
                  title: boldText(
                    text: 'Masuk -> Pulang',
                    size: 14,
                  ),
                  subtitle: regularText(
                    text: 'Senin 12 Agustus 2023',
                    color: mainColor,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      regularText(text: '07.00 ->', color: mainColor),
                      regularText(text: '02.00', color: mainColor),
                      // boldText(
                      //   text: 'task',
                      //   size: 14,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      // boldText(
                      //     text: '7', size: 15, color: Theme.of(context).primaryColor)
                    ],
                  ),
                  // trailing: GestureDetector(
                  //   onTap: () {},
                  //   child: Icon(
                  //     Icons.more_vert_rounded,
                  //     color: textColor,
                  //   ),
                  // ),
                ),
                spaceHor10,
                Divider(
                  height: 5,
                  thickness: 2,
                  color: textColor.withOpacity(0.10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  tabbarPage() {
    return Expanded(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    text: 'Absent',
                  ),
                  Tab(
                    text: 'Tasks',
                  ),
                  Tab(
                    text: 'Schedule',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                TaskList(),
                attendeesTab(),
                Schedule(),
              ],
            ),
          )),
    );
  }
}
