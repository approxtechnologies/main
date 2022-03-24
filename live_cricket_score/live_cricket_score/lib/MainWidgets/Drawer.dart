import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 22.h,
              color: Theme.of(context).primaryColor,
            ),
            ListTile(
              leading: Container(
                height: 24,
                width: 24,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/dark_mode.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              horizontalTitleGap: 0,
              title: Text(
                "Dark Mode",
                style: TextStyle(color: MyThemes.textColor, fontSize: 16),
              ),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            Container(
              height: 2,
              width: 90.h,
              color: MyThemes.grey,
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/share_social_sharp.svg",
                width: 24,
                height: 24,
              ),
              horizontalTitleGap: 0,
              title: Text(
                "Share",
                style: TextStyle(color: MyThemes.textColor, fontSize: 16),
              ),
            ),
            Container(
              height: 2,
              width: 90.h,
              color: MyThemes.grey,
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/star_fill.svg",
                width: 24,
                height: 24,
              ),
              horizontalTitleGap: 0,
              title: Text(
                "Rate",
                style: TextStyle(color: MyThemes.textColor, fontSize: 16),
              ),
            ),
            Container(
              height: 2,
              width: 90.h,
              color: MyThemes.grey,
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/more.svg",
                width: 24,
                height: 24,
              ),
              horizontalTitleGap: 0,
              title: Text(
                "More",
                style: TextStyle(color: MyThemes.textColor, fontSize: 16),
              ),
            ),
            Container(
              height: 2,
              width: 90.h,
              color: MyThemes.grey,
            ),
            ListTile(
              leading: Container(
                width: 24,
                height: 24,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/lock_fill.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              horizontalTitleGap: 0,
              title: Text(
                "Privacy Policy",
                style: TextStyle(color: MyThemes.textColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
