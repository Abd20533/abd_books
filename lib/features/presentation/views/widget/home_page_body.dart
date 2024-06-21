import 'package:culturalspacelibrary/cubit/cubit2/home_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit6/my_library_cubit.dart';
import 'package:culturalspacelibrary/features/presentation/views/comments.dart';
import 'package:culturalspacelibrary/features/presentation/views/helper_widget/helper_in_home_page.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/get.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var home = HomeCubit.get(context);

          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: DefaultTabController(
              initialIndex: 1,
              length: 4,
              child: Scaffold(
                key: home.scaffoldKeyHome,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: Row(children: [
                          const Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {
                              home.scaffoldKeyHome.currentState!
                                  .openEndDrawer();
                            },
                            icon:
                                const Icon(Icons.more_horiz_outlined, size: 30),
                          )
                        ]),
                      ),
                      topBar(),
                      const Divider(color: Color(0xff34D399)),
                      makeStackAndContainerAndTextInHomePage(
                          height: (MediaQuery.of(context).size.height / 5)),
                      mySizedBox(height: 10),
                      Column(children: [
                        home1(context: context),
                      ]),
                      const Divider(color: Color(0xff34D399)),
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 10, bottom: 6),
                      //   child: Text("Top rated",
                      //       style: TextStyle(
                      //           color: Color(0xff059669), fontSize: 22)),
                      // ),
                      // display2InHomePageInTopRated(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 7),
                        child: Text(
                          "Available categories",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff34d399), //.withOpacity(0.5),
                          ),
                        ).center(),
                      ),
                      SizedBox(
                        height: 100,
                        child: cardStack(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 30),
                        child: Text(
                          "Authors",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff34d399), //.withOpacity(0.5),
                          ),
                        ).center(),
                      ),
                      SizedBox(
                        height: 100,
                        child: cardStackToImage(),
                      ),
                      const Divider(color: Color(0xff34D399)),
                      mySizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(50)),
                          height: 60,
                          child: CurvedNavigationBar(
                            animationDuration:
                                const Duration(milliseconds: 400),
                            backgroundColor: Colors.transparent,
                            //kcolor,
                            iconPadding: 0,
                            index: 0,

                            // backgroundColor: const Color(0xff34D399).withOpacity(.5),
                            color: const Color(0xff34D399),
                            onTap: (value) {
                              if (value == 0) {}
                              if (value == 1) {}
                              if (value == 2) {}
                              if (value == 3) {
                                Get.to(MyProfile());
                              }
                              if (value == 4) {
                                Get.to(Comments());
                              }
                              if (value == 5) {
                                Get.to(SettingsBody());
                              }
                            },

                            buttonBackgroundColor: Colors.transparent,

                            items: items,
                          )),
                    ],
                  ),
                ),
                endDrawer: displayEndDrawerInHomePage(
                    scaffoldKey: home.scaffoldKeyHome),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
