import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    super.initState();
    changeStatusbar();
  }
  changeStatusbar(){
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
statusBarColor:Colors.blueAccent,
  systemNavigationBarColor: Colors.blueAccent
));
  }
  rollbackStatusBar(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor:Colors.blueAccent,
        systemNavigationBarColor: Colors.blueAccent
    ));
  }

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _txtResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double?precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {

      setState(() {
        _txtResultado='Valor inválido,digite numeros maiores  que 0 e utilizando (.)';

      });
    }
    else {
      if ((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _txtResultado='Abasteça com Gasolina';
        });
      }else{
        setState(() {
          _txtResultado='Abasteça com Etanol';
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("Calculadora de Combustível"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(

        child: SingleChildScrollView( //criando scroll da tela
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 36),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção de abastecimento para o seu carro ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Álcool',
                  contentPadding: EdgeInsets.all(5),

                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                  labelText: 'Preço Gasolina',
                  contentPadding: EdgeInsets.all(5),
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: _calcular,
                  child: Text(
                      'Calcular'),

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _txtResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}