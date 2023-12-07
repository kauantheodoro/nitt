import 'package:flutter/material.dart';
import 'package:nitt/apps_screen.dart';
import 'package:nitt/metas_screen.dart';
import 'package:nitt/profile_screen.dart';
import 'package:nitt/settings_screen.dart';
import 'package:nitt/tarefas_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:nitt/graph_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment(-0.9, 0.0),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent.shade100,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              SizedBox(height: 60),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GraphScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    alignment: Alignment(0.0, 0.0),
                                    primary: Colors.deepPurpleAccent.shade100,
                                  ),
                                  child: Text(
                                    'Clique aqui para mais detalhes',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 48,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  size: 36,
                                  color: Colors.black,
                                ),
                                radius: 45,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 154.0),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.4,
                                lineHeight: 18,
                                percent: 0.80,
                                animation: true,
                                animationDuration: 5000,
                                center: Text(
                                  "80%",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.green,
                                backgroundColor: Colors.deepPurple.shade100,
                                barRadius: Radius.circular(50),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment(-0.9, 0.0),
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 120.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Estudar para',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Banco de Dados',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Data: 01/11/2023',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Meta 01',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Prazo 01/11/2023',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment(-0.9, 0.0),
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 120.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Matemática',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Discreta',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Data: 05/11/2023',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Meta 02',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Prazo 05/11/2023',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Ajuste a distância do botão em relação à parte inferior
            right: 7,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MetasScreen()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.deepPurpleAccent.shade100,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksScreen()),
                );
              },
              icon: Icon(Icons.book),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppsScreen()),
                );
              },
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}