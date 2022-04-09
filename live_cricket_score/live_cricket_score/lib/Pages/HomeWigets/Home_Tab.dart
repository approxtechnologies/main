import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/adwidgets/native_inline_page.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

import '../../models/DataModel.dart';
import 'ListItem1.dart';

class Home_Tab extends StatefulWidget {
  const Home_Tab({Key? key}) : super(key: key);

  @override
  State<Home_Tab> createState() => _Home_TabState();
}

class _Home_TabState extends State<Home_Tab>
    with AutomaticKeepAliveClientMixin<Home_Tab> {
  static DataModel dataModel = DataModel();

  @override
  bool get wantKeepAlive => true;

  bool call = false;
  late NativeAd _ad;

  @override
  void initState() {
    super.initState();
    //loadNative();
    getData();
  }

  getData() async {
    var queryParameters = {
      'matchState': 'recent',
    };
    var response = await http.get(
        Utils.getUrl(Utils.MATCHLISTENDPOINT, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    if (decodedData["typeMatches"] == null) {
      setState(() {
        call = true;
      });
      getData();
    }

    dataModel!.typeMatches = List.from(decodedData["typeMatches"])
        .map<TypeMatches>((item) => TypeMatches.fromJson(item))
        .toList();

    if (dataModel.typeMatches![1].matchType == "League") {
      var leaguage = dataModel.typeMatches![1];
      dataModel.typeMatches!.removeAt(1);
      dataModel.typeMatches!.insert(0, leaguage);
    }

    setState(() {
      call = true;
    });
  }

  @override
  void dispose() {
    // TODO: Dispose a NativeAd object
    _ad.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return dataModel != null &&
            dataModel!.typeMatches != null &&
            dataModel.typeMatches!.isNotEmpty
        ? Container(
            height: 100.h,
            width: 100.w,
            child: RefreshIndicator(
              onRefresh: () => getData(),
              child: ListView.builder(
                primary: true,
                itemBuilder: (context, index1) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: .5.h, horizontal: 3.w),
                        child: Text(
                          "${dataModel.typeMatches?[index1].matchType}",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          if (dataModel.typeMatches?[index1]
                                  .seriesAdWrapper![index].seriesMatches !=
                              null) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (dataModel
                                              .typeMatches![index1]
                                              .seriesAdWrapper![index]
                                              .seriesMatches !=
                                          null &&
                                      dataModel
                                              .typeMatches![index1]
                                              .seriesAdWrapper![index]
                                              .seriesMatches!
                                              .matches !=
                                          null)
                                    ListItem1(
                                        data: dataModel
                                            .typeMatches![index1]
                                            .seriesAdWrapper![index]
                                            .seriesMatches!)
                                  else
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                    )
                                ]);
                          } else {
                            return Container();
                          }
                        }),
                        itemCount: dataModel
                            .typeMatches![index1].seriesAdWrapper?.length,
                      ),
                    ],
                  );
                },
                itemCount: dataModel.typeMatches!.length,
              ),
            ),
          )
        : CircularProgressIndicator().centered();
  }
}
