import 'package:dartz/dartz.dart';
import 'package:netplix/domain/entities/movie/movie.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';
import 'package:netplix/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
