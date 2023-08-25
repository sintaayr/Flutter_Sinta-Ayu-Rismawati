void main() {
  // 1.) Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
  String namaDepan = 'Sinta';
  String namaTengah = 'Ayu';
  String namaBelakang = 'Rismawati';
  print('My name is $namaDepan $namaTengah $namaBelakang');
  print('\n-------------------------------');

  // 2.) Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.
  double phi = 3.14;
  double r = 8;
  double tinggi = 17;
  double volumeTabung = phi * (r*r) * tinggi;

  print('/ Volume Tabung /');
  print('Jari-jari : $r');
  print('Tinggi : $tinggi');
  print('Volume : $volumeTabung');
}