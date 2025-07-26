import 'package:flutter/material.dart';

const colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.purple,
  Colors.pink,
  Colors.brown,
];

class MyExpanded extends StatelessWidget {
  const MyExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: colors
          .map(
            (clr) => Expanded(
              flex: clr == Colors.brown ? 2 : 1,
              child: Container(color: clr),
            ),
          )
          .toList(),
    );
  }
}

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 1, child: Container(color: Colors.orange, width: 200)),
        Expanded(flex: 2, child: Container(color: Colors.blue)),
      ],
    );
  }
}
