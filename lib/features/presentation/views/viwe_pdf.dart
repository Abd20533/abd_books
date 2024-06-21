import 'dart:io';

import 'package:culturalspacelibrary/features/presentation/views/widget/viwePdf6.dart';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class MyViewPdf extends StatelessWidget {
  MyViewPdf({super.key, required this.path1});
  final String path1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyApp12345(
        path: path1!,
      ),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path1;

  const PdfViewPage({super.key, required this.path1});
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  String? path;

  @override
  void initState() {
    super.initState();
    downloadPDF().then((f) {
      setState(() {
        path = f.path;
      });
    });
  }

  Future<File> downloadPDF() async {
    final url = widget.path1; // Replace with your PDF URL
    final filename = url.substring(url.lastIndexOf('/') + 1);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');

    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }

  @override
  Widget build(BuildContext context) {
    if (path != null) {
      return PDFView(
        filePath: path,
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}
