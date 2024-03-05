import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart";
import "package:picsflutter/src/models/image.dart";
import "package:picsflutter/src/widgets/image_list.dart";

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int count = 0;
  List<Image_model> mappedImages = [];

  void handlePress() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/photos/1');

    var response = await get(url);
    var fetchedImages = Image_model.fromJson(jsonDecode(response.body));
    setState(() {
      mappedImages.add(fetchedImages);
      count++;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Let's see some images",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: ImageList(mappedImages),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey[800],
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50,
          )),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: handlePress,
        backgroundColor: Colors.blueGrey[800],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
