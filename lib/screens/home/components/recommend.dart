import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_read_api/mymodel.dart';
import 'dart:convert';

import 'package:lets_read_api/screens/details/details_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatefulWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  State<RecomendsPlants> createState() => _RecomendsPlantsState();
}

Map<String, dynamic>? mapResponse;
Map? dataResponse;
List? listResponse;

String stringResponse = '';

class _RecomendsPlantsState extends State<RecomendsPlants> {
  Future<Mymodel> apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://lets-read-dev.appspot.com/api/home/query?localization=4846240843956224"));

    final extractedData = json.decode(response.body);

    // print('extracted bdy');
    // print(extractedData);
    Mymodel mymodel = Mymodel.fromJson(extractedData);
    // setState(() {
    //   //
    //   mapResponse = json.decode(response.body);
    //   listResponse = mapResponse!['items'];
    // });
    return mymodel;
  }

  void initState() {
    apicall();
    super.initState();
  }

  int index = 2;

  @override
  Widget build(BuildContext context) {
    listResponse == null ? 0 : listResponse!.length;
    // return Scaffold(
    //   body: ListView.builder(

    //     itemBuilder: (context, index) {

    return FutureBuilder<Mymodel>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 160.0, top: 1.0, right: 100.0, bottom: 2.0),
              child: Lottie.network(
                  "https://assets4.lottiefiles.com/packages/lf20_poqmycwy.json",
                  width: 90,
                  height: 90),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          // return ListView.builder(
          //     itemCount: snapshot.data?.length,
          //     itemBuilder: (BuildContext context, int index) {
          var books = snapshot.data?.sections?[2].items ?? [];
          return buildBooks(context, books);
        }
      },
      future: apicall.call(),
    );
  }

  Widget buildBooks(BuildContext context, List<Items> books) {
    return SizedBox(
      height: 430,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecomendPlantCard(
            image: books[index].thumborCoverImageUrl ?? 'hey',
            title: books[index].name ?? "hello",
            country: "Nepal",
            price: 20,
            press: () {
              Navigator.pushNamed(context, DetailsScreen.routeName);
            }),
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.6,
      child: Column(
        children: <Widget>[
          Image.network(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
    return const Text("hello");
  }
}
