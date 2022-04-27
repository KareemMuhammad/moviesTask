import 'package:flutter/material.dart';
import 'package:movies_task/backend/model/movie_model.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState{}

class DetailsFetchFailed extends DetailsState{}

class DetailsFetchLoading extends DetailsState{}

class DetailsFetchSuccessful extends DetailsState{
  final Movie? movie;

  DetailsFetchSuccessful(this.movie);
}