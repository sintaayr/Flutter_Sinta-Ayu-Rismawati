import 'package:code_competence_weekly_one/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test contact page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    expect(find.text("Code Competence Weekly 1"), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);

    // await tester.enterText(find.byKey(const Key('firstname')), 'Sinta');
    // await tester.enterText(find.byKey(const Key('lastname')), 'Ayu');
    // await tester.enterText(
    //     find.byKey(const Key('email')), 'sintaayr03@gmail.com');
    // await tester.enterText(find.byKey(const Key('message')), 'test');

    // // Tekan tombol "Submit"
    // await tester.press(find.byKey(const Key('submit')));
    // await tester.pump();

    // expect(find.text('Contact Information'),
    //     findsOneWidget); // Memeriksa apakah dialog "Contact Information" muncul

    // // Periksa apakah data yang dimasukkan sesuai dengan yang diharapkan di dalam dialog
    // expect(find.text('First Name : Sinta'), findsOneWidget);
    // expect(find.text('Last name : Ayu'), findsOneWidget);
    // expect(find.text('Email : sintaayr03@gmail.com'), findsOneWidget);
    // expect(find.text('Message : test'), findsOneWidget);
  });

  // testWidgets("cek desc", (tester) async{
  //   await tester.pumpWidget(const MaterialApp(home: ContactPage()));

  //   expect(find.text('Need to get in touch with us? Either fill out the form with your inquiry or find the '), findsOneWidget);
  // });

  testWidgets("label tiap textfield sesuai", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    expect(find.text('First name*'), findsOneWidget);
    expect(find.text('Last name'), findsOneWidget);
    expect(find.text('Email*'), findsOneWidget);
    expect(find.text('What can we help you with?'), findsOneWidget);
  });

  testWidgets("hint text pada setiap textfield telah sesuai", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    expect(find.text('Input first name'), findsOneWidget);
    expect(find.text('Input last name'), findsOneWidget);
    expect(find.text('Input email'), findsOneWidget);
    expect(find.text('Type here'), findsOneWidget);
  });

  testWidgets("button dengan submit", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });

  testWidgets("dekripsi sesuai", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    final richTextFinder = find.byKey(const Key('RichText'));
    final richTextWidget = tester.widget(richTextFinder) as RichText;
    final richTextWidget1 = tester.widget(richTextFinder) as RichText;
    final richTextWidget2 = tester.widget(richTextFinder) as RichText;

    final richTextText = richTextWidget.text.toPlainText();
    final richTextText1 = richTextWidget1.text.toPlainText();
    final richTextText2 = richTextWidget2.text.toPlainText();

    expect(
        richTextText,
        contains(
            "Need to get in touch with us? Either fill out the form with your inquiry or find the department email you'd like to contact below."));
    expect(richTextText1, contains("department email"));
    expect(richTextText2, contains("you'd like to contact below."));
  });

  // testWidgets("Show dialog saat button di klik", (tester) async {
  //   await tester.pumpWidget(const MaterialApp(home: ContactPage()));

  //   await tester.press(find.byKey(const Key('submit')));
  //   await tester.pump();

  //   expect(find.byKey(const Key('dialog')), findsOneWidget);

  // });
}
