import 'dart:io';

import 'package:neosoft_training_tasks/Rendering%20PDFs%20lib/pdf_api.dart';
import 'package:pdf/widgets.dart';

class PDFInvoiceApiGenerate {
  static Future<File> generate() async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => [
          testLength(),
        ],
      ),
    );

    return PDFApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Column testLength() {
    return Column(
      children: [
        for (int i = 0; i < 100; i++) Text("Invoice"),
      ],
    );
  }

  static Widget page() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("It Flows"),
        ],
      ),
    );
  }
}
