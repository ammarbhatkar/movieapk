import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:intl/intl.dart';
import 'package:movie_api/model/details_models/main_model.dart';
import 'package:movie_api/services/movies_api.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:movie_api/widgets/expanded_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:expand_widget/expand_widget.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsModel? detailsObj;
  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the height as a percentage of the screen height
    double imageHeightPercentage =
        55.0; // You can adjust this percentage as needed
    double imageHeight = (screenHeight * imageHeightPercentage) / 100;
    return Scaffold(
      body: Builder(
        builder: (context) {
          final detailsListVar = detailsObj;
          final title = detailsListVar?.originalTitle;
          final revenue = detailsListVar?.revenue;
          final imageUrl = detailsListVar?.posterPath;
          final overview = detailsListVar?.overview;
          final budget = detailsListVar?.budget;
          final imdbid = detailsListVar?.imdbId;
          final runtime = detailsListVar?.runtime;
          final voteCount = detailsListVar?.voteCount;
          final status = detailsListVar?.status;
          final backdropImageUrl = detailsListVar?.backdropPath;
          final genres = detailsListVar?.genres;
          final votecount = detailsListVar?.voteCount;
          final tagline = detailsListVar?.tagline;
          final originalLanguage = detailsListVar?.originalLanguage;
          final productionCompanies = detailsListVar?.productionCompanies;
          final productionCountries = detailsListVar?.productionCountries;
          String releaseDateFormat = "";
          if (detailsObj?.releaseDate != null) {
            releaseDateFormat = DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(detailsObj!.releaseDate!));
          }
          final voteAverage = (detailsListVar?.voteAverage ?? 0);
          Color progressColor;
          if (voteAverage >= 8) {
            progressColor = Colors.green;
          } else if (voteAverage == 6) {
            progressColor = Colors.yellow;
          } else {
            progressColor = Colors.red;
          }

          return Visibility(
            visible: detailsObj != null,
            child: Stack(
              children: [
                Image.network(
                    'https://image.tmdb.org/t/p/w500/' +
                        backdropImageUrl.toString(),
                    fit: BoxFit.cover,
                    height: imageHeight),
                Container(
                  height: imageHeight, // Match the image height
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 236, 235, 235).withOpacity(
                            0.8), // Start with a semi-transparent color
                        Colors
                            .transparent, // Gradually fade to fully transparent
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image COntainer

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 0, 10, 60),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          imageUrl.toString(),
                                      height: 150,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 24),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                              child: Text(
                                                title.toString(),
                                                style: TextStyle(
                                                    fontSize: 19.2,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                                maxLines: 2,
                                                overflow: TextOverflow.visible,
                                                softWrap: true,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 3, 0, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            226, 237, 241, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month_rounded, // Replace with the clock icon you want
                                                            color: const Color
                                                                .fromARGB(
                                                                255,
                                                                59,
                                                                124,
                                                                178), // Icon color
                                                            size:
                                                                14, // Adjust the icon size as needed
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(5,
                                                                    1, 0.5, 1),
                                                            child: Text(
                                                              releaseDateFormat,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      59,
                                                                      124,
                                                                      178)),
                                                              // softWrap: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 3, 0, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            226, 237, 241, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time, // Replace with the clock icon you want
                                                            color: const Color
                                                                .fromARGB(
                                                                255,
                                                                59,
                                                                124,
                                                                178), // Icon color
                                                            size:
                                                                14, // Adjust the icon size as needed
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(5,
                                                                    1, 0.5, 1),
                                                            child: Text(
                                                              '\t' +
                                                                  runtime
                                                                      .toString() +
                                                                  '\t' +
                                                                  'mins',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      59,
                                                                      124,
                                                                      178)),
                                                              // softWrap: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 10, 0, 0),
                                                  child: Wrap(
                                                    spacing: 10,
                                                    children:
                                                        genres?.map((genre) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        4.0),
                                                                child:
                                                                    Container(
                                                                  height: 16,
                                                                  child: Chip(
                                                                    deleteIconColor:
                                                                        Color.fromRGBO(
                                                                            226,
                                                                            237,
                                                                            241,
                                                                            1),

                                                                    label:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          9),
                                                                      child: Text(
                                                                          genre.name ??
                                                                              '',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color: Color.fromRGBO(
                                                                                26,
                                                                                109,
                                                                                176,
                                                                                1),
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start),
                                                                    ),
                                                                    elevation:
                                                                        2,
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    visualDensity: VisualDensity(
                                                                        horizontal:
                                                                            0,
                                                                        vertical:
                                                                            -4), // Adjust these values to control the visual density

                                                                    // Add styling or customize the Chip widget as needed
                                                                  ),
                                                                ),
                                                              );
                                                            }).toList() ??
                                                            [],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 5, 10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 18.7,
                                                        lineWidth: 3,
                                                        percent:
                                                            voteAverage / 10,
                                                        center: Text(
                                                          voteAverage
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255, 0, 0, 0),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                236, 235, 235),
                                                        progressColor:
                                                            progressColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          4, 10, 0, 15),
                                                  child: Text(
                                                    'User Score \n' +
                                                        '(' +
                                                        votecount.toString() +
                                                        '\t votes'
                                                            ')',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              tagline.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(226, 237, 241, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Overview:\n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      ExpandedWidget(
                                        text: overview.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Image COntainer
                          // Other widgets
                          //OVERVIEW COTAINER

                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                            child: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(226, 237, 241, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 10),
                                        child: Text(
                                          "About Movie",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/imdb.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/fbapp.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/twitter.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/instagram.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/internet.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Status:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),

                                            Text(
                                              status.toString() + '\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            Text(
                                              'Original language:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),
                                            Text(
                                              originalLanguage.toString() +
                                                  '\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            Text(
                                              'Budget:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),
                                            Text(
                                              budget.toString() + '\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            Text(
                                              'Revenue:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),
                                            Text(
                                              revenue.toString() + '\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Production Countries:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),
                                            Wrap(
                                              spacing: 10,
                                              children: productionCountries
                                                      ?.map((country) {
                                                    return Text(
                                                      country.name ?? '',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    );
                                                  }).toList() ??
                                                  [],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Production Companies:',
                                              style: TextStyle(fontSize: 12.2),
                                            ),
                                            Wrap(
                                              spacing: 10,
                                              children: productionCompanies
                                                      ?.map((country) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 2, 0, 2),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              226, 237, 241, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 1,
                                                                offset: Offset(
                                                                    0, 1))
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Text(
                                                            country.name ?? '',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList() ??
                                                  [],
                                            )

                                            //For default Button Its return a Email Button

                                            //For facebook Button
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //OVERVIEWWcoNTAINER
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchDetails() async {
    var obj = await MovieApi.fecthMovieDetails(widget.movieId);
    setState(() {
      detailsObj = obj; // Store the movie details in a list
    });
  }

  // void fetchDetails() async {
  //   final url =
  //       'https://api.themoviedb.org/3/movie/${widget.movieId}?api_key=4edfcc165b262b5674174a89abfdcdd9';

  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);

  //   if (response.statusCode == 200) {
  //     final body = response.body;
  //     final json = jsonDecode(body);
  //     print(body);
  //     setState(() {
  //       detailsObj = json; // Store the movie details in a list
  //     });

  //   } else {
  //     // Handle error
  //     print('Failed to fetch movie details');
  //   }
  // }
}
