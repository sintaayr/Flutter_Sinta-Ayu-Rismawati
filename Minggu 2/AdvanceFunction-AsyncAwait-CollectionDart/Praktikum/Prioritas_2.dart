void main() {
  ///  1. Buatlah sebuah list dengan spesifikasi berikut:
  ///     a. Tiap elemen wajib berupa list juga
  ///     b. tiap element wajib terdapat 2 data(sub-elemen)
  ///     c. Buatlah sebuah map dengan menggunakan list tersebut

  List<List<dynamic>> listOfLists = [
    ['Sinta', '17'],
    ['Rizka', '20'],
    ['Ayu', '19'],
    ['Rakha', '13'],
  ];

  var students = []; 
  for (var item in listOfLists) {
    var student = {
      'nama': item[0],
      'umur': item[1],
    };
    students.add(student); 
  }
  print(students);

  print('\n----------------------------------------------------------------------------\n');

  /// 2.) Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. 
  /// Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.
  
  List<int> angka = [9, 3, 5, 7, 11, 21];
  
  int total = 0;
  for (int n in angka) {
    total += n;
  }
  
  double rataRata = (total / angka.length);
  int pembulatan = rataRata.round();
  print(angka);
  print('Rata - Rata : $rataRata');
  print('Pembulatan : $pembulatan');

  print('\n----------------------------------------------------------------------------\n');

  /// 3.) Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron.
Future<int> hitungFactorial(int n) {
  return Future<int>(() {
    if (n < 0) {
      throw ArgumentError('Bilangan negatif tidak memiliki faktorial');
    }

    if (n == 0 || n == 1) {
      return 1;
    }

    int factorial = 1;
    for (int i = 2; i <= n; i++) {
      factorial *= i;
    }

    return factorial;
  });
}

hitungFactorial(6).then((result) {
    print('Hasil faktorial: $result');
  }).catchError((error) {
    print('Terjadi kesalahan: $error');
  });

}



