part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class Sending extends ChatState {}
final class Success extends ChatState {}
final class Failure extends ChatState {
  final String error;
  Failure(this.error);
}


