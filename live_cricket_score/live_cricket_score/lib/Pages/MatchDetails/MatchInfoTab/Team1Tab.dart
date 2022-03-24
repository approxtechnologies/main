import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/player_info/MainPlayerInfo.dart';
import 'package:live_cricket_score/models/TeamPlayerListModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Team1Tab extends StatefulWidget {
  final int id;

  const Team1Tab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Team1Tab> createState() => _Team1TabState(id);
}

class _Team1TabState extends State<Team1Tab>
    with AutomaticKeepAliveClientMixin<Team1Tab> {
  @override
  bool get wantKeepAlive => true;

  final int id;

  _Team1TabState(this.id);

  @override
  void initState() {
    getData();
    super.initState();
  }

  var data;

  getData() async {
    var queryParameters = {
      'teamId': id.toString(),
    };

    var response = await http.get(
        Utils.getUrl(Utils.TEAMPLAYERS, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    data = TeamPlayerListModel.fromJson(decodedData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return data != null
        ? ListView.builder(
            primary: true,
            addAutomaticKeepAlives: true,
            itemBuilder: (context, index) {
              if (data.player![index].id != null) {
                return Card(
                  elevation: 0,
                  color: MyThemes.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  child: Column(
                    children: [
                      SizedBox(height: 1.2.h),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MainPlayerInfo(played: data.player![index]),
                            )),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 80,
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundImage: NetworkImage(
                                      Utils.getUrl(Utils.IMAGEAPI, {
                                        'id': data.player![index].imageId
                                            .toString()
                                      }).toString(),
                                      headers: Utils.HEADERS,
                                    ),
                                  )),
                              Container(
                                child: Text(
                                  data.player![index].name!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.2.h),
                    ],
                  ),
                );
              } else
                return Column(
                  children: [
                    SizedBox(height: 2.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                      child: Row(
                        children: [
                          Text(
                            data.player![index].name!.toString(),
                            style: TextStyle(
                                color: MyThemes.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
            },
            itemCount: data.player!.length,
          )
        : CircularProgressIndicator().centered();
  }
}
