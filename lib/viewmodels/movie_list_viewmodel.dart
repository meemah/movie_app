import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/networking/api_response.dart';
import 'package:movie_app/networking/api_serivce.dart';

class MovieListViewmodel with ChangeNotifier {
  MovieListViewmodel() {
    fetchMovies();
  }

  // ApiResponse<List<ResturantListModel>> _allResuturants;
  ApiResponse<MovieList> _allMovies;

  get allMovies => this._allMovies;

  // set allResuturants(ApiResponse<List<ResturantListModel>> response) {
  set allMovies(ApiResponse<MovieList> response) {
    _allMovies = response;
    notifyListeners();
  }

  fetchMovies() async {
    _allMovies = ApiResponse.loading("Loading");
    try {
      final response = await ApiClient().get();
      MovieList _allMovie = movieListFromJson(response);
      print(_allMovies.toString());
      // List<ResturantListModel> _allResuturants = resturantListModelFromJson(response);
      allMovies = ApiResponse.completed(_allMovie);
    } catch (e) {
      print(e.toString());
      allMovies = ApiResponse.error(e.toString());
    }
  }
}
