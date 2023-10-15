import 'package:flutter/material.dart';
import 'formulario.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == "admin" && password == "admin") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyForm()));
    } else if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Credenciales vacias")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales incorrectas")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Inicio de Sesión")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  controller: _emailController,
                  decoration:
                      const InputDecoration(labelText: "Correo Electrónico"))),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Contraseña"),
                  obscureText: true)),
          ElevatedButton(
              onPressed: _handleLogin, child: const Text("Iniciar Sesión"))
        ])));
  }
}
