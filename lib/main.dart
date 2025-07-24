import 'package:flutter/material.dart';

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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(child: BiggerText(text: "Halo! Flutter")),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
