import 'package:flutter/material.dart';
import 'package:movies_task/backend/model/movie_model.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState{}

class MoviesFetchFailed extends MoviesState{}

class MoviesFetchLoading extends MoviesState{}

class MoviesFetchSuccessful extends MoviesState{
  final List<Movie>? moviesList;

  MoviesFetchSuccessful(this.moviesList);
}