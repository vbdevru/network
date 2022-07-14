import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const NetworkApp());
}

class NetworkApp extends StatelessWidget {
  const NetworkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

Future<http.Response> getData() async {
  const url = 'https://jsonplaceholder.typicode.com/todos/1';
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((value) {
    if (value.statusCode == 200) {
      print(value.body);
    } else {
      print(value.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}