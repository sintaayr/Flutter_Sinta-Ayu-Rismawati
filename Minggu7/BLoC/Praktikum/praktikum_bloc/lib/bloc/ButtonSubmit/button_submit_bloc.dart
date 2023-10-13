import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:praktikum_bloc/bloc/PhoneField/phone_field_bloc.dart';
import 'package:praktikum_bloc/bloc/UsernameField/username_field_bloc.dart';

part 'button_submit_event.dart';
part 'button_submit_state.dart';

class ButtonSubmitBloc extends Bloc<ButtonSubmitEvent, ButtonSubmitState> {
  final UsernameFieldBloc usernameFieldBloc;
  final PhoneFieldBloc phoneFieldBloc;

  ButtonSubmitBloc({
    required this.usernameFieldBloc,
    required this.phoneFieldBloc,
  }) : super(
          const ButtonSubmitEnable(
            isValid: false,
            daftarName: "",
            daftarPhone: "",
          ),
        ) {
    on<ValidationButtonSubmitEvent>((event, emit) {
      final usernameState = usernameFieldBloc.state;
      final phoneState = phoneFieldBloc.state;

      bool isValid = usernameState.nameValue?.isNotEmpty == true &&
          phoneState.phoneValue?.isNotEmpty == true;
      
      if(isValid=true){
        
      }

      emit(
        ButtonSubmitEnable(
          isValid: isValid,
          daftarName: usernameState.nameValue,
          daftarPhone: phoneState.phoneValue,
        ),
      );
    });
  }
}
