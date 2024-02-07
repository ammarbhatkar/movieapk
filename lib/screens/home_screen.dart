import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_api/model/description_model.dart';
import 'package:movie_api/screens/movie_details.dart';
import 'package:movie_api/services/movies_api.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Result> fetchingList = [];

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 37, 65),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                0, 0, 38, 0), // Adjust padding as needed
            child: Image.asset(
              'assets/images/appbaricon.jfif', // Replace 'your_image.png' with your image file path
              width: 50,
              // Adjust the height of the image as needed
            ),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
          Theme(
            data: ThemeData(
                iconTheme:
                    IconThemeData(color: Color.fromARGB(255, 1, 180, 228))),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Remove the top padding here
            // ... previous code

            Stack(children: [
              Image.asset(
                'assets/images/johnwick.jpg',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome.',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      'Millions of moives,\nTv shows and\npeople to discover\nExplore now',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 32,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            //padding: EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Search...',
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.sourceSansPro(
                                              fontSize: 17.6,
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, .5))),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment
                                          .topLeft, // Define the starting point of the gradient
                                      end: Alignment
                                          .bottomRight, // Define the ending point of the gradient
                                      colors: [
                                        Color.fromARGB(255, 192, 254, 207),
                                        // Starting color
                                        Color.fromARGB(
                                            255, 1, 180, 228), // Ending color
                                      ],
                                    ),
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text('Search',
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),

// ... rest of your code

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Text(
                    'Trending',
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 24,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 37, 65),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).focusColor.withOpacity(0.9),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                      child: Row(
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 192, 254, 207),
                                  Color.fromARGB(255, 30, 213, 169)
                                ],
                                stops: [0.0, 1.0], // Adjust stops as needed
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors
                                    .white, // Set the color to white to use the gradient
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color.fromARGB(255, 30, 213, 169),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Container(
                height: 365, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fetchingList.length,
                  itemBuilder: (context, index) {
                    final fetchingListVar = fetchingList[index];
                    final title = fetchingListVar.originalTitle;
                    final id = fetchingListVar.id;
                    final imageUrl = fetchingListVar.posterPath;
                    final releaseDateFormatted =
                        fetchingListVar.releaseDate != null
                            ? DateFormat('MMM dd, yyyy')
                                .format(fetchingListVar.releaseDate!)
                            : 'Release Date Unavailable';
                    final voteAverage = fetchingListVar.voteAverage * 10;
                    Color progressColor;
                    if (voteAverage >= 87) {
                      progressColor = Colors.green;
                    } else if (voteAverage == 86) {
                      progressColor = Colors.yellow;
                    } else {
                      progressColor = Colors.red;
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(movieId: id),
                          ),
                        );
                      },
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/tbackground.jpg',
                            ),

                            fit: BoxFit.contain,

                            alignment: Alignment(-0.1, -0.3),

                            // You can adjust the fit as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                height: 365,
                                width:
                                    150, // Fixed width for each card container
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/' +
                                            imageUrl,
                                        fit: BoxFit.fill,
                                        height: 220,
                                        width: 150,
                                      ),
                                    ),
                                    Positioned(
                                      bottom:
                                          123, // Adjust the position to move it up
                                      left:
                                          0, // Adjust the position to move it right
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: 42,
                                          height: 42,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromARGB(255, 3, 37, 65),
                                          ),
                                          child: CircularPercentIndicator(
                                            radius:
                                                18.7, // Adjust the size of the circular container
                                            lineWidth: 3.0,
                                            percent: voteAverage /
                                                100, // Assuming voteAverage is between 0 and 100
                                            center: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${voteAverage.toInt()}%',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),

                                            backgroundColor:
                                                Color.fromARGB(255, 32, 69, 41),
                                            progressColor: progressColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 250, 0, 0),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              title,
                                              textAlign: TextAlign.center,

                                              style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines:
                                                  2, // Adjust the number of lines as needed
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Container(
                                            height: 20,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(releaseDateFormatted,
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                          fontSize: 16,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, .6),
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // == = = = = = = = = = = ================================================================
            // ====================================latest trailer start=============================================== ===
            // ==================================================================================  == ==
            SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: 380,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 3, 37, 65)),
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/trailernew.jpg',
                      fit: BoxFit.fill,
                      alignment: Alignment(0, -1),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text('Latest Trailers',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Container(
                            height: 30,
                            width: 130,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment
                                    .topLeft, // Define the starting point of the gradient
                                end: Alignment
                                    .bottomRight, // Define the ending point of the gradient
                                colors: [
                                  Color.fromARGB(
                                      255, 192, 254, 207), // Starting color
                                  Color.fromARGB(
                                      255, 0, 128, 128), // Ending color
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.9),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Streaming',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 3, 37, 65),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 3, 37, 65),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 365,
                        // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fetchingList.length,
                          itemBuilder: (context, index) {
                            final fetchingListVar = fetchingList[index];
                            final title = fetchingListVar.originalTitle;
                            final id = fetchingListVar.id;
                            final backdropImageUrl =
                                fetchingListVar.backdropPath;
                            final onlyTitle = fetchingListVar.title;

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetails(movieId: id),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 30, 0, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: (300 / 1.78),

                                      width:
                                          300, // Fixed width for each card container
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/w500/' +
                                                  backdropImageUrl,
                                              fit: BoxFit.fitWidth,
                                              width: 300,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 20,
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.play_arrow,
                                                  size: 64,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 9,
                                            right: 9,
                                            child: Container(
                                              height: 27,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                        255, 200, 200, 200)
                                                    .withOpacity(0.5),
                                              ),
                                              child: Center(
                                                child: IconButton(
                                                    icon: Icon(
                                                      Icons.more_horiz_sharp,
                                                      size: 14,
                                                      color: Color.fromARGB(
                                                          255, 219, 219, 219),
                                                    ),
                                                    onPressed: () {}),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          title,
                                          textAlign: TextAlign.center,

                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 19.2,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines:
                                              2, // Adjust the number of lines as needed
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 3.5, 0, 0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Official trailer of ' +
                                              onlyTitle +
                                              '.',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines:
                                              2, // Adjust the number of lines as needed
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ) //main cloumn for  trailers
            // =============================latest trailer end ===========================================
            // =================================================================================================
          ],
        ),
      ),
    );
  }

  Future<void> fetchMovies() async {
    final response = await MovieApi.fetchMovies();
    setState(() {
      fetchingList = response;
    });
  }
}
