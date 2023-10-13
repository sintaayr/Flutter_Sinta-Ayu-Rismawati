part of 'phone_field_bloc.dart';

sealed class PhoneFieldEvent extends Equatable {
  const PhoneFieldEvent();
}

class InputPhoneFieldEvent extends PhoneFieldEvent{
  final String? value;

  const InputPhoneFieldEvent({required this.value});

  @override
  List<Object> get props => [value ?? ""];
}
