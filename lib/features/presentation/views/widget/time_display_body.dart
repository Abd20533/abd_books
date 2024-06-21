// ignore_for_file: library_private_types_in_public_api

import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:culturalspacelibrary/constant/widgetes/widgetes.dart';
import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:get/get.dart';

class TimeDisplay1 extends StatefulWidget {
  @override
  _TimeDisplay1State createState() => _TimeDisplay1State();
}

class _TimeDisplay1State extends State<TimeDisplay1> {
  String? _formattedTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _formattedTime = _formatDateTime(DateTime.now());
    // تحديث الوقت كل ثانية
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    _timer?.cancel(); // إلغاء الـ Timer عند التخلص من الويدجت
    super.dispose();
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formatted = _formatDateTime(now);
    setState(() {
      _formattedTime = formatted;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolor,
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10, right: 20, left: 20),
        child: Column(
          children: [
            Row(children: [
              Card(
                elevation: 3,
                surfaceTintColor: Colors.grey,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: kcolor,
                    border:
                        Border.all(color: const Color(0xff22C55E), width: 1),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.back();

                        ;
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Color(0xff34D399),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ),
                  child: const Text(
                    "Now Time ",
                    style: TextStyle(color: Color(0xff34D399), fontSize: 18),
                  ).center(),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.access_time,
                color: Color(0xff34D399),
                size: 28,
              )
            ]),
            mySizedBox(height: MediaQuery.of(context).size.height / 6),
            Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: 125,
              width: 125,
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
            mySizedBox(height: MediaQuery.of(context).size.height / 4),
            Center(
              child: Text(
                _formattedTime!,
                style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff22C55E)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
