import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_bloc/bloc/ButtonSubmit/button_submit_bloc.dart';
import 'package:praktikum_bloc/widget/button_widget.dart';

class ButtonSubmitWidget extends StatelessWidget {
  const ButtonSubmitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<ButtonSubmitBloc, ButtonSubmitState>(
            builder: (context, state) {
              if (state is ButtonSubmitEnable) {
                return ButtonWidget(
                  title: "Submit",
                  onPressed: state.isValid
                      ? () {
                          // print(state.nameValue);
                          // print(state.contactList);
                        }
                      : null,
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
