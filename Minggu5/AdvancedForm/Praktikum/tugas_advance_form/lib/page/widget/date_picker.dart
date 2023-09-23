import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParsingDateFormat {
  String dateFormat(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  String? timerString;

  // String _dateFormat(DateTime dateTime) {
  //   return DateFormat('EEEE, dd-MM-yyyy').format(dateTime);
  // }

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
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2050),
                  );

                  if (selectDate != null) {
                    _dueDate = selectDate;
                    currentDate = selectDate;
                    setState(() {});

                    widget.onDateSelected(selectDate);
                  }
                },
                child: const Text("Select"),
              ),
            ],
          ),
          Text(
            ParsingDateFormat().dateFormat(_dueDate),
          ),
          Text(timerString ?? ""),
        ],
      ),
    );
  }
}
