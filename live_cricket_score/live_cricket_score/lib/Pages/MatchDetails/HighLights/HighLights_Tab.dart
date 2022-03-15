import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:live_cricket_score/Pages/MatchDetails/HighLights/HighLights_Container.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/DropDownloadModel.dart';
import 'package:live_cricket_score/models/HighLightsModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
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

  var data = HighLightsModel();
  int iid = 1;
  int htype = 0;
  String FirstFilterValue = "";
  var filters2;

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
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = HighLightsModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    getFirstFilter();
    return data != null && data.commentaryLines != null
        ? Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      // DropdownButton(
                      //     items: filters1.map((DropDownModel map) {
                      //       return new DropdownMenuItem<String>(
                      //         value: map.txt,
                      //         child: new Text(map.txt,
                      //             style: new TextStyle(color: Colors.black)),
                      //       );
                      //     }).toList(),
                      //     value: FirstFilterValue,
                      //     onChanged: (string) {
                      //       selectFilter1(string.toString());
                      //       FirstFilterValue = string.toString();
                      //     })
                    ],
                  ).expand(),
                  Column(
                    children: [
                      // DropdownButton(
                      //     items: filters2,
                      //     onChanged: (string) {
                      //       selectFilter2(string.toString());
                      //     })
                    ],
                  ).expand()
                ],
              ),
              ListView.builder(
                itemBuilder: (context, index) =>
                    HighLights_Container(data: data.commentaryLines![index]),
                itemCount: data.commentaryLines!.length,
              ).expand(),
            ],
          )
        : CircularProgressIndicator().centered();
  }

  selectFilter2(String s) {
    switch (s.toString().toLowerCase()) {
      case 'fours':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'sixs':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'wickets':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'fifties':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'hundreds':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'dropped catches':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'udrs':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      case 'others':
        htype = 0;
        getData(iid.toString(), htype.toString());
        break;

      default:
        htype = 0;
        getData(iid.toString(), htype.toString());
    }
  }

  selectFilter1(String s) {
    if (items.matchScore!.team1Score != null) {
      if (items.matchScore!.team1Score?.inngs1 != null) {
        if ("${items.matchInfo!.team1!.teamSName}-1st inn" == s) {
          iid = items.matchScore!.team1Score!.inngs1!.inningsId!;
        }
      }

      if (items.matchScore!.team1Score?.inngs2 != null) {
        if ("${items.matchInfo!.team1!.teamSName}-2nd inn" == s) {
          iid = items.matchScore!.team1Score!.inngs2!.inningsId!;
        }
      }
    }
    if (items.matchScore!.team2Score != null) {
      if (items.matchScore!.team2Score?.inngs1 != null) {
        if ("${items.matchInfo!.team2!.teamSName}-1st inn" == s) {
          iid = items.matchScore!.team2Score!.inngs1!.inningsId!;
        }
      }

      if (items.matchScore!.team2Score?.inngs2 != null) {
        if ("${items.matchInfo!.team2!.teamSName}-2nd inn" == s) {
          iid = items.matchScore!.team2Score!.inngs2!.inningsId!;
        }
      }
    }

    FirstFilterValue = filters1[0].txt;
  }

  getFirstFilter() {
    List<DropDownModel> list;
    var d1, d2, d3, d4;
    if (items.matchScore!.team1Score != null) {
      if (items.matchScore!.team1Score?.inngs1 != null) {
        //filters1.add("${items.matchInfo!.team1!.teamSName}-1st inn");
        d1 = DropDownModel(
            txt: "${items.matchInfo!.team1!.teamSName}-1st inn", value: 1);
      }

      if (items.matchScore!.team1Score?.inngs2 != null) {
        //filters1.add("${items.matchInfo!.team1!.teamSName}-2nd inn");
        d2 = new DropDownModel(
            txt: "${items.matchInfo!.team1!.teamSName}-2nd inn", value: 2);
      }
    }
    if (items.matchScore!.team2Score != null) {
      if (items.matchScore!.team2Score?.inngs1 != null) {
        //filters1.add("${items.matchInfo!.team2!.teamSName}-1st inn");
        d3 = DropDownModel(
            txt: "${items.matchInfo!.team2!.teamSName}-1st inn", value: 3);
      }

      if (items.matchScore!.team2Score?.inngs2 != null) {
        //filters1.add("${items.matchInfo!.team2!.teamSName}-2nd inn");
        d4 = new DropDownModel(
            txt: "${items.matchInfo!.team2!.teamSName}-2nd inn", value: 4);
      }
    }
    if (d1 != null && d2 != null && d3 != null && d4 != null) {
      filters1 = [d1, d2, d3, d4];
    } else if (d1 != null && d2 != null && d3 != null && d4 == null) {
      filters1 = [d1, d2, d3];
    } else if (d1 != null && d2 == null && d3 != null && d4 != null) {
      filters1 = [d1, d4, d3];
    } else if (d1 != null && d2 == null && d3 != null && d4 == null) {
      filters1 = [d1, d3];
    } else if (d1 != null && d2 == null && d3 == null && d4 == null) {
      filters1 = [d1];
    } else if (d1 == null && d2 == null && d3 != null && d4 == null) {
      filters1 = [d3];
    }
  }
}
