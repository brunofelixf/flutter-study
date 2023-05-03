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
          primarySwatch: Colors.blue,
        ),
        home: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(color: Colors.blue, width: 200, height: 200),
                  Container(color: Colors.red, width: 100, height: 100)
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(color: Colors.blue, width: 200, height: 200),
                  Container(color: Colors.red, width: 100, height: 100)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(color: Colors.blue, width: 50, height: 50),
                  Container(color: Colors.red, width: 50, height: 50),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(color: Colors.blue, width: 50, height: 50),
                      Container(color: Colors.red, width: 40, height: 40),
                    ],
                  )
                ],
              ),
              Container(
                color: Colors.yellow,
                width: 300,
                height: 30,
                child: Text(
                    'Teste',
                    style: TextStyle(color: Colors.black, fontSize: 28),
                    textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {print('Apertou');},
                child: Text('Aperte'),
              )
            ],
          ),
        ));
  }
}
