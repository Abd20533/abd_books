import 'package:culturalspacelibrary/import_package.dart';

import 'package:get/get.dart';

import 'cubit/cubit5/auther_cubit_body.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //  يتم  تنفيذ  هذا  الكود  عندما  تصل  إشعارات  في  الخلفية
  print('Handling a background message ${message.messageId}');
}

//com.example.culturalSpaceLibrary

// void main() {
//   runApp(
//
//     ///to do
//       BlocProvider(
//           create: (context) {
//             return WeatherCubit(WeatherService());
//           },
//           //name
//           child: WeatherApp()));
// }

///firebase
//FirebaseMessaging messaging = FirebaseMessaging.instance;
//
// //  الحصول  على  رمز  الجهاز  لإرسال  الإشعارات  له
// String? token = await messaging.getToken();
// print('FirebaseMessaging Token: $token');
//@override
// void initState() {
//   super.initState();
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //  يتم  تنفيذ  هذا  الكود  عندما  تصل  إشعارات  في  المقدمة
//     print('Got a message whilst in the foreground!');
//     print('Message data: ${message.data}');
//
//     if (message.notification != null) {
//       print('Message also contained a notification: ${message.notification}');
//     }
//   });
// }
void main() async {
  ///to do portraitUp
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ScreenOrientation.lockOrientation(DeviceOrientation.portraitUp);

  ///to do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  DioHelper.init();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),

        ///
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => AuthorsBodyCubit()..getHome4(context: context),
        ),
        BlocProvider(
          create: (context) => MyLibraryCubit()..getMyLibrary(context: context),
        ),
      ],

      ///
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          transitionDuration: Duration(seconds: 2),
          theme: state.themeData,
          darkTheme: ThemeData(backgroundColor: Colors.black),
          themeMode: state.themeData == ThemeData.light
              ? ThemeMode.dark
              : ThemeMode.light,
          home: CashHelper.getUserToken() != ""
              ? const SplashViewBody2()
              : HomePage(),
        );
      }),
    );
  }
}

///TO DO Theme

// builder: (context, child) {
//   return AnimatedTheme(
//       duration: Duration(milliseconds: 100),
//       curve: Curves.easeInOut,
//       data: state.themeData,
//       child: child!);
// },

///TO DO
//import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: ClipPath(
//                 clipper: TriangleClipper(),
//                 child: Image.network('https://via.placeholder.com/150'),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.green,
//                 child: Center(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Button'),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width / 2, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

///to pdf important
///
/// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: Container(
//           child: SfPdfViewer.network(
//               'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));
// }
//@override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: SfPdfViewer.network(
//               'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'));
// }
///import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// void main() {
//   runApp(MaterialApp(
//     title: 'Syncfusion PDF Viewer Demo',
//     home: HomePage(),
//   ));
// }
//
// /// Represents Homepage for Navigation
// class HomePage extends StatefulWidget {
//   @override
//   _HomePage createState() => _HomePage();
// }
//
// class _HomePage extends State<HomePage> {
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
//         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }
