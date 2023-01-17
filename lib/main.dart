import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/task.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  bool opacidade = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter: Primeiros Passos'),
          leading: Icon(Icons.add_task),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Color.fromARGB(255, 208, 221, 237),
            child: ListView(
              children: const [
                Padding(//aula 5.4
                  padding: EdgeInsets.only(top:8),
                  child: Tasks(
                      'Estudar Flutter',
                      'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                      3),
                ),
                Tasks(
                    'Andar de Bike',
                    'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                    2),
                Tasks(
                    'Ler 50 páginas',
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                    1),
                Tasks(
                    'Meditar',
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                    4),
                Tasks('Jogar',
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 0),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          backgroundColor: Colors.blue[100],
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}
