import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFApi {
  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    String path = await createCustomDirectory();

    final file = File('$path/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<String> createCustomDirectory() async {
    // GET the permission status
    var status = await Permission.storage.status;

    // Ask for permission
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // PATH
    String path = "/storage/emulated/0/Neosoft_Training_Tasks";

    // CHECK if path exists
    final exists = await Directory(path).exists();

    if (!exists) {
      // Creates a Directory with specifeid path
      await Directory(path).create();
    }

    return path;
  }
}
