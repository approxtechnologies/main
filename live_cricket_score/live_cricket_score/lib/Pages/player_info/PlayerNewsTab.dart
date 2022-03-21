import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/models/PlayerBattingInfoModel.dart';
import 'package:live_cricket_score/models/PlayerCarrerInfoModel.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/models/PlayerNewsModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class PlayerNewsTab extends StatefulWidget {
  final String id;
  const PlayerNewsTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PlayerNewsTab> createState() => _Player_News_TabState(id);
}

class _Player_News_TabState extends State<PlayerNewsTab>
    with AutomaticKeepAliveClientMixin<PlayerNewsTab> {
  @override
  bool get wantKeepAlive => true;
  final String id;
  //PlayerNewsModel data;
  var data;

  _Player_News_TabState(this.id);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var parameters = <String, String>{"playerId": id};
    var response = await http.get(Utils.getUrl(Utils.NEWSINFO, parameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = PlayerNewsModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && data.newsList != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Table(
              columnWidths: {
                0: FractionColumnWidth(.05),
                1: FractionColumnWidth(.9),
                2: FractionColumnWidth(.05)
              },
              children: [
                TableRow(children: [
                  Container(),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    primary: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return data.newsList![index].story != null
                          ? Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 60,
                                        child: Image.network(
                                          Utils.getUrl(Utils.IMAGEAPI, {
                                            "id": data
                                                .newsList![index].story!.imageId
                                                .toString()
                                          }).toString(),
                                          headers: Utils.HEADERS,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${data.newsList![index].story!.hline}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.newsList![index].story!.pubTime!)))}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ).expand()
                                    ],
                                  ),
                                  Container(
                                    child: Text(
                                        data.newsList![index].story!.intro!),
                                  )
                                ],
                              ),
                            )
                          : Container();
                    },
                    itemCount: data.newsList!.length,
                  ),
                  Container()
                ])
              ],
            ),
          ],
        ),
      );
    } else
      return CircularProgressIndicator().centered();
  }
}
