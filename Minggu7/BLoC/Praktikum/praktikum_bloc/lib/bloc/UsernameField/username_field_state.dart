part of 'username_field_bloc.dart';

sealed class UsernameFieldState extends Equatable {
  const UsernameFieldState();
}

class InputUsernameFieldState extends UsernameFieldState{
  final String? nameValue;

  const InputUsernameFieldState({required this.nameValue});

   @override
  List<Object?> get props => [nameValue];
}