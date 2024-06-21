import 'package:culturalspacelibrary/import_package.dart';

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({Key? key}) : super(key: key);

  @override
  State<MyProfileBody> createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
  final GlobalKey<ScaffoldState> _scaffoldKeyInMyProfileBody =
      GlobalKey<ScaffoldState>();
  late ImagePicker _imagePicker;

  XFile? _image = null;

  Future<void> _getImage({required int a}) async {
    final ImagePicker _picker = ImagePicker();
    if (a == 1) {
      XFile? image = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image!;
      });
    } else {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    // Use the picked image as needed
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    // Use the picked image as needed
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff34D399),
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      appBar: myAppBarInMyProfile(
          scaffoldKey1: _scaffoldKeyInMyProfileBody, title: "MyProfile"),
      key: _scaffoldKeyInMyProfileBody,
      endDrawer: displayEndDrawer(scaffoldKey1: _scaffoldKeyInMyProfileBody),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    _image == null
                        ? Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 100,
                                child: Image.asset(
                                  AssetsData.imageSplashViewBody,
                                )),
                          )
                        : Container(
                            // height: 150,
                            // width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 100,
                                backgroundImage: FileImage(
                                  File(
                                    _image!.path,
                                  ),
                                )),
                          ),
                    IconButton(
                        onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: const Text('رسالة منبثقة'),
                                  title: Container(
                                    child: SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _getImage(a: 1);
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Text("Camara",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white)),
                                                      Icon(Icons
                                                          .camera_alt_outlined)
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    _getImage(a: 0);
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Text(" Callery",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .white)),
                                                      Icon(Icons.ad_units)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  content: Text("اختر مكان الصورة    "),
                                  //   content: const Text('هذه الرسالة المنبثقة ستختفي بعد ثوانٍ قليلة'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ok'),
                                    )
                                  ],
                                );
                              },
                            ),
                        icon: Icon(
                          Icons.camera_alt,
                          color: kColorDisplay2InHomePage,
                          size: 30,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff34D399),
                                width: 2,
                              )),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: MediaQuery.of(context).size.height / 22,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Name: Abdulrahman',
                                  style: TextStyle(
                                      color: Color(0xff34D399), fontSize: 18),
                                ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.edit,
                                //     color: Color(0xff34D399),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff34D399),
                                width: 2,
                              )),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: MediaQuery.of(context).size.height / 22,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Email: abdalraman@ga.com',
                                  style: TextStyle(
                                      color: Color(0xff34D399), fontSize: 18),
                                ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.edit,
                                //     color: Color(0xff34D399),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff34D399),
                                width: 2,
                              )),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: MediaQuery.of(context).size.height / 22,
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Age: ',
                                  style: TextStyle(
                                      color: Color(0xff34D399), fontSize: 22),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '21 ',
                                    style: TextStyle(
                                        color: Color(0xff34D399), fontSize: 22),
                                  ),
                                ),
                                const Spacer(),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.edit,
                                //     color: Color(0xff34D399),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff34D399),
                                width: 2,
                              )),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: MediaQuery.of(context).size.height / 22,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Password: abdalraman123123',
                                  style: TextStyle(
                                      color: Color(0xff34D399), fontSize: 18),
                                ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.edit,
                                //     color: Color(0xff34D399),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ).center(),
            SizedBox(
              width: 200,
              height: 200,
              child: FadeInUp(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceIn,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: LottieBuilder.asset("assets/Lottie/Animation.json",
                          reverse: true, repeat: true),
                    ),
                  ),
                ),
              ),
            ).center(),
          ],
        ),
      ),
    );
  }

  void myShowPopup(BuildContext context,
      {required String text, required String path, bool? T = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('رسالة منبثقة'),
          title: Container(
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: LottieBuilder.asset(
                  path,
                  repeat: true,
                  reverse: true,
                ),
              ),
            ),
          ),
          content: Text("$text"),
          //   content: const Text('هذه الرسالة المنبثقة ستختفي بعد ثوانٍ قليلة'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ok'),
            )
          ],
        );
      },
    );
  }
}
// IconButton(
//   onPressed: () {
//     _scaffoldKeyInMyProfileBody.currentState!
//         .showBottomSheet((context) => Container(
//               color: Color(0xff34D399),
//               height: 110,
//               width: 250,
//               padding: EdgeInsets.all(4),
//               child: Column(children: [
//                 Text(" Chose image",
//                     style: TextStyle(fontSize: 18)),
//                 Padding(
//                   padding: const EdgeInsets.all(1.0),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           _getImage(a: 1);
//                         },
//                         child: const Column(
//                           children: [
//                             Text("Camara",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.white)),
//                             Icon(Icons.camera_alt_outlined)
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       InkWell(
//                         onTap: () {
//                           _getImage(a: 0);
//                         },
//                         child: const Column(
//                           children: [
//                             Text(" Callery",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.white)),
//                             Icon(Icons.ad_units)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: InkWell(
//                     onTap: () {
//                       _getImage(a: 0);
//                     },
//                     child: const Text(" Callery",
//                         style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white)),
//                   ),
//                 )
//               ]),
//             ));
//     //  _getImage(a: 1);
//   },
//   icon: const Icon(
//     Icons.camera_alt_outlined,
//     color: kColorDisplay2InHomePage,
//     size: 30,
//   ),
// ),
//            Row(
//               children: [
//                 // SizedBox(
//                 //   width: 100,
//                 //   height: 150,
//                 //   child: FadeInUp(
//                 //     duration: const Duration(seconds: 2),
//                 //     curve: Curves.bounceIn,
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.only(top: 40),
//                 //       child: Container(
//                 //         height: 100,
//                 //         width: double.infinity,
//                 //         child: Center(
//                 //           child: LottieBuilder.asset(
//                 //               "assets/Lottie/Animation.json",
//                 //               reverse: false,
//                 //               repeat: true),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Spacer(),
//                 // Container(
//                 //   //alignment: Alignment.center,
//                 //   padding: const EdgeInsets.all(10),
//                 //   height: 100,
//                 //   width: 100,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(70),
//                 //     color: kColorTextFromScreenLogin.withOpacity(0.5),
//                 //   ),
//                 //   child: CircleAvatar(
//                 //     backgroundColor: Colors.grey[100],
//                 //     backgroundImage: const AssetImage(
//                 //       "assets/images/abd3.png",
//                 //     ),
//                 //   ),
//                 // ),
//                 ///
//                 // Spacer(),
//                 // SizedBox(
//                 //   width: 100,
//                 //   height: 150,
//                 //   child: FadeInUp(
//                 //     duration: const Duration(seconds: 2),
//                 //     curve: Curves.bounceIn,
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.only(top: 40),
//                 //       child: Container(
//                 //         height: 100,
//                 //         width: double.infinity,
//                 //         child: Center(
//                 //           child: LottieBuilder.asset(
//                 //               "assets/Lottie/Animation.json",
//                 //               reverse: false,
//                 //               repeat: true),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
