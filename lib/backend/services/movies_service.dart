import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:movies_task/helpers/my_constants.dart';

class MoviesService{
 Future<Response> fetchPopularMovies()async{
   try{
     Response response = await get(Uri.parse(MyConstants.popularUrl));
     return response;
   }catch(e){
     if(!kReleaseMode) {
       debugPrint(e.toString());
     }
     return Response('', 404);
   }
 }

 Future<Response> fetchDetailsOfMovie(String id)async{
   try{
     Response response = await get(Uri.parse(MyConstants.baseUrl + id + MyConstants.detailsApiUrl));
     return response;
   }catch(e){
     if(!kReleaseMode) {
       debugPrint(e.toString());
     }
     return Response('', 404);
   }
 }
}