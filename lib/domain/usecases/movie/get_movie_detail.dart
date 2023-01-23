import 'package:dartz/dartz.dart';
import 'package:netplix/domain/entities/movie/movie_detail.dart';
import 'package:netplix/domain/repositories/movie_repository.dart';
import 'package:netplix/common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
