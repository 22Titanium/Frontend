import 'package:flutter/material.dart';
import 'package:frontend/Container/conn_http.dart';
import 'package:logger/logger.dart';

import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ricochet Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Ricochet'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var log = Logger();
  ConnHttp connHttp = ConnHttp();

  Future<void> _makeNewRoom() async {
    log.d("A new room is created");
  
    final response = await connHttp.request('GET', '', null);  // test line for http connection
    // To be implement ...
  }

  void _enterRoom(int index){
    log.d("Entering room is succeed");
    // To be implement ...
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
        body: GridView.builder(itemCount: 3, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 3,
            crossAxisSpacing: 6,
            childAspectRatio: 4
        ), itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(8),
            elevation: 8,
            child: GridTile(
              header: GridTileBar(
                title: Text('ROOM $index', style: const TextStyle(color: Colors.black)),
                subtitle: const Text('Room explain', style: TextStyle(color: Colors.black)),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: (){
                    log.d('This room number is $index');
                    _enterRoom(index);
                  },
                  tooltip: 'TOOLTIP',
                  child: const Text(
                      'Enter',
                      style: TextStyle(fontSize: 16)
                  ),
                ),
              ),
            )
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: _makeNewRoom,
        tooltip: 'Make Room',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
