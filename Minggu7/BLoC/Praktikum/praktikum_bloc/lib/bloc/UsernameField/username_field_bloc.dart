import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'username_field_event.dart';
part 'username_field_state.dart';

class UsernameFieldBloc extends Bloc<UsernameFieldEvent, InputUsernameFieldState> {
  UsernameFieldBloc()
      : super(
          const InputUsernameFieldState(nameValue: "")
        ) {
    on<InputUsernameFieldEvent>(
      (event, emit) {
        String nameValue = event.value ?? "";
        

        emit(InputUsernameFieldState(nameValue: nameValue));
      },
    );
  }
}
