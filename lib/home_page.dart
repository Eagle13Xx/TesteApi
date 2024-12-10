import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String respostaFinal = '';
  final dio = Dio();
  Map<String, dynamic>? endereco;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/76875534/json/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text('Consumo de APIS usando DIO'),
            ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic>? endecoAuxiliar = await getHttp();
                  setState(() {
                    endereco = endecoAuxiliar;
                  });
                },
                child: Text('Consultar')),
            SizedBox(
              height: 32,
            ),
            Text('${endereco?['logradouro']}')
          ],
        ),
      )),
    );
  }
}
