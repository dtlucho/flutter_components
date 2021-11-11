import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  _MenuProvider() {
    loadData();
  }
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('data/menu_options.json');
    Map dataMap = json.decode(data);
    options = dataMap["routes"];
    return options;
  }
}

final menuProvider = _MenuProvider();
