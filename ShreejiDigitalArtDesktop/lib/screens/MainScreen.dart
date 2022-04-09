import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shreejidigitalartdesktop/models/Model.dart';
import 'package:shreejidigitalartdesktop/screens/FullViewScreen.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Model data;
  var data;
  bool isLoading = false;

  @override
  void initState() {
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(
        Uri.https(
            'tathastubim.com',
            '/ShreejiDigitalArt/Image_Database/view_image.php',
            {"key": "hfbvygefoijsdjxhgbcfuywedfkjcnjdncfwgedfhcbjsdfhciw"}),
        headers: {
          'HttpHeaders.contentTypeHeader': 'application/json; charset=utf-8',
          'Cache-Control': 'no-cache',
        });
    var decodedData = jsonDecode(response.body);

    data = Model.fromJson(decodedData);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
        actions: [
          IconButton(onPressed: () => getData(), icon: Icon(Icons.refresh))
        ],
      ),
      body: data != null && !isLoading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 5 / 5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FullViewScreen(data.data![index], index)),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Flexible(
                            flex: 9,
                            child: Center(
                              child: Hero(
                                  tag: index.toString(),
                                  child: Image.memory(
                                      base64.decode(data.data![index].image!))),
                            ),
                          ),
                          Flexible(flex: 1, child: Text(data.data![index].des!))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.data!.length,
              ),
            )
          : isLoading
              ? Center(child: CircularProgressIndicator())
              : Center(child: Text("No Data")),
    );
  }
}
