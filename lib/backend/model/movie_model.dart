class Movie {
  final int id;
  final String title;
  final String overview;
  final String poster;

  Movie(this.id,this.title, this.overview,this.poster);
  factory Movie.fromMap(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['original_title'],
      json['overview'],
      json['poster_path'],
    );
  }

  int handleVoteAverageType(Map<String, dynamic> json){
    double vote = json['vote_average'];
    return vote.round();
  }
}