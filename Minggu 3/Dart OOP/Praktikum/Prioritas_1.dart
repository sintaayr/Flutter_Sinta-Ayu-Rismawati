/// - buatlah sebuah class Hewan dengan property Berat (menyimpan data berat badan hewan)
/// - buatlah class mobil yang berisi :
/// 1. property kapasitas (total berat maksimum muatan)
/// 2. Property muatan (list data hewan yang menjadi muatan)
/// 3. Method tambahMuatan (jika kapasitas mencukupi, maka menambah data hewan pada list muatan)

class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan) {
    double totalBeratMuatan = muatan.fold(0, (total, hewan) => total + hewan.berat);
    if (totalBeratMuatan + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print('Hewan berhasil ditambahkan ke muatan mobil.');
    } else {
      print('Kapasitas muatan mobil tidak mencukupi.');
    }
  }
}

void main() {
  Mobil mobil = Mobil(800.0); // Kapasitas mobil 1000 kg

  Hewan kerbau = Hewan(300.0); // Berat kucing 5 kg
  Hewan kambing = Hewan(10.0); // Berat anjing 10 kg
  Hewan sapi = Hewan(500.0); // Berat sapi 500 kg

  mobil.tambahMuatan(kerbau); // Berhasil ditambahkan ke muatan
  mobil.tambahMuatan(kambing); // Berhasil ditambahkan ke muatan
  mobil.tambahMuatan(sapi); // Kapasitas muatan mobil tidak mencukupi
}
