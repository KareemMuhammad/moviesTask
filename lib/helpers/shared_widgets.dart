import 'package:flutter/material.dart';
import 'package:movies_task/helpers/my_constants.dart';
import 'package:movies_task/helpers/size_config.dart';
import 'custom_shimmer.dart';

Widget loadProjectsShimmer(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        elevation: 4,
        child: MyShimmer.rectangular(width: SizeConfig.screenWidth! - 50,
          shapeBorder: const RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(20))),baseColor: Colors.black,)
    ),
  );
}

Widget loadMovieShimmer(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: MyConstants.white,
        elevation: 4,
        child: const MyShimmer.rectangular(baseColor: MyConstants.white,)
    ),
  );
}

Widget header(String text){
  return Text(text,style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 3
  ,color: MyConstants.black),);
}

Widget footer(String text){
  return Text(text,style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2.5
      ,color: MyConstants.black),);
}