class bangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  bangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class kubus extends bangunRuang {
  double sisi;

  kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class balok extends bangunRuang {
  balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {  
  kubus bangun = kubus(2.5); 
  print('Volume : ${bangun.volume()}');

  /// ATAU
  //  balok bangun = balok (2, 3, 4);
  //  print('Volume : ${bangun.volume()}');
}
