import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/frontend/screens/details_screen.dart';
import 'package:movies_task/helpers/my_constants.dart';
import 'package:movies_task/helpers/size_config.dart';
import '../../backend/model/movie_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie? movie;

  const MovieCardWidget({Key? key, this.movie,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(movie: movie,)));
                },
                child: Card(
                  elevation: 4,
                  color: MyConstants.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Hero(
                            tag: movie!.id,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "${MyConstants.BASE_IMAGE_URL}${movie!.poster}",
                            ),
                          )
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _blurBottomContainer(),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

  Widget _blurBottomContainer() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
          ),
          height: SizeConfig.screenHeight! * 0.08,
          width: SizeConfig.screenWidth,
          child: Center(
            child: Text(movie!.title,style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2.3,
              color: MyConstants.black,letterSpacing: 1,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
