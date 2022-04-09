import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';

class Live_Tab extends StatefulWidget {
  final Matches items;

  const Live_Tab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<Live_Tab> createState() => _Live_State(items);
}

class _Live_State extends State<Live_Tab>
    with AutomaticKeepAliveClientMixin<Live_Tab> {
  final Matches items;

  _Live_State(this.items);

  static var data;
  bool call = false;

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
        Utils.getUrl(Utils.MATChSCOREBOARD, queryParameters),
        headers: Utils.HEADERS);
    setState(() {
      call = true;
    });
    var decodedData = jsonDecode(response.body);

    print(decodedData);
    data = ScoreBoardModel.fromJson(decodedData);
    if (data == null)
      getData();
    else if (data.scorecard == null) getData();
    setState(() {
      call = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data != null && data.scorecard != null
        ? RefreshIndicator(
            onRefresh: () => getData(),
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                  shape: Utils.radious,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < data.scorecard!.length; i++)
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.w),
                                    child: Text(
                                      "${data.scorecard![i].batTeamSName!}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                            ],
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < data.scorecard!.length; i++)
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 15),
                                      child: Text(
                                        "${data.scorecard![i].score != null ? data.scorecard![i].score : 0} - ${data.scorecard![i].wickets != null ? data.scorecard![i].wickets : 0} (${data.scorecard![i].overs})",
                                        style: TextStyle(fontSize: 20),
                                      )),
                              ]),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                        child: Text(
                          "${data.status}",
                          style: TextStyle(color: MyThemes.textHighlightColor),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : call
            ? Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/images/nodata.svg",

                      ),
                      SizedBox(height: 20),
                      Text("Please, Wait to up coming match...",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator().centered();
  }
}
