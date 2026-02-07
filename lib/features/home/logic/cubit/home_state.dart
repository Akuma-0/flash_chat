part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GettingUserData extends HomeState {}

final class GotUserData extends HomeState {}

final class ErrorGettingUserData extends HomeState {
  final String error;
  ErrorGettingUserData(this.error);
}
