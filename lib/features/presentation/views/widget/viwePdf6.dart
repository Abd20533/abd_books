import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

class MyApp12345 extends StatefulWidget {
  final String path;
  const MyApp12345({Key? key, required this.path}) : super(key: key);

  @override
  _MyApp12345State createState() => _MyApp12345State();
}

class _MyApp12345State extends State<MyApp12345> {
  static const int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  PdfControllerPinch? _pdfController;
  int? pages = 0;
  int? myReading = 0;
  int? currentPage = 1;
  bool isReady = false;
  String errorMessage = '';

  @override
  void initState() {
    // _pdfController;
    downloadAndOpenPdf();

    super.initState();
  }

  Future<void> downloadAndOpenPdf() async {
    final url = widget.path;
    final dio = Dio();

    final appDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDir.path}/downloaded-file.pdf';

    // Download the PDF file
    try {
      final response = await dio.download(url, filePath);

      setState(() {
        _pdfController = PdfControllerPinch(
          document: PdfDocument.openFile(filePath),
          initialPage: _initialPage,
        );
      });
      setState(() {}); // Update the UI
    } catch (e) {
      print('Error downloading PDF file: $e');
    }
  }

  @override
  void dispose() {
    _pdfController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('PdfView example'),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: _pdfController != null
            ? Stack(
                children: [
                  PdfViewPinch(
                    controller: _pdfController!,
                    onDocumentLoaded: (document) {
                      setState(() {
                        _allPagesCount = document.pagesCount;
                      });
                    },
                    onPageChanged: (page) {
                      setState(() {
                        pages = page;
                        myReading = pages! >= myReading!
                            ? myReading = pages
                            : myReading = myReading;
                        _actualPageNumber = page;
                      });
                    },
                    builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                      options: DefaultBuilderOptions(),
                      documentLoaderBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      pageLoaderBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      errorBuilder: (_, error) =>
                          Center(child: Text('Error: $error')),
                      // options line removed
                    ),
                  ),
                  Positioned(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    top: 15,
                    left: 0,
                    child: Opacity(
                      opacity: 0.8,
                      child: Row(
                        children: [
                          Container(
                            color: kColorDisplay2InHomePage.withOpacity(0.4),
                            height: 40,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _pdfController!.jumpToPage(myReading! - 1);
                                  });
                                },
                                icon: Text(
                                  "go My read ${myReading}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            color: kColorDisplay2InHomePage.withOpacity(0.4),
                            child: Row(
                              children: [
                                Text(
                                  "  add Note Page ${pages} ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notes_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

/// to
//import 'package:culturalspacelibrary/constant/constant.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdfx/pdfx.dart';
//
// class MyApp12345 extends StatefulWidget {
//   final String path;
//   const MyApp12345({Key? key, required this.path}) : super(key: key);
//
//   @override
//   _MyApp12345State createState() => _MyApp12345State();
// }
//
// class _MyApp12345State extends State<MyApp12345> {
//   static const int _initialPage = 2;
//   int _actualPageNumber = _initialPage, _allPagesCount = 0;
//   bool isSampleDoc = true;
//   PdfControllerPinch? _pdfController;
//   int? pages = 0;
//   int? myReading = 0;
//   int? currentPage = 1;
//   bool isReady = false;
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     downloadAndOpenPdf();
//     // _pdfController = PdfControllerPinch(
//     //   //document: PdfDocument.openAsset('${widget.path}'),
//     //   document: PdfDocument.openAsset('assets/pdf/WA0000.pdf'),
//     //   initialPage: _initialPage,
//     // );
//     super.initState();
//   }
//
//   Future<void> downloadAndOpenPdf() async {
//     final url = widget.path; // Replace with your PDF URL
//     final dio = Dio();
//
//     final appDir = await getApplicationDocumentsDirectory();
//     final filePath = '${appDir.path}/downloaded-file.pdf';
//
//     // Download the PDF file
//     try {
//       final response = await dio.download(url, filePath);
//       // Open the downloaded PDF file
//       // _pdfController = PdfControllerPinch(
//       //   document: PdfDocument.openFile(filePath),
//       //   initialPage: _initialPage,
//       //
//       //
//       // );
//       setState(() {
//         _pdfController = PdfControllerPinch(
//           document: PdfDocument.openFile(filePath),
//           initialPage: _initialPage,
//         );
//       });
//       setState(() {}); // Update the UI
//     } catch (e) {
//       print('Error downloading PDF file: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _pdfController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.grey,
//           appBar: AppBar(
//             title: const Text('PdfView example'),
//             centerTitle: true,
//             actions: <Widget>[],
//           ),
//           body: Stack(
//             children: [
//               PdfViewPinch(
//                 controller: _pdfController!,
//                 onDocumentLoaded: (document) {
//                   setState(() {
//                     _allPagesCount = document.pagesCount;
//                   });
//                 },
//                 onPageChanged: (page) {
//                   setState(() {
//                     pages = page;
//                     myReading = pages! >= myReading!
//                         ? myReading = pages
//                         : myReading = myReading;
//                     _actualPageNumber = page;
//                   });
//                 },
//                 builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
//                   options: DefaultBuilderOptions(),
//                   documentLoaderBuilder: (_) =>
//                       const Center(child: CircularProgressIndicator()),
//                   pageLoaderBuilder: (_) =>
//                       const Center(child: CircularProgressIndicator()),
//                   errorBuilder: (_, error) =>
//                       Center(child: Text('Error: $error')),
//                   // options line removed
//                 ),
//               ),
//               Positioned(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 top: 15,
//                 left: 0,
//                 child: Opacity(
//                   opacity: 0.8,
//                   child: Row(
//                     children: [
//                       Container(
//                         color: kColorDisplay2InHomePage.withOpacity(0.4),
//                         height: 40,
//                         child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _pdfController!.jumpToPage(myReading! - 1);
//                               });
//                             },
//                             icon: Text(
//                               "go My read ${myReading}",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 10),
//                             )),
//                       ),
//                       Spacer(),
//                       Container(
//                         height: 40,
//                         color: kColorDisplay2InHomePage.withOpacity(0.4),
//                         child: Row(
//                           children: [
//                             Text(
//                               "  add Note Page ${pages} ",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 10),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.notes_outlined,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
//
// /// to
