import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/Pages/MatchDetails/MatchDetail_Page.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/ScoreBoard.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/DataModel.dart';
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

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    if (MatchDetail_Page.data == null)
      getData();
    else if (MatchDetail_Page.data.status == null) getData();
  }

  getData() async {
    var queryParameters = {
      'matchId': items.matchInfo?.matchId.toString(),
    };

    var response = await http.get(
        Utils.getUrl(Utils.MATChSCOREBOARD, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    MatchDetail_Page.data = ScoreBoardModel.fromJson(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MatchDetail_Page.data != null && MatchDetail_Page.data.status != null
        ? RefreshIndicator(
            onRefresh: () => getData(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0;
                              i < MatchDetail_Page.data.scorecard!.length;
                              i++)
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 15),
                                child: Text(
                                  "${MatchDetail_Page.data.scorecard![i].batTeamSName!}",
                                  style: TextStyle(fontSize: 20),
                                )),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < MatchDetail_Page.data.scorecard!.length;
                                i++)
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 15),
                                  child: Text(
                                    "${MatchDetail_Page.data.scorecard![i].score} - ${MatchDetail_Page.data.scorecard![i].wickets} (${MatchDetail_Page.data.scorecard![i].overs})",
                                    style: TextStyle(fontSize: 20),
                                  )),
                          ]),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                    child: Text(
                      "${MatchDetail_Page.data.status}",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
