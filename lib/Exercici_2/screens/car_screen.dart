import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';

class CarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Coches')),
      body: carProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];
                return ListTile(
                  title: Text(car.make),
                  subtitle: Text(car.model),
                  trailing: Text(car.year.toString()),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => carProvider.fetchCars(),
      ),
    );
  }
}
