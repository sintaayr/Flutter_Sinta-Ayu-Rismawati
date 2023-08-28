import 'dart:io';

void main() {
  // 1.) Buatlah sebuah piramid bintang
  int jmlBaris = 15;
  for (int i = 0; i < jmlBaris; i += 2) {
    for (int j = jmlBaris - i; j > 1; j--) {
      stdout.write(" ");
    }
    for (int k = 0; k <= i; k++) {
      stdout.write("* ");
    }
    print("");
  }

  print("");

  // 2.) Buatlah sebuah jam pasir

  int jmlBaris2 = 11;
  for (int i = jmlBaris2; i > 0; i -= 2) {
    for (int j = jmlBaris2 - i + 2; j > 0; j--) {
      stdout.write(" ");
    }
    for (int k = 0; k <= i - 1; k++) {
      stdout.write("0 ");
    }
    print("");
  }

  int jmlBaris3 = 9;
  for (int l = 0; l < jmlBaris3; l += 2) {
    for (int m = jmlBaris3 - l + 1; m > 0; m--) {
      stdout.write(" ");
    }
    for (int n = 0; n <= l + 2; n++) {
      stdout.write("0 ");
    }
    print("");
  }

  print(' ');

  // 3.) Tampilkan faktorial dari 10, 40 dan 50
  BigInt faktorial(int n) {
    if (n == 0 || n == 1) {
      return BigInt.one;
    } else {
      return BigInt.from(n) * faktorial(n - 1);
    }
  }

  int angkaPertama = 10;
  BigInt hasil1 = faktorial(angkaPertama);
  print("Faktorial dari $angkaPertama adalah $hasil1");

  int angkaKedua = 40;
  BigInt hasil2 = faktorial(angkaKedua);
  print("Faktorial dari $angkaKedua adalah $hasil2");

  int angkaKetiga = 50;
  BigInt hasil3 = faktorial(angkaKetiga);
  print("Faktorial dari $angkaKetiga adalah $hasil3");

print(" ");

  /// 4.) Buatlah sebuah function dengan parameter untuk 
  /// menghitung luas lingkaran. kemudian function lingkaran 
  /// tersebut dijalankan pada function main!
  double luasLingkaran(int r){
    return 3.14 * r * r;
  }

  var lingkaran = luasLingkaran(27);
  print('Luas Lingkaran : $lingkaran');
}
