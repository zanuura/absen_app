import 'package:absen_app/styles/color_palette.dart';
import 'package:absen_app/styles/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleDetail extends StatefulWidget {
  const ScheduleDetail({super.key});

  @override
  State<ScheduleDetail> createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      tittle: 'Schedule Detail',
      automaticallyImplyLeading: true,
      actions: [],
      mobileDefault: buildBody(),
      mobileHandset: buildBody(),
      mobileTablet: buildBody(),
      webDefault: buildBody(web: true),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(
              text: 'Senin',
              color: textColor,
              size: 20,
            ),
          ),
          spaceVer10,
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: regularText(
                            text: 'IPA',
                            color: textColor,
                            size: 18,
                          ),
                        ),
                        Expanded(
                          child: regularText(
                            text: '09.00 - 10.00',
                            color: mainColor,
                            size: 15,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    regularText(
                      text: 'Budi Soto',
                      color: mainColor,
                      size: 15,
                      textAlign: TextAlign.end,
                    ),
                    simpleDivider,
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
