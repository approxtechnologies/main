import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Overs_Pages/Overs_Container.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/OversModel.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:velocity_x/velocity_x.dart';

class Overs_Tab extends StatefulWidget {
  final Matches items;

  const Overs_Tab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<Overs_Tab> createState() => _Overs_TabState(items);
}

class _Overs_TabState extends State<Overs_Tab>
    with AutomaticKeepAliveClientMixin<Overs_Tab> {
  ScrollController controller = new ScrollController();
  List<OverSep> list = [];

  final Matches items;
  int inigs = 0;
  OversModel data = OversModel();

  _Overs_TabState(this.items);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    controller
      ..addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          if (data.overSepList![0]
                  .overSep![data.overSepList![0].overSep!.length - 1].overNum! >
              1)
            getData(
                (int.parse(data
                            .overSepList![0]
                            .overSep![data.overSepList![0].overSep!.length - 1]
                            .timestamp!) +
                        1)
                    .toString(),
                (inigs).toString());
          else {
            if (inigs - 1 >= 0) {
              inigs--;
              getData(
                  (int.parse(data
                              .overSepList![0]
                              .overSep![
                                  data.overSepList![0].overSep!.length - 1]
                              .timestamp!) +
                          1)
                      .toString(),
                  (inigs).toString());
            }
          }
        }
      });

    getData("", "");
  }

  getData(String timestamp, String i) async {
    var queryParameters = {
      'matchId': items.matchInfo?.matchId.toString(),
      'iid': i,
      'tms': timestamp,
    };

    var response = await http.get(
        Utils.getUrl(Utils.OVERSFETCH, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = OversModel.fromJson(decodedData);

    list.addAll(data.overSepList![0].overSep!);
    inigs = data.miniscore!.inningsScores![0].inningsScore!.length - 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && data.matchHeaders != null)
      inigs = data.miniscore!.inningsScores![0].inningsScore!.length;
    return data != null && data.matchHeaders != null
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = inigs - 1; i >= 0; i--)
                            Text(
                              "${data.miniscore!.inningsScores![0].inningsScore?[i].batTeamShortName}   ${data.miniscore!.inningsScores![0].inningsScore?[i].runs}-${data.miniscore!.inningsScores![0].inningsScore?[i].wickets} (${data.miniscore!.inningsScores![0].inningsScore?[i].overs})",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            ).p12(),
                          Text(
                            "${data.matchHeaders!.status}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ).p12(),
                        ],
                      ),
                    ],
                  ),
                ),
                //data.overSepList![0].overSep![index
                ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Overs_Container(overSep: list[index]);
                  },
                  itemCount: list.length,
                ).expand()
              ],
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
