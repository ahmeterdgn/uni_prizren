import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_prizren/core/constants/global.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';
import 'package:uni_prizren/views/widgets/newsItem.dart';
import 'package:uni_prizren/views/widgets/serverError.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var result;
  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UKSHIN HOTI ~ Prizren'),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Tema Değiştir', 'Hakkında'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: result != null
          ? result['error'] != 'server'
              ? ListView.builder(
                  itemCount: result['items'].length,
                  itemBuilder: (context, index) {
                    return NewsItem(
                      result: result,
                      index: index,
                    );
                  },
                )
              : ServerError()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  data() async {
    result = await connectionServer({
      'action': 'newslist',
    });
    setState(() {
      print(result);
    });
  }

  showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Hakkında"),
        content: new Text(
            "Ahmet Erdoğan Tarafından Geliştirilmiştir. \n\nİletişim Adresi -  \nahmeterdgn6@gmail.com"),
        actions: <Widget>[
          TextButton(
            child: Text('Tamam!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  handleClick(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (value) {
      case 'Tema Değiştir':
        setState(() {
          theme = !theme;
          prefs.setBool('theme', theme);
          Get.changeTheme(
            Get.isDarkMode
                ? ThemeData(
                    primaryColor: Colors.amber,
                  )
                : ThemeData.dark(),
          );
        });
        break;
      case 'Hakkında':
        showMaterialDialog();
        break;
    }
  }
}
