import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_prizren/core/constants/global.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';
import 'package:uni_prizren/views/widgets/newsItem.dart';
import 'package:uni_prizren/views/widgets/serverError.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
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
        title: const Text('UKSHIN HOTI ~ Prizren'),
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
              : const ServerError()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  data() async {
    result = await connectionServer({
      'action': 'newslist',
    });
    setState(() {
      // ignore: avoid_print
      print(result);
    });
  }

  showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Hakkında"),
        content: const Text(
            "Ahmet Erdoğan Tarafından Geliştirilmiştir. \n\nİletişim Adresi -  \nahmeterdgn6@gmail.com"),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam!'),
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
                    primarySwatch: Colors.amber,
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
