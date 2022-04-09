import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/Pages/HomeWigets/List_Item.dart';
import 'package:live_cricket_score/adwidgets/native_inline_page.dart';

import 'package:live_cricket_score/models/DataModel.dart';
import 'package:velocity_x/velocity_x.dart';

class ListItem1 extends StatelessWidget {
  final SeriesMatches data;

  const ListItem1({
    Key? key,
    required this.data,
  })  : assert(data != null),
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (data != null &&
        data.matches != null &&
        data.matches!.isNotEmpty &&
        data.matches!.length > 0) {
      int size = data.matches!.length;
      return ListView.builder(
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              List_Item(items: data.matches![index]),
            /*  if(index % 3 ==0 && index != 1)
                Container(
                  height: 200,
                  child: NativeInlinePage(),//AdWidget(ad: _ad),
                  alignment: Alignment.center,
                )*/
            ],
          );
        },
        itemCount: size,
      );
    } else {
      return Container();
    }
  }
}
