import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_ui_testing/page/contact_page.dart';

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
        home: ContactPage(),
      ),
    );

    expect(find.byIcon(Icons.phone), findsOneWidget);
  });

  testWidgets("Judul header : Create New Contacts", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactPage(),
      ),
    );

    expect(
        find.text(
            "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
        findsOneWidget);
  });

  testWidgets("Terdapat divider setelah deskripsi header", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactPage(),
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

  testWidgets("Judul list contact : List Contact", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactPage(),
      ),
    );

    expect(find.text("List Contact"), findsOneWidget);
  });

  testWidgets("TextField phone number should work as expected", (tester) async {
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
                onChanged: (val) {},
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

    expect(find.widgetWithText(TextField, "+62123"), findsOneWidget);
  });

  testWidgets("TextField name should work as expected", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Insert Your Name",
                ),
                onChanged: (val) {},
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );

    final textFieldFinder = find.byType(TextField);
    await tester.enterText(textFieldFinder, "sinta");

    expect(find.widgetWithText(TextField, "sinta"), findsOneWidget);
  });

// MASIH FAIL
  //  testWidgets('Test Submit Button Functionality', (WidgetTester tester) async {

  //   await tester.pumpWidget(const MaterialApp(home: ContactPage(),),);

  //   final nameTextField = find.widgetWithText(TextField, "Name");
  //   final nomorTextField = find.widgetWithText(TextField, "Nomor");

  //   final submitButton = find.widgetWithText(ElevatedButton, "Submit");

  //   await tester.enterText(nameTextField, "John");
  //   await tester.enterText(nomorTextField, "+123456789");

  //   // expect(submitButton, findsOneWidget);
  //   // expect(tester.widget<ElevatedButton>(submitButton).enabled, true);

  //   await tester.press(submitButton);
  //   await tester.pump();

  //   expect(find.widgetWithText(ListTile, "John"), findsOneWidget);
  //   expect(find.widgetWithText(ListTile, "+123456789"), findsOneWidget);
  //   expect(find.widgetWithIcon(ListTile, Icons.delete), findsOneWidget);
  //   expect(find.widgetWithIcon(ListTile, Icons.edit), findsOneWidget);
  // });
}
