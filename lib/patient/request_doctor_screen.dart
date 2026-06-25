import 'package:flutter/material.dart';
import '../../data/app_data.dart';

class RequestDoctorScreen extends StatelessWidget {
  const RequestDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      "Dr. Hasbi",
      "Dr. Sarah",
      "Dr. Ayis",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Doctor"),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(doctors[index]),
              subtitle: const Text("Dental Specialist"),
              trailing: ElevatedButton(
                onPressed: () {
                  AppData.requests.add({
                    "patientName": AppData.loggedPatient,
                    "doctorName": doctors[index],
                    "status": "Waiting",
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Request sent to ${doctors[index]}",
                      ),
                    ),
                  );
                },
                child: const Text("Request"),
              ),
            ),
          );
        },
      ),
    );
  }
}