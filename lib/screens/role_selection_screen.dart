import 'package:flutter/material.dart';
import 'doctor_login_screen.dart';
import 'patient_login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.health_and_safety,
              size: 100,
              color: Color(0xFF2F80ED),
            ),

            const SizedBox(height: 30),

            const Text(
              "Select Your Role",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PatientLoginScreen(),
                    ),
                  );
                },
                child: const Text("Patient"),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DoctorLoginScreen(),
                    ),
                  );
                },
                child: const Text("Doctor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}