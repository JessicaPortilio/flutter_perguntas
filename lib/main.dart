import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'pontuacao': 10},
        {'texto':'Vermelho', 'pontuacao': 5},
        {'texto':'Verde', 'pontuacao': 3},
        {'texto':'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Coellho', 'pontuacao': 10},
        {'texto':'Cobra', 'pontuacao': 5},
        {'texto':'Elefante', 'pontuacao': 3},
        {'texto':'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Leo', 'pontuacao': 10},
        {'texto':'Maria', 'pontuacao': 5},
        {'texto':'João', 'pontuacao': 3},
        {'texto':'Pedro', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
    
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //  List<String> respostas = temPerguntaSelecionada
    //  ? _perguntas[_perguntaSelecionada]['respostas']
    // : null;

    //tudo isso tornou uma linha só a linha 34 e a linha 56
    // List<Widget> widgets = respostas
    //   .map((t) => Resposta(t, _responder))
    //   .toList();

    //for(String textoResp in respostas)
    //{
    //    widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perguntas'),//barra da nossa navegação
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
