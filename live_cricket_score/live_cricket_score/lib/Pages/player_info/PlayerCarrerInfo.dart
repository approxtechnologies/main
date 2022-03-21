import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/models/PlayerBattingInfoModel.dart';
import 'package:live_cricket_score/models/PlayerCarrerInfoModel.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';

class PlayerCarrerInfo extends StatefulWidget {
  final String id;
  const PlayerCarrerInfo({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PlayerCarrerInfo> createState() => _Player_CarrerInfo_TabState(id);
}

class _Player_CarrerInfo_TabState extends State<PlayerCarrerInfo>
    with AutomaticKeepAliveClientMixin<PlayerCarrerInfo> {
  @override
  bool get wantKeepAlive => true;
  final String id;
  //PlayerCarrerInfoModel data;
  var data;

  _Player_CarrerInfo_TabState(this.id);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var parameters = <String, String>{"playerId": id};
    var response = await http.get(Utils.getUrl(Utils.CARRERINFO, parameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = PlayerCarrerInfoModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && data.values != null) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < data.values!.length; i++)
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [Text(data.values![i].name!.toUpperCase())],
                    ),
                  ),
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(0.3),
                      1: FractionColumnWidth(0.7),
                    },
                    children: [
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [Text("Debut")],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(data.values![i].debut!),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [Text("Last Played")],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(data.values![i].lastPlayed!),
                        ),
                      ])
                    ],
                  )
                ],
              )
          ],
        ),
      );
    } else
      return CircularProgressIndicator().centered();
  }
}
