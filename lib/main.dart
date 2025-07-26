import 'package:flutter/material.dart';
import 'package:flutter_apps/expanded.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Oswald',
      ),
      home: MyFlexible(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Mengenal stateless & stateful widgets
class Heading extends StatelessWidget {
  final String text;

  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;
  final double _maxSize = 64.0;
  final double _minSize = 16.0;

  void _increaseTextSize() {
    if (_textSize <= _maxSize) {
      setState(() {
        _textSize += 8.0;
      });
    }
  }

  void _decreaseTextSize() {
    if (_textSize > _minSize) {
      setState(() {
        _textSize -= 8.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(fontSize: _textSize, color: Colors.purple),
          child: Text(widget.text),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _decreaseTextSize,
              child: const Text("Perkecil"),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: _increaseTextSize,
              child: const Text("Perbesar"),
            ),
          ],
        ),
      ],
    );
  }
}

// Mengenal scaffold widgets
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search clicked')));
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu'),
              ),
              ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
            ],
          ),
        ),
      ),
      body: const Center(child: MyRow()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('FAB clicked')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Mengenal container
class Content extends StatelessWidget {
  final String text;

  const Content({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 350,
      width: 300,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red, //shape: BoxShape.circle
        boxShadow: const [
          BoxShadow(color: Colors.blue, offset: Offset(3, 6), blurRadius: 10),
        ],
        border: Border.all(color: Colors.amber, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(fontSize: 18.0, color: Colors.white)),
    );
  }
}

// mengenal padding
class MyPadding extends StatelessWidget {
  final String text;
  const MyPadding({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}

// Mengenal Row and Column

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("MainAxisAlignment.center"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        SizedBox(height: 32),
        Text("MainAxisAlignment.spaceBetween"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        SizedBox(height: 32),
        Text("MainAxisAlignment.spaceAround"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        SizedBox(height: 32),
        Text("MainAxisAlignment.spaceEvenly"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        SizedBox(height: 32),
        Text("MainAxisAlignment.end"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        SizedBox(height: 32),
        Text("MainAxisAlignment.start"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
      ],
    );
  }
}

// Mengenal button
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Data submitted successfully")),
              );
            },
            child: Text("Submit"),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Text Button was clicked!")),
              );
            },
            child: Text("Text Button"),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Outline was clicked!")));
            },
            child: Text("Outline"),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
            icon: Icon(Icons.volume_up),
            tooltip: "Increase volume by 10",
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Increase volume")));
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: MyDropdownButton(),
        ),
      ],
    );
  }
}

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? language;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: ['Java', 'Kotlin', 'Dart', 'Javascript']
          .map(
            (String lang) =>
                DropdownMenuItem<String>(value: lang, child: Text(lang)),
          )
          .toList(),
      value: language,
      hint: Text('Select Language'),
      onChanged: (String? value) {
        setState(() {
          language = value;
        });
      },
    );
  }
}
