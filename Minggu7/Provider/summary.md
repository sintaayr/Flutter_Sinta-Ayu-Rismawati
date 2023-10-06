**# Summary Flutter State Management (Provider)
**
State merupakan data yang dapat dibaca sata pembuatan widget dan dapat berubah saat widget sedang aktif. State hanya dapat digunakan / dimiliki oleh StatefullWidget.

Dengan adanya state, dapat mempermudah antar widget dapat memanfaatkan state yang sama dengan mudah. Penggunaan state seperti property dari class dan digunakan pada widget saat build. 

Contoh :
onPressed: (){
    setState(){
        number=number+1;
    }
}
artinya tiap terjadinya onpressed maka akan dilakukan penambahan variable sebanyak +1.

# Global State
Global state merupakan state biasa yang dapat digunakan pada seluruh widget. 

Dalam penggunaanya diperlukan instalasi provider terlebih dahulu dengan cara menambahkannya pada dependencies di pubspec.yaml. 
Lalu langkah selanjutnya yaitu sebagai berikut :
1. Membuat State Provider 
    Definisikan state dalam bentuk class. misal buat file contact.dart lalu masukkan source code berikut
    Ex :
    class contohProvider with ChangeNotifier{
        List<Map<String, String>> _contacts = [];
        List<Map<String, String>> get contacts => _contacts;
        
        void add(Map<String, String> contact) {
            _contacts.add(contact);
            notifyListeners();
        }
    }

2. Mendaftarkan State Provider
    Import class yang telah dibuat ke dalam main.dart lalu daftarkan state pada runApp dengan MultiProvider.
    Ex : 
    import 'package:flutter/material.dart';
    import 'package:provider.dart';
    import 'package:contact.dart' as contact_store;

    void main(){
        runApp(
            MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => contact_store.Contact())
            ],
            child: MyWidget(),
        ),
        )
    }

3. Menggunakan State dari provider 
    Simpan provider dalam variabel dan ambil data dari provider melalui getter. 
    Ex :
    //build
    final contactProvider = Provider.of<contact_store.Contact>(context);

    //return
    ListView.builder(
        itemCount: contactProvider.contacts.length,
        itemBuilder:(context, index){
            return ListTile(
                title: Text(contactProvider.contacts[index]['name'] ?? ''),
                subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
            );
        },
    );
