import 'package:flutter/material.dart';
import 'package:http_demo/model.dart';

import 'api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> data = [];
  late Api api;

  @override
  void initState() {
    api = Api();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data[i].title}",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text("${data[i].url}", style: TextStyle(color: Colors.blue)),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _fetchData() async {
    List<Data>? response = await api.fetchData();
    if (response != null) {
      setState(() {
        data = response;
        print("data -- ${data}");
      });
    }
  }
}
