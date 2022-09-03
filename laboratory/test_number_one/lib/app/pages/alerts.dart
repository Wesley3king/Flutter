import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAlert extends StatefulWidget {
  const MyAlert({super.key});

  @override
  State<MyAlert> createState() => _MyAlertState();
}

class _MyAlertState extends State<MyAlert> {
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  ValueNotifier state = ValueNotifier(false);

  appBarDinamica(BuildContext context) {
    return AppBar(title: const Text('Search'), actions: [
      IconButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: MySearchDelegate(),
          );
        },
        icon: const Icon(Icons.search),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: appBarDinamica(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => SimpleDialog(
                      title: Text('Adicionar:'),
                      children: [
                        CheckboxListTile(
                          title: Text('item 1'),
                          value: item1,
                          onChanged: (value) => setState(() {
                            item1 = !item1;
                            state.value = !state.value;
                          }),
                        ),
                        CheckboxListTile(
                          title: Text('item 2'),
                          value: item2,
                          onChanged: (value) => setState(() {
                            item2 = !item2;
                          }),
                        ),
                        CheckboxListTile(
                          title: Text('item 3'),
                          value: item3,
                          onChanged: (value) => setState(() {
                            item3 = !item3;
                          }),
                        )
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.notifications_active)),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 44),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = [
      'Brazil',
      'Canada',
      'USA',
      'Japan',
      'UK',
      'China',
    ];
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
