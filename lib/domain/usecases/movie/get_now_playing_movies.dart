import 'package:dartz/dartz.dart';
import 'package:netplix/domain/entities/movie/movie.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';
import 'package:netplix/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
