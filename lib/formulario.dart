import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numericController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String lastname = _lastnameController.text;
      String email = _emailController.text;
      String cellphone = _numericController.text;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Nombre: $name, Apellido: $lastname, Correo Electrónico: $email, Celular: $cellphone')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Formulario Flutter')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su nombre';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Nombre')),
                  TextFormField(
                      controller: _lastnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su apellido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Apellido')),
                  TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su correo electrónico';
                        }
                        if (!value.contains('@')) {
                          return 'Correo electrónico no válido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Correo Electrónico')),
                  TextFormField(
                      controller: _numericController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su celular';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Teléfono')),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: _submitForm, child: const Text('Enviar'))
                ]))));
  }
}
