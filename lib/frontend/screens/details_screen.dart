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
            toolbarHeight: SizeConfig.screenHeight! * 0.07,
            expandedHeight: SizeConfig.screenHeight! * 0.4,
            pinned: true,
            stretch: true,
            backgroundColor: MyConstants.white,
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white70,
              child: IconButton(
                icon: const Icon(Icons.arrow_back,color: MyConstants.black,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const SizedBox(),
              background: Hero(
                tag: widget.movie!.id,
                child: CachedNetworkImage(
                  imageUrl: "${MyConstants.BASE_IMAGE_URL}${widget.movie!.poster}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                ),
                child: Text(
                  widget.movie!.title,
                  style: TextStyle(color: MyConstants.black,fontSize: SizeConfig.blockSizeVertical! * 3,
                      shadows: const[
                        Shadow(
                          offset: Offset(0.0, 2.0),
                          color: Color.fromARGB(100, 0, 0, 0),
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
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
