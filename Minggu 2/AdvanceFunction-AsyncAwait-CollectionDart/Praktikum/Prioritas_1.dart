/// 1. Buatlah sebuah fungsi dengan spesifikasi berikut:
///     a. Menerima 2 parameter, yaitu list data dan pengali
///     b. Lakukan perulangan pada list data secara asynchronous
///     c. Tiap perulangan, kalikan elemen list data dengan pengali
///     d. Return list baru yang berisi hasil proses diatas

Future<List<double>> perkalian(List<double> listAngka, double pengali) async {
  List<double> result = [];

  for (double angka in listAngka) {
    double hitungPerkalian = angka * pengali;
    result.add(hitungPerkalian);
  }

  return result;
}

void main() async {
  List<double> inputAngka = [9, 3.8, 8, 2, 11];
  double pengali = 5.5;

  List<double> hasilPerkalian = await perkalian(inputAngka, pengali);
  print("List Hasil Perkalian: $hasilPerkalian");
}
