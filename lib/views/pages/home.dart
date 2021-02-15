import 'package:flutter/material.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';
import 'package:uni_prizren/views/pages/detail.dart';

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

  data() async {
    result = await connectionServer({
      'action': 'newslist',
    });
    setState(() {
      print("Tamamdır");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universiteti "UKSHIN HOTI" Prizren'),
      ),
      body: result != null
          ? ListView.builder(
              itemCount: result['items'].length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          link: result['items'][index]['link'],
                          title: result['items'][index]["title"],
                        ),
                      ),
                    );
                  },
                  splashColor: Colors.deepPurple,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(result['items'][index]["title"]),
                        subtitle: Text(result['items'][index]["desc"]),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
