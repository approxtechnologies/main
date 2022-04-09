import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shreejidigitalartdesktop/models/Model.dart';
import 'package:sizer/sizer.dart';

class FullViewScreen extends StatelessWidget {
  Data data;
  int index;

  FullViewScreen(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 200.w,
        child: Hero(
          tag: index.toString(),
          child: Image.memory(base64.decode(data.image!),fit: BoxFit.contain),
        ),
      ),
    );
  }
}
