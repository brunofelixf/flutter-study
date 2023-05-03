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
        home: Scaffold(
          appBar: AppBar(
            leading: Container(color: Colors.black26,),
            title: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('Tarefas'),
            ),
          ),
          body: ListView(
            children: const [
              Task('Estudar Flutter','https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png'),
              Task('Fazer compras','https://png.pngtree.com/png-clipart/20221224/original/pngtree-the-flutter-colorful-design-png-image_8801693.png'),
              Task('Malhar','https://static.wixstatic.com/media/c7bbc3_5f2893d3bdfb4dba8ee69b3cfeea9381~mv2.png/v1/fill/w_288,h_294,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Grupo%20412.png'),
              Task('Correr','https://flutterx.com/thumbnails/artifact-8'),
              Task('Inglês','https://mdevelopers.com/storage/0_flutterheader_0c3ac92d.png'),
              Task('Ler','https://banner2.cleanpng.com/20180710/xui/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3adae62.4180922415312688197114.jpg'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            print('Apertou');
          }),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;

  const Task(this.nome, this.foto, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(color: Colors.blue, height: 140),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.grey,
                        width: 70,
                        height: 100,
                        child:
                          Image.network(
                              widget.foto,
                              // 'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png',
                              fit: BoxFit.cover,
                          ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                              print(nivel);
                            }, child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('UP', style: TextStyle(fontSize: 12),)
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel/10,
                        ),
                        width: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nível: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
