part of 'phone_field_bloc.dart';

sealed class PhoneFieldState extends Equatable {
  const PhoneFieldState();
}

class InputPhoneFieldState extends PhoneFieldState {
  final String? phoneValue;

  const InputPhoneFieldState({required this.phoneValue});

  @override
  List<Object?> get props => [phoneValue];
}
