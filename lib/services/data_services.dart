import 'dart:convert';

import 'package:flutter/services.dart';

class DataServices {
  getUsers() async {
    var info = await rootBundle.loadString('json/data.json');
    var list = json.decode(info);
    return list;
  }
}
