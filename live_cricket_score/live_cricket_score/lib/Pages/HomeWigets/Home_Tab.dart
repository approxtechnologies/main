import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

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

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var queryParameters = {
      'matchState': 'recent',
    };
  
    var response = await http.get(Utils.getUrl(Utils.MATCHLISTENDPOINT,queryParameters),headers: Utils.HEADERS);
    var decodedData = jsonDecode(response.body);
    dataModel!.typeMatches = List.from(decodedData["typeMatches"])
        .map<TypeMatches>((item) => TypeMatches.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dataModel != null &&
            dataModel!.typeMatches != null &&
            dataModel.typeMatches!.isNotEmpty)
          RefreshIndicator(
            onRefresh: () => getData(),
            child: ListView.builder(
              primary: true,
              itemBuilder: (context, index1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.00),
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
                                Container(
                                  padding: EdgeInsets.all(8.00),
                                  child: Text(
                                    "${dataModel.typeMatches?[index1].seriesAdWrapper![index].seriesMatches!.seriesName}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
        else
          CircularProgressIndicator().centered().expand(),
      ],
    );
  }
}
