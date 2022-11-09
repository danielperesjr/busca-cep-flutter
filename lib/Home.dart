import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";

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
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  "images/logo.png",
                  height: 250,
                  width: 250,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  _resultado,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite o CEP (somente números):"
                  ),
                  style: TextStyle(
                      fontSize: 20
                  ),
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
                  onPressed: (){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
