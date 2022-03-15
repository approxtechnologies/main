import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/MainTeam_Page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/MatchInfo.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
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
                Container(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "SQUADS",
                        ).p8(),
                      )
                    ],
                  ),
                ),
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
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8),
                          child: Text(data.team1!.teamName!).p12(),
                        ),
                        Column().expand(),
                        Icon(Icons.arrow_forward_ios),
                        10.widthBox
                      ],
                    ),
                  ),
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
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(8),
                            child: Text(data.team2!.teamName!).p12()),
                        Column().expand(),
                        Icon(Icons.arrow_forward_ios),
                        10.widthBox
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "INFO",
                        ).p8(),
                      )
                    ],
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FractionColumnWidth(.25),
                    1: FractionColumnWidth(.05),
                    2: FractionColumnWidth(.7)
                  },
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Match",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.matchDesc!).p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Series",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.seriesName!).p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Date",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text("${DateFormat('EEE, MMM d').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.startDate!)))} - ${DateFormat('EEE, MMM d').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.endDate!)))}")
                            .p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Venue",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.venueInfo!.ground!).p12(),
                      ],
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "VENUE GUIDE",
                        ).p8(),
                      )
                    ],
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FractionColumnWidth(.25),
                    1: FractionColumnWidth(.05),
                    2: FractionColumnWidth(.7)
                  },
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Stadium",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.venueInfo!.ground!).p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "City",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.venueInfo!.city!).p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Capacity",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text("${data.venueInfo!.capacity}").p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ends",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.venueInfo!.ends!).p12(),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Host to",
                            style: TextStyle(color: Colors.grey.shade500),
                          ).pOnly(left: 12),
                        ),
                        Container(),
                        Text(data.venueInfo!.homeTeam!).p12(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
