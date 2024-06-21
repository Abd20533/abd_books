import 'package:culturalspacelibrary/features/presentation/views/widget/search/search_cubit.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class search extends StatefulWidget {
  search({
    super.key,
  });

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String? qury = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: TextFormField(
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.name,
          style: TextStyle(color: Colors.black),
          validator: (value) {
            return !GetUtils.isUsername(value!) ? 'not_valid_Username' : null;
          },
          decoration: InputDecoration(
            fillColor: Colors.blue,
            filled: true,
            suffixIcon: IconButton(
              color: Colors.black,
              onPressed: () {
                qury = '';
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            labelText: 'name',
            hintStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(color: Colors.black),
          ),
          onTap: () {},
          onChanged: (value) {
            setState(() {
              qury = value!;
              print(value);
            });
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5, left: 5, top: 5),
        child: FutureBuilder<List<Author>>(
          future: qury != ''
              ? SearchBodyCubit().getSearchWithQ(Q: qury!, context: null)
              : SearchBodyCubit().getSearch(context: context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');

              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              print('hasData');

              List<Author> Proudect = snapshot.data!;
              return ListView.builder(
                itemCount: Proudect.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container();
                  //   ViweOneMedicine(
                  //   moduleMedicine: Proudect[index],
                  // );
                },
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                //  value: 7,
                strokeWidth: 3,
              ));
            }
          },
        ),
      ),
    );
  }
}
