import 'package:flutter/material.dart';
import 'car.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Car car = cars[0];

  void updateCar(Car c) {
    setState(() {
      car = c;
    });
  }

  void updateWarranty(int years) {
    setState(() {
      car.warranty = years;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Model'),
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 10),
        CarsMenu(updateCar: updateCar),
        const SizedBox(height: 10),
        WarrantyWidget(car: car, updateWarranty: updateWarranty),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Insurance: ', style: TextStyle(fontSize: 18)),
          Checkbox(value: car.insurance, onChanged: (value) => setState(() {
            car.insurance = value as bool;
          }))
        ]),
        const SizedBox(height: 10),
        Text('Total Price: ${car.getTotalPrice()}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ])

      ),
    );
  }
}
