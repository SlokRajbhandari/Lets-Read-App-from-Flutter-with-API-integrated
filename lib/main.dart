import 'package:flutter/material.dart';
import 'package:lets_read_api/constants.dart';
import 'package:lets_read_api/screens/details/details_screen.dart';
import 'package:lets_read_api/screens/home/homepage.dart';

// import 'package:plant_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lets Read App',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          '/details': (context) => DetailsScreen(),
        });
  }
}
