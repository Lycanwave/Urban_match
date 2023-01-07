import 'package:flutter/material.dart';
import 'package:urban_match_rohit/view/task1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FirstTask()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Task1'),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Task2'),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
