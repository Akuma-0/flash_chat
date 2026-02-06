import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/user_model.dart';
import '../../data/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final TextEditingController searchController = TextEditingController();
  final SearchServices _searchServices = SearchServices();
  Future<void> searchUsers() async {
    emit(SearchLoading());
    try {
      final results = await _searchServices.searchUsers(searchController.text);
      emit(SearchSuccess(results));
    } on FirebaseException catch (e) {
      emit(SearchFailure(e.message ?? 'An error occurred'));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
