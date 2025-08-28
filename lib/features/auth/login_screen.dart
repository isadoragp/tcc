import 'package:flutter/material.dart';
import 'package:elder_care/core/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => email = val!.trim(),
                validator: (val) => val!.isEmpty ? "Campo obrigatório" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
                onSaved: (val) => senha = val!.trim(),
                validator: (val) => val!.isEmpty ? "Campo obrigatório" : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text("Entrar"),
                onPressed: isLoading ? null : _loginUsuario,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUsuario() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => isLoading = true);

    try {
      // Login usando AuthService
      final uid = await AuthService.loginUsuario(email, senha);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login realizado com sucesso!")),
      );

      // Aqui você pode redirecionar para a Home do cuidador
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
}
