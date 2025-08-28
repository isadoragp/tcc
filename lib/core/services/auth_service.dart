import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Cadastra usuário com email e senha
  static Future<String> cadastrarUsuario(String email, String senha) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return cred.user!.uid; // retorna o UID do usuário criado
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Erro ao cadastrar usuário";
    }
  }

  /// Faz login do usuário com email e senha
  static Future<String> loginUsuario(String email, String senha) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return cred.user!.uid; // retorna o UID do usuário logado
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Erro ao fazer login";
    }
  }

  /// Faz logout do usuário
  static Future<void> logout() async {
    await _auth.signOut();
  }

  /// Retorna o usuário atualmente logado (ou null)
  static User? get usuarioAtual => _auth.currentUser;
}

