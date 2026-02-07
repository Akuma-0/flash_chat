import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/features/home/data/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeService _homeService = HomeService();
  final _auth = FirebaseAuth.instance;
  Future<void> getUserData() async {
    emit(GettingUserData());
    try {
      currentUser = await _homeService.getUserData();
      emit(GotUserData());
    } on FirebaseException catch (e) {
      emit(ErrorGettingUserData(e.message ?? 'An error occurred'));
    } catch (e) {
      emit(ErrorGettingUserData(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
