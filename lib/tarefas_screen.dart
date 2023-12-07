import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String name;
  int priority; // Adiciona a prioridade à tarefa

  Task(this.name, this.priority);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task('Crises', 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas e Metas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].name),
            subtitle: _buildPriorityLabel(tasks[index].priority),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editTask(context, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTask(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPriorityLabel(int priority) {
    Color color;
    switch (priority) {
      case 1:
        color = Colors.green; // Baixa prioridade
        break;
      case 2:
        color = Colors.yellow; // Média prioridade
        break;
      case 3:
        color = Colors.red; // Alta prioridade
        break;
      default:
        color = Colors.grey; // Outras prioridades
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Prioridade $priority',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _addTask(BuildContext context) async {
    Task newTask = await showDialog(
      context: context,
      builder: (context) {
        String taskName = '';
        int taskPriority = 1; // Prioridade padrão

        return AlertDialog(
          title: Text('Nova Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  taskName = value;
                },
                decoration: InputDecoration(
                  hintText: 'Digite a nova tarefa',
                ),
              ),
              SizedBox(height: 8),
              DropdownButton<int>(
                value: taskPriority,
                onChanged: (value) {
                  setState(() {
                    taskPriority = value!;
                  });
                },
                items: [
                  DropdownMenuItem(value: 1, child: Text('Baixa')),
                  DropdownMenuItem(value: 2, child: Text('Média')),
                  DropdownMenuItem(value: 3, child: Text('Alta')),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, Task(taskName, taskPriority));
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );

    if (newTask != null && newTask.name.isNotEmpty) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  _editTask(BuildContext context, int index) async {
    Task editedTask = await showDialog(
      context: context,
      builder: (context) {
        String taskName = tasks[index].name;
        int taskPriority = tasks[index].priority;

        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: taskName),
                onChanged: (value) {
                  taskName = value;
                },
                decoration: InputDecoration(
                  hintText: 'Digite a tarefa editada',
                ),
              ),
              SizedBox(height: 8),
              DropdownButton<int>(
                value: taskPriority,
                onChanged: (value) {
                  setState(() {
                    taskPriority = value!;
                  });
                },
                items: [
                  DropdownMenuItem(value: 1, child: Text('Baixa')),
                  DropdownMenuItem(value: 2, child: Text('Média')),
                  DropdownMenuItem(value: 3, child: Text('Alta')),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, Task(taskName, taskPriority));
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );

    if (editedTask != null) {
      setState(() {
        tasks[index] = editedTask;
      });
    }
  }

  _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
}
