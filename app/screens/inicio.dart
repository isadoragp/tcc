import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Barra de busca
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Procurar pacientes",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Conteúdo central (ainda vazio)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColors.secondary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Bem-vinda, Isadora!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Rodapé
            Container(
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 8),
                      Text("Agendamento de visitas"),
                    ],
                  ),
                  const Icon(Icons.settings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
