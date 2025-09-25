// File: modul_lain.dart
// Fungsi-fungsi untuk demonstrasi modularisasi dan tipe data koleksi

// Fungsi percobaan 6: Modularisasi
void fungsiPercobaan6() {
  print('==============');
  print('Ini modul lain');
  print('==============');
}

// Fungsi percobaan List
void fungsiPercobaanList() {
  List<String> buah = ['Apel', 'Mangga', 'Pisang'];
  buah.add('Jeruk');
  print('Isi List: $buah');
  print('Buah pertama: ${buah[0]}');
  print('Jumlah buah: ${buah.length}');
  print('==============');
}

// Fungsi percobaan Map<K, V>
void fungsiPercobaanMap() {
  Map<String, String> biodata = {
    'nama': 'Yoppy',
    'jurusan': 'Teknologi Informasi',
  };
  biodata['asal'] = 'Malang';
  print('Biodata: $biodata');
  print('Nama: ${biodata['nama']}');
  print('==============');
}

// Fungsi percobaan Set
void fungsiPercobaanSet() {
  Set<String> hobi = {'membaca', 'menulis', 'berenang'};
  hobi.add('membaca'); // tidak akan ditambahkan dua kali
  print('Hobi: $hobi');
  print('Jumlah hobi unik: ${hobi.length}');
  print('==============');
}