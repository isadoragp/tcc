import 'package:cloud_firestore/cloud_firestore.dart';
import '../modelos/user_model.dart';
import '../modelos/caregiver_model.dart';
import '../modelos/elder_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ========================= USUARIO =========================
  Future<void> addUser(UserModel user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String id) async {
    final doc = await _db.collection('users').doc(id).get();
    if (doc.exists) return UserModel.fromMap(doc.data()!);
    return null;
  }

  Future<void> updateUser(UserModel user) async {
    await _db.collection('users').doc(user.id).update(user.toMap());
  }

  Future<void> deleteUser(String id) async {
    await _db.collection('users').doc(id).delete();
  }

  Stream<List<UserModel>> getUsers() {
    return _db.collection('users').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => UserModel.fromMap(doc.data()))
            .toList());
  }

  // ====================== CUIDADOR ======================
  Future<void> addCaregiver(CaregiverModel caregiver) async {
    await _db.collection('caregivers').doc(caregiver.id).set(caregiver.toMap());
  }

  Future<CaregiverModel?> getCaregiver(String id) async {
    final doc = await _db.collection('caregivers').doc(id).get();
    if (doc.exists) return CaregiverModel.fromMap(doc.data()!);
    return null;
  }

  Future<void> updateCaregiver(CaregiverModel caregiver) async {
    await _db.collection('caregivers').doc(caregiver.id).update(caregiver.toMap());
  }

  Future<void> deleteCaregiver(String id) async {
    await _db.collection('caregivers').doc(id).delete();
  }

  Stream<List<CaregiverModel>> getCaregivers() {
    return _db.collection('caregivers').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => CaregiverModel.fromMap(doc.data()))
            .toList());
  }

  // ======================== IDOSO ========================
  Future<void> addElder(ElderModel elder) async {
    await _db.collection('elders').doc(elder.id).set(elder.toMap());
  }

  Future<ElderModel?> getElder(String id) async {
    final doc = await _db.collection('elders').doc(id).get();
    if (doc.exists) return ElderModel.fromMap(doc.data()!);
    return null;
  }

  Future<void> updateElder(ElderModel elder) async {
    await _db.collection('elders').doc(elder.id).update(elder.toMap());
  }

  Future<void> deleteElder(String id) async {
    await _db.collection('elders').doc(id).delete();
  }

  Stream<List<ElderModel>> getElders() {
    return _db.collection('elders').snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => ElderModel.fromMap(doc.data())).toList());
  }
}
