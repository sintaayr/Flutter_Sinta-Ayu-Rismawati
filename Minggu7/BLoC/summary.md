Summary Materi BLoC

BLoC (Business Logic Component) adalah salah satu metode manajemen state pada Flutter yang digunakan untuk mengatur logika bisnis dan keadaan aplikasi. Dalam BLoC, keadaan (state) aplikasi terpisahkan dari tampilan (UI), yang membantu menjaga kode menjadi bersih dan terstruktur. Ini bekerja dengan prinsip menggunakan aliran data (streams) untuk mengelola perubahan state aplikasi.

Keuntungan BLoC :
1. Simple
    BLoC memisahkan logika bisnis dari tampilan, sehingga membuat kode lebih mudah dimengerti dan dipelihara. Ini memungkinkan pengembang untuk fokus pada masing-masing aspek aplikasi secara terpisah.

2. Powerful
    BLoC adalah metode yang kuat untuk mengelola state aplikasi. Dengan aliran data (streams) dan sink, BLoC dapat mengatasi perubahan state yang kompleks dan berbagai jenis event dengan baik. Ini memungkinkan pengembang untuk mengatasi kasus penggunaan yang beragam.

3. Testable
    BLoC memudahkan pengujian (testing) karena logika bisnis terpisah dari UI. Ini berarti Anda dapat menguji logika aplikasi dengan lebih mudah dan memastikan bahwa aplikasi berperilaku seperti yang diharapkan.

Cara kerja BLoC :
1. Menerima event sebagai input
    BLoC menerima event-event sebagai input. Event adalah peristiwa atau aksi yang memicu perubahan state aplikasi. Misalnya, tombol diklik atau data diterima dari server. Event ini dikirim ke BLoC untuk diproses.

2. Dianalisa dan dikelola di dalam BLoC
    Hasil dari analisis dan logika bisnis adalah perubahan state aplikasi. State adalah keadaan aplikasi yang mencerminkan apa yang terjadi pada saat itu. BLoC menghasilkan state baru dan mengirimkannya ke UI melalui stream, sehingga tampilan dapat diperbarui sesuai dengan state yang baru.

3. Menghasilkan state sebagai output
    Dalam BLoC, stream adalah komponen kunci yang digunakan untuk mengalirkan data dari BLoC ke tampilan. Stream adalah aliran data asinkron yang memungkinkan informasi untuk mengalir secara real-time. Ini memungkinkan tampilan untuk merespons perubahan state aplikasi secara dinamis.

Actor utama pada BLoC adalah stream. Ketika event atau aksi tertentu terjadi dalam aplikasi, BLoC akan menghasilkan perubahan state yang akan dikirimkan melalui stream. Tampilan kemudian akan mengikuti stream ini untuk menerima pembaruan state secara real-time.