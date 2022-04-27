import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/backend/model/movie_model.dart';
import 'package:movies_task/helpers/my_constants.dart';
import 'package:movies_task/helpers/shared_widgets.dart';
import 'package:movies_task/helpers/size_config.dart';

class DetailsScreen extends StatefulWidget {
  final Movie? movie;
  const DetailsScreen({Key? key, this.movie}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: SizeConfig.screenHeight! * 0.3,
            pinned: true,
            stretch: true,
            backgroundColor: MyConstants.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.movie!.title,
                style: TextStyle(color: MyConstants.white,fontSize: SizeConfig.blockSizeVertical! * 2.8,
                    shadows: const[
                  Shadow(
                    offset: Offset(0.0, 5.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(100, 0, 0, 0),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
              background: Hero(
                tag: widget.movie!.id,
                child: CachedNetworkImage(
                  imageUrl: "${MyConstants.BASE_IMAGE_URL}${widget.movie!.poster}",
                  height: SizeConfig.screenHeight! * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: footer(widget.movie!.overview),
              ),
            ]
          ))
        ],
      ),
    );
  }
}
