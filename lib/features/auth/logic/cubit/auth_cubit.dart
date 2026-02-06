import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/features/auth/data/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthService authService = AuthService();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await authService.signUp(name: name, email: email, password: password);
      emit(SignUpSuccess());
    } on FirebaseException catch (e) {
      emit(
        SignUpFailure(errorMessage: e.message ?? 'An unknown error occurred'),
      );
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await authService.signIn(email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseException catch (e) {
      emit(
        SignInFailure(errorMessage: e.message ?? 'An unknown error occurred'),
      );
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
