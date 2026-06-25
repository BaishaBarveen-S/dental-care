import 'package:flutter/material.dart';
import '../../data/app_data.dart';
import 'doctor_dashboard_screen.dart';
import 'doctor_signup_screen.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({super.key});

  @override
  State<DoctorLoginScreen> createState() =>
      _DoctorLoginScreenState();
}

class _DoctorLoginScreenState
    extends State<DoctorLoginScreen> {

  final TextEditingController doctorNameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController registrationController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 30),

              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FF),
                  borderRadius:
                      BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.medical_services,
                  size: 70,
                  color: Color(0xFF2F80ED),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Welcome Back Doctor",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sign in to access your dashboard",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: doctorNameController,
                decoration: InputDecoration(
                  labelText: "Doctor Name",
                  prefixIcon:
                      const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon:
                      const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller:
                    registrationController,
                decoration: InputDecoration(
                  labelText:
                      "Medical Registration No",
                  prefixIcon: const Icon(
                    Icons.verified_user,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: hidePassword,

                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon:
                      const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword =
                            !hidePassword;
                      });
                    },
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2F80ED),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              16),
                    ),
                  ),

                  onPressed: () {

                    if (doctorNameController
                            .text
                            .trim()
                            .isEmpty ||
                        emailController.text
                            .trim()
                            .isEmpty ||
                        registrationController
                            .text
                            .trim()
                            .isEmpty ||
                        passwordController.text
                            .trim()
                            .isEmpty) {

                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please fill all fields",
                          ),
                        ),
                      );

                      return;
                    }

                    AppData.loggedDoctor =
                        doctorNameController
                            .text
                            .trim();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DoctorDashboardScreen(
                          doctorName:
                              doctorNameController
                                  .text
                                  .trim(),
                        ),
                      ),
                    );
                  },

                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  const Text(
                    "Don't have an account?",
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const DoctorSignupScreen(),
                        ),
                      );
                    },

                    child: const Text(
                      "Create Account",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}