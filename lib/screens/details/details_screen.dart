import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_read_api/constants.dart';
import 'package:lottie/lottie.dart';

import 'package:lets_read_api/mymodel.dart';
import 'package:lets_read_api/screens/details/components/body.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "/details";
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

Map<String, dynamic>? mapResponse;
Map? dataResponse;
List? listResponse;

String stringResponse = '';
bool isfine = false;
List users = [];
bool isLoading = false;

class _DetailsScreenState extends State<DetailsScreen> {
  Future<Mymodel> apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://lets-read-dev.appspot.com/api/home/query?localization=4846240843956224"));

    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    print('extracted bdy');
    print(extractedData);
    Mymodel mymodel = Mymodel.fromJson(extractedData);
    // setState(() {
    //   //
    //   mapResponse = json.decode(response.body);
    //   listResponse = mapResponse!['items'];
    // });
    return mymodel;
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //this is for the animation for loading : )
        // body: Center(
        // child: Lottie.network(
        //     "https://assets4.lottiefiles.com/packages/lf20_1a8dx7zj.json")),
        body: Column(children: <Widget>[
      FutureBuilder<Mymodel>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 50.0, top: 300),
              child: Center(
                child: Lottie.network(
                  "https://assets4.lottiefiles.com/packages/lf20_1a8dx7zj.json",
                  height: 200,
                  width: 200,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: Wrap(
                children: [
                  Center(
                      child: Wrap(children: [
                    DetailsScreenCard(
                      image: snapshot.data?.sections?[2].items?[2].coverImageUrl
                              .toString() ??
                          'hey',
                      description: snapshot
                              .data?.sections?[2].items?[2].description
                              .toString() ??
                          'hey',
                      country: "United Kingdom",
                      language: snapshot.data?.sections?[2].items?[2].name
                              .toString() ??
                          "hey",
                    ),
                  ]))
                ],
              ),
            );
          }
        },
        future: apicall.call(),
      )
    ]));
  }
}

class DetailsScreenCard extends StatelessWidget {
  const DetailsScreenCard({
    Key? key,
    required this.image,
    required this.description,
    required this.country,
    required this.language,
  }) : super(key: key);

  final String description, country;
  final String language;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        ClipRRect(
          child: Image.network(
            image,
            height: 520,
          ),
        ),
        GestureDetector(
          // onTap: press,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(35.0),
            child: Wrap(spacing: 30, runSpacing: 60, children: [
              Center(
                child: Column(
                  children: [
                    // TextSpan(
                    //     text: "$description\n".toUpperCase(),
                    //     style: Theme.of(context).textTheme.button),
                    // TextSpan(
                    //   text: "$country".toUpperCase(),
                    //   style: TextStyle(
                    //     color: kPrimaryColor.withOpacity(0.5),
                    //   ),
                    // ),
                    Center(
                      child: Text(" $language\n".toUpperCase(),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.dosis(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),

                    Center(
                      child: Text(" $description\n".toUpperCase(),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.dosis(fontSize: 20)),
                    ),

                    Text("Country : $country\n".toUpperCase(),
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.dosis(fontSize: 20)),
                  ],
                ),
              ),
              Spacer(),
            ]),
          ),
        )
      ],
    );
  }
}
