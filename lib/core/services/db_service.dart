import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/usuario.dart';

class DBService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Salva usuário no Firestore
  static Future<void> salvarUsuario(Usuario usuario) async {
    try {
      await _db.collection('usuarios').doc(usuario.id).set(usuario.toMap());
    } catch (e) {
      throw "Erro ao salvar usuário: $e";
    }
  }

  /// Busca usuário pelo UID
  static Future<Usuario?> buscarUsuario(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('usuarios').doc(uid).get();
      if (doc.exists) {
        return Usuario.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw "Erro ao buscar usuário: $e";
    }
  }
}
