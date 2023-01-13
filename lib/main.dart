import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Tarefas')),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Andar de bike'),
            Task('Meditar'),
            Task('Caminhada'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
            Task('Joooogar video game'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),
        ),
      ),
    );
  }
}
class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140,
          ),
          Container(color: Colors.white, height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.black26, width: 72, height: 100,
                ),
                Text(this.nome),
                ElevatedButton(onPressed:  () {}, child: Icon(Icons.arrow_drop_up))
              ],
            ),),
        ],
      ),
    );
  }
}
