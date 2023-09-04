/// Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
///     1. Terdapat method untuk melakukan penjumlahan dua bilangan.
///     2. Terdapat method untuk melakukan pengurangan dua bilangan.
///     3. Terdapat method untuk melakukan perkalian dua bilangan.
///     4. Terdapat method untuk melakukan pembagian dua bilangan.

class Calculator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception("Pembagian oleh nol tidak diperbolehkan.");
    }
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();

  double bilPertama = 20;
  double bilKedua = 3.5;

  double penjumlahan = calculator.tambah(bilPertama, bilKedua);
  double pengurangan = calculator.kurang(bilPertama, bilKedua);
  double perkalian = calculator.kali(bilPertama, bilKedua);
  double pembagian = calculator.bagi(bilPertama, bilKedua);

  print("$bilPertama + $bilKedua = $penjumlahan");
  print("$bilPertama - $bilKedua = $pengurangan");
  print("$bilPertama x $bilKedua = $perkalian");
  print("$bilPertama : $bilKedua = $pembagian");
}
