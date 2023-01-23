import 'package:dartz/dartz.dart';
import 'package:netplix/domain/entities/movie/movie.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';
import 'package:netplix/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
