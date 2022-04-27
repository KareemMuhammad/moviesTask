import 'package:bloc/bloc.dart';
import 'package:movies_task/backend/blocs/details_bloc/details_state.dart';
import 'package:movies_task/backend/model/movie_model.dart';
import 'package:movies_task/backend/repository/movies_repo.dart';

class DetailsCubit extends Cubit<DetailsState>{
  final MoviesRepository moviesRepository;
  DetailsCubit(this.moviesRepository) : super(DetailsInitial());

  Movie? currentMovie;

  void getMoviesList(String id)async{
    emit(DetailsFetchLoading());
    currentMovie = await moviesRepository.getMovieDetailsResponse(id);
    if(currentMovie != null){
      emit(DetailsFetchSuccessful(currentMovie));
    }else{
      emit(DetailsFetchFailed());
    }
  }
}