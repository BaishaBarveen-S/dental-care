import 'package:flutter/material.dart';
import '../../data/app_data.dart';
import 'request_doctor_screen.dart';
import 'chat_screen.dart';

class PatientDashboardScreen extends StatefulWidget {
  final String patientName;

  const PatientDashboardScreen({
    super.key,
    required this.patientName,
  });

  @override
  State<PatientDashboardScreen> createState() =>
      _PatientDashboardScreenState();
}

class _PatientDashboardScreenState
    extends State<PatientDashboardScreen> {

  String getPatientStatus() {
    for (var request in AppData.requests) {
      if (request["patientName"] ==
          widget.patientName) {
        return request["status"];
      }
    }
    return "No Request";
  }

  @override
  Widget build(BuildContext context) {
    String consultationStatus =
        getPatientStatus();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "DentalCare AI",
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                "Hi, ${widget.patientName} 👋",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20),
                  gradient:
                      const LinearGradient(
                    colors: [
                      Color(0xFF3B82F6),
                      Color(0xFF2563EB),
                    ],
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Patient ID",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "PAT001",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Consultation Status: $consultationStatus",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,

                children: [

                  GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const RequestDoctorScreen(),
                        ),
                      );

                      setState(() {});
                    },

                    child: _actionCard(
                      Icons.medical_services,
                      "Request Doctor",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                      if (consultationStatus ==
                          "Accepted") {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ChatScreen(),
                          ),
                        );

                      } else {

                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Chat unlocks after doctor accepts your request",
                            ),
                          ),
                        );
                      }
                    },

                    child: _actionCard(
                      Icons.chat_bubble_outline,
                      "Chat",
                    ),
                  ),

                  _actionCard(
                    Icons.description_outlined,
                    "Reports",
                  ),

                  _actionCard(
                    Icons.person_outline,
                    "Profile",
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.history,
                    color: Colors.blue,
                  ),

                  title: const Text(
                    "Consultation Status",
                  ),

                  subtitle: Text(
                    consultationStatus,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionCard(
    IconData icon,
    String title,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: const Color(0xFF2F80ED),
            size: 35,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}