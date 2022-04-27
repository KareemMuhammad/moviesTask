import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/backend/blocs/movies_bloc/movies_cubit.dart';
import 'package:movies_task/backend/blocs/movies_bloc/movies_state.dart';
import 'package:movies_task/frontend/widgets/movie_card_widget.dart';
import 'package:movies_task/helpers/shared_widgets.dart';
import 'package:movies_task/helpers/size_config.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  State<PopularMoviesScreen> createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  MoviesCubit? moviesCubit;
  @override
  void initState() {
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    super.initState();
    moviesCubit!.getMoviesList();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: BlocBuilder<MoviesCubit,MoviesState>(
           builder: (BuildContext context, state) {
           if(state is MoviesFetchSuccessful){
             return GridView.builder(
               itemCount: state.moviesList!.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
               itemBuilder: (BuildContext context, int index) {
                 return MovieCardWidget(movie: state.moviesList![index],);
               },
             );
           } else if(state is MoviesFetchFailed){
             return header('Error in fetching data!, please reload the screen');
           }else {
             return GridView.builder(
               itemCount: 6,
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
               itemBuilder: (BuildContext context, int index) {
                 return loadMovieShimmer();
               },
             );
           }
         },

         ),
    );
  }
}
