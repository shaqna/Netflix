import 'package:dartz/dartz.dart';
import 'package:netplix/common/failure.dart';
import 'package:netplix/domain/entities/movie/movie.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
