Summary Output Build Flutter

A. Output Build
- file/berkas hasil keluaran dari project flutter 
- digunakan untuk merilis aplikasi ke App Store
- terdiri dari format APK atau AAB untuk aandroid dan IPA untuk iOS. implementasi (jalankan di terminal) :
    >>> flutter build apk (output : .apk)
    >>> flutter build appbundle (output : .aab)
    >>> flutter build ios (output : .ipa)
- Terdapat 3 macam mode build, sebagai berikut :
    1.) Mode Debug 
        Untuk pengujian selama proses development.
        Implementasi :
        flutter build apk --debug
        Output :
        build/app/outputs/apk/debug/app-debug.apk

    2.) Mode Profile
        Untuk pengujian performa aplikasi.
        implementasi :
        flutter build apk --profile
        Output :
        build/app/outputs/apk/profile/app-profile.apk

    3.) Mode release
        Untuk merilis aplikasi ke Google Play dan Stores androd lainnya. 
        Implementasi :
        flutter build apk --release
        Output :
        build/app/outputs/apk/release/app-release.apk

B. Build Apk 
- hanya dapat berjalan di android 
- output : .apk
- dapat di install langsung pada perangkat android
- proses yang dapat dilakukan sebelum build apk di android/app/src/main/AndroidManifest.xml:
    1.) Mengatur nama aplikasi 
    2.) Mengatur icon aplikasi
    3.) Mengatur perizinan aplikasi (contoh perizian : camera, bluetooth, internet, dll)



