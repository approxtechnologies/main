import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_cricket_score/models/TeamPlayerListModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class Team2Tab extends StatefulWidget {
  final int id;

  const Team2Tab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Team2Tab> createState() => _Team2TabState(id);
}

class _Team2TabState extends State<Team2Tab>
    with AutomaticKeepAliveClientMixin<Team2Tab> {
  @override
  bool get wantKeepAlive => true;

  final int id;

  _Team2TabState(this.id);

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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                            width: 80,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                Utils.getUrl(Utils.IMAGEAPI, {
                                  'id': data.player![index].imageId.toString()
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
                );
              } else
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Text(
                        data.player![index].name!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                );
            },
            itemCount: data.player!.length,
          )
        : CircularProgressIndicator().centered();
  }
}
