import 'package:netplix/common/constants.dart';
import 'package:netplix/common/utils.dart';
import 'package:netplix/injection.dart' as di;
import 'package:netplix/presentation/pages/about/about_page.dart';
import 'package:netplix/presentation/pages/movie/home_movie_page.dart';
import 'package:netplix/presentation/pages/movie/movie_detail_page.dart';
import 'package:netplix/presentation/pages/movie/popular_movies_page.dart';
import 'package:netplix/presentation/pages/movie/search_page.dart';
import 'package:netplix/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:netplix/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:netplix/presentation/provider/bloc/movie/detail/detail_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/now_playing/now_playing_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/popular/popular_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/recommendations/recommendation_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/search/search_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/top_rated/top_rated_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'package:netplix/presentation/provider/bloc/movie/watchlist_status/watchlist_movie_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieStatusBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationMovieBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
