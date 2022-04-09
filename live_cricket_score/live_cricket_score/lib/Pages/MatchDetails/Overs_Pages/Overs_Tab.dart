import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchDetail_Page.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Overs_Pages/Overs_Container.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/OversModel.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
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
  bool isLoading = false;
  final Matches items;
  int inigs = 0;
  OversModel data = OversModel();

  _Overs_TabState(this.items);

  @override
  bool get wantKeepAlive => true;

  bool call = false;

  @override
  void initState() {
    super.initState();

    controller
      ..addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          setState(() {});
          isLoading = true;
          if (list![list.length - 1].overNum! == 0) {
            getData((list[list.length - 1].timestamp!).toString(),
                (inigs).toString());
          } else {
            if (inigs - 1 >= 0) {
              inigs--;
              getData((list[list.length - 1].timestamp!).toString(),
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
    setState(() {
      call = true;
    });
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = OversModel.fromJson(decodedData);
    if (data != null && data.matchHeaders != null) {
      getData(timestamp, i);
    }

    setState(() {
      if (data != null && data.overSepList != null) {
        if (i != "") {
          for (int j = 1; j < data.overSepList![0].overSep!.length; j++)
            list.add(data.overSepList![0].overSep![j]);
        } else {
          list.addAll(data.overSepList![0].overSep!);
        }
        inigs = data.miniscore!.inningsScores![0].inningsScore!.length - 1;
      }

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list != null && list.length > 0)
      inigs = data.miniscore!.inningsScores![0].inningsScore!.length;
    return data != null && data.matchHeaders != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Card(
                elevation: 0,
                color: MyThemes.grey,
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
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
                            for (int i = 0;
                                i <
                                    data.miniscore!.inningsScores![0]
                                        .inningsScore!.length;
                                i++)
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.w),
                                  child: Text(
                                    "${data.miniscore!.inningsScores![0].inningsScore?[i].batTeamShortName}",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0;
                                  i <
                                      data.miniscore!.inningsScores![0]
                                          .inningsScore!.length;
                                  i++)
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 15),
                                    child: Text(
                                      "${data.miniscore!.inningsScores![0].inningsScore?[i].runs != null ? data.miniscore!.inningsScores![0].inningsScore![i].runs! : 0} - ${data.miniscore!.inningsScores![0].inningsScore?[i].wickets != null ? data.miniscore!.inningsScores![0].inningsScore![i].wickets : 0}(${data.miniscore!.inningsScores![0].inningsScore?[i].overs})",
                                      style: TextStyle(fontSize: 20),
                                    )),
                            ]),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                      child: Text(
                        "${data.matchHeaders!.status}",
                        style: TextStyle(color: MyThemes.textHighlightColor),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    )
                  ],
                ),
              ),
              Container(
                height: 45.h,
                child: Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  shape: Utils.radious,
                  child: Column(
                    children: [
                      ListView.builder(
                        controller: controller,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Overs_Container(overSep: list[index]);
                        },
                        itemCount: list.length,
                      ).expand(),
                      if (isLoading)
                        Container(
                            child: CircularProgressIndicator().centered(),
                            margin: EdgeInsets.symmetric(vertical: 20)),
                    ],
                  ),
                ),
              ),
            ],
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
                      Text(
                        "Please, Wait to up coming event...",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator().centered();
  }
}
