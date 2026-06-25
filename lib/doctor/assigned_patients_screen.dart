import 'package:flutter/material.dart';
import '../../data/app_data.dart';

class AssignedPatientsScreen extends StatefulWidget {
  const AssignedPatientsScreen({super.key});

  @override
  State<AssignedPatientsScreen> createState() =>
      _AssignedPatientsScreenState();
}

class _AssignedPatientsScreenState
    extends State<AssignedPatientsScreen> {

  @override
  Widget build(BuildContext context) {

    final assignedPatients = AppData.requests
        .where(
          (request) =>
              request["doctorName"] ==
              "Dr. ${AppData.loggedDoctor}",
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Assigned Patients"),
      ),

      body: assignedPatients.isEmpty
          ? const Center(
              child: Text(
                "No Patient Requests",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: assignedPatients.length,
              itemBuilder: (context, index) {

                final patient =
                    assignedPatients[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: Padding(
                    padding:
                        const EdgeInsets.all(15),

                    child: Column(
                      children: [

                        ListTile(
                          leading:
                              const CircleAvatar(
                            child:
                                Icon(Icons.person),
                          ),

                          title: Text(
                            patient["patientName"],
                          ),

                          subtitle: Text(
                            patient["status"],
                          ),
                        ),

                        Row(
                          children: [

                            Expanded(
                              child:
                                  ElevatedButton(
                                onPressed: () {

                                  setState(() {
                                    patient["status"] =
                                        "Accepted";
                                  });

                                },

                                style:
                                    ElevatedButton
                                        .styleFrom(
                                  backgroundColor:
                                      Colors.green,
                                ),

                                child: const Text(
                                  "Accept",
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child:
                                  ElevatedButton(
                                onPressed: () {

                                  setState(() {
                                    patient["status"] =
                                        "Rejected";
                                  });

                                },

                                style:
                                    ElevatedButton
                                        .styleFrom(
                                  backgroundColor:
                                      Colors.red,
                                ),

                                child: const Text(
                                  "Reject",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}