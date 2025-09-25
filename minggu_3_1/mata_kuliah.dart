class MataKuliah {
  final String kode;
  final String nama;
  final int sks;
  final double nilai;

  MataKuliah(this.kode, this.nama, this.sks, this.nilai);

  @override
  String toString() {
    return '$nama ($kode) - SKS: $sks, Nilai: $nilai';
  }
}