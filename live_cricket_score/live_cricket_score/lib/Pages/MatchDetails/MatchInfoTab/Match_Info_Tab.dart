import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/MainTeam_Page.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/MatchInfo.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:intl/intl.dart';

class Match_Info_Tab extends StatefulWidget {
  final Matches items;

  const Match_Info_Tab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<Match_Info_Tab> createState() => _Match_InfoState(items);
}

class _Match_InfoState extends State<Match_Info_Tab>
    with AutomaticKeepAliveClientMixin<Match_Info_Tab> {
  final Matches items;
  MatchInfoModel data = MatchInfoModel();
  _Match_InfoState(this.items);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var queryParameters = {
      'matchId': items.matchInfo?.matchId.toString(),
    };

    var response = await http.get(
        Utils.getUrl(Utils.MATCHINFO, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = MatchInfoModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return data != null && data.matchId != null
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 3.w),
                        child: Text(
                          "Squads",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 3.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainTeamPage(
                                items: items,
                                ii: 0,
                              ),
                            )),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 3.w),
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
                              Text(
                                data.team1!.teamName!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Column().expand(),
                              Icon(Icons.arrow_forward_ios, size: 20),
                              SizedBox(
                                width: 3.w,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 99.w,
                        color: MyThemes.divaidarColor,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainTeamPage(
                                items: items,
                                ii: 1,
                              ),
                            )),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 3.w),
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
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                data.team2!.teamName!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Column().expand(),
                              Icon(Icons.arrow_forward_ios, size: 20),
                              SizedBox(
                                width: 3.w,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 3.w),
                        child: Text(
                          "Info",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 3.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Table(
                        columnWidths: {
                          0: FractionColumnWidth(.25),
                          2: FractionColumnWidth(.75)
                        },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Match",
                                        style: TextStyle(
                                            color: MyThemes.textColor,
                                            fontWeight: FontWeight.bold))
                                    .pOnly(left: 12),
                              ),
                              Text(
                                data.matchDesc!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Series",
                                        style: TextStyle(
                                            color: MyThemes.textColor,
                                            fontWeight: FontWeight.bold))
                                    .pOnly(left: 12),
                              ),
                              Text(
                                data.seriesName!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Date",
                                        style: TextStyle(
                                            color: MyThemes.textColor,
                                            fontWeight: FontWeight.bold))
                                    .pOnly(left: 12),
                              ),
                              Text(
                                "${DateFormat('EEE, MMM d').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.startDate!)))} - ${DateFormat('EEE, MMM d').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.endDate!)))}",
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Venue",
                                        style: TextStyle(
                                            color: MyThemes.textColor,
                                            fontWeight: FontWeight.bold))
                                    .pOnly(left: 12),
                              ),
                              Text(
                                data.venueInfo!.ground!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 3.w),
                        child: Text(
                          "Venue Guide",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 3.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Table(
                        columnWidths: {
                          0: FractionColumnWidth(.25),
                          2: FractionColumnWidth(.75)
                        },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Stadium",
                                  style: TextStyle(
                                      color: MyThemes.textColor,
                                      fontWeight: FontWeight.bold),
                                ).pOnly(left: 12),
                              ),
                              Text(
                                data.venueInfo!.ground!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "City",
                                  style: TextStyle(
                                      color: MyThemes.textColor,
                                      fontWeight: FontWeight.bold),
                                ).pOnly(left: 12),
                              ),
                              Text(
                                data.venueInfo!.city!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Capacity",
                                  style: TextStyle(
                                      color: MyThemes.textColor,
                                      fontWeight: FontWeight.bold),
                                ).pOnly(left: 12),
                              ),
                              Text(
                                "${data.venueInfo!.capacity}",
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Ends",
                                  style: TextStyle(
                                      color: MyThemes.textColor,
                                      fontWeight: FontWeight.bold),
                                ).pOnly(left: 12),
                              ),
                              Text(
                                data.venueInfo!.ends!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Host to",
                                  style: TextStyle(
                                      color: MyThemes.textColor,
                                      fontWeight: FontWeight.bold),
                                ).pOnly(left: 12),
                              ),
                              Text(
                                data.venueInfo!.homeTeam!,
                                style: TextStyle(color: MyThemes.textColor),
                              ).p12(),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
