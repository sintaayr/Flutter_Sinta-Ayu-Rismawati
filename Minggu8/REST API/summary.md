Summary materi REST API

A. Rest API
    - singakatan dari Representational State Transfer Application Programming Interface 
    - merupakan arsitektural yang memisahkan tampilan dengan proses bisnis
    - bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request.
    - alur :
        # client (web/mobile/desktop) mengirimkan request (GET, POST, PUT,, DELETE) ke REST API
        # REST API akan memproses request tersebut kepada server
        # server akan mengembalikan hasil request kepada REST API
        # REST API akan mengembalikan hasil berupa JSON Data kepada client

B. HTTP
    - merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web.
    - alur komunikasi : 
        # client mengirim request kepada server
        # server memproses requeust tersebut
        # server mengembalikan respon kepada client
    - struktur Request :
        * URL : alamat halaman yang akan diakses
        * Method (GET, POST, PUT, DELETE) : menunjukkan aksi yang diinginkan 
        * Header : informasi tambahan terkait request yang dikirimkan 
        * body : data yang disertakan bersama request
    - struktur Response :
        * Status code : kode yang mewakili keseluruhan responese(sukses/gagal)
        * Header : informasi tambahan terkait response yang diberikan 
        * body : data yang disertakan bersama response

C. Dio
    - berfungsi sebagai HTTP Client 
    - dimanfaatkan untuk melakukan REST API
    - untuk menggunakannya pada flutter , perlu menambahkan package dio ke dalam pubspec.yaml . contoh :
    dio: ^5.3.3
    - contoh peggunaan dio untuk mengambil data
        Dio()
        .get("url")
        .then((response){
            print(response);
        });

D. Serialisasi JSON 
    - JSON (JavaScript Object Notation) adalah format data yang digunakan untuk pertukaran data antara sistem yang berbeda.
        1. Penulisan Data: JSON adalah format yang digunakan untuk mewakili data dalam bentuk teks. Data dalam JSON ditulis dalam format teks dengan aturan tertentu. Data dalam JSON terdiri dari pasangan "kunci" (key) dan "nilai" (value), di mana kunci adalah string dan nilainya dapat berupa berbagai tipe data, termasuk string, angka, objek, array, boolean, atau null.

        2. Umum Digunakan pada REST API: JSON adalah format data yang sangat umum digunakan dalam RESTful API. Saat klien mengirim permintaan HTTP ke REST API, server seringkali akan merespons dengan data dalam format JSON. Ini memungkinkan klien untuk dengan mudah mengurai (parse) data dan menggunakannya dalam aplikasi mereka. JSON juga memiliki keunggulan dalam hal ringan dan mudah dibaca, sehingga cocok untuk pertukaran data.

    - serialisasi JSON 
        * mengubah struktur data ke bentuk JSON
        * alur : map/list ---> serialisasi ---> JSON
        * cara implementasi :
            1. import "dart:convert";
            2. Contoh :
                void main(){
                    var dataMap = {
                        'name' : 'John Doe',
                        'age' : 25,
                    };

                    var dataJSON = jsonEncode(dataMap);
                    print(dataJSON);
                };
            3. Hasil :
                {"name":"John Doe", "age":"25"}

    - deserialisasi JSON 
        * mengubah bentuk JSON ke struktur data
        * alur : JSON ---> Deserialisasi ---> map/list
        * cara implementasi :
            1. import "dart:convert";
            2. Contoh :
            void main() {
                var dataJSON = {"name":"John Doe", "age":"25"};
                var dataMap = jsonDecode(dataJSON);
                print(dataMap);
            }
            3. Hasil :
            {name: John Doe, age: 25}

