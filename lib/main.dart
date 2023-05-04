import 'dart:ffi';

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
              Task('Estudar Flutter','https://www.fecaf.com.br/wp-content/uploads/2021/02/estudar-melhor.jpg', 3),
              Task('Fazer compras','https://statics-cuidateplus.marca.com/cms/2022-11/compras-compulsivas_0.jpg', 5),
              Task('Malhar','https://conteudo.imguol.com.br/c/entretenimento/6a/2019/03/18/musculacao-treino-academia-exercicio-1552946244916_v2_450x600.jpg', 1),
              Task('Correr','https://conteudo.imguol.com.br/c/entretenimento/bf/2019/02/27/corrida-subida-montanha-1551295317604_v2_450x600.jpg', 4),
              Task('Inglês','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRMmzmA3gxdHN_xPI2cFTGQjWejl3TTuk-_BS_2uZmUHJzVbaBuLr77FIcm4imqCa1b-s&usqp=CAU', 3),
              Task('Ler','https://media.newyorker.com/photos/59ee325f1685003c9c28c4ad/master/w_2560%2Cc_limit/Heller-Kirkus-Reviews.jpg', 5),
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
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue
              ),
                height: 140),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        width: 70,
                        height: 100,
                        child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                widget.foto,
                                // 'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png',
                                fit: BoxFit.cover,
                            ),
                          ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 24, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 15, color: widget.dificuldade >=1 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: widget.dificuldade >=2 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: widget.dificuldade >=3 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: widget.dificuldade >=4 ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: widget.dificuldade >=5 ? Colors.blue : Colors.blue[100]),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel < 10 ? nivel++: nivel;
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
