import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_api/model/description_model.dart';
import 'package:movie_api/model/details_models/main_model.dart';

class MovieApi {
  static Future<List<Result>> fetchMovies() async {
    print('fetchMovies called');
    const url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=4edfcc165b262b5674174a89abfdcdd9';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final movies = results.map((e) {
      return Result.fromMap(e);
    }).toList();

    return movies;
  }

  static Future<MovieDetailsModel> fecthMovieDetails(int id) async {
    final url =
        'https://api.themoviedb.org/3/movie/$id?api_key=4edfcc165b262b5674174a89abfdcdd9';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body);
    // print(body);
    final movieDetails = MovieDetailsModel.fromJson(json);

    print(movieDetails.originalTitle);
    return movieDetails;
  }
}
