part of 'username_field_bloc.dart';

sealed class UsernameFieldEvent extends Equatable {
  const UsernameFieldEvent();
}

class InputUsernameFieldEvent extends UsernameFieldEvent{
  final String? value;

  const InputUsernameFieldEvent({required this.value});

  @override
  List<Object> get props => [value ?? ""];
}

// class ControllerUsernameField extends UsernameFieldEvent{
//   final  String nameController = TextEditingController().text;

//   ControllerUsernameField({required nameController});
//   @override
//   List<Object> get props => [nameController];
// }