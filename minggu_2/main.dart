// Import untuk fungsi percobaan-3
import 'dart:io';
// Import untuk fungsi percobaan-6
import 'modul_lain.dart';

void main() {
  print('Halo, Dart!');
  print('--------------');

  // 1. Fungsi, Variabel, dan Tipe Data
  fungsiPercobaan1();

  // 2. Operator
  fungsiPercobaan2();

  // 3. Input Pengguna
  fungsiPercobaan3();

  // 4. Pencabangan
  fungsiPercobaan4(80);

  // 5. Perulangan
  fungsiPercobaan5('Yoppy', 5);

  // 6. Panggil fungsi dari file lain
  fungsiPercobaan6();

  // 7. Tipe Data List
  fungsiPercobaanList();

  // 8. Tipe Data Map
  fungsiPercobaanMap();

  // 9. Tipe Data Set
  fungsiPercobaanSet();
}

// Fungsi percobaan 1: Variabel dan Tipe Data
void fungsiPercobaan1() {
  String nama = 'Yoppy Yunhasnawa';
  int umur = 36;
  double ipk = 3.89;
  bool lulus = true;

  // Print
  print('Nama : $nama');
  print('Umur : $umur');
  print('IPK : $ipk');
  print('Sudah Lulus? : $lulus');
  print('--------------');
}

// Fungsi percobaan 2: Operator
void fungsiPercobaan2() {
  int a = 10;
  int b = 3;

  // Print perhitungan dengan operator
  print('Penjumlahan: ${a + b}');
  print('Pembagian : ${a / b}');
  print('Modulus : ${a % b}');
  print('Logika : ${(a > b) && (b < 5)}');
  print('--------------');
}

// Fungsi percobaan 3: Input Pengguna
void fungsiPercobaan3() {
  stdout.write('Masukkan nama: ');
  String? nama = stdin.readLineSync();
  print('Halo, $nama!');
  print('--------------');
}

// Fungsi percobaan 4: Pencabangan
void fungsiPercobaan4(double nilai) {
  String status;
  if (nilai >= 75) {
    status = 'Lulus';
  } else {
    status = 'Mengulang';
  }
  print('Nilai : $nilai');
  print('Status: $status');
  print('--------------');
}

// Fungsi percobaan 5: Perulangan
void fungsiPercobaan5(String nama, double jumlah) {
  // Perulangan dengan for
  for(int i = 0; i < jumlah; i++) {
    print('For ke-$i: $nama');
  }
  print('--------------');

  // Perulangan dengan while
  int j = 0;
  while (j < jumlah) {
    print('While ke-$j: $nama');
    j++;
  }
  print('--------------');
}