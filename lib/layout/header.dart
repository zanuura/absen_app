import 'package:absen_app/pages/home_page.dart';
import 'package:absen_app/pages/schedule.dart';
import 'package:absen_app/pages/schedule_detail.dart';
import 'package:absen_app/pages/settings.dart';
import 'package:absen_app/pages/task_list.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

// final GlobalKey<ScaffoldState> _key = GlobalKey();

AppBar Header(
  BuildContext context, {
  List<Widget>? actions,
  bool? centerTitle,
  bool? automaticallyImplyLeading,
  String? tittle,
  PreferredSizeWidget? bottom,
  Widget? leading,
}) {
  return AppBar(
    // automaticallyImplyLeading: true,
    leading: automaticallyImplyLeading == true && leading == null
        ? BackButton(
            color: textColor,
          )
        : leading,
    leadingWidth:
        automaticallyImplyLeading == true && leading == null ? 30 : 80,
    elevation: 0,
    automaticallyImplyLeading:
        automaticallyImplyLeading != null ? automaticallyImplyLeading : false,
    backgroundColor: bodyColor,
    centerTitle: centerTitle,
    title: boldText(
      text: tittle != null ? tittle : 'd o s',
      size: 18,
    ),
    actions: actions,
    bottom: bottom,
  );
}

Widget HeaderUI({GlobalKey<ScaffoldState>? key, Function()? openDrawer}) {
  return AdaptiveBuilder.custom(
    defaultBuilder: (context, screen) => Header(context),
    webDelegate: headerLayoutWeb(key: key, openDrawer: openDrawer),
  );
}

List<Widget> headerMenu(BuildContext context, {Color? textColor}) {
  return [
    ListTile(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        },
        leading: Icon(
          Icons.home_outlined,
          color: bodyColor,
        ),
        title: regularText(
          color: textColor,
          text: 'Home',
        )),
    ListTile(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TaskList();
            },
          ));
        },
        leading: Icon(
          Icons.task_outlined,
          color: bodyColor,
        ),
        title: regularText(
          color: textColor,
          text: 'Task',
        )),
    ListTile(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Schedule(),
              ));
        },
        leading: Icon(
          Icons.schedule_outlined,
          color: bodyColor,
        ),
        title: regularText(
          color: textColor,
          text: 'Schedule',
        )),
    ListTile(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Settings(),
              ));
        },
        leading: Icon(
          Icons.settings_outlined,
          color: bodyColor,
        ),
        title: regularText(
          color: textColor,
          text: 'Settings',
        )),
  ];
}

List<Widget> sideBarMenu(BuildContext context, {Color? textColor}) {
  return [
    IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ));
      },
      icon: Icon(
        Icons.home_outlined,
        color: bodyColor,
      ),
    ),
    IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return TaskList();
          },
        ));
      },
      icon: Icon(
        Icons.task_outlined,
        color: bodyColor,
      ),
    ),
    IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Schedule(),
            ));
      },
      icon: Icon(
        Icons.schedule_outlined,
        color: bodyColor,
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.settings_outlined,
        color: bodyColor,
      ),
    ),
  ];
}

Drawer myDrawer(BuildContext context, {GlobalKey<ScaffoldState>? key}) {
  return Drawer(
    width: 200,
    key: key,
    backgroundColor: textColor,
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVer30,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     boldText(
            //       text: 'd o s',
            //       size: 30,
            //       color: bodyColor,
            //     )
            //   ],
            // ),
            spaceVer20,
            // spaceVer50,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: headerMenu(context, textColor: bodyColor),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout,
                    color: bodyColor,
                  )),
            ],
          ),
        )
      ],
    ),
  );
}

AdaptiveLayoutDelegate? headerLayoutWeb(
    {GlobalKey<ScaffoldState>? key, Function()? openDrawer}) {
  return AdaptiveLayoutDelegateWithScreenSize(
    defaultBuilder: (context, screen) {
      return Header(
        context,
        actions: headerMenu(context),
      );
    },
    xLarge: (context, screen) {
      return Header(context);
    },
    large: (context, screen) {
      return Header(
        context,
        actions: headerMenu(context),
      );
    },
    medium: (context, screen) {
      return Header(
        context,
        actions: headerMenu(context),
      );
    },
    small: (context, screen) {
      return Header(
        context,
        actions: headerMenu(context),
      );
    },
    xSmall: (context, screen) {
      return Header(context,
          // actions: headerMenu(context),
          actions: [
            IconButton(
                onPressed: openDrawer,
                // onPressed: () {
                //   key!.currentState!.openDrawer();
                // },
                icon: Icon(
                  Icons.menu,
                  color: textColor,
                )),
          ]);
    },
  );
}

// class Header extends StatelessWidget {
//   const Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('logo'),
//     );
//   }
// }
