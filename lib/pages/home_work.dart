import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/task_detail.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'Homework',
      automaticallyImplyLeading: true,
      actions: [],
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
          // holderPlaces(
          //   icons: Icons.home_work_outlined,
          //   text: 'No Homework to do',
          // ),

          // spaceVer10,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
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
                            return TaskDetail(
                              homeWork: true,
                            );
                          },
                        ));
                      },
                      contentPadding: EdgeInsets.all(0),
                      tittle: 'MTK',
                      subTittle: '08:00 - 09:00',
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
}
