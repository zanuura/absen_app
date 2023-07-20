import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/main.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  TaskDetail({super.key, this.homeWork = false});
  bool homeWork;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  PageController pageController = PageController(
      // initialPage: 0,
      );
  List<dynamic> itemsTasks = [
    0,
    1,
    2,
    3,
  ];
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return DefaultScaffold(
      tittle: 'Task',
      automaticallyImplyLeading: true,
      actions: [
        popUpMenuTask(type: 'Task'),
      ],
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      webDefault: buildBody(),
      floatingActionButton: fieldInputAnswer(isKeyboardOpen: isKeyboardOpen),
    );
  }

  buildBody({bool? web, bool? webSmall, bool? webMedium, bool? webLarge}) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceVer10,
                boldText(
                  text: 'Matematika',
                  size: 20,
                ),
                spaceVer10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    regularText(
                      text: 'Senin 12 agustus 2023',
                      size: 18,
                    ),
                    regularText(
                      color: mainColor,
                      text: '07:00 -> 01:00',
                    ),
                  ],
                ),
              ],
            ),
          ),
          spaceVer10,
          Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemsTasks.length,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showTaskItems(
                    listItems: itemsTasks,
                    jumpToPage: itemsTasks[index],
                  );
                  print(index);
                  // pageController.animateTo(index.toDouble(),
                  //     duration: Duration(milliseconds: 500),
                  //     curve: Curves.easeIn);
                  // pageController.jumpToPage(itemsTasks[index]);
                },
                child: Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          spaceVer10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: field(
              controller: TextEditingController(
                  text:
                      'Catat lalu kerjakan soal diatas!! lalu kirim catatanya boleh dalam bentuk foto atau file'),
              enabled: false,
              readOnly: true,
            ),
          ),
          spaceVer10,
          userTaskItem(
            userName: 'Your Tasks',
            taskTexts: 'ini tugas nya bu',
            times: '09.15',
            items: itemsTasks,
          ),
          spaceVer20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(text: 'Other Tasks', size: 18),
          ),
          spaceVer10,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => userTaskItem(
              userName: 'hammam',
              taskTexts: 'ini tugas nya bu maaf telat',
              times: '09.34',
              items: itemsTasks,
            ),
          )
        ],
      ),
    );
  }

  fieldInputAnswer({bool isKeyboardOpen = false}) {
    return Padding(
      padding: isKeyboardOpen
          ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
          : const EdgeInsets.all(1.0),
      child: Container(
        color: bodyColor,
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: field(
              hintText: 'your Answer',
            )),
            spaceHor10,
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file,
                color: iconColor,
              ),
            ),
            spaceHor10,
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showTaskItems({
    var listItems,
    int jumpToPage = 0,
  }) {
    // pageController.jumpToPage(jumpToPage);
    // pageController.animateToPage(jumpToPage,
    //     duration: Duration(milliseconds: 500), curve: Curves.ease);
    return showDialog(
      context: context,
      // builder: (context) {
      //   return Scaffold(
      //     appBar: AppBar(
      //       leading: IconButton(
      //           onPressed: () => Navigator.pop(context),
      //           icon: Icon(
      //             Icons.close_rounded,
      //             color: Colors.white,
      //           )),
      //       backgroundColor: Colors.black,
      //       title: boldText(text: 'Task Items', color: Colors.white, size: 16),
      //       centerTitle: true,
      //     ),
      //     backgroundColor: textColor,
      //     body: PageView.builder(
      //       itemCount: listItems.length,
      //       controller: pageController,
      //       itemBuilder: (context, index) {
      //         // print(listItems.length);
      //         // print(listItems[index]);
      //         // print(jumpToPage);
      //         // pageController.animateTo(jumpToPage.toDouble(),
      //         //     duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      //         return Container(
      //           width: double.infinity,
      //           height: double.infinity,
      //           child: Center(
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Icon(
      //                   Icons.image,
      //                   color: Colors.white,
      //                   size: 120,
      //                 ),
      //                 spaceVer10,
      //                 boldText(
      //                   text: listItems[index].toString(),
      //                   color: Colors.white,
      //                 )
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   );
      // },
      builder: (context) => ShowItems(
        jumpToPage: jumpToPage,
        listItems: listItems,
      ),
    );
  }

  userTaskItem(
      {String? userName, String? taskTexts, String? times, var items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      boldText(
                          text: userName != null ? userName : 'name', size: 14),
                      spaceHor10,
                      regularText(
                        text: times != null ? times : 'times',
                        color: mainColor,
                      )
                    ],
                  ),
                  spaceVer5,
                  regularText(text: taskTexts != null ? taskTexts : 'texts'),
                ],
              ),
              popUpMenuAnswer(type: 'Answer')
            ],
          ),
        ),
        spaceVer5,
        Container(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                showTaskItems(
                  listItems: items,
                  jumpToPage: items[index],
                );
              },
              child: Container(
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
        spaceVer10,
      ],
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
      itemBuilder: widget.homeWork == false
          ? (context) => [
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
                    child: Row(children: [
                      Icon(
                        Icons.flag_outlined,
                        color: bodyColor,
                      ),
                      spaceHor10,
                      boldText(
                        text: 'Report $type',
                        color: bodyColor,
                      )
                    ]))
              ]
          : (context) => [
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

  popUpMenuAnswer({String? type}) {
    return popUpMenu(
      context,
      onSelected: (value) {
        if (value == 1) {
          print('Bookmark');
        } else if (value == 2) {
          print('Report');
        }
      },
      itemBuilder: (context) => [
        // PopupMenuItem(
        //   value: 1,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.bookmark_border_rounded,
        //         color: bodyColor,
        //       ),
        //       spaceVer20,
        //       boldText(
        //         text: 'Bokkmark $type',
        //         color: bodyColor,
        //       )
        //     ],
        //   ),
        // ),
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
