import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

connectionServer(Map<String, dynamic> data) async {
  data['token'] = 'asfasdfasdfadsfasd';
  var error = {
    'error': 'server',
  };
  int timeout = 5;
  try {
    http.Response response = await http
        .post('https://api.ahmeterdgn.com/uni/index.php', body: data)
        .timeout(Duration(seconds: timeout));
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['result'] == 'success') {
        return json.decode(response.body);
      } else {
        return error;
      }
    } else {
      return error;
    }
  } on TimeoutException catch (e) {
    print(e);
    return error;
  } on SocketException catch (e) {
    print(e);
    return error;
  } on Error catch (e) {
    print(e);
    return error;
  }
}
