import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tugas_advance_form/page/widget/color_picker.dart';
import 'package:tugas_advance_form/page/widget/date_picker.dart';
import 'package:tugas_advance_form/page/widget/file_picker.dart';
import 'package:tugas_advance_form/page/widget/header_contact_page.dart';
import '../theme/theme_color_style.dart';
import '../theme/theme_text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  // void initState() {
  //   Color _currentColor = Colors.orange;
  // }

  String _nameValue = "";
  String _phoneValue = "";
  DateTime? _selectedDate;
  Color? _selectedColor;
  FilePickerResult? _selectedFile;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  List<Map<String, String>> contacts = [];

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts.add({
        "title": _nameValue,
        "subtitle": _phoneValue,
        // "date": _selectedDate.toString()
        "date": ParsingDateFormat().dateFormat(_selectedDate!),
        "color": _selectedColor != null ? _selectedColor.toString() : "",
        "file": _selectedFile != null ? _selectedFile!.files.first.name : "",
      });
      setState(() {
        _nameValue = "";
        _phoneValue = "";
      });
      print(contacts);
      _nameController.clear();
      _phoneController.clear();
    }
  }

  int selectedIndex = -1;

  void updateContact(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts[index]["title"] = _nameValue;
      contacts[index]["subtitle"] = _phoneValue;
      setState(() {});
      selectedIndex = -1;
      _nameController.clear();
      _phoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 167, 248),
        title: Text(
          "Contact",
          style: ThemeTextStyle().m3DisplayLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: "Name",
            hintText: "Insert Your Name",
            onChanged: (val) {
              _nameValue = val;
              setState(() {});
              // ignore: avoid_print
              print(_nameValue);
            },
            controller: _nameController,
            keyboardType: TextInputType.text,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62 ....",
            onChanged: (val) {
              _phoneValue = val;
              setState(() {});
              // ignore: avoid_print
              print(_phoneValue);
            },
            controller: _phoneController,
            keyboardType: TextInputType.number,
          ),
          DatePickerWidget(onDateSelected: (DateTime selectedDate) {
            print("Tanggal yang dipilih: $selectedDate");
            _selectedDate = selectedDate;
          }),
          ColorPickerWidget(
            onColorSelected: (Color color) {
              print("warna yang dipilih : $color");
              _selectedColor = color;
            },
          ),
          FilePickerWidget(
            onFileSelected: (FilePickerResult? result) {
              // print("file yang dipilih : $result2");
              _selectedFile = result;
              print("file yang dipilih : $result");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            title: "Submit",
            onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                ? () {
                    if (selectedIndex == -1) {
                      addContact();
                    } else {
                      updateContact(selectedIndex);
                    }
                  }
                : null,
          ),
          const SizedBox(
            height: 49,
          ),
          Text(
            "List Contact",
            style: ThemeTextStyle().m3HeadLineSmall,
            textAlign: TextAlign.center,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ThemeColor().m3SysyLightPurple90,
                      child: Text(
                        "A",
                        style: TextStyle(color: ThemeColor().m3SysDarkPurple),
                      ),
                    ),
                    title: Text(
                      "Name : ${contacts[index]["title"] ?? ""}",
                      style: ThemeTextStyle().m3BodyLarge,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone : ${contacts[index]["subtitle"] ?? ""}",
                          style: ThemeTextStyle().m3BodySmall,
                        ),
                        Text(
                          "Date : ${contacts[index]["date"] ?? ""}",
                          style: ThemeTextStyle().m3BodySmall,
                        ),
                        Row(
                          children: [
                            Text(
                              // "Color : ${contacts[index]["color"] ?? ""}",
                              "Color : ",
                              style: ThemeTextStyle().m3BodySmall,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              color: _selectedColor,
                            )
                          ],
                        ),
                        Text(
                          "File : ${contacts[index]["file"] ?? ""}",
                          style: ThemeTextStyle().m3BodySmall,
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _nameController.text = contacts[index]["title"]!;
                            _phoneController.text =
                                contacts[index]["subtitle"]!;
                            selectedIndex = index;
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              contacts.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
