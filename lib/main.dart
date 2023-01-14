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

        appBar: AppBar(title: Text('Tarefas'),
        leading: Container(),),
        body: ListView(
          children: [
            Task('Aprender Flutter', '', 5),
            Task('Andar de bike', '', 4),
            Task('Meditar', '', 3),
            Task('Caminhada', '', 2),
            Task('Joooogar video game', '', 3),

          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),
        ),
      ),
    );
  }
}
class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficult;
  const Task(this.name,this.photo, this.difficult,  {Key? key}) : super(key: key);

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
            Container(color: Colors.blue, height: 140,
            ),
            Column(
              children: [
                Container(color: Colors.white, height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(color: Colors.black26, width: 72, height: 100,
                        child: Image.asset('assets/images/flutter.png',
                        fit: BoxFit.cover),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text(widget.name,
                            style:
                            TextStyle(fontSize: 24,
                            overflow: TextOverflow.ellipsis),
                          ),
                          width: 200,
                          ),
                          Row(
                            children: [
                              Icon( Icons.star, size: 15, color: (widget.difficult >=1 ? Colors.blue : Colors.blue[100])),
                              Icon( Icons.star, size: 15, color: (widget.difficult >=2 ? Colors.blue : Colors.blue[100])),
                              Icon( Icons.star, size: 15, color: (widget.difficult >=3 ? Colors.blue : Colors.blue[100])),
                              Icon( Icons.star, size: 15, color: (widget.difficult >=4 ? Colors.blue : Colors.blue[100])),
                              Icon( Icons.star, size: 15, color: (widget.difficult >=5 ? Colors.blue : Colors.blue[100])),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 52, width: 52,
                        child: ElevatedButton(onPressed:  () {
                          setState(() {
                              nivel++;
                              print(nivel);
                          });
                    }, child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon( Icons.arrow_drop_up),
                          Text("UP", style: TextStyle(fontSize: 12),)
                        ],
                    )),
                      )
                    ],
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(12),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10,

                        ),
                      ),
                      Text('Nível: $nivel', style: TextStyle(color: Colors.white)
                      ),
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
