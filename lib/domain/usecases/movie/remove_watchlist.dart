import 'package:dartz/dartz.dart';
import 'package:netplix/common/failure.dart';
import 'package:netplix/domain/entities/movie/movie_detail.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';

class RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
