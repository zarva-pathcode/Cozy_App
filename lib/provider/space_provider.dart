import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var result = await http
        .get(Uri.parse("http://bwa-cozy.herokuapp.com/recommended-spaces"));
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromjson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
