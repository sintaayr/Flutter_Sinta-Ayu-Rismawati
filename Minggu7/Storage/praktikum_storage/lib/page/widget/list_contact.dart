import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_prioritas_1_dan_2/provider/db_manager.dart';

import '../../provider/contact_page_provider.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer<DbManager>(
        builder: (context, dbManager, child) {
          if (dbManager.contactDataModel.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: dbManager.contactDataModel.length,
              itemBuilder: (context, index) {
                final data = dbManager.contactDataModel[index];
                return ListTile(
                  leading: const CircleAvatar(
                    // backgroundColor: ThemeColor().m3SysyLightPurple90,
                    child: Text(
                      "A",
                      // style: TextStyle(color: ThemeColor().m3SysDarkPurple),
                    ),
                  ),
                  title: Text(data.name ?? "-"),
                  subtitle: Text(data.phone?.toString() ?? "-"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Consumer<ContactPageProvider>(
                          builder: (context, contactPageProvider, child) {
                        return IconButton(
                          onPressed: () {
                            contactPageProvider.nameController.text = data.name ?? "";
                            contactPageProvider.phoneController.text = data.phone ?? "";
                            contactPageProvider.nameValue = data.name ?? "";
                            contactPageProvider.phoneValue = data.phone ?? "";
                            contactPageProvider.isEdit = true;
                          },
                          icon: const Icon(Icons.edit),
                        );
                      }),
                      IconButton(
                        onPressed: () {
                          dbManager.deleteContact(data.name ?? "");
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No contacts available"),
            );
          }
        },
      ),
    );
  }
}
