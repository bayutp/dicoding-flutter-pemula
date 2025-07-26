import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo'), backgroundColor: Colors.amber,),
      body: Center(
        // Image network
        // child: Image.network(
        //   'https://picsum.photos/200/300',
        //   width: 200,
        //   height: 200,
        // ),
        child: Image.asset('images/android.png', width: 200, height: 200),
      ),
    );
  }
}
