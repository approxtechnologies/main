import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Batsmen_Container.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Boller_container.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Fow_Container.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/MatchInfo.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Score_Board_Tab extends StatefulWidget {
  final Matches items;

  const Score_Board_Tab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<Score_Board_Tab> createState() => _ScoreBoard_State(items);
}

class _ScoreBoard_State extends State<Score_Board_Tab>
    with AutomaticKeepAliveClientMixin<Score_Board_Tab> {
  final Matches items;
  ScoreBoardModel data = ScoreBoardModel();
  _ScoreBoard_State(this.items);

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
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = ScoreBoardModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return data != null && data.status != null
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("${data.status} d").p12(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Text(
                                  data.scorecard![index].batTeamName!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                trailing: Text(
                                    "${data.scorecard![index].score} - ${data.scorecard![index].wickets} (${data.scorecard![index].overs})",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                textColor: Colors.white,
                              ),
                              Batsmen_Container(
                                batsman: data.scorecard![index].batsman!,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0, left: 20.0),
                                        child: Text(
                                          "Extras",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${Utils.cheaknull(data.scorecard![index].extras!.total)} b ${Utils.cheaknull(data.scorecard![index].extras!.byes)}, lb ${Utils.cheaknull(data.scorecard![index].extras!.legByes)}, w ${Utils.cheaknull(data.scorecard![index].extras!.wides)}, nb ${Utils.cheaknull(data.scorecard![index].extras!.noBalls)} ",
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0, left: 20.0),
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${data.scorecard![index].score} - ${data.scorecard![index].wickets} (${data.scorecard![index].overs})",
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Bower_Container(
                                bowler: data.scorecard![index].bowler!,
                              ),
                              Fow_Container(
                                fow: data.scorecard![index].fow![0].fow!
                                ,
                              ),
                            ],
                          ).expand(),
                        ],
                      );
                    },
                    itemCount: data.scorecard?.length,
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator().centered();
  }
}