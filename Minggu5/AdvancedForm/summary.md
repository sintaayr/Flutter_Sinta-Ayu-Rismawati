Summary Advance Form

A. DatePicker
    Widget pada flutter yang memungkinkan user untuk memilih tanggal yang diinginkan, menggunakan fungsi showDatePicker yang memiliki 4 parameter yaitu : context, initialDate (menentukan tanggal yang akan ditampilkan pertama kali), firstDate (memberikan batas awal tanggal), lastDate (memberikan batas akhir tanggal). Memerlukan tambahan dependencies intl

B. ColorPicker
    Widget pada flutter yang memungkinkan user untuk memilih warna yang diinginkan. Dapat menggunakan fungsi :
    - BlockPicker : bentuknya nanti seperti pilihan-pilihan warna dalam bentuk blok-blok lingkaran
    - SlidePicker : bentuknya seperti menentukan gabungan-gabungan komponen warna dengan cara di slide untuk mengaturnya
    
    Untuk menggunakan widget ini perlu menambahkan package flutter_colorpicker ke dalam dependencies

C. FilePicker
    Widget pada flutter yang memungkinkan user untuk memilih file atau membuka file. Untuk menggunakannya diperlukan tambahan package file_picker dan open_file pada dependencies. Fungsi yang dapat digunakan yaitu FilePicker(), FilePickerResult(), dll.

D. ImagePicker
    Widget pada flutter dimana memungkinkan user untuk memilih media berupa gambar. Dengan menggunakan fungsi ImagePicker() dan mengatur ImageSource nya ingin diambil dari gallery atau camera. 
