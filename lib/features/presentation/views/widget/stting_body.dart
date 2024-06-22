import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:culturalspacelibrary/constant/widgetes/widgetes.dart';
import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/features/presentation/views/helper_widget/helper_in_home_page.dart';
import 'package:culturalspacelibrary/helper_with_dio/cash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> kayes = GlobalKey();

  bool colo = false;
  dynamic name = "arabic";
  bool b1 = false;
  bool darkMode = CashHelper.getUserTheme() == "dark" ? true : false;

  //bool darkMode = false;
  // final GlobalKey<ScaffoldState> scaffoldKeyUsersBody =
  // GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, right: 1, left: 1),
      child: Scaffold(
        key: kayes,
        drawer: displayEndDrawerInHomePage(scaffoldKey: kayes),
        endDrawer: displayEndDrawerInHomePage(scaffoldKey: kayes),
        appBar: myAppBarInAuthorsBody(scaffoldKey1: kayes, title: "Setting "),
        body: Column(
          children: [
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: c,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                backgroundImage: const AssetImage(
                  AssetsData.imageSplashViewBody,
                ),
              ),
            ).center(),
            Container(
              child: CheckboxListTile(
                value: darkMode,
                title: Text("Dark Mode"),
                onChanged: (v) {
                  darkMode = v!;
                  setState(() {});
                },
              ),
            ),
            SwitchListTile(
              title: Text(
                "voice",
              ),
              value: b1,
              onChanged: (value) => {
                setState(() {
                  b1 = value;
                })
              },
            ),
            SwitchListTile(
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.red,
              title: Text(
                "Dark Mode",
              ),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                  if (darkMode) {
                    CashHelper.putUserTheme(theme: "dark");

                    BlocProvider.of<ThemeBloc>(context)
                        .add(ChangeThemeEvent(ThemeData.dark()));
                    CashHelper.putUserTheme(theme: "dark");
                    print(CashHelper.getUserTheme());
                  }
                });
                if (!darkMode) {
                  CashHelper.putUserTheme(theme: "light");

                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(ThemeData.light()));
                  CashHelper.putUserTheme(theme: "light");
                  print(CashHelper.getUserTheme());
                }
              },
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "what your2 languges want? ",
                  ),
                  RadioListTile(
                    title: Text(
                      'arabic',
                    ),
                    value: "arabic ",
                    groupValue: name,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'english',
                    ),
                    value: "english ",
                    groupValue: name,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  RadioListTile(
                    value: "french",
                    groupValue: name,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    title: Text(
                      'french',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeData themeData;
  ChangeThemeEvent(this.themeData);
}

class ThemeState {
  final ThemeData themeData;
  ThemeState(this.themeData);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData.light())) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(event.themeData));
    });
  }
}

///to

enum VolumeEvent { updateVolume }

class VolumeState {
  final int volume;

  VolumeState(this.volume);
}

class VolumeBloc extends Bloc<VolumeEvent, VolumeState> {
  VolumeBloc() : super(VolumeState(50));

  @override
  Stream<VolumeState> mapEventToState(VolumeEvent event) async* {
    if (event == VolumeEvent.updateVolume) {
      yield VolumeState(state.volume + 10);
    }
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VolumeBloc, VolumeState>(
        builder: (context, state) {
          return Column(
            children: [
              Text("volume:${state.volume}"),
              ElevatedButton(
                onPressed: () {
                  context.read<VolumeBloc>().add(VolumeEvent.updateVolume);
                },
                child: Text("Increase volume"),
              )
            ],
          );
        },
      ),
    );
  }
}

///to
