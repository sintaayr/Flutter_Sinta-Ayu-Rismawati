import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_bloc/bloc/ButtonSubmit/button_submit_bloc.dart';
import 'package:praktikum_bloc/widget/text_field_widget.dart';

import '../../bloc/UsernameField/username_field_bloc.dart';

class FieldUsernameWidget extends StatelessWidget {
  const FieldUsernameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameFieldBloc, UsernameFieldState>(
        builder: (context, state) {
      return TextFieldWidget(
          label: "Name",
          hintText: "Insert Your Name",
          onChanged: (value) {
            context.read<UsernameFieldBloc>().add(
                  InputUsernameFieldEvent(value: value),
                );
            context.read<ButtonSubmitBloc>().add(
                  ValidationButtonSubmitEvent(),
                );
          },
          keyboardType: TextInputType.text,);
    });
  }
}
