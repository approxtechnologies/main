import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';

import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Batsmen_Container.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Boller_container.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/Fow_Container.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';

class Score_Board_Tab extends StatefulWidget {
  final Matches items;

  //tatic ScoreBoardModel data;

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
  var data;
  _ScoreBoard_State(this.items);

  @override
  bool get wantKeepAlive => true;

  bool call = false;

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
    setState(() {
      call = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data != null && data.status != null
        ? RefreshIndicator(
            onRefresh: () => getData(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                    child: Text(
                      "${data.status}",
                      style: TextStyle(color: MyThemes.textHighlightColor),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: MyThemes.divaidarColor, width: 1.0)),
                          margin: EdgeInsets.symmetric(
                              vertical: .5.h, horizontal: 3.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ExpansionTile(
                              collapsedBackgroundColor: MyThemes.grey,
                              backgroundColor: Theme.of(context).primaryColor,
                              initiallyExpanded:
                                  index == (data.scorecard!.length - 1),
                              title: Text(
                                "${data.scorecard![index].score != null ? data.scorecard![index].score : 0} - ${data.scorecard![index].wickets != null ? data.scorecard![index].wickets : 0} (${data.scorecard![index].overs})",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              textColor: Colors.white,
                              collapsedTextColor: MyThemes.textColor,
                              collapsedIconColor: MyThemes.divaidarColor,
                              iconColor: Colors.white,
                              leading: Text(
                                "${data.scorecard![index].batTeamName!.toUpperCase()}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              children: [
                                if (data.scorecard![index].batsman != null)
                                  Batsmen_Container(
                                    batsman: data.scorecard![index].batsman!,
                                  ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 3.w),
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
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 3.w),
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
                                              "${data.scorecard![index].score != null ? data.scorecard![index].score : 0} - ${data.scorecard![index].wickets != null ? data.scorecard![index].wickets : 0} (${data.scorecard![index].overs})",
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                if (data.scorecard![index].bowler != null)
                                  Bower_Container(
                                    bowler: data.scorecard![index].bowler!,
                                  ),
                                if (data.scorecard![index].fow != null &&
                                    data.scorecard![index].fow![0] != null &&
                                    data.scorecard![index].fow![0].fow != null)
                                  Fow_Container(
                                    fow: data.scorecard![index].fow![0].fow!,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: data.scorecard?.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        : call
            ? Center(
                child: SvgPicture.asset(
                "assets/images/no_data.svg",
                width: 120,
                height: 120,
              ))
            : CircularProgressIndicator().centered();
  }
}
