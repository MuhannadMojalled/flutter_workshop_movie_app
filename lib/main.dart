import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variables to help with the rating system
  double rating = 0;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 17, 61),
        body: Column(children: [
          // stack to hold the background image and the gradient
          Stack(
            children: [
              Image.asset(
                'assets/MovieBackground.jpg',
                fit: BoxFit.fill,
                height: 250,
              ),
              Container(
                height: 250, // Height of the fade area
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      const Color.fromARGB(255, 0, 17, 61)
                    ],
                    stops: [0.2, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              )
            ],
          ),
          // row to hold the movie poster and information
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //container for the movie information
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: 220,
                child:
                    //column for the movie information
                    const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wicked",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text("Directed by Jon M. Chu",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text("2024 • PG • 2h 40m",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              // container for the movie poster
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child:
                    // column for the movie poster
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Image.asset(
                        "assets/MoviePoster.jpg",
                        width: 100,
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // container for the movie description
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              "Everyone deserves the chance to fly.\n\nElphaba, an ostracized but defiant girl born with green skin, and Galinda, a privileged aristocrat born popular, become extremely unlikely friends in the magical Land of Oz. As the two girls struggle with their opposing personalities, their friendship is tested as both begin to fulfil their destinies as Glinda the Good and The Wicked Witch of the West.",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          // star rating system
          StarRating(
            size: 40.0,
            rating: rating,
            color: Colors.orange,
            borderColor: Colors.grey,
            allowHalfRating: true,
            starCount: starCount,
            onRatingChanged: (rating) => setState(() {
              this.rating = rating;
            }),
          ),
          const Divider(),
        ]));
  }
}
