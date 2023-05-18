import 'dart:convert';
import 'dart:core';
import 'Homepage.dart';

import 'package:http/http.dart' as http;



Future<List> HomeData() async {
  List<List<dynamic>> lst0 = [];
  http.Response response = await http.get(Uri.parse('http://127.0.0.1:5000/'));
  print(response.body);
  if (response.statusCode == 200) {
    String str = response.body.toString();
    var data = jsonDecode(str);

    for (int i = 1; i < 11; i++) {
      String aniname = data[i.toString()]['name'];
      int Idnum=data[i.toString()]['id'];
      lst0.add([Idnum,aniname]);
    }
  } else {
    print('try again');
  }
  print(lst0);
  return lst0;
}