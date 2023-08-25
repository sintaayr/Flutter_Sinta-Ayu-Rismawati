void main() {
  // 1.) Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan.
  String kata = "kasur rusak"; 
  int jmlKata = kata.length;
  bool palindrom = true;

  for (int i = 0; i < jmlKata / 2; i++) {
    if (kata[i] != kata[jmlKata - i - 1]) {
      palindrom = false;
      break; 
    }
  }

  print('Kata : $kata');
  if (palindrom == true) {
    print('Adalah Palindrom');
  } else {
    print('Adalah Bukan Palindrom');
  }
  print('\n--------------------------');

  // 2.) Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.
  int angka = 10;
  List<int> faktor = [];

  for (int i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      faktor.add(i);
    }
  }

  print("Faktor dari $angka adalah: $faktor");

}
