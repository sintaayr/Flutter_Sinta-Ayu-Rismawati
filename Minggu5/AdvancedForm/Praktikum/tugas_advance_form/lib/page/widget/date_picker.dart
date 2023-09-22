import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParsingDateFormat {
  String dateFormat(DateTime dateTime) {
    return DateFormat('EEEE,dd-MM-yyyy').format(dateTime);
  }
}

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  String? timerString;

  String _dateFormat(DateTime dateTime) {
    return DateFormat('EEEE,dd-MM HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Date'),
              TextButton(
                onPressed: () async {
                  // print(_dueDate);
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    // intiialDate untuk menampilkan tanggal yang muncul pertama kali
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2050),
                  );

                  if (selectDate != null) {
                    _dueDate = selectDate;
                    currentDate = selectDate;
                    setState(() {});
                  }
                },
                child: const Text("Select"),
              ),
            ],
          ),
          Text(
            // jika memakai method :
            //_dateFormat(_dueDate),
            // jika memakai class, agar dapat dipanggil secara global
            ParsingDateFormat().dateFormat(_dueDate),
            // DateFormat('EEEE,dd-MM HH:mm:ss', 'id').format(_dueDate),
          ),
          Text(timerString ?? ""),
        ],
      ),
    );
  }
}
