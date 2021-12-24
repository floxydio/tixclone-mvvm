// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

GenreModel genreModelFromJson(String str) =>
    GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  GenreModel({
    this.genres,
  });

  List<Genre> genres;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

GenreMovieModel genreMovieModelFromJson(String str) =>
    GenreMovieModel.fromJson(json.decode(str));

String genreMovieModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreMovieModel {
  GenreMovieModel({
    this.genres,
  });

  List<Genre> genres;

  factory GenreMovieModel.fromJson(Map<String, dynamic> json) =>
      GenreMovieModel(
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class GenreMovie {
  GenreMovie({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory GenreMovie.fromJson(Map<String, dynamic> json) => GenreMovie(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
