import 'package:flutter/material.dart';

class CodeSearch extends StatefulWidget {
  const CodeSearch({Key? key}) : super(key: key);

  @override
  State<CodeSearch> createState() => _CodeSearchState();
}

class _CodeSearchState extends State<CodeSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search_off_outlined))
      ]),
    );
  }
}

///todo
Map<String, String> a = {"a": "aa"};
List<Map<String, Map<String, dynamic>>> abd = [
  {
    "a": {"11": "1", "2": "21"}
  },
  {
    "aa": {"11": "1", "22": "21"}
  },
  {
    "ass": {"111": "1", "222": "21"}
  },
];
List qname = ["abd", "sss", "dsdgd", "abdsa", "sass", "dsdaasgd"];

List? name;

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        //todo
        //  print(abd[0]["a"]!["11"]);

        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Search results for: $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "" || query == null) {
      return ListView.builder(
        itemBuilder: (context, index) => Text("${qname[index]}"),
        itemCount: qname?.length,
      );
    } else {
      name = qname.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemBuilder: (context, index) => InkWell(
            child: Text("${name![index]}"),
            onTap: () {
              showResults(context);
            }),
        itemCount: name!.length,
      );
    }
  }
}
