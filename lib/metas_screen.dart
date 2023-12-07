import 'package:flutter/material.dart';
import 'package:nitt/graph_screen.dart'; // Importe a tela GraphScreen


class MetasScreen extends StatefulWidget {
  @override
  _MetasScreenState createState() => _MetasScreenState();
}

class _MetasScreenState extends State<MetasScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _descricaoController = TextEditingController();
  Color? corSelecionada;

  List<Meta> metas = [];

  List<Color> coresPrioridade = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  String? prazoSelecionado;
  List<String> prazos = ['Curto', 'Médio', 'Longo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adicionar Meta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<Color>(
                value: corSelecionada,
                onChanged: (cor) {
                  setState(() {
                    corSelecionada = cor;
                  });
                },
                items: coresPrioridade.map((cor) {
                  return DropdownMenuItem<Color>(
                    value: cor,
                    child: Container(
                      width: 20,
                      height: 20,
                      color: cor,
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Prioridade',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione a prioridade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: prazoSelecionado,
                onChanged: (prazo) {
                  setState(() {
                    prazoSelecionado = prazo;
                  });
                },
                items: prazos.map((prazo) {
                  return DropdownMenuItem<String>(
                    value: prazo,
                    child: Text(prazo),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Prazo',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione o prazo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Criar uma nova meta
                    Meta meta = Meta(
                      prioridade: corSelecionada!,
                      descricao: _descricaoController.text,
                      prazo: prazoSelecionado!,
                    );

                    // Adicionar a nova meta à lista de metas
                    metas.add(meta);

                    // Limpar os campos do formulário
                    corSelecionada = null;
                    prazoSelecionado = null;
                    _descricaoController.clear();

                    // Exibir uma mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Meta adicionada com sucesso!'),
                      ),
                    );
                  }
                },
                child: Text('Adicionar Meta'),
              ),
              SizedBox(height: 20),
              Text(
                'Metas Adicionadas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: metas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Prioridade: ${metas[index].prioridade}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descrição: ${metas[index].descricao}'),
                          Text('Prazo: ${metas[index].prazo}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Meta {
  final Color prioridade;
  final String descricao;
  final String prazo;

  Meta({
    required this.prioridade,
    required this.descricao,
    required this.prazo,
  });
}
