import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultado = '';
  String _classificacao = '';
  Color _corResultado = Colors.black;
  bool _mostrarResultado = false;

  void _calcularIMC() {
    final double peso =
        double.tryParse(_pesoController.text.replaceAll(',', '.')) ?? 0;
    final double altura =
        double.tryParse(_alturaController.text.replaceAll(',', '.')) ?? 0;

    if (peso <= 0 || altura <= 0) {
      setState(() {
        _resultado = 'Digite valores válidos!';
        _classificacao = 'Peso deve ser maior que 0kg e altura maior que 0m';
        _corResultado = Colors.red;
        _mostrarResultado = true;
      });
      return;
    }

    if (peso > 1000 || altura > 3.0) {
      setState(() {
        _resultado = 'Valores muito altos!';
        _classificacao = 'Verifique se os valores estão corretos';
        _corResultado = Colors.red;
        _mostrarResultado = true;
      });
      return;
    }

    final double imc = peso / (altura * altura);
    final Map<String, dynamic> classificacaoInfo = _classificarIMC(imc);

    setState(() {
      _resultado = 'IMC: ${imc.toStringAsFixed(2)}';
      _classificacao = classificacaoInfo['texto'];
      _corResultado = classificacaoInfo['cor'];
      _mostrarResultado = true;
    });
  }

  Map<String, dynamic> _classificarIMC(double imc) {
    if (imc < 18.5) {
      return {
        'texto': 'Baixo peso',
        'cor': Colors.blue,
        'descricao': 'Pode ser recomendável ganhar peso',
      };
    } else if (imc < 25) {
      return {
        'texto': 'Peso normal',
        'cor': Colors.green,
        'descricao': 'Mantenha um estilo de vida saudável',
      };
    } else if (imc < 30) {
      return {
        'texto': 'Sobrepeso',
        'cor': Colors.orange,
        'descricao': 'Considere uma dieta balanceada e exercícios',
      };
    } else if (imc < 35) {
      return {
        'texto': 'Obesidade grau I',
        'cor': Colors.deepOrange,
        'descricao': 'Recomendável consultar um médico',
      };
    } else if (imc < 40) {
      return {
        'texto': 'Obesidade grau II',
        'cor': Colors.red,
        'descricao': 'Necessário acompanhamento médico',
      };
    } else {
      return {
        'texto': 'Obesidade grau III',
        'cor': Colors.red[900]!,
        'descricao': 'Situação de risco - procure ajuda médica',
      };
    }
  }

  void _limparCampos() {
    _pesoController.clear();
    _alturaController.clear();
    setState(() {
      _resultado = '';
      _classificacao = '';
      _mostrarResultado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // icon title
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Icon(
                      Icons.monitor_weight,
                      size: 80,
                      color: Colors.blue[600],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Calcule seu Índice de Massa Corporal',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Card 
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      TextField(
                        controller: _pesoController,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Peso (kg)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.scale,
                            color: Colors.blue[600],
                          ),
                          hintText: 'Ex: 70.5',
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _alturaController,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Altura (m)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.blue[600],
                          ),
                          hintText: 'Ex: 1.70',
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              // parte dos botões 
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calcularIMC,
                      child: Text(
                        'CALCULAR IMC',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _limparCampos,
                      child: Text(
                        'LIMPAR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue[600],
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: Colors.blue[600]!, width: 2),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Resultado
              if (_mostrarResultado)
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Colors.white, _corResultado.withOpacity(0.05)],
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.assignment_turned_in,
                          color: _corResultado,
                          size: 40,
                        ),
                        SizedBox(height: 15),
                        Text(
                          _resultado,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: _corResultado,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _classificacao,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: _corResultado,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 30),

              // Limitações do IMC
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ExpansionTile(
                  title: Text(
                    '⚠️ Limitações importantes do IMC',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange[700],
                    ),
                  ),
                  leading: Icon(Icons.info_outline, color: Colors.orange[600]),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange[200]!),
                        ),
                        child: Text(
                          'Olá, tudo bem? 🐭 \n\nO IMC é uma medida simples e prática para avaliar o peso em relação à altura, mas não leva em conta fatores como massa muscular, distribuição de gordura, idade, sexo e composição corporal. Portanto, o IMC não reflete com precisão a saúde de indivíduos muito musculosos, idosos ou crianças. Assim como cada pessoa é única, cada corpo também é! 🐭💪\n\nPara uma avaliação mais completa, consulte um profissional de saúde para considerar todos esses fatores, ok? Lembre-se: o mais importante é como você se sente e cuida do seu corpo! 🐭❤️',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange[800],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Tabela de ref
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Tabela de Referência IMC (OMS)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  leading: Icon(Icons.table_chart, color: Colors.blue[600]),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          _criarLinhaTabela(
                            '< 18.5',
                            'Baixo peso',
                            Colors.blue,
                          ),
                          _criarLinhaTabela(
                            '18.5 - 24.9',
                            'Peso normal',
                            Colors.green,
                          ),
                          _criarLinhaTabela(
                            '25.0 - 29.9',
                            'Sobrepeso',
                            Colors.orange,
                          ),
                          _criarLinhaTabela(
                            '30.0 - 34.9',
                            'Obesidade grau I',
                            Colors.deepOrange,
                          ),
                          _criarLinhaTabela(
                            '35.0 - 39.9',
                            'Obesidade grau II',
                            Colors.red,
                          ),
                          _criarLinhaTabela(
                            '≥ 40.0',
                            'Obesidade grau III',
                            Colors.red[900]!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // rodapé
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.medical_services,
                      color: Colors.blue[600],
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'O IMC é uma medida de referência. Consulte um profissional de saúde para avaliação completa.',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 58, 116, 164),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarLinhaTabela(String imc, String classificacao, Color cor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            imc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            classificacao,
            style: TextStyle(
              color: cor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
