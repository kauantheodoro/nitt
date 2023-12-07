import 'package:flutter/material.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  _AppsScreenState createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  // Lista de aplicativos distratores
  List<AppInfo> appsList = [
    AppInfo(name: 'Facebook', isActive: true),
    AppInfo(name: 'Instagram', isActive: true),
    AppInfo(name: 'Twitter', isActive: true),
    AppInfo(name: 'TikTok', isActive: true),
    AppInfo(name: 'Snapchat', isActive: true),
    AppInfo(name: 'WhatsApp', isActive: true),
    AppInfo(name: 'YouTube', isActive: true),
    // Adicione mais aplicativos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps Distratores'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: ListView.builder(
        itemCount: appsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appsList[index].name),
            trailing: Switch(
              value: appsList[index].isActive,
              onChanged: (value) {
                setState(() {
                  appsList[index].isActive = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class AppInfo {
  final String name;
  bool isActive;

  AppInfo({required this.name, required this.isActive});
}

void main() {
  runApp(
    MaterialApp(
      home: AppsScreen(),
    ),
  );
}
