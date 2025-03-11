import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contador: ${context.watch<CounterProvider>().counter}",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterProvider>().increment(),
              child: Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
