import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchDetail_Page.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

import '../../models/DataModel.dart';

class List_Item extends StatelessWidget {
  final Matches items;

  const List_Item({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetail_Page(
                items: items,
              ),
            )),
        child: Card(
          elevation: 0,
          color: MyThemes.grey,
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: .8.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            children: [
              Container(
                width: 94.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${items.matchInfo?.seriesName}",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: MyThemes.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: .8.h,
                          ),
                          if (DateFormat('dd-MM-yyyy').format(
                                  DateTime.fromMillisecondsSinceEpoch(int.parse(
                                      items.matchInfo!.startDate!))) ==
                              DateFormat('dd-MM-yyyy').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(items.matchInfo!.endDate!))))
                            Text(
                              "Time :${DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(items.matchInfo!.startDate!)))}",
                              style: TextStyle(fontSize: 12),
                            )
                          else
                            Text(
                              "Time :${DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(items.matchInfo!.startDate!)))} to ${DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(items.matchInfo!.endDate!)))}",
                              style: TextStyle(fontSize: 12),
                            ),
                          SizedBox(
                            height: .6.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 100.w,
                      color: Vx.hexToColor("#CFCFCF"),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 1.w),
                              child: CircleAvatar(
                                radius: 6.w,
                                backgroundImage: NetworkImage(
                                  Utils.getUrl(Utils.IMAGEAPI, {
                                    'id': items.matchInfo!.team1!.imageId
                                        .toString()
                                  }).toString(),
                                  headers: Utils.HEADERS,
                                ),
                                backgroundColor: MyThemes.grey,
                              )),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items.matchInfo!.team1!.teamSName!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (items.matchScore?.team1Score != null &&
                                  items.matchScore!.team1Score!.inngs1 != null)
                                Text(
                                    "${items.matchScore!.team1Score!.inngs1!.runs == null ? 0 : items.matchScore!.team1Score!.inngs1!.runs} / ${items.matchScore!.team1Score!.inngs1!.wickets == null ? 0 : items.matchScore!.team1Score!.inngs1!.wickets}"),
                              if (items.matchScore?.team1Score != null &&
                                  items.matchScore!.team1Score!.inngs2 != null)
                                Text(
                                    "${items.matchScore!.team1Score!.inngs2!.runs == null ? 0 : items.matchScore!.team1Score!.inngs2!.runs} / ${items.matchScore!.team1Score!.inngs2!.wickets == null ? 0 : items.matchScore!.team1Score!.inngs2!.wickets}")
                            ],
                          ).expand(),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                    "assets/images/arrow_left_right.svg"),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  items.matchInfo!.team2!.teamSName!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (items.matchScore?.team2Score != null &&
                                  items.matchScore!.team2Score!.inngs1 != null)
                                Text(
                                    "${items.matchScore!.team2Score!.inngs1!.runs == null ? 0 : items.matchScore!.team2Score!.inngs1!.runs} / ${items.matchScore!.team2Score!.inngs1!.wickets == null ? 0 : items.matchScore!.team2Score!.inngs1!.wickets}"),
                              if (items.matchScore?.team2Score != null &&
                                  items.matchScore!.team2Score!.inngs2 != null)
                                Text(
                                    "${items.matchScore!.team2Score!.inngs2!.runs == null ? 0 : items.matchScore!.team2Score!.inngs2!.runs} / ${items.matchScore!.team2Score!.inngs2!.wickets == null ? 0 : items.matchScore!.team2Score!.inngs2!.wickets}")
                            ],
                          ).expand(),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 1.w),
                              child: CircleAvatar(
                                radius: 6.w,
                                backgroundImage: NetworkImage(
                                  Utils.getUrl(Utils.IMAGEAPI, {
                                    'id': items.matchInfo!.team2!.imageId
                                        .toString()
                                  }).toString(),
                                  headers: Utils.HEADERS,
                                ),
                                backgroundColor: MyThemes.grey,
                              )),
                        ],
                      ),
                    ),
                    if (items.matchInfo!.status != null)
                      Container(
                        padding: EdgeInsets.only(left: 3.w, bottom: 2.h),
                        child: Text(
                          "${items.matchInfo!.status}",
                          style: TextStyle(color: MyThemes.textHighlightColor),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
