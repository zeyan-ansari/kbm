import 'package:flutter/material.dart';

import 'data/writeup_data.dart';
import 'nauhas_display.dart';

class SearchByNauhaTitleDelegate extends SearchDelegate {
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
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> a = [];
    for (int i = 0; i < nauhas.length; i++) {
      for (int j = 0; j < nauhas[i]['nauhatitles'].length; j++) {
        a.add({
          "nauhatitles": nauhas[i]['nauhatitles'][j],
          "innerindex": j,
          "outerindex": i
        });
      }
    }
    final suggestionsList = a
        .where((p) => p['nauhatitles']
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionsList[index]['nauhatitles']),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NauhaDisplay(
                        suggestionsList[index]['outerindex'],
                        suggestionsList[index]['innerindex'])));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> a = [];
    for (int i = 0; i < nauhas.length; i++) {
      for (int j = 0; j < nauhas[i]['nauhatitles'].length; j++) {
        a.add({
          "nauhatitles": nauhas[i]['nauhatitles'][j],
          "innerindex": j,
          "outerindex": i
        });
      }
    }
    final suggestionsList = a
        .where((p) => p['nauhatitles']
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionsList[index]['nauhatitles']),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NauhaDisplay(
                        suggestionsList[index]['outerindex'],
                        suggestionsList[index]['innerindex'])));
          },
        );
      },
    );
  }
}
