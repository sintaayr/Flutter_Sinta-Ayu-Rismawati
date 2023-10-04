Resume Assets, Dialog Bottomsheet,  Navigation

A. Assets
    Assets merupakan file yang di bundled dan di deployed bersamaan dengan aplikasi. Macam-macam tipe assets antara lain : static data(JSON Files), icons, images, font file (ttf). Untuk menambahkan assets pada flutter, pertama buatlah folder assets untuk meletakkan asset2 yang ingin digunakan. Setelah itu, inisialisasi setiap assets di pubspec.yaml. Contoh :
    - assets/my_icon.png
    - assets/background.jpg
    atau untuk memasukkan semua yang ada pada folder assets cukup inisialisasi seperti berikut :
    - assets/

    a.) Image 
        Untuk menampilkan image pada flutter dapat menggunakan widget image, berikut beberapa contoh penggunaannya : 
        1. Image(
            image: AssetImage('assets/background.jpg'),
        )
        2. Image.asset('assets/background.jpg')
        3. Image.network('https://piscum.photos/id/1/200/300') >>>>> untuk menampilkan gambar yang diambil dari internet

    b.) Font 
        Untuk menambahkan font pada flutter dapat dilakukan dengan menambahkan custom font atau menambahkan package pada dependencies di pubspec.yaml

B. Dialog & Bottom Sheet
    a.) Alert Dialog
        digunakan untuk tampilan android, digunakan untuk memberi informasi tertentu kepada user, dapat juga untuk mendapatkan input dari user. Dalam penggunaannya tentunya menggunakan widget alertdialog dan menggunakan helper method showdialog. Pada showdialog membutuhkan context dan builder, pada builder akan dilakukan return alertdialog. ex :
        showDialog(){
            context : context,
            builder: (context) => AlertDialog()
        }
        Alertdialog memiliki properti content untuk mengisi konten yang akan ditampilkan seperti text, textbutton, gambar, dll. Selain itu juga terdapat properti actions untuk mengatur respon saat terjadi keadaan tertentu. 

    b.) Bottom Sheet
        Mirip seperti alertdialog namun bootom sheet seperti namanya akan muncul dari bawah layar aplikasi, bottomsheet menggunakan fungsi bawaan yaitu showModalBottomSheet dan memerlukan 2 propertie yaitu : context dan builder. Ex :
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(),
        )

C. Navigation 
    Navigation digunakan untuk berpindah dari satu halaman ke halaman lain. Macam-macam navigation : 
    1. Navigator.push()
        ex : 
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=> const halamanyangdituju())
        )

        Dalam navigation Navigator.push() kita dapat mengirimkan data ke halaman yang dituju menggunakan parameter, ex : 
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=> const halamanyangdituju(), parameter: 'Hore')
        )

        lalu pada halaman halamanyangdituju inisialisasi constructor seperti berikut : 
        final String parameter;
        const halamanyangdituju({Key? key, requiered this.parameter}) : super(key:key);

    2. Navigator.pop() >>> untuk kembali ke halaman sebelumnya 

    3. Navigation dengan Named Routes
        Tiap halaman memiliki route(alamat) yang dideklarasikan pada main.dart (di dalam MaterialApp). Ex :
        initialRoute : '/',
        routes: {
            '/' : (_) => const HalamanPertama(),
            '/kedua' : (_) => const HalamanKedua()
        }

        Initial route dapat diibaratkan seperti home, yaitu halaman pertama yang dituju ketika aplikasi dijalankan. Berikut contoh penggunaannya dalam berpindah halaman : 
        Navigator.of(context).pushNamed('/kedua');

        Untuk mengirimkan data pada jenis navigation ini dilakukan menggunakan argument, seperti berikut :
        Navigator.of(context).pushNamed('/kedua', arguments: 'Hore');

        lalu pada halaman yang dituju tambahkan code sebagai berikut untuk mengambil parameter yang dikirim melaui argumen, ex :
        final parameter = ModalRoute.of(context)!.settings.arguments as String;
