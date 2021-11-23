import 'package:flutter/material.dart';

import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_util.dart';
import 'package:flutter_components/src/pages/alert_page.dart';

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
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    for (var option in data!) {
      final tempWidget = ListTile(
        leading: getIcon(option['icon']),
        title: Text(option['text']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          final route = MaterialPageRoute(
            builder: (context) => const AlertPage(),
          );
          Navigator.push(context, route);
        },
      );

      options
        ..add(tempWidget)
        ..add(const Divider());
    }

    return options;
  }
}
