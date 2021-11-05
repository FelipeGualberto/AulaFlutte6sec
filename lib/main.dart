import 'package:flutter/material.dart';
import 'package:instrucao_flutter/constants.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escala de Serviço"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(24, 16, 16, 0),

                decoration: BoxDecoration(

                ),
                child: Text(
                    "Próximo serviço",
                  style: kHeadingTextStyle1,
                )),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("LINHA 1"),
                      Text("LINHA 2")
                    ],
                  ),
                  Divider(
                    color: kDeathColor,
                    thickness: 10,
                  ),
                  Row(
                    children: [
                      Text("LINHA 1"),
                      Text("LINHA 2")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
