import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/db_service.dart';
import '../../core/model/usuario.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';
  String senha = '';
  String cpf = '';
  String telefone = '';
  DateTime? dataNascimento;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Cuidador")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                onSaved: (val) => nome = val!.trim(),
                validator: (val) => val!.isEmpty ? "Campo obrigatório" : null,
              ),
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
                validator: (val) => val!.length < 6 ? "Mínimo 6 caracteres" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "CPF"),
                onSaved: (val) => cpf = val!.trim(),
                validator: (val) => val!.isEmpty ? "Campo obrigatório" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Telefone"),
                keyboardType: TextInputType.phone,
                onSaved: (val) => telefone = val!.trim(),
                validator: (val) => val!.isEmpty ? "Campo obrigatório" : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : _cadastrarUsuario,
                child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cadastrarUsuario() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => isLoading = true);

    try {
      // Cria usuário no Firebase Auth
      final uid = await AuthService.cadastrarUsuario(email, senha);

      // Cria modelo Usuario
      Usuario usuario = Usuario(
        id: uid,
        nome: nome,
        email: email,
        cpf: cpf,
        telefone: telefone,
        dataNascimento: dataNascimento,
        tipo: 'cuidador',
      );

      // Salva no Firestore
      await DBService.salvarUsuario(usuario);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cadastro realizado com sucesso!")),
      );

      Navigator.pop(context); // Volta para a tela de login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
}
