import 'package:flutter/material.dart';

import 'package:flutter_components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // print(menuProvider.options);
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data) {
    final List<Widget> options = [];

    for (var option in data!) {
      final tempWidget = ListTile(
        leading: const Icon(Icons.ac_unit, color: Colors.blue),
        title: Text(option['text']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {},
      );

      options
        ..add(tempWidget)
        ..add(const Divider());
    }

    return options;
  }
}
