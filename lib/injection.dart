import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:netplix/data/datasources/db/database_helper.dart';

import 'package:netplix/data/datasources/local/movie/movie_local_data_source.dart';

import 'package:netplix/data/datasources/remote/movie/movie_remote_data_source.dart';

import 'package:netplix/data/repositories/movie_repository_impl.dart';

import 'package:netplix/domain/repositories/movie_repository.dart';
import 'package:netplix/domain/usecases/movie/get_movie_detail.dart';
import 'package:netplix/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:netplix/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:netplix/domain/usecases/movie/get_popular_movies.dart';
import 'package:netplix/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:netplix/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:netplix/domain/usecases/movie/get_watchlist_status.dart';
import 'package:netplix/domain/usecases/movie/remove_watchlist.dart';
import 'package:netplix/domain/usecases/movie/save_watchlist.dart';
import 'package:netplix/domain/usecases/movie/search_movies.dart';
import 'package:netplix/presentation/provider/bloc/movie/detail/detail_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/now_playing/now_playing_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/popular/popular_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/recommendations/recommendation_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/search/search_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/top_rated/top_rated_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/watchlist_status/watchlist_movie_status_bloc.dart';
import 'package:netplix/utils/ssl_client.dart';

final locator = GetIt.instance;

void init() {
  // bloc movie
  locator.registerFactory(
    () => SearchBloc(locator()),
  );
  locator.registerFactory(
    () => DetailMovieBloc(locator()),
  );
  locator.registerFactory(
    () => NowPlayingMovieBloc(locator()),
  );
  locator.registerFactory(
    () => PopularMovieBloc(locator()),
  );
  locator.registerFactory(
    () => RecommendationMovieBloc(locator()),
  );
  locator.registerFactory(() => TopRatedMovieBloc(locator()));
  locator.registerFactory(() => WatchlistMovieBloc(locator()));
  locator.registerFactory(
    () => WatchlistMovieStatusBloc(locator(), locator(), locator()),
  );


  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );


  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));


  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // utils
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<SSLClient>(() => SSLClient());
}
