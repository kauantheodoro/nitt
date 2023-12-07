import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráfico de Desempenho'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(showTitles: true, reservedSize: 30),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mat';
                            case 2:
                              return 'Hist';
                            case 4:
                              return 'Geo';
                            case 6:
                              return 'BD'; // Manter "BD" no último ponto
                            default:
                              return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: const Color(0xff37434d),
                        width: 1,
                      ),
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            y: 5,
                            width: 24,
                            borderRadius: const BorderRadius.all(Radius.zero),
                            colors: [Colors.green], // Cor verde para o gráfico "Mat"
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            y: 3,
                            width: 24,
                            borderRadius: const BorderRadius.all(Radius.zero),
                            colors: [Colors.orange], // Cor laranja para o gráfico "Hist"
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(
                            y: 7,
                            width: 24,
                            borderRadius: const BorderRadius.all(Radius.zero),
                            colors: [Colors.purple], // Cor roxa para o gráfico "Geo"
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 6,
                        barRods: [
                          BarChartRodData(
                            y: 8,
                            width: 24,
                            borderRadius: const BorderRadius.all(Radius.zero),
                            colors: [Colors.blue], // Cor azul para o gráfico "BD" (ou "Mat")
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LegendItem(color: Colors.green, label: 'Mat: 5%'),
                  LegendItem(color: Colors.orange, label: 'Hist: 3%'),
                  LegendItem(color: Colors.purple, label: 'Geo: 7%'),
                  LegendItem(color: Colors.blue, label: 'Bd: 8%'), // Alterar a legenda de "BD" para "Mat"
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Text(label),
        SizedBox(width: 16),
      ],
    );
  }
}
