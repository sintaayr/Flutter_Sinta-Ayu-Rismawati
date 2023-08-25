void main() {
  // 1.) Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemograman Dart
  int sisiPersegi = 5;
  int luasPersegi = sisiPersegi * sisiPersegi;
  int kelilingPersegi = 4 * sisiPersegi;

  print('/ Persegi /');
  print('Sisi : $sisiPersegi');
  print('Luas : $luasPersegi');
  print('Keliling : $kelilingPersegi');
  print('\n---------------------------');

  double lebarPersegiPanjang = 7.5;
  double panjangPersegiPanjang = 19;
  double luasPersegiPanjang = lebarPersegiPanjang * panjangPersegiPanjang;
  double kelilingPersegiPanjang = 2 * (lebarPersegiPanjang + panjangPersegiPanjang);

  print('/ Persegi Panjang /');
  print('Panjang : $panjangPersegiPanjang');
  print('Lebar : $lebarPersegiPanjang');
  print('Luas : $luasPersegiPanjang');
  print('Keliling : $kelilingPersegiPanjang');
  print('\n---------------------------');


  // 2.) Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart 
  double phi = 3.14;
  double r = 7;
  double luasLingkaran = phi * (r*r);
  double kelilingLingkaran = phi * (2 * r);

  print('/ Lingkaran /');
  print('Jari-jari : $r');
  print('Luas : $luasLingkaran');
  print('Keliling : $kelilingLingkaran');  
}