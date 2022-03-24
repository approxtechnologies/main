import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/HighLights/HighLights_Container.dart';
import 'package:live_cricket_score/main.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/DropDownloadModel.dart';
import 'package:live_cricket_score/models/HighLightsModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HighLights_Tab extends StatefulWidget {
  final Matches items;

  const HighLights_Tab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<HighLights_Tab> createState() => _HighLights_TabState(items);
}

class _HighLights_TabState extends State<HighLights_Tab>
    with AutomaticKeepAliveClientMixin<HighLights_Tab> {
  final Matches items;
  bool call = false;
  var data = HighLightsModel();
  int iid = 1;
  int htype = 0;

  List<DropDownModel> filters1 = [];

  @override
  void initState() {
    super.initState();

    getData(1.toString(), 0.toString());
  }

  _HighLights_TabState(this.items);

  getData(String iid, String htype) async {
    var queryParameters = {
      'matchId': items.matchInfo?.matchId.toString(),
      'iid': iid,
      'htype': htype,
    };

    var response = await http.get(
        Utils.getUrl(Utils.HIGHLIGHTS, queryParameters),
        headers: Utils.HEADERS);
    setState(() {
      call = true;
    });
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = HighLightsModel.fromJson(decodedData);

    setState(() {
      call = true;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return data != null && data.commentaryLines != null
        ? Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            color: MyThemes.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) =>
                      HighLights_Container(data: data.commentaryLines![index]),
                  itemCount: data.commentaryLines!.length,
                ).expand(),
              ],
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
