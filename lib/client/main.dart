import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../server/gematria.dart' show calculateGematria;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gematria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gematria'),
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
  final TextEditingController controller = TextEditingController();
  
  String _queryWord = "";

  void _setQueryWord(String word) {
    setState(() {
      _queryWord = word;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (newWord) => {_setQueryWord(newWord)},
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]*$"))],
            ),
            Text(
              calculateGematria(_queryWord).toString()
            ),
            // ListView(

            // ),
          ],
        ),
      ),
    );
  }
}
