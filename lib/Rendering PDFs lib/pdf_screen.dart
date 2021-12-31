import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Rendering%20PDFs%20lib/pdf_api.dart';

import 'pdf_invoice_api_generate.dart';

class RenderingPDFScreen extends StatefulWidget {
  const RenderingPDFScreen({Key? key}) : super(key: key);

  @override
  _RenderingPDFScreenState createState() => _RenderingPDFScreenState();
}

class _RenderingPDFScreenState extends State<RenderingPDFScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rendering PDFs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final pdfFile = await PDFInvoiceApiGenerate.generate();

                await PDFApi.openFile(pdfFile);
              },
              child: Text("Generate PDF"),
            ),
          ],
        ),
      ),
    );
  }
}
