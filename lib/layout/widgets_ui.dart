import 'dart:ffi';

import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  ProfileCard(
      {super.key,
      this.web,
      this.webSmall,
      this.webMedium,
      this.webLarge,
      this.onTap});
  bool? web;
  bool? webSmall;
  bool? webMedium;
  bool? webLarge;
  Function()? onTap;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    double avatarSize = widget.web == true ? 150 : 90;
    return Container(
      padding: EdgeInsets.all(widget.web == false ? 10 : 20),
      margin: EdgeInsets.all(widget.web == false ? 10 : 20),
      decoration: BoxDecoration(
          color: bodyColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: textColor.withOpacity(0.10),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: avatarSize,
              width: avatarSize,
              // constraints: BoxConstraints(
              //   maxHeight: 500,
              //   maxWidth: 500,
              //   // minWidth: 50,
              //   // minHeight: 50,
              // ),
              child: CircleAvatar(
                backgroundColor: textColor,
              ),
            ),
          ),
          spaceHor10,
          GestureDetector(
            onTap: widget.onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldText(
                  text: 'Hammam Hanan',
                  size: widget.webSmall == true ? 20 : 16,
                ),
                regularText(text: 'Kelas 12 RPL'),
                regularText(
                  text: 'SMK Islamiyah Ciawi',
                ),
                regularText(text: 'Semester 6'),
              ],
            ),
          )
          // ListTile(
          //   // minLeadingWidth: 300,
          //   // contentPadding: EdgeInsets.all(0),
          //   title: boldText(text: 'Hammam Hanan'),
          //   subtitle: regularText(text: 'Kelas 12 RPL'),
          // ),
        ],
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
  MyListTile({
    super.key,
    this.tittle,
    this.subTittle,
    this.onTap,
    this.trailling,
    this.contentPadding,
    this.taskText,
    this.taskContent,
    this.leading,
  });
  Function()? onTap;
  String? tittle;
  String? subTittle;
  Widget? trailling;
  String? taskText;
  Widget? taskContent;
  EdgeInsetsGeometry? contentPadding;
  Widget? leading;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: widget.contentPadding != null
              ? widget.contentPadding
              : EdgeInsets.symmetric(horizontal: 16.0),
          onTap: widget.onTap,
          leading: widget.leading,
          title: boldText(
            text: widget.tittle,
            size: 14,
          ),
          subtitle: regularText(
            text: widget.subTittle,
            color: mainColor,
          ),
          trailing: widget.trailling,

          // trailing: GestureDetector(
          //   onTap: () {},
          //   child: Icon(
          //     Icons.more_vert_rounded,
          //     color: textColor,
          //   ),
          // ),
        ),
        // spaceVer5,
        widget.taskText != null
            ? regularText(
                text: widget.taskText,
              )
            : Container(),
        widget.taskContent != null ? spaceVer10 : Container(),
        widget.taskContent ?? Container(),
        spaceVer10,
        Divider(
          height: 2,
          thickness: 2,
          color: textColor.withOpacity(0.10),
        )
      ],
    );
  }
}

class ShowItems extends StatefulWidget {
  ShowItems({super.key, this.listItems, this.jumpToPage = 0});
  var listItems;
  int jumpToPage;

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  PageController pageController = PageController();
  bool done = false;

  @override
  void initState() {
    super.initState();
    if (done) {
      pageController.animateToPage(widget.jumpToPage,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
    // pageController.addListener(() {
    //   if (pageController.hasListeners) {
    //     pageController.animateToPage(widget.jumpToPage,
    //         duration: Duration(milliseconds: 300), curve: Curves.ease);
    //   }
    // });
    // pageController.jumpToPage(widget.jumpToPage);
    // pageController.animateToPage(widget.jumpToPage,
    //     duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      done = true;
    });
    // pageController.jumpToPage(widget.jumpToPage);
    // pageController.animateToPage(widget.jumpToPage,
    //     duration: Duration(milliseconds: 300), curve: Curves.ease);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close_rounded,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: boldText(text: 'Task Items', color: Colors.white, size: 16),
        centerTitle: true,
      ),
      backgroundColor: textColor,
      body: PageView.builder(
        itemCount: widget.listItems.length,
        controller: pageController,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 120,
                ),
                spaceVer10,
                boldText(
                  text: widget.listItems[index].toString(),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

holderPlaces({IconData? icons, String? text}) {
  return Column(
    children: [
      Icon(
        icons,
        size: 100,
        color: mainColor,
      ),
      spaceVer10,
      regularText(
        text: text,
        size: 20,
        color: mainColor,
      ),
    ],
  );
}

myDateTimePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  return showDatePicker(
    context: context,
    // initialDatePickerMode: DatePickerMode.day,
    // initialEntryMode: DatePickerEntryMode.input,

    initialDate: initialDate != null ? initialDate : DateTime.now(),
    firstDate: firstDate != null ? firstDate : DateTime.now(),
    lastDate: lastDate != null ? lastDate : DateTime.now(),
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
}

popUpMenu(BuildContext context,
    {Function(dynamic)? onSelected,
    required List<PopupMenuEntry<dynamic>> Function(BuildContext)
        itemBuilder}) {
  return PopupMenuButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 2.0 * 56.0,
      maxWidth: 6.0 * 56.0,
    ),
    icon: Icon(
      Icons.more_vert_outlined,
      color: iconColor,
    ),
    color: textColor,
    onSelected: onSelected,
    itemBuilder: itemBuilder,
  );
}

messageInfo(BuildContext context, {String? message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: textColor,
    clipBehavior: Clip.antiAlias,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    // margin: EdgeInsets.all(15),
    content: boldText(
      text: message,
      color: bodyColor,
    ),
  ));
}
