import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../class_imageItem.dart';
import '../theme/theme_color_style.dart';
import '../theme/theme_text_style.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';
import 'widget/header_contact_page.dart';
import 'widget/image_picker_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";
  XFile? _selectedImage;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  List<Map<String, String>> contacts = [];

  List<ImageItem> imageItems = [];

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts.add({
        "title": _nameValue,
        "subtitle": _phoneValue,
        "image": _selectedImage != null ? _selectedImage!.name : ""
      });
      imageItems.add(ImageItem(_selectedImage!.path));

      setState(() {
        _nameValue = "";
        _phoneValue = "";
        _selectedImage = null;
      });
      // ignore: avoid_print
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
      contacts[index]["image"] = _selectedImage!.name;
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
          const SizedBox(
            height: 20,
          ),
          ImagePickerWidget(
            onImageSelected: (XFile? file) {
              _selectedImage = file;
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
                    // ignore: avoid_print
                    print(imageItems);
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
                      contacts[index]["title"] ?? "",
                      style: ThemeTextStyle().m3BodyLarge,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contacts[index]["subtitle"] ?? "",
                          style: ThemeTextStyle().m3BodySmall,
                        ),
                        Text(
                          contacts[index]["image"] ?? "",
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
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            title: "Lihat Gallery",
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/gallery', arguments: imageItems);
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery', arguments: imageItems);
              },
            )
          ],
        ),
      ),
    );
  }
}
