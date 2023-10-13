part of 'button_submit_bloc.dart';

sealed class ButtonSubmitEvent extends Equatable {
  const ButtonSubmitEvent();
}

class ValidationButtonSubmitEvent extends ButtonSubmitEvent {
  @override
  List<Object> get props => [];
}

// class UpdateContactListEvent extends ButtonSubmitEvent {
//   final String? nameValue;
//   final String? phoneValue;

//   const UpdateContactListEvent(
//       {required this.nameValue, required this.phoneValue});

//   @override
//   List<Object?> get props => [nameValue, phoneValue];
// }
