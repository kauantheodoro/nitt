import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Text('Conteúdo da Página Inicial'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Adicione a lógica desejada para o ícone de livro aqui
              },
              icon: Icon(Icons.book),
            ),
            IconButton(
              onPressed: () {
                // Adicione a lógica desejada para o ícone de notificação aqui
              },
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                // Navegue para a tela de configurações
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

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switch1Value = true;
  bool _switch2Value = false;
  String _dropdownValue1 = 'Opção 1';
  String _dropdownValue2 = 'Português';

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingSwitch(
              context,
              'Configuração 1',
              Icons.toggle_on,
              _switch1Value,
                  (value) {
                setState(() {
                  _switch1Value = value;
                });
                // Adicione a lógica desejada para a configuração 1
              },
            ),
            _buildSettingSwitch(
              context,
              'Configuração 2',
              Icons.toggle_on,
              _switch2Value,
                  (value) {
                setState(() {
                  _switch2Value = value;
                });
                // Adicione a lógica desejada para a configuração 2
              },
            ),
            _buildSettingDropdown(
              context,
              'Configuração 3',
              Icons.settings,
              _dropdownValue1,
                  (value) {
                setState(() {
                  _dropdownValue1 = value!;
                });
                // Adicione a lógica desejada para a configuração 3
              },
              ['Opção 1', 'Opção 2', 'Opção 3'],
            ),
            _buildSettingDropdown(
              context,
              'Configuração 4',
              Icons.language,
              _dropdownValue2,
                  (value) {
                setState(() {
                  _dropdownValue2 = value!;
                });
                // Adicione a lógica desejada para a configuração 4
              },
              ['Português', 'Inglês', 'Espanhol'],
            ),
            _buildSettingButton(
              context,
              'Alterar Tema',
              Icons.color_lens,
                  () {
                // Adicione a lógica para navegar para a tela de alteração de tema
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para salvar as configurações
                _showSnackBar(context, 'Configurações salvas com sucesso!');
              },
              child: Text('Salvar Configurações'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingSwitch(BuildContext context, String title, IconData icon, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      leading: Icon(icon),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSettingDropdown(BuildContext context, String title, IconData icon, String selectedValue, Function(String?) onChanged, List<String> options) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      leading: Icon(icon),
      trailing: DropdownButton<String>(
        value: selectedValue,
        onChanged: onChanged,
        items: options
            .map((option) => DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        ))
            .toList(),
      ),
    );
  }

  Widget _buildSettingButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      leading: Icon(icon),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: onPressed,
      ),
    );
  }
}
