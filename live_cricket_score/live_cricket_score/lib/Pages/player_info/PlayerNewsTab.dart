import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/models/PlayerBattingInfoModel.dart';
import 'package:live_cricket_score/models/PlayerCarrerInfoModel.dart';
import 'package:live_cricket_score/models/PlayerInfoModel.dart';
import 'package:live_cricket_score/models/PlayerNewsModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    if (data == null)
      getData();
    else if (data.newsList == null) getData();
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
                0: FractionColumnWidth(.03),
                1: FractionColumnWidth(.94),
                2: FractionColumnWidth(.03)
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
                          ? Card(
                              elevation: 0,
                              color: MyThemes.grey,
                              margin: EdgeInsets.symmetric(vertical: .8.h),
                              shape: Utils.radious,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Container(
                                          width: 25.w,
                                          height: 12.h,
                                          child: CachedNetworkImage(
                                            imageUrl: Utils.getUrl(
                                                Utils.IMAGEAPI, {
                                              "id": data.newsList![index].story!
                                                  .imageId
                                                  .toString()
                                            }).toString(),
                                            httpHeaders: Utils.HEADERS,
                                            placeholder: (context, url) =>
                                                SvgPicture.asset(
                                                    "assets/images/image.svg"),
                                            errorWidget: (context, url,
                                                    error) =>
                                                SvgPicture.asset(
                                                    "assets/images/image.svg"),
                                          ),
                                          // child: Image.network(
                                          //   Utils.getUrl(Utils.IMAGEAPI, {
                                          //     "id": data.newsList![index].story!
                                          //         .imageId
                                          //         .toString()
                                          //   }).toString(),
                                          //   headers: Utils.HEADERS,
                                          // ),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data.newsList![index].story!.hline}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: MyThemes.textColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: .6.h,
                                            ),
                                            Text(
                                              "${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.newsList![index].story!.pubTime!)))}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      Vx.hexToColor("#7E7E7E"),
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ).expand(),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: .5.h, horizontal: 3.w),
                                      child: Text(
                                        data.newsList![index].story!.intro!,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(height: .5.h)
                                  ],
                                ),
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
