import 'package:flutter/material.dart';
import 'BoxContent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluter Day 01',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(title: 'Flutter Demo Day 01'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<List> items = [
    [
      'https://play-lh.googleusercontent.com/wnBLkioNZetwPWZxO5-rlS05dRZpc6Vs7vQS1uGJhW5XCiBuxfqlxEp5Zv8D4nZW1bc',
      'Alex',
      'Software Engineer',
    ],
    [
      'https://flutter.dev/images/flutter-logo-sharing.png',
      'Ben',
      'Product Designer',
    ],
    ['https://example.com/image3.jpg', 'Charlie', 'Data Scientist'],
    ['https://example.com/image4.jpg', 'Diana', 'UX Researcher'],
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // separate decrement method
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
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

        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Action for info button
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        children: <Widget>[
          const Text('You have pushed the button this mes:'),
          const SizedBox(height: 6.0),
          Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8.0),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _decrementCounter();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),

          const SizedBox(height: 12.0),

          // 4 grid items (2x2)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 3 / 4,
            children: const [
              BoxContent(
                imageUrl:
                    'https://play-lh.googleusercontent.com/wnBLkioNZetwPWZxO5-rlS05dRZpc6Vs7vQS1uGJhW5XCiBuxfqlxEp5Zv8D4nZW1bc',
                title: 'Alex',
                subtitle: 'Software Engineer',
                imageSize: 200,
                // imageSize: double.infinity,
              ),
              BoxContent(
                imageUrl: 'https://flutter.dev/images/flutter-logo-sharing.png',
                title: 'Ben',
                subtitle: 'Product Designer',
                imageSize: 200,
              ),
              BoxContent(
                imageUrl:
                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&q=80',
                title: 'Cara',
                subtitle: 'Mobile Developer',
                imageSize: 200,
              ),
              BoxContent(
                imageUrl:
                    'https://images.unsplash.com/photo-1545996124-1b7a5b6f0f40?w=400&q=80',
                title: 'Dana',
                subtitle: 'QA Engineer',
                imageSize: 200,
              ),
            ],
          ),

          const SizedBox(height: 12.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
