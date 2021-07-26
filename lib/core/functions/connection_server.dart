import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

var url = Uri.parse('http://api.ahmeterdgn.com/uni/');
connectionServer(Map<String, dynamic> data) async {
  data['token'] = 'asfasdfasdfadsfasd';
  int timeout = 5;
  try {
    http.Response response =
        await http.post(url, body: data).timeout(Duration(seconds: timeout));

    if (response.statusCode == 200) {
      print(response.body);
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
    print(e);
    return {
      'error': 'time',
    };
  } on SocketException catch (e) {
    print(e);
    return {
      'error': 'server',
    };
  } on Error catch (e) {
    print(e);
    return {
      'error': 'server',
    };
  }
}
