import 'package:absen_app/layout/widgets_ui.dart';
import 'package:absen_app/main.dart';
import 'package:absen_app/pages/task_detail.dart';
import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class AttendessDetail extends StatefulWidget {
  const AttendessDetail({super.key});

  @override
  State<AttendessDetail> createState() => _AttendessDetailState();
}

class _AttendessDetailState extends State<AttendessDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'Attendees Detail',
      automaticallyImplyLeading: true,
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      // body: buildBody(),
      actions: [],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: normalButton(child: boldText(text: 'Masuk')),
              ),
            ),
            spaceHor10,
            Expanded(
              child: Container(
                height: 50,
                child: normalButton(child: boldText(text: 'Pulang')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildBody({bool? web, bool? webSmall, bool? webMedium, bool? webLarge}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVer10,
            boldText(
              text: 'Senin 12\nAgustus 2022',
              size: 20,
            ),
            spaceVer10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                regularText(
                  text: 'Masuk -> Pulang',
                  size: 18,
                ),
                regularText(
                  color: mainColor,
                  text: '07:00 -> 01:00',
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MyListTile(
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
