import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:movies_task/backend/model/movie_model.dart';
import 'package:movies_task/backend/services/movies_service.dart';

class MoviesRepository{
  final MoviesService _moviesService = MoviesService();

  Future<List<Movie>?> getPopularMoviesResponse()async{
    Response response = await _moviesService.fetchPopularMovies();
    if(!kReleaseMode) {
      log(response.headers.toString());
      log(response.body);
    }
    List moviesList = jsonDecode(response.body)['results'];
    if(response.statusCode == 200){
      return moviesList.map((e) => Movie.fromMap(e)).toList();
    }else{
      return [];
    }
  }

  Future<Movie?> getMovieDetailsResponse(String id)async{
    Response response = await _moviesService.fetchDetailsOfMovie(id);
    if(!kReleaseMode) {
      log(response.headers.toString());
      log(response.body);
    }
    Movie movie = jsonDecode(response.body);
    if(response.statusCode == 200){
      return movie;
    }else{
      return null;
    }
  }
}