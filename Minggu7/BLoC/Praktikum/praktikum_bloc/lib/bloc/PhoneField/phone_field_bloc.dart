import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_field_event.dart';
part 'phone_field_state.dart';

class PhoneFieldBloc extends Bloc<PhoneFieldEvent, InputPhoneFieldState> {
  PhoneFieldBloc() : super(const InputPhoneFieldState(phoneValue: '')) {
    on<InputPhoneFieldEvent>((event, emit) {
      String phoneValue = event.value ?? "";

      emit(InputPhoneFieldState(phoneValue: phoneValue));
    });
  }
}
