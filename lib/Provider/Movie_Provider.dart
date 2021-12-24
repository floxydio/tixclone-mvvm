import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tixclone/Constant/Server_constant.dart';
import 'package:tixclone/Models/Genre_model.dart';
import 'package:tixclone/Models/Latest_model.dart';
import 'package:tixclone/Models/MovieID_model.dart';
import 'package:tixclone/Models/TVTrending_model.dart';
import 'package:tixclone/Models/Trending_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  String UPLOAD_PATH = "https://image.tmdb.org/t/p/original";

  List<DataTrending> movieTrending = [];
  // https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
  Future<List<TrendingModel>> movieTrendingData() async {
    movieTrending = [];
    try {
      var response = await http.get(Uri.parse(
          "${ServerConstant.BASE_URL + "trending/movie/day?api_key=${ServerConstant.API_KEY}"}"));

      print("<-- 200 OK Movie Trending");
      print(response.body);
      print("--> Close");
      var dcode = jsonDecode(response.body);
      movieTrending = TrendingModel.fromJson(dcode).results.toList();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<TVData> tvTrending = [];
  Future<List<TVModel>> tvTrendingData() async {
    tvTrending = [];
    try {
      var response = await http.get(Uri.parse(
          "${ServerConstant.BASE_URL + "trending/tv/day?api_key=${ServerConstant.API_KEY}"}"));

      print("<-- 200 OK Movie Trending");
      print(response.body);
      print("--> Close");
      var dcode = jsonDecode(response.body);
      tvTrending = TVModel.fromJson(dcode).results.toList();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  FavoritModel latest;
  Future<FavoritModel> latestData() async {
    latest = null;
    try {
      var response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/550?api_key=${ServerConstant.API_KEY}&language=en-US"));
      print("<-- 200 Latest Data");
      print(response.body);
      print("--> Close");
      latest = favoritModelFromJson(response.body);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  MovieById listMovie;
  Future<MovieById> getMovieById(int id) async {
    listMovie = null;
    try {
      var response = await http.get(Uri.parse(ServerConstant.BASE_URL +
          "movie/${id}?api_key=${ServerConstant.API_KEY}&language=en-US"));

      print("<-- 200 Get Movie By ID [$id]");
      print(response.body);
      print("--> Close");

      listMovie = movieByIdFromJson(response.body);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  GenreMovieModel genreMovie;
  Future<GenreMovieModel> getGenreMovie() async {
    genreMovie = null;
    try {
      var response = await http.get(Uri.parse(ServerConstant.BASE_URL +
          "genre/movie/list?api_key=${ServerConstant.API_KEY}"));

      print("<-- 200 Get Movie Genre");
      print(response.body);
      print("--> Close");

      genreMovie = genreMovieModelFromJson(response.body);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  GenreModel genreTV;
  Future<GenreModel> getGenreTV() async {
    genreTV = null;
    try {
      var response = await http.get(Uri.parse(ServerConstant.BASE_URL +
          "genre/tv/list?api_key=${ServerConstant.API_KEY}"));

      print("<-- 200 Get TV Genre");
      print(response.body);
      print("--> Close");
      genreTV = genreModelFromJson(response.body);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
