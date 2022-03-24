import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/DataModel.dart';
import 'ListItem1.dart';

class Live_Tab extends StatefulWidget {
  const Live_Tab({Key? key}) : super(key: key);

  @override
  State<Live_Tab> createState() => _Live_TabState();
}

class _Live_TabState extends State<Live_Tab>
    with AutomaticKeepAliveClientMixin<Live_Tab> {
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
      'matchState': 'live',
    };
    var response = await http.get(
        Utils.getUrl(Utils.MATCHLISTENDPOINT, queryParameters),
        headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    if (decodedData["typeMatches"] == null) {
      setState(() {
        call = true;
      });
      getData();
    }
    dataModel!.typeMatches = List.from(decodedData["typeMatches"])
        .map<TypeMatches>((item) => TypeMatches.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return dataModel != null &&
            dataModel!.typeMatches != null &&
            dataModel.typeMatches!.isNotEmpty
        ? RefreshIndicator(
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
                      padding:
                          EdgeInsets.symmetric(vertical: .5.h, horizontal: 3.w),
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
                                ListItem1(
                                    data: dataModel.typeMatches![index1]
                                        .seriesAdWrapper![index].seriesMatches!)
                              ]);
                        } else
                          return Container().h0(context);
                      }),
                      itemCount: dataModel
                          .typeMatches![index1].seriesAdWrapper?.length,
                    ), //Datamodel.typeMatchesList![index1],
                  ],
                );
              },
              itemCount: dataModel.typeMatches!.length,
            ),
          ).expand()
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
