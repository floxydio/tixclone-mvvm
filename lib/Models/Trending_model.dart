class TrendingModel {
  int page;
  List<DataTrending> results;
  int totalPages;
  int totalResults;

  TrendingModel({this.page, this.results, this.totalPages, this.totalResults});

  TrendingModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new DataTrending.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class DataTrending {
  bool video;
  int id;
  String overview;
  String releaseDate;
  int voteCount;
  bool adult;
  String backdropPath;
  double voteAverage;
  List<int> genreIds;
  String title;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  double popularity;
  String mediaType;

  DataTrending(
      {this.video,
      this.id,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.adult,
      this.backdropPath,
      this.voteAverage,
      this.genreIds,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.popularity,
      this.mediaType});

  DataTrending.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteAverage = json['vote_average'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_average'] = this.voteAverage;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}