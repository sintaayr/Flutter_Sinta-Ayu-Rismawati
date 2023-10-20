import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_prioritas_1_dan_2/model/contact_data_model.dart';
import 'package:storage_prioritas_1_dan_2/provider/db_manager.dart';
import '../provider/contact_page_provider.dart';
import '../utils/shared_preference.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';
import 'login_page.dart';
import 'widget/header_contact_page.dart';
import 'widget/list_contact.dart';

class ContactPage extends StatefulWidget {
  final bool? isEdit;
  final ContactDataModel? contactDataModel;

  const ContactPage({super.key, this.isEdit, this.contactDataModel});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _usernameController = TextEditingController();
  // final _phoneController = TextEditingController();

  // String nameValue = "";
  // String phoneValue = "";

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
  void dispose() {
    _usernameController.dispose();
    // _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactPageProvider>(context);
    // final dbManager = Provider.of<DbManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 167, 248),
        title: const Text(
          "Contact",
          // style: ThemeTextStyle().m3DisplayLarge,
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
              // nameValue = val;
              contactProvider.nameValue = val;
              contactProvider.nameController = _usernameController;
              setState(() {});
            },
            controller: _usernameController,
            keyboardType: TextInputType.text,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62 ....",
            onChanged: (val) {
              // phoneValue = val;
              contactProvider.phoneValue = val;
              setState(() {});
            },
            controller: contactProvider.phoneController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
              title: contactProvider.isEdit == true ? "Update" : "Simpan",
              onPressed: contactProvider.nameValue.isNotEmpty && contactProvider.phoneValue.isNotEmpty
                  ? () {
                      if (contactProvider.isEdit == true) {
                        Provider.of<DbManager>(context, listen: false)
                            .updateContact(
                          ContactDataModel(name: contactProvider.nameValue, phone: contactProvider.phoneValue),
                        );
                        contactProvider.clear();
                      } else {
                        Provider.of<DbManager>(context, listen: false)
                            .addContact(
                          ContactDataModel(name: contactProvider.nameValue, phone: contactProvider.phoneValue),
                        );
                        contactProvider.clear();
                      }
                    }
                  : null),
          const SizedBox(
            height: 49,
          ),
          const Text(
            "List Contact",
            // style: ThemeTextStyle().m3HeadLineSmall,
            textAlign: TextAlign.center,
          ),
          const ListContact(),
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