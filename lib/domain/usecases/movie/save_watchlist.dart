import 'package:dartz/dartz.dart';
import 'package:netplix/common/failure.dart';
import 'package:netplix/domain/entities/movie/movie_detail.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
