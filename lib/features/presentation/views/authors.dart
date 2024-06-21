import 'package:culturalspacelibrary/features/presentation/views/widget/authors_body.dart';
import 'package:flutter/material.dart';

class Authors extends StatelessWidget {
  const Authors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthorsBody(),
    );
  }
}

///important to MypdfSyncfusion
//
// class MypdfSyncfusion extends StatefulWidget {
//   final String pathPdf;
//
//   const MypdfSyncfusion({super.key, required this.pathPdf});
//   @override
//   _MypdfSyncfusion createState() => _MypdfSyncfusion();
// }
//
// class _MypdfSyncfusion extends State<MypdfSyncfusion> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//               semanticLabel: 'Bookmark',
//             ),
//             onPressed: () {
//               _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//         ],
//       ),
//       body: SfPdfViewer.network(
//         // pathPdf!
//         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }
