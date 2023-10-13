part of 'button_submit_bloc.dart';

sealed class ButtonSubmitState extends Equatable {
  const ButtonSubmitState();
}

final class ButtonSubmitEnable extends ButtonSubmitState {
  final bool isValid;
  final String? daftarName;
  final String? daftarPhone;
  // final List<Map<String, String?>> contactList;

  const ButtonSubmitEnable({
    required this.isValid,
    required this.daftarName,
    required this.daftarPhone,
    // required this.contactList
  });

  @override
  List<Object> get props => [isValid, daftarName ?? "", daftarPhone ?? ""];
}
