// ignore_for_file: unused_field

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';



class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String email = '';
  String senha = '';

  final _nomeEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Simples")
      ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Nome: ')),
              controller: _nomeEC,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              }, 
              ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Email: ')),
              controller: _emailEC,
              validator: (value) {
                    final bool isValid = EmailValidator.validate(value!);
                    if (isValid == false) {
                      return "Digite um email válido!";
                    }
                  return null;
                  },
                ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Senha de 6 dígitos: ')), 
              obscureText: true,  
              controller: _senhaEC,
              validator: (value) {
                  if (value!.length > 6) {
                    return "Diminua sua senha para 6 dígitos";
                  } else if (value.length < 6) {
                    return "Aumente sua senha para 6 dígitos";
                  }
                  return null;
                  },
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  final validate =
                    _formKey.currentState?.validate() ?? false;

                  if (validate) {
                    setState(() {
                      nome = _nomeEC.text;
                      email = _emailEC.text;
                      senha = _senhaEC.text;
                    });
                    nome = _nomeEC.text;
                    email = _emailEC.text;
                    senha = _senhaEC.text;
                  }
                },
                child: const Text('Salvar')),
  
                const SizedBox(height: 20),
                Text('Nome: $nome'),
                Text('Email: $email'),
                Text('Senha: $senha')
              ],
            )
          ),
        ),
      );
  }
}