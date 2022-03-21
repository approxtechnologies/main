import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/models/PlayerBattingInfoModel.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
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
      var rowWidth = 0.76 / (data.headers!.length - 1);
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: FractionColumnWidth(.24),
                for (int i = 0; i < (data.headers!.length - 1); i++)
                  i: FractionColumnWidth(rowWidth),
              },
              children: [
                TableRow(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      color: Theme.of(context).primaryColorLight,
                      child: Text("Bowling"),
                    ),
                    for (int i = 1; i < (data.headers!.length); i++)
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        color: Theme.of(context).primaryColorLight,
                        child: Text(
                          "${data.headers![i]}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                  ],
                ),
                for (int i = 0; i < data.values!.length; i++)
                  TableRow(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Text(
                          "${data.values![i].values![0]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int j = 1; j < (data.values![i].values!.length); j++)
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: Text(
                            "${data.values![i].values![j]}",
                            textAlign: TextAlign.end,
                          ),
                        ),
                    ],
                  ),
              ],
            )
          ],
        ),
      );
    } else
      return CircularProgressIndicator().centered();
  }
}
