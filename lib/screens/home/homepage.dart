import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lets_read_api/components/my_bottom_nav_bar.dart';
import 'package:lets_read_api/constants.dart';
import 'package:lets_read_api/screens/home/components/body.dart';
import 'package:lets_read_api/screens/home/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          MyDrawer();
        },
      ),
    );
  }
}
