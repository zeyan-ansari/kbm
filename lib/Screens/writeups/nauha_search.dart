import 'package:flutter/material.dart';

import 'data/writeup_data.dart';
import 'nauhas_display.dart';


class CustomSearchDelegate extends SearchDelegate {
  final int outerindex;
  CustomSearchDelegate(this.outerindex);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> a = [];
    for (int i = 0; i < nauhas[outerindex]['nauhatitles'].length; i++) {
      a.add({"name": nauhas[outerindex]['nauhatitles'][i], "innerindex": i});
    }
    final suggestionsList = a
        .where((p) =>
        p['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionsList[index]['name']),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NauhaDisplay(
                        outerindex, suggestionsList[index]['innerindex'])));
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
