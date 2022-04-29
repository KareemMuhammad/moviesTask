import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/backend/blocs/details_bloc/details_cubit.dart';
import 'package:movies_task/backend/blocs/details_bloc/details_state.dart';
import 'package:movies_task/frontend/screens/details_screen.dart';
import 'package:movies_task/helpers/my_constants.dart';

class DeepLinkDetailsScreen extends StatefulWidget {
  final String? movieId;
  const DeepLinkDetailsScreen({Key? key, this.movieId}) : super(key: key);

  @override
  _DeepLinkDetailsScreenState createState() => _DeepLinkDetailsScreenState();
}

class _DeepLinkDetailsScreenState extends State<DeepLinkDetailsScreen> {
  DetailsCubit? _detailsCubit;
  @override
  void initState() {
    _detailsCubit = BlocProvider.of<DetailsCubit>(context);
    super.initState();
    _detailsCubit!.getMoviesList(widget.movieId!);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit,DetailsState>(
      builder: (context,state) {
        if(state is DetailsFetchSuccessful) {
          return DetailsScreen(movie: state.movie,);
        }else{
          return const CircularProgressIndicator(color: MyConstants.black);
        }
      }
    );
  }
}
