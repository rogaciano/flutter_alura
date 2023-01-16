import 'package:flutter/material.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  bool opacidade = true;

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
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
        duration: Duration( milliseconds: 1000 ),
        child: ListView(
          children: [
            Task('Aprender Flutter', 'assets/images/flutter.png', 5),
            Task('Andar de bike', 'assets/images/bike.jpg', 4),
            Task('Meditar', 'assets/images/meditar.jpeg', 1),
            Task('Ler', 'assets/images/leitura.jpg', 2),
            Task('Jogar video game', 'assets/images/jogar.jpg', 3),

          ],
        ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          opacidade = !opacidade;
          print(opacidade);
        }, child: Icon(Icons.add),
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
            Container(height: 140,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.blue, ),
            ),
            Column(
              children: [
                Container(  height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 72, height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black26, ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(widget.photo,
                          fit: BoxFit.cover),
                        ),
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
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
                          value: ( widget.difficult > 0 ) ?  nivel / widget.difficult / 10: 1,

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
