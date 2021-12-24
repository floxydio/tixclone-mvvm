class TVModel {
  int page;
  List<TVData> results;
  int totalPages;
  int totalResults;

  TVModel({this.page, this.results, this.totalPages, this.totalResults});

  TVModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new TVData.fromJson(v));
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

class TVData {
  List<String> originCountry;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String posterPath;
  double voteAverage;
  String overview;
  int voteCount;
  String backdropPath;
  String name;
  String firstAirDate;
  String originalName;
  double popularity;
  String mediaType;

  TVData(
      {this.originCountry,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.posterPath,
      this.voteAverage,
      this.overview,
      this.voteCount,
      this.backdropPath,
      this.name,
      this.firstAirDate,
      this.originalName,
      this.popularity,
      this.mediaType});

  TVData.fromJson(Map<String, dynamic> json) {
    originCountry = json['origin_country'].cast<String>();
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    voteCount = json['vote_count'];
    backdropPath = json['backdrop_path'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['origin_country'] = this.originCountry;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['poster_path'] = this.posterPath;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['vote_count'] = this.voteCount;
    data['backdrop_path'] = this.backdropPath;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
