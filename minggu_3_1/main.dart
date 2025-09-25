import 'dart:io';
import 'mata_kuliah.dart';

void main() {
  // Data transkrip mahasiswa
  List<MataKuliah> transkrip = [
    MataKuliah('IF101', 'Algoritma dan Pemrograman', 3, 3.5),
    MataKuliah('IF102', 'Basis Data', 3, 4.0),
    MataKuliah('IF103', 'Pemrograman Web', 4, 3.0),
    // MataKuliah('IF104', 'Struktur Data', 3, 3.8),
    // MataKuliah('IF105', 'Jaringan Komputer', 3, 2.5),
    // MataKuliah('IF106', 'Pemrograman Mobile', 4, 3.7),
  ];

  print('=== SISTEM TRANSKRIP MAHASISWA ===\n');

  bool running = true;
  while (running) {
    tampilkanMenu();
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        hitungIPK(transkrip);
        break;
      case '2':
        filterNilaiBagus(transkrip);
        break;
      case '3':
        tampilkanNilaiTerformat(transkrip);
        break;
      case '4':
        tampilkanSemuaData(transkrip);
        break;
      case '5':
        analisaStatistik(transkrip);
        break;
      case '0':
        print('Terima kasih! Program selesai.');
        running = false;
        break;
      default:
        print('Pilihan tidak valid! Silakan coba lagi.\n');
    }

    if (running) {
      print('\nTekan Enter untuk melanjutkan...');
      stdin.readLineSync();
      print('\n' + '=' * 50 + '\n');
    }
  }
}

void tampilkanMenu() {
  print('MENU PILIHAN:');
  print('1. Hitung IPK');
  print('2. Filter Nilai Bagus (>= 3.5)');
  print('3. Tampilkan Nilai Terformat');
  print('4. Tampilkan Semua Data');
  print('5. Analisa Statistik');
  print('0. Keluar');
  print('');
  stdout.write('Pilih opsi (0-5): ');
}

void hitungIPK(List<MataKuliah> transkrip) {
  print('\n=== PERHITUNGAN IPK ===');

  // Hitung total nilai (nilai * sks)
  double totalNilai = transkrip
      .map((mk) => mk.nilai * mk.sks)
      .reduce((a, b) => a + b);

  // Hitung total SKS
  int totalSks = transkrip
      .map((mk) => mk.sks)
      .reduce((a, b) => a + b);

  // Hitung IPK
  double ipk = totalNilai / totalSks;

  print('Total SKS yang diambil: $totalSks');
  print('Total nilai tertimbang: ${totalNilai.toStringAsFixed(2)}');
  print('IPK: ${ipk.toStringAsFixed(2)}');

  // Kategori IPK
  String kategori;
  if (ipk >= 3.5) {
    kategori = 'Cumlaude';
  } else if (ipk >= 3.0) {
    kategori = 'Sangat Memuaskan';
  } else if (ipk >= 2.5) {
    kategori = 'Memuaskan';
  } else {
    kategori = 'Kurang Memuaskan';
  }
  print('Predikat: $kategori');
}

void filterNilaiBagus(List<MataKuliah> transkrip) {
  print('\n=== MATA KULIAH DENGAN NILAI BAGUS (>= 3.5) ===');

  var nilaiBagus = transkrip.where((mk) => mk.nilai >= 3.5);

  if (nilaiBagus.isEmpty) {
    print('Tidak ada mata kuliah dengan nilai >= 3.5');
  } else {
    print('Jumlah mata kuliah dengan nilai bagus: ${nilaiBagus.length}');
    print('');
    for (var mk in nilaiBagus) {
      print('${mk.nama} (${mk.kode})');
      print('  SKS: ${mk.sks}, Nilai: ${mk.nilai}');
    }
  }
}

void tampilkanNilaiTerformat(List<MataKuliah> transkrip) {
  print('\n=== DAFTAR NILAI TERFORMAT ===');

  // Menggunakan map untuk format data
  var nilaiTerformat = transkrip.map((mk) =>
  '${mk.nama.padRight(25)} : ${mk.nilai.toString().padLeft(4)} (${getHurufMutu(mk.nilai)})');

  nilaiTerformat.forEach(print);
}

void tampilkanSemuaData(List<MataKuliah> transkrip) {
  print('\n=== SEMUA DATA TRANSKRIP ===');
  print('Kode'.padRight(8) + 'Nama Mata Kuliah'.padRight(25) + 'SKS'.padRight(5) + 'Nilai'.padRight(7) + 'Huruf');
  print('-' * 50);

  for (var mk in transkrip) {
    print('${mk.kode.padRight(8)}${mk.nama.padRight(25)}${mk.sks.toString().padRight(5)}${mk.nilai.toString().padRight(7)}${getHurufMutu(mk.nilai)}');
  }
}

void analisaStatistik(List<MataKuliah> transkrip) {
  print('\n=== ANALISA STATISTIK ===');

  // Nilai tertinggi dan terendah
  double nilaiTertinggi = transkrip.map((mk) => mk.nilai).reduce((a, b) => a > b ? a : b);
  double nilaiTerendah = transkrip.map((mk) => mk.nilai).reduce((a, b) => a < b ? a : b);

  // Rata-rata nilai (bukan IPK)
  double rataRataNilai = transkrip.map((mk) => mk.nilai).reduce((a, b) => a + b) / transkrip.length;

  // Mata kuliah dengan nilai tertinggi dan terendah
  var mkTertinggi = transkrip.where((mk) => mk.nilai == nilaiTertinggi).first;
  var mkTerendah = transkrip.where((mk) => mk.nilai == nilaiTerendah).first;

  // Distribusi nilai
  var nilaiA = transkrip.where((mk) => mk.nilai >= 3.5).length;
  var nilaiB = transkrip.where((mk) => mk.nilai >= 3.0 && mk.nilai < 3.5).length;
  var nilaiC = transkrip.where((mk) => mk.nilai >= 2.5 && mk.nilai < 3.0).length;
  var nilaiD = transkrip.where((mk) => mk.nilai < 2.5).length;

  print('Nilai Tertinggi: $nilaiTertinggi (${mkTertinggi.nama})');
  print('Nilai Terendah: $nilaiTerendah (${mkTerendah.nama})');
  print('Rata-rata Nilai: ${rataRataNilai.toStringAsFixed(2)}');
  print('');
  print('Distribusi Nilai:');
  print('  A (>= 3.5): $nilaiA mata kuliah');
  print('  B (3.0-3.4): $nilaiB mata kuliah');
  print('  C (2.5-2.9): $nilaiC mata kuliah');
  print('  D (< 2.5): $nilaiD mata kuliah');
}

String getHurufMutu(double nilai) {
  if (nilai >= 3.5) return 'A';
  if (nilai >= 3.0) return 'B';
  if (nilai >= 2.5) return 'C';
  return 'D';
}