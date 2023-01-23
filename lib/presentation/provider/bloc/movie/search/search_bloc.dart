import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:netplix/domain/entities/movie/movie.dart';
import 'package:netplix/domain/usecases/movie/search_movies.dart';
import 'package:netplix/presentation/provider/bloc/movie/search/search_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';


part 'search_event.dart';

part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());

      final result = await _searchMovies.execute(query);

      result.fold((failure) {
        emit(SearchError(failure.message));
      }, (data) {
        emit(SearchHasData(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

}
