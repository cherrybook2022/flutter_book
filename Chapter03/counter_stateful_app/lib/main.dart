import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    print ("MyApp() constructor");
  }
  @override
  Widget build(BuildContext context) {
    print ("MyApp().build");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LifeCycle Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key) {
    print("MyHomePage() constructor");
  }
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print("_MyHomePageState() constructor : mounted=${this.mounted} ");
  }

  @override
  void initState() {
    print("_MyHomePageState.initState : mounted=${this.mounted}: _counter(${this
        ._counter})");
    super.initState();
  }

  @override
  void reassemble() {
    print(
        "_MyHomePageState.reassemble :: mounted=${this.mounted}: _counter(${this
            ._counter})");
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print("_MyHomePageState.didChangeDependencies : mounted=${this
        .mounted}: _counter(${this._counter})");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("_MyHomePageState.dispose() : mounted=${this.mounted}: _counter(${this
        ._counter})");
    super.dispose();
  }

  @override
  void deactivate() {
    print("_MyHomePageState.deactivate:mounted=${this.mounted}: _counter(${this
        ._counter})");
    super.deactivate();
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    print("_MyHomePageState.didUpdateWidget:mounted=${this
        .mounted}: _counter(${this._counter})");
    super.didUpdateWidget(oldWidget);
  }

  int _counter = 0;

  void _incrementCounter() {
    print("Clicked:_incrementCounter:mounted=${this.mounted} : _counter(${this
        ._counter})");
    setState(() {
      _counter++;
      print("_MyHomePageState.setState():mounted=${this.mounted}:_counter(${this
          ._counter})");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState.build():mounted=${this.mounted}: _counter(${this
        ._counter})");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$widget.title'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
