import 'package:flutter/material.dart';
import '../modelos/caregiver_model.dart';
import '../modelos/elder_model.dart';
import '../services/firestore_service.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Listagem"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Cuidadores"),
              Tab(text: "Idosos"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Listagem de cuidadores
            StreamBuilder<List<CaregiverModel>>(
              stream: firestoreService.getCaregivers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Nenhum cuidador cadastrado."));
                }

                final caregivers = snapshot.data!;
                return ListView.builder(
                  itemCount: caregivers.length,
                  itemBuilder: (context, index) {
                    final c = caregivers[index];
                    return ListTile(
                      title: Text(c.name),
                      subtitle: Text("CPF: ${c.cpf} | E-mail: ${c.email}"),
                      trailing: Text(c.phone),
                    );
                  },
                );
              },
            ),

            // Listagem de idosos
            StreamBuilder<List<ElderModel>>(
              stream: firestoreService.getElders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Nenhum idoso cadastrado."));
                }

                final elders = snapshot.data!;
                return ListView.builder(
                  itemCount: elders.length,
                  itemBuilder: (context, index) {
                    final e = elders[index];
                    return ListTile(
                      title: Text(e.name),
                      subtitle: Text("CPF: ${e.cpf} | Nasc: ${e.birthDate}"),
                      trailing: Text(e.healthNotes),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

