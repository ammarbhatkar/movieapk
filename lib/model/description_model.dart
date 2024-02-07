class DescriptionModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  DescriptionModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class Result {
  bool adult;
  String backdropPath;
  //List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  //final GenreIds genreIds;

  Result(
      {required this.adult,
      required this.releaseDate,
      required this.backdropPath,
      // required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required});
  factory Result.fromMap(Map<String, dynamic> e) {
    return Result(
      adult: e['adult'],
      backdropPath: e['backdrop_path'],
      //genreIds: e['genre_ids'],
      id: e['id'],
      releaseDate: e['release_date'] != null
          ? DateTime.tryParse(e[
              'release_date']) // Parse release_date or set it to null if it's null or not in the expected date format
          : null,

      // Handle null date if needed
      originalLanguage: e['original_language'],
      originalTitle: e['original_title'],
      overview: e['overview'],
      popularity: e['popularity'],
      posterPath: e['poster_path'],
      //releaseDate: e['release_date'],
      title: e['title'],
      video: e['video'],
      voteAverage: e['vote_average'],
      voteCount: e['vote_count'],
    );
  }
}
