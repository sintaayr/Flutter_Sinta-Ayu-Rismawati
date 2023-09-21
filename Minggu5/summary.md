SUMMARY MATERI FORM

08/09/2023

A. FORM
    Form berfungsi untuk menerima isian data dari pengguna, jumlah data dapat lebih dari satu. Data dapat diketikkan / diisi secara real time, wajib menggunakan stateful widget. ex : 
        var formKey = GlobalKey<FormState>();
        form(
        key: formkey,
        child: inputWidgets,
        );

B. INPUT
    * TextField
        Komponen wajib jika memakai form yaitu TextEditingController(), gunanya untuk mengambil data pada textField. Ex : 
        final namaController = TextEditingControler();
        controller : namaController;

        Komponen lainnya pada textField antara lain : 
        - decoration
        - disableBorder 
        - border
        - focusBorder (untuk mengatur agar textfield berubah saat di klik)
        - obscureText:true (untuk menyembunyikan teks)
        - hintText (fungsinya seperti placeholder text)
        - prefixIcon (untuk menambahkan ikon dalam textField di sebelah kiri)
        - sufixIcon (untuk menambahkan ikon dalam textField di sebelah kanan)
        - Icons.visibility_off (untuk icon mata yang biasanya terdapat saat memasukkan password)

    * TextFormField
    * Radio 
        Memberi opsi kepada pengguna dimana pengguna hanya dapat memilih satu pilihan 
    
    *  Checkbox 
        Hampir sama seperti radio, bedanya pada checkbox pengguna dapat memilih beberapa opsi 

    * Dropdown 
        Saat di klik maka akan menampilkan opsi untuk pengguna dima apengguna hanya dapat memilih 1 opsi. 


C. BUTTON
    Dapat melakukan tindakan jika di klik. Tedapat 2 jenis yaitu : 
    - ElevatedButton
    - IconButton (jenis button yang hanya menampilkan icon)