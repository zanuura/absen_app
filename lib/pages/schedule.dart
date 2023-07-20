import 'package:absen_app/dumy.dart';
import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/pages/home_page.dart';
import 'package:absen_app/pages/schedule_detail.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Schedule extends StatefulWidget {
  Schedule({super.key, this.useAppBar});
  bool? useAppBar;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class Keys3 {
  static final key = GlobalKey<ScaffoldState>();
  static final defaultKey = GlobalKey<ScaffoldState>();
  static final handSetKey = GlobalKey<ScaffoldState>();
  static final tabletKey = GlobalKey<ScaffoldState>();
  static final webSmallKey = GlobalKey<ScaffoldState>();
  static final webXSmallKey = GlobalKey<ScaffoldState>();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      key: Keys3.key,
      defaultKey: Keys3.defaultKey,
      handSetKey: Keys3.handSetKey,
      tabletKey: Keys3.tabletKey,
      webSmallKey: Keys3.webSmallKey,
      webXSmallKey: Keys3.webXSmallKey,
      tittle: 'Schedule',
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
          spaceVer10,
          GestureDetector(
            onTap: () {
              myDateTimePicker(context);
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
                  boldText(
                    text: DateTime.now()
                        .toString()
                        .replaceAll('-', ' ')
                        .replaceAll(':', ' '),
                    color: textColor,
                    size: 20,
                  ),
                  regularText(
                    text: '09.27',
                    size: 16,
                    color: mainColor,
                  ),
                  Icon(
                    Icons.schedule_outlined,
                    size: 18,
                    color: mainColor,
                  )
                  // spaceVer10,
                  // ListView.builder(
                  //   itemCount: 5,
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(bottom: 5),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           regularText(
                  //             text: 'IPA',
                  //             color: textColor,
                  //           ),
                  //           regularText(
                  //             text: '09.00 - 10.00',
                  //             color: mainColor,
                  //             size: 13,
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          lessonSection(),
          spaceVer20,
          picketSection(),
          spaceVer50,
          spaceVer30,
        ],
      ),
    );
  }

  lessonSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceVer10,
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: boldText(
            text: 'Lesson',
            size: 18,
          ),
        ),
        spaceVer20,
        MasonryGridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemCount: scheduleListData.length,
          crossAxisCount: isDesktop ? getItemCountPerRow(context) : 2,
          itemBuilder: (context, i) {
            return AnimationConfiguration.staggeredGrid(
              position: i,
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleDetail(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: bodyColor,
                        boxShadow: [
                          BoxShadow(
                              color: textColor.withOpacity(0.10),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        boldText(
                          text: scheduleListData[i]['day'],
                          color: textColor,
                          size: 18,
                        ),
                        spaceVer10,
                        // ListView.builder(
                        //   itemCount: scheduleListData[i]['subjects'].length,
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index) {
                        //     // int index2 =;
                        //     return Padding(
                        //       padding: const EdgeInsets.only(bottom: 5),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Expanded(
                        //             child: regularText(
                        //               text: scheduleListData[i]['subjects'][i]
                        //                   ['subject'][index],
                        //               color: textColor,
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: regularText(
                        //                 text: '09.00 - 10.00',
                        //                 color: mainColor,
                        //                 size: 13,
                        //                 textAlign: TextAlign.end),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // )
                        ListView.builder(
                          // itemCount: scheduleListData[i]['subjects'].length,
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // int index2 =;
                            return ListView.builder(
                              itemCount: scheduleListData[i]['subjects'][index]
                                      ['subject']
                                  .length,
                              // itemCount: 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index2) {
                                // int index2 =;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: regularText(
                                          text: scheduleListData[i]['subjects']
                                              [index]['subject'][index2],
                                          color: textColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: regularText(
                                            text: '09.00 - 10.00',
                                            color: mainColor,
                                            size: 13,
                                            textAlign: TextAlign.end),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
              ),
            );
          },
        ),
      ],
    );
  }

  picketSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceVer10,
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: boldText(
            text: 'Picket',
            size: 18,
          ),
        ),
        spaceVer20,
        MasonryGridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemCount: scheduleListData.length,
          crossAxisCount: isDesktop ? getItemCountPerRow(context) : 2,
          itemBuilder: (context, i) {
            return AnimationConfiguration.staggeredGrid(
              position: i,
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleDetail(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: bodyColor,
                        boxShadow: [
                          BoxShadow(
                              color: textColor.withOpacity(0.10),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        boldText(
                          text: scheduleListData[i]['day'],
                          color: textColor,
                          size: 18,
                        ),
                        spaceVer10,
                        // ListView.builder(
                        //   itemCount: scheduleListData[i]['subjects'].length,
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index) {
                        //     // int index2 =;
                        //     return Padding(
                        //       padding: const EdgeInsets.only(bottom: 5),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Expanded(
                        //             child: regularText(
                        //               text: scheduleListData[i]['subjects'][i]
                        //                   ['subject'][index],
                        //               color: textColor,
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: regularText(
                        //                 text: '09.00 - 10.00',
                        //                 color: mainColor,
                        //                 size: 13,
                        //                 textAlign: TextAlign.end),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // )
                        ListView.builder(
                          // itemCount: scheduleListData[i]['subjects'].length,
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // int index2 =;
                            return ListView.builder(
                              itemCount: scheduleListData[i]['subjects'][index]
                                      ['subject']
                                  .length,
                              // itemCount: 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index2) {
                                // int index2 =;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: regularText(
                                          text: scheduleListData[i]['subjects']
                                              [index]['subject'][index2],
                                          color: textColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: regularText(
                                            text: '09.00 - 10.00',
                                            color: mainColor,
                                            size: 13,
                                            textAlign: TextAlign.end),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
              ),
            );
          },
        ),
      ],
    );
  }
}
