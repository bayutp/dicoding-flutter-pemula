import 'package:flutter/material.dart';

const numberList = [1, 2, 3, 4, 5, 6, 7];

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Menggunakan separated
          ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    '${numberList[index]}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: numberList.length,
          ),
      // Menggunakan builder
      // ListView.builder(
      //   itemCount: numberList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       height: 250,
      //       decoration: BoxDecoration(
      //         color: Colors.grey,
      //         border: Border.all(color: Colors.black),
      //       ),
      //       child: Center(
      //         child: Text('${numberList[index]}', style: TextStyle(fontSize: 24)),
      //       ),
      //     );
      //   },
      // ),

      // Menggunakan children
      // ListView(
      //   children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      //       .map(
      //         (number) => Container(
      //           height: 250,
      //           decoration: BoxDecoration(
      //             color: Colors.grey,
      //             border: Border.all(color: Colors.black),
      //           ),
      //           child: Center(
      //             child: Text('$number', style: TextStyle(fontSize: 30)),
      //           ),
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }
}
