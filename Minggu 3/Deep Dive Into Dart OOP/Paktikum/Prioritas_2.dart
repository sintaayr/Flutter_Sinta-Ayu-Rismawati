class matematika {
  double hasil() {
    return 0.0;
  }
}

class kelipatanPersekutuanTerkecil implements matematika {
  double x;
  double y;

  kelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  double hasil() {
    double max;
  
  if (x > y) {
    max = x;
  } else {
    max = y;
  }
  
  while (true) {
    if (max % x == 0 && max % y == 0) {
      return max;
    }
    max += max;
  }
  }
}

class faktorPersekutuanTerbesar implements matematika {
  double x;
  double y;

  faktorPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil() {
    while (y != 0) {
    double sisa = x % y;
    x = y;
    y = sisa;
  }
    return x;
  }
}

void main() {
  final kpk = kelipatanPersekutuanTerkecil(8, 12);
  final fpb = faktorPersekutuanTerbesar(10, 16);

  matematika operation = kpk; 
  print('Kelipatan Persekutuan Terkecil: ${operation.hasil()}');

  operation = fpb; 
  print('Faktor Persekutuan Terbesar: ${operation.hasil()}');
}
