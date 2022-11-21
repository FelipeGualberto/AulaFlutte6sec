import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:teste_api/models/EstadoModel.dart';
import 'package:teste_api/models/IcmsTipoModel.dart';
import 'package:teste_api/models/MercadoriaModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:  MyHomePage(title: 'Tributo sem Mistério'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<EstadoModel> estadosList = [];
  List<IcmsTipoModel> icmsList = [];
  List<MercadoriaModel> mercadoriaList = [];

  EstadoModel? dropdownValueEstadoModel;
  IcmsTipoModel? dropdownValueIcmsModel;
  MercadoriaModel? dropdownValueMercadoriaModel;

  var valorAliquota = "";

  @override
  void initState() {
    getEstados();
    getTipoIcms();
    getTipoMercadoria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(32),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  height: 50,
                 // width: 375,
                  child:
                  DropdownButton<EstadoModel>(
                    value: dropdownValueEstadoModel,
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Selecionar Estado"),
                    ),
                    underline: SizedBox(),
                    isExpanded: true,
                    elevation: 16,
                    onChanged:
                        (EstadoModel? newValue) {
                      setState(() {
                        dropdownValueEstadoModel = newValue;

                      });
                    },
                    items: estadosList.map<
                        DropdownMenuItem<
                            EstadoModel>>(
                            (EstadoModel value) {
                          return DropdownMenuItem<
                              EstadoModel>(
                            value: value,
                            child: Text(
                                value.sigla!),
                          );
                        }).toList(),
                  ),
                ))),

        Padding(
            padding: const EdgeInsets.all(32),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  height: 50,
                  // width: 375,
                  child:
                  DropdownButton<IcmsTipoModel>(
                    value: dropdownValueIcmsModel,
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Selecionar Tipo de ICMS"),
                    ),
                    underline: SizedBox(),
                    isExpanded: true,
                    elevation: 16,
                    onChanged:
                        (IcmsTipoModel? newValue) {
                      setState(() {
                        dropdownValueIcmsModel = newValue;

                      });
                    },
                    items: icmsList.map<
                        DropdownMenuItem<
                            IcmsTipoModel>>(
                            (IcmsTipoModel value) {
                          return DropdownMenuItem<
                              IcmsTipoModel>(
                            value: value,
                            child: Text(
                                value.descricao!),
                          );
                        }).toList(),
                  ),
                ))),

        Padding(
            padding: const EdgeInsets.all(32),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  height: 50,
                  // width: 375,
                  child:
                  DropdownButton<MercadoriaModel>(
                    value: dropdownValueMercadoriaModel,
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Selecionar Mercadoria"),
                    ),
                    underline: SizedBox(),
                    isExpanded: true,
                    elevation: 16,
                    onChanged:
                        (MercadoriaModel? newValue) {
                      setState(() {
                        dropdownValueMercadoriaModel = newValue;

                      });
                    },
                    items: mercadoriaList.map<
                        DropdownMenuItem<
                            MercadoriaModel>>(
                            (MercadoriaModel value) {
                          return DropdownMenuItem<
                              MercadoriaModel>(
                            value: value,
                            child: Text(
                                value.descricao!),
                          );
                        }).toList(),
                  ),
                ))),


        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
                getAliquota(dropdownValueIcmsModel!.idIcmsTipo, dropdownValueEstadoModel!.idEstado, dropdownValueMercadoriaModel!.idMercadoria);

            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 16),
            ),
            child: const Text(
              "Calcular ICMS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),

        Padding(padding: EdgeInsets.all(32), child: Center(child: Text("$valorAliquota"  , style: TextStyle(fontSize: 64),),),)

      ]));


  }

  Future<void> getEstados() async {
    List jsonObject;
    await http.get(Uri.parse("http://10.0.30.209/example-api/public/api/estados")).then((value){
      jsonObject = jsonDecode(value.body);
      jsonObject.forEach((element) {
        //debugPrint("${element}");
        estadosList.add(EstadoModel.fromJson(element));
      });
    });

    setState(() {

    });

  }

  Future<void> getTipoIcms() async {
    List jsonObject;
    await http.get(Uri.parse("http://10.0.30.209/example-api/public/api/icms-tipos")).then((value){
      jsonObject = jsonDecode(value.body);
      jsonObject.forEach((element) {
        //debugPrint("${element}");
        icmsList.add(IcmsTipoModel .fromJson(element));
      });
    });

    setState(() {

    });

  }

  Future<void> getTipoMercadoria() async {
    List jsonObject;
    await http.get(Uri.parse("http://10.0.30.209/example-api/public/api/mercadorias")).then((value){
      jsonObject = jsonDecode(value.body);
      jsonObject.forEach((element) {
        //debugPrint("${element}");
        mercadoriaList.add(MercadoriaModel.fromJson(element));
      });
    });

    setState(() {

    });

  }

  Future<void> getAliquota(icmsTipo,estado,mercadoria) async {
    List jsonObject;
    await http.get(Uri.parse("http://10.0.30.209/example-api/public/api/getAliquota/icmstipo/$icmsTipo/estado/$estado/mercadoria/$mercadoria")).then((value){
      jsonObject = jsonDecode(value.body);

      //debugPrint("${value.body}");

      valorAliquota = "${jsonObject.first["valor"]}" + "%";
    });

    setState(() {

    });

  }
}
