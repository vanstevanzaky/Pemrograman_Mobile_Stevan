import 'dart:io';
import 'package:dart_image_grabber/image_grabber.dart';

void main() async {
  print("Selamat datang di Dart Image Grabber!");

  stdout.write("Inputkan halaman web: ");
  String? url = stdin.readLineSync();

  if (url == null || url.trim().isEmpty) {
    print("URL tidak valid.");
    return;
  }
  url = url.trim();

//untuk tujuan input manual
  // stdout.write("Masukkan folder tujuan: ");
  // String? folder = stdin.readLineSync();
  //
  // if (folder == null || folder.trim().isEmpty) {
  //   print("Folder tujuan tidak valid.");
  //   return;
  // }
  // folder = folder.trim();

  //untuk langsung masuk ke folder yang telah dibuat
  String folder = "storage";
  print("Folder tujuan: $folder");
  final dir = Directory(folder);
  if (!await dir.exists()) {
    await dir.create(recursive: true);
    print("Folder '$folder' telah dibuat.");
  }

    final grabber = ImageGrabber(url, folder);
    await grabber.run();
}