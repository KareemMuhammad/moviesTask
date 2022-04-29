import 'package:flutter/material.dart';
import 'package:movies_task/frontend/screens/deeplink_details_screen.dart';
import 'package:movies_task/frontend/screens/details_screen.dart';
import 'package:movies_task/frontend/screens/popular_movies_screen.dart';
import 'package:movies_task/helpers/my_constants.dart';
import '../backend/model/movie_model.dart';

class MyRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyConstants.popularRoute:
        return MaterialPageRoute(builder: (_) => const PopularMoviesScreen());
      case MyConstants.deepDetailsRoute:
        return MaterialPageRoute(builder: (_) => DeepLinkDetailsScreen(movieId: settings.arguments as String,));
      case MyConstants.detailsRoute:
        {
          final args = settings.arguments as Movie;
          return MaterialPageRoute(builder: (_) => DetailsScreen(movie: args,));
        }
      default: return MaterialPageRoute(builder: (_) => const PopularMoviesScreen());
    }
  }
}
