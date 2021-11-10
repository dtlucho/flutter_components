import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);

  final options = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components temp"),
      ),
      body: ListView(
        // children: _createItems(),
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = [];

    for (String option in options) {
      final tempWidget = ListTile(
        title: Text(option),
      );

      // Option 1
      // list.add(tempWidget);
      // list.add(const Divider(height: 10, color: Colors.red));

      // Option 2
      list
        ..add(tempWidget)
        ..add(const Divider(height: 10, color: Colors.red));
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((option) {
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: Text(option),
            subtitle: const Text("This is a subtitle"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          const Divider(height: 10, color: Colors.red),
        ],
      );
    }).toList();
  }
}
