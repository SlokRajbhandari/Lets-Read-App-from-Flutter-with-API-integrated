import 'package:flutter/material.dart';
import 'package:lets_read_api/constants.dart';

import 'featured.dart';
import 'searchbox.dart';
import 'recommend.dart';
import 'title_with.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Collections", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Featured Books", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
