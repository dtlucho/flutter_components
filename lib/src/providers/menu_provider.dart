import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  _MenuProvider() {
    loadData();
  }
  List<dynamic> options = [];

  loadData() {
    rootBundle.loadString('data/menu_options.json').then((data) {
      print(data);
    });
  }
}

final menuProvider = new _MenuProvider();
