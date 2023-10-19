import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contact_page_provider.dart';
import '../theme/color_style.dart';
import '../theme/text_style.dart';
import '../utils/shared_preference.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';
import 'login_page.dart';
import 'widget/header_contact_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _usernameController = TextEditingController();

  void load() async {
    _usernameController.text = await SharedPreference().readUsername();
    setState(() {});
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactPageProvider>(context);

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
              contactProvider.nameValue = val;
              contactProvider.nameController = _usernameController;
            },
            controller: _usernameController,
            keyboardType: TextInputType.text,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62 ....",
            onChanged: (val) {
              contactProvider.phoneValue = val;
            },
            controller: contactProvider.phoneController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
              title: "Submit",
              onPressed: contactProvider.nameValue.isNotEmpty &&
                      contactProvider.phoneValue.isNotEmpty
                  ? () {
                      if (contactProvider.selectedIndex == -1) {
                        contactProvider.addContact();
                      } else {
                        contactProvider
                            .updateContact(contactProvider.selectedIndex);
                      }
                    }
                  : null),
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
            itemCount: contactProvider.contacts.length,
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
                      contactProvider.contacts[index]["title"] ?? "",
                      style: ThemeTextStyle().m3BodyLarge,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contactProvider.contacts[index]["subtitle"] ?? "",
                          style: ThemeTextStyle().m3BodySmall,
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            contactProvider.nameController.text =
                                contactProvider.contacts[index]["title"]!;
                            contactProvider.phoneController.text =
                                contactProvider.contacts[index]["subtitle"]!;
                            contactProvider.selectedIndex = index;
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              contactProvider.contacts.removeAt(index);
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
            height: 30,
          ),
          ButtonWidget(
            title: "Logout",
            onPressed: () {
              SharedPreference().hapusUsername();
              SharedPreference().hapusPassword();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HalamanLogin(),
                  ),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}
