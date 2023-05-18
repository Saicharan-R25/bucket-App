import 'dart:convert';
import 'dart:core';
import 'Homepage.dart';

import 'package:http/http.dart' as http;



Future<List> QuoteData() async {
  List<List<String>> lst1 = [];
  http.Response response = await http.get(Uri.parse('https://animechan.vercel.app/api/quotes'));

  if (response.statusCode == 200) {
    String str = response.body.toString();
    var data = jsonDecode(str);

    for (int i = 0; i < 10; i++) {
      String aniname = data[i]['anime'];
      String charname = data[i]['character'];
      String quotestr = data[i]['quote'];
      lst1.add([aniname, charname, quotestr]);
    }
  } else {
    print('try again');
  }

  return lst1;
}


