import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Helper/App_notifier.dart';
import '../eng2Persian/widget/traslation_box.dart';
import 'data/translate_data.dart';

class CustomSearchDelegates extends SearchDelegate {
  final int outerindex;
  CustomSearchDelegates(this.outerindex);
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
    for (int i = 0; i < arabic[outerindex]['titles'].length; i++) {
      a.add({"name": arabic[outerindex]['titles'][i], "innerindex": i});
    }
    final suggestionsList = a
        .where((p) =>
        p['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return ListView.builder(
          itemCount: suggestionsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestionsList[index]['name']),
              onTap: () {
                translationDialog(context, arabic, outerindex,
                    suggestionsList[index]['innerindex'],appState.isDarkMode);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordsDisplay(
                            outerindex, suggestionsList[index]['innerindex'])));*/
              },
            );
          },
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> a = [];
    for (int i = 0; i < arabic[outerindex]['titles'].length; i++) {
      a.add({"name": arabic[outerindex]['titles'][i], "innerindex": i});
    }
    final suggestionsList = a
        .where((p) =>
        p['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {

        return ListView.builder(
          itemCount: suggestionsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestionsList[index]['name']),
              onTap: () {
                translationDialog(context, arabic, outerindex,
                    suggestionsList[index]['innerindex'],appState.isDarkMode);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordsDisplay(
                            outerindex, suggestionsList[index]['innerindex'])));*/
              },
            );
          },
        );
      }
    );
  }
}
