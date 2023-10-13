import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_bloc/bloc/ButtonSubmit/button_submit_bloc.dart';
import 'package:praktikum_bloc/bloc/PhoneField/phone_field_bloc.dart';
import 'package:praktikum_bloc/widget/text_field_widget.dart';

class FieldPhoneWidget extends StatelessWidget {
  const FieldPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneFieldBloc, PhoneFieldState>(
      builder: (context, state) {
        return TextFieldWidget(
          label: "Phone",
          hintText: "+62.....",
          onChanged: (value) {
            context.read<PhoneFieldBloc>().add(
                  InputPhoneFieldEvent(value: value),
                );
            context.read<ButtonSubmitBloc>().add(
                  ValidationButtonSubmitEvent(),
                );
          },
          keyboardType: TextInputType.number,
        );
      },
    );
  }
}
