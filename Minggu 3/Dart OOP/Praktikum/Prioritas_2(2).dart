/// Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
/// 1. Atribut dari Course terdiri dari judul dan deskripsi.
/// 2. Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
/// 3. Student dapat menambahkan course.
/// 4. Student dapat menghapus course.
/// 5. Student dapat melihat semua course yang telah ditambahkan.

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatDaftarCourse() {
    print("----- Daftar Course -----");
    print("Nama : $nama");
    print("Kelas : $kelas");
    int i = 1;
    for (var course in daftarCourse) {
      print("$i.) ${course.judul} \nDeskripsi : ${course.deskripsi}");
      i++;
    }
  }
}

void main() {
  Course course1 = Course("Introduction Mobile Appp Development", "Materi 1 Week 1");
  Course course2 = Course("Git", "Materi 2 Week 1");
  Course course3 = Course("Fundamental Dart", "Materi 3 Week 1");
  Course course4 = Course("Branching - Looping - Function", "Materi 1 Week 2");
  Course course5 = Course("Advance Function - Async Await - Collection Dart", "Materi 2 Week 2");


  Student student = Student("Sinta", "Flutter A");

  student.tambahCourse(course1);
  student.tambahCourse(course2);
  student.tambahCourse(course3);
  student.tambahCourse(course4);
  student.tambahCourse(course5);
  student.hapusCourse(course2);

  student.lihatDaftarCourse();
}
