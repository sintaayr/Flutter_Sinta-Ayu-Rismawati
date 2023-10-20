Summary materi storage 

A. Penyimpanan Lokal
    Penyimpanan lokal diperlukan untuk efisiensi penggunaan data internet. Untuk menyimpan data yang akan digunakan berulang kali sehingga tidak perlu mengakses ulang dari internet saat akan menggunakannya.

B. Implementasi Penyimpanan Lokal 
    1.) Shared Preferences
        - menyimpan data yang sederhana, seperti menyimpan data login dan menyimpan riwayat pencarian
        - penyimpanannya menggunakan format key-value
        - tipe data yang digunakan : teks, angka, boolean
        - untuk implementasinya diperlukan install package shared_preferences pada pubspec.yaml. contoh :
        shared_preferences: ^2.0.12
        - delete, read, save : 
            String username = "sinta";
            String password = "1906";

            class SharedPreference {
                .proses write.........
                .proses read..........
                .proses delete........
            }

            a.) Delete
                Contoh :
                Future<void> hapusUsername() async {
                SharedPreferences sharedPreference = await SharedPreferences.getInstance();
                await sharedPreference.remove(username);
                }

            b.) Read
                Contoh : 
                Future<String> readUsername() async {
                SharedPreferences sharedPreference = await SharedPreferences.getInstance();

                return sharedPreference.getString(username) ?? "";
                }

            c.) Save
                Contoh :
                Future<void> simpanUsername(String usernameInput) async {
                SharedPreferences sharedPreference = await SharedPreferences.getInstance();
                sharedPreference.setString(username, usernameInput);
                }

    2.) Local Database (SQLite)
        - Menyimpan dan meminta data dalam jumlah besar pada local device
        - bersifat privat
        - menggunakan SQLite database melalui package sqflite. Ex : 
            sqflite: ^2.0.2
            path: ^1.8.0
        - SQLite adalah database open source yang mendukung isert, read, update dan remove data.
        - Implementasi : 
            a.) Buat model data , ex :
                class ContactDataModel {
                    String? name;
                    String? phone;

                    ContactDataModel({
                        required this.name,
                        required this.phone,
                    });

                    Map<String, dynamic> toMap(){
                        return{
                            'name' : name,
                            'phone' : phone
                        };
                    }

                    ContactDataModel.fromMap(Map<String, dynamic> map){
                        name = map['name'];
                        phone = map['phone'];
                    }
                }
            b.) Buat database_helper dimana didalamnya terdapa method dengan sintaks untuk create, read, update dan delete data. contohnya dapat dilihat pada file database_helper.dart

            c.) Buat provider untuk memanggil method-method yang telah dibuat pada database-helper agar dapat dipanggil pada halaman lain ketika terjadi interaksi user. contohnya dapat dilihat pada db_manager.dart
                
