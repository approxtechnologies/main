import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/DataModel.dart';
import 'ListItem1.dart';

class UpComing_Tab extends StatefulWidget {
  const UpComing_Tab({Key? key}) : super(key: key);

  @override
  State<UpComing_Tab> createState() => _UpComing_TabState();
}

class _UpComing_TabState extends State<UpComing_Tab>
    with AutomaticKeepAliveClientMixin<UpComing_Tab> {
  static DataModel dataModel = DataModel();

  @override
  bool get wantKeepAlive => true;
  bool call = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var queryParameters = {
      'matchState': 'upcoming',
    };
    var response = await http.get(
        Utils.getUrl(Utils.MATCHLISTENDPOINT, queryParameters),
        headers: Utils.HEADERS);
    setState(() {
      call = true;
    });
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
  Widget build(BuildContext context) {
    return dataModel != null &&
            dataModel.typeMatches != null &&
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
                            horizontal: 3.w, vertical: .5.h),
                        child: Text(
                          "${dataModel.typeMatches?[index1].matchType}",
                          style: TextStyle(
                            fontSize: 24.0,
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
                                      height: 0,
                                      width: 0,
                                    )
                                ]);
                          } else
                            return Container().h0(context);
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
