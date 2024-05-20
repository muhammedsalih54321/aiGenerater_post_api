part of 'ai_bloc.dart';

@immutable
sealed class AiEvent {}
class fetchai extends AiEvent{
  final String massage;

  fetchai({required this.massage});
}
