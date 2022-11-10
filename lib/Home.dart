import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";
  TextEditingController _controllerCep = TextEditingController();

  void _recuperarCep() async {
    String _cepDigitado = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${_cepDigitado}/json/";

    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    String _logradouro = retorno["logradouro"];
    String _complemento = retorno["complemento"];
    String _bairro = retorno["bairro"];
    String _localidade = retorno["localidade"];
    String _uf = retorno["uf"];

    //TODO implementar validação de CEP inválido/resposta da API != 200
    setState(() {
      _resultado = "${_logradouro}, ${_complemento}, ${_bairro}, ${_localidade}, ${_uf}";
    });

    _limparCampos();
  }

  void _limparCampos(){
    _controllerCep.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Busca CEP")
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  "images/logo.png",
                  height: 225,
                  width: 225,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: Text(
                  _resultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 75, right: 75, bottom: 25),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite o CEP (somente números):"
                  ),
                  style: TextStyle(
                      fontSize: 20
                  ),
                  controller: _controllerCep
                ),
              ),
              MaterialButton(
                  color: Colors.amberAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Text(
                    "Buscar",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _recuperarCep
              ),
            ],
          ),
        ),
      ),
    );
  }
}
