import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';

class MyConstants{
  static const String baseUrl = "https://api.themoviedb.org/3/movie/";
  static String detailsApiUrl = "?api_key=${remoteConfigService!.getKey}&language=en-US";
  static String popularUrl = baseUrl + "popular?api_key=${remoteConfigService!.getKey}&language=en-US&page=1";
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500";
  static const String popularRoute = '/';
  static const String detailsRoute = '/details';
  static const String deepDetailsRoute = '/deep';
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");
}