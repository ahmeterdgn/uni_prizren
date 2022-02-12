import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

connectionServer({String add = '/'}) async {
  var url = Uri.parse('https://api.kodkahve.com/uni' + add);

  int timeout = 30;
  try {
    http.Response response =
        await http.get(url).timeout(Duration(seconds: timeout));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['result'] == 'success') {
        return json.decode(response.body);
      } else {
        return {
          'error': 'server',
        };
      }
    } else {
      return {
        'error': 'server',
      };
    }
  } on TimeoutException catch (e) {
    // ignore: avoid_print
    print("$e asda");
    return {
      'error': 'server',
    };
  } on SocketException catch (e) {
    // ignore: avoid_print
    print("$e asda");
    return {
      'error': 'server',
    };
  } on Error catch (e) {
    // ignore: avoid_print
    print("$e asda");
    return {
      'error': 'server',
    };
  }
}
