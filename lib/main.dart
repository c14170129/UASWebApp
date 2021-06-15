import 'package:flutter/material.dart';
import 'package:flutteruntukuas/myButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutteruntukuas/postsAPI.dart';
import 'package:flutteruntukuas/commentsPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UAS WebApp",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<postsAPI> list = [];
  void getListAPI() {
    postsAPI.getPosts().then((value) {
      list = value;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton("GET POSTS", pressButton: getListAPI),
              Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index].title),
                          subtitle: Text(list[index].body),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => commentsPage()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(list[index].body)));
                          },
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
