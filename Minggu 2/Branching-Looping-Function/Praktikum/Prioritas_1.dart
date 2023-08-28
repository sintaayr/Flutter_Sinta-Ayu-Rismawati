void main() {
  /// 1. Terdapat sebuah nilai:
  ///     jika nilai > 70 akan mereturn “Nilai A”
  ///     jika nilai > 40 akan mereturn “Nilai B”
  ///     ika nilai > 0 akan mereturn “Nilai C”
  ///     selain itu return teks kosong  
  
  int nilai = 60;
  if (nilai > 70){
    print('Nilai A');
  } else if (nilai > 40 && nilai <=70){
    print('Nilai B');
  } else if (nilai > 0 && nilai <= 40){
    print('Nilai C');
  }else {
    return null;
  }

  print('\n==============================\n');

  /// 2. Tampilkan nilai 1 - 10 pada layar dengan menggunakan perulangan!
  
  int j =1;
  for(var i = 0; i < 10 ; i++){
    print(j);
    j++;
  }
}