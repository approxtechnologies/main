import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/models/PlayerBattingInfoModel.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class PLayerBowlingInfoTab extends StatefulWidget {
  final String id;
  const PLayerBowlingInfoTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PLayerBowlingInfoTab> createState() => _Player_BowlingInfo_TabState(id);
}

class _Player_BowlingInfo_TabState extends State<PLayerBowlingInfoTab>
    with AutomaticKeepAliveClientMixin<PLayerBowlingInfoTab> {
  @override
  bool get wantKeepAlive => true;
  final String id;
  //PlayerBattingInfoModel data;
  var data;

  _Player_BowlingInfo_TabState(this.id);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var parameters = <String, String>{"playerId": id};
    var response = await http.get(Utils.getUrl(Utils.BOWLINGINFO, parameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = PlayerBattingInfoModel.fromJson(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && data.headers != null) {
      var rowWidth = 0.74 / (data.headers!.length - 1);
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: MyThemes.divaidarColor),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Table(
                border: TableBorder.symmetric(
                    inside:
                        BorderSide(width: 1, color: MyThemes.divaidarColor)),
                columnWidths: {
                  0: FractionColumnWidth(.26),
                  for (int i = 1; i < (data.headers!.length - 1); i++)
                    i: FractionColumnWidth(rowWidth),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                        color: MyThemes.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7))),
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 17, horizontal: 8),
                        color: MyThemes.grey,
                        child: Text(
                          "Bowling",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int i = 1; i < (data.headers!.length); i++)
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 17, horizontal: 8),
                          color: MyThemes.grey,
                          child: Text("${data.headers![i]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                  for (int i = 0; i < data.values!.length; i++)
                    if (i != data.values!.length - 1)
                      TableRow(
                        decoration: BoxDecoration(
                            color: i % 2 != 0 ? MyThemes.grey : Colors.white),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 8),
                            child: Text(
                              "${data.values![i].values![0]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (int j = 1;
                              j < (data.values![i].values!.length);
                              j++)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 8),
                              child: Text(
                                "${data.values![i].values![j]}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      )
                    else
                      TableRow(
                        decoration: BoxDecoration(
                            color: i % 2 != 0 ? MyThemes.grey : Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7))),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 8),
                            child: Text(
                              "${data.values![i].values![0]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (int j = 1;
                              j < (data.values![i].values!.length);
                              j++)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 8),
                              child: Text(
                                "${data.values![i].values![j]}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      )
                ],
              ),
            )
          ],
        ),
      );
    } else
      return CircularProgressIndicator().centered();
  }
}
