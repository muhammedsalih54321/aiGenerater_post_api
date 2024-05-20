part of 'ai_bloc.dart';

@immutable
sealed class AiState {}

final class AiInitial extends AiState {}
final class Aiblocloadig extends AiState {}
final class Aiblocloaded extends AiState {}
final class Aierror extends AiState {}
