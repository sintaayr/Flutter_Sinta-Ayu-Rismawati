import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_provider/page/contact_page.dart';
import 'package:praktikum_provider/page/widget/header_contact_page.dart';

void main() {
  testWidgets("Judul appbar harus contact", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactPage(),
      ),
    );

    expect(find.text("Contact"), findsOneWidget);
  });

  testWidgets("Icon pada header harus icon telepon", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HeaderContactPage(),
      ),
    );

    expect(find.byIcon(Icons.phone), findsOneWidget);
  });

  testWidgets("Judul header : Create New Contacts", (tester) async {
     await tester.pumpWidget(
      const MaterialApp(
        home: HeaderContactPage(),
      ),
    );

    expect(find.text("A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."), findsOneWidget);
  });

  testWidgets("Terdapat divider setelah deskripsi header", (tester) async {
     await tester.pumpWidget(
      const MaterialApp(
        home: HeaderContactPage(),
      ),
    );

    expect(find.byType(Divider), findsOneWidget);
  });

testWidgets("Design textfield name sesuai", (tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ContactPage(),
    ),
  );

  expect(find.widgetWithText(TextField, "Name"), findsOneWidget);
  expect(find.widgetWithText(TextField, "Insert Your Name"), findsOneWidget);
});

testWidgets("Design textfield nomor telepon sesuai", (tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ContactPage(),
    ),
  );

  expect(find.widgetWithText(TextField, "Nomor"), findsOneWidget);
  expect(find.widgetWithText(TextField, "+62 ...."), findsOneWidget);
});

testWidgets("Button dengan text submit", (tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ContactPage(),
    ),
  );

  expect(find.widgetWithText(ElevatedButton, "Submit"), findsOneWidget);
});
  testWidgets("TextField should work as expected", (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Nomor",
                hintText: "+62 ....",
              ),
              onChanged: (val){
                
              },
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    ),
  );

  final textFieldFinder = find.byType(TextField);
  await tester.enterText(textFieldFinder, "+62123");

  expect(find.text("+62123"), findsOneWidget);
});
}
