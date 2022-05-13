import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'models/EstadosModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> siglas = [];
  List<DropdownMenuItem<String>> items = [];

  var dropDownValueUF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Aula flutter - Consumo de API")),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Texto
                    Text("Escolha seu Estado"),

                    // DropDown
                    DropdownButton(
                        hint: Text("UF"),
                        value: dropDownValueUF,
                        onTap: () {},
                        isExpanded: true,
                        items: items,
                        onChanged: (e) async {
                          setState(() {
                            dropDownValueUF = e;
                          });
                        }),

                    // Botao
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          get();
                         // post();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0)),
                          padding: const  EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Text(
                          "Pegar Estados",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  get() async {
    List<EstadosModel> listEstados = [];
    Response response = await http.get(Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados/'));

    if (response.statusCode == 200) {
        
        debugPrint(response.body);
        
        List list = jsonDecode(response.body);
        for (var element in list) { 
          listEstados.add(EstadosModel.fromJson(element));
        }
        
        createListItemsDropDown(listEstados);
    } 
  }

  post() async {
    await http.post(
      Uri.parse('https://ptsv2.com/t/6aop8-1652403899/post'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'login': "teste",
      }),
    );
  }
  
  
  createListItemsDropDown(List<EstadosModel> listEstados){
    
    for (var estado in listEstados) {
      items.add(createDropDownItem(estado.nome));
    }
    setState(() {});
  }


  createDropDownItem(String? Uf){
    return DropdownMenuItem<String>(
      value: Uf,
      child: Text(Uf!),
    );
  }
}
