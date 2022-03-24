import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Player_Info_Tab extends StatefulWidget {
  final String id;
  const Player_Info_Tab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Player_Info_Tab> createState() => _Player_Info_TabState(id);
}

class _Player_Info_TabState extends State<Player_Info_Tab>
    with AutomaticKeepAliveClientMixin<Player_Info_Tab> {
  @override
  bool get wantKeepAlive => true;
  final String id;
  //PlayerInfoModel data;
  var data;

  _Player_Info_TabState(this.id);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var parameters = <String, String>{"playerId": id};
    var response = await http.get(Utils.getUrl(Utils.PLAYERINFO, parameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    data = PlayerInfoModel.fromJson(response.body);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return data != null && data.name != null
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(data.image!, headers: Utils.HEADERS),
                        radius: 45,
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            data.name!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        data.intlTeam![0],
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: .5.h, horizontal: 3.w),
                            child: Text(
                              "Personal Information",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: MyThemes.textColor),
                            ),
                          )
                        ],
                      ),
                       SizedBox(
                        height: .8.h,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  margin: EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Table(
                        columnWidths: {
                          0: FractionColumnWidth(.35),
                          2: FractionColumnWidth(.65)
                        },
                        children: [
                          if (data.doB != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Born",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.doB!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                          if (data.birthPlace != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Birth Place",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.birthPlace!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                          if (data.nickName != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "NickName",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.nickName!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                          if (data.role != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Role",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.role!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                          if (data.bat != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Batting Style",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.bat!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                          if (data.bowl != null)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Bowling Style",
                                    style: TextStyle(
                                        color: MyThemes.textColor,
                                        fontWeight: FontWeight.bold),
                                  ).pOnly(left: 12),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(data.bowl!,
                                        style: TextStyle(
                                            color: MyThemes.textColor))),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: .8.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                      child: Text(
                        "ICC Rankings",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyThemes.textColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyThemes.divaidarColor),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(
                            width: 1, color: MyThemes.divaidarColor)),
                    children: [
                      // 1---------------------------------------------------------------------------------------------------------
                      TableRow(
                        decoration: BoxDecoration(
                            color: MyThemes.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        children: [
                          Container(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                "Test",
                                style: TextStyle(
                                    color: MyThemes.TEXT1COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ).pOnly(left: 12),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                "ODI",
                                style: TextStyle(
                                    color: MyThemes.TEXT1COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ).pOnly(left: 12),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                "T20I",
                                style: TextStyle(
                                    color: MyThemes.TEXT1COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ).pOnly(left: 12),
                            ),
                          ),
                        ],
                      ),

                      // Bat -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              "Bat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyThemes.TEXT1COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bat!.testRank != null)
                                      Text(
                                        "${data.currRank!.bat!.testRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bat!.testDiffRank !=
                                        null)
                                      data.currRank!.bat!.testDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bat!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bat!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bat!.testBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bat!.testBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bat!.odiRank != null)
                                      Text(
                                        "${data.currRank!.bat!.odiRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bat!.odiDiffRank != null)
                                      data.currRank!.bat!.odiDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bat!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bat!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bat!.odiBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bat!.odiBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bat!.t20Rank != null)
                                      Text(
                                        "${data.currRank!.bat!.t20Rank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bat!.t20DiffRank != null)
                                      data.currRank!.bat!.t20DiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bat!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bat!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bat!.t20BestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bat!.t20BestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // bowl-----------------------------------------------------------------------------------------------------------------------------------------

                      TableRow(
                        decoration: BoxDecoration(color: MyThemes.grey),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              "Bat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyThemes.TEXT1COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bowl!.testRank != null)
                                      Text(
                                        "${data.currRank!.bowl!.testRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bowl!.testDiffRank !=
                                        null)
                                      data.currRank!.bowl!.testDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bowl!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bowl!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bowl!.testBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bowl!.testBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bowl!.odiRank != null)
                                      Text(
                                        "${data.currRank!.bowl!.odiRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bowl!.odiDiffRank !=
                                        null)
                                      data.currRank!.bowl!.odiDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bowl!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bowl!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bowl!.odiBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bowl!.odiBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.bowl!.t20Rank != null)
                                      Text(
                                        "${data.currRank!.bowl!.t20Rank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.bowl!.t20DiffRank !=
                                        null)
                                      data.currRank!.bowl!.t20DiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.bowl!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bowl!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.bowl!.t20BestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.bowl!.t20BestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // alll -=------------------------------------------------------------------------=-=-=-----------------------=-=--------------------
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              "All",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyThemes.TEXT1COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.all!.testRank != null)
                                      Text(
                                        "${data.currRank!.all!.testRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.all!.testDiffRank !=
                                        null)
                                      data.currRank!.all!.testDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.all!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.all!.testDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.all!.testBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.all!.testBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.all!.odiRank != null)
                                      Text(
                                        "${data.currRank!.all!.odiRank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.all!.odiDiffRank != null)
                                      data.currRank!.all!.odiDiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.all!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.all!.odiDiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.all!.odiBestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.all!.odiBestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (data.currRank!.all!.t20Rank != null)
                                      Text(
                                        "${data.currRank!.all!.t20Rank}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    else
                                      Text(
                                        "--",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    if (data.currRank!.all!.t20DiffRank != null)
                                      data.currRank!.all!.t20DiffRank!
                                              .startsWith("+")
                                          ? Text(
                                              "  ${data.currRank!.all!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          : Text(
                                              "  ${data.currRank!.bowl!.t20DiffRank}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (data.currRank!.all!.t20BestRank != null)
                                  Text(
                                    "Best: ${data.currRank!.all!.t20BestRank}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                      child: Text(
                        "Teams",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyThemes.textColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .8.h,
                ),
                Card(
                  color: MyThemes.grey,
                  elevation: 0,
                  shape: Utils.radious,
                  margin: EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "${data.teams}",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyThemes.textColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .8.h,
                ),
                Card(
                  color: MyThemes.grey,
                  elevation: 0,
                  shape: Utils.radious,
                  margin: EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Html(data: "${data.bio}"),
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
