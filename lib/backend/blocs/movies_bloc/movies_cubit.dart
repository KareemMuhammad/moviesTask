import 'package:bloc/bloc.dart';
import 'package:movies_task/backend/blocs/movies_bloc/movies_state.dart';
import 'package:movies_task/backend/model/movie_model.dart';
import 'package:movies_task/backend/repository/movies_repo.dart';

class MoviesCubit extends Cubit<MoviesState>{
  final MoviesRepository moviesRepository;
  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<Movie>? currentMoviesList;

  void getMoviesList()async{
    emit(MoviesFetchLoading());
    currentMoviesList = await moviesRepository.getPopularMoviesResponse();
    if(currentMoviesList!.isNotEmpty){
      emit(MoviesFetchSuccessful(currentMoviesList));
    }else{
      emit(MoviesFetchFailed());
    }
  }
}