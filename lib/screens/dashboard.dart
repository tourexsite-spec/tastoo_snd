import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tastoo SND")),

      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {},
            child: const Text("Customers"),
          ),

          ElevatedButton(
            onPressed: () {},
            child: const Text("Products"),
          ),

          ElevatedButton(
            onPressed: () {},
            child: const Text("Invoices"),
          ),

          ElevatedButton(
            onPressed: () {},
            child: const Text("Payments"),
          ),

        ],
      ),
    );
  }
}
