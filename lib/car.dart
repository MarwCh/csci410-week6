import 'package:flutter/material.dart';

class Car {
  String model;
  int price;
  int warranty = 1;
  bool insurance = false;

  Car(this.model, this.price);

  @override
  String toString() {
    return 'Model: $model Price: \$$price';
  }

  String getTotalPrice() {
    int insuranceAmount = insurance ? 1000: 0;

    if (warranty == 1) {
      return (price * 1.05 + insuranceAmount).toStringAsFixed(0);
    }
    else {
      return (price * 1.1 + insuranceAmount).toStringAsFixed(0);
    }
  }
}

List<Car> cars = [
  Car('BMW', 10000),
  Car('Honda', 12000),
  Car('Toyota', 8000),
  Car('Hyundai', 20000),
];

class CarsMenu extends StatelessWidget {
  final Function(Car) updateCar;

  const CarsMenu({required this.updateCar, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        onSelected: (car) => updateCar(car as Car),
        width: 300,
        initialSelection: cars[0],
        dropdownMenuEntries: cars.map((Car? car) => DropdownMenuEntry(value: car, label: car.toString())).toList()
    );
  }
}

class WarrantyWidget extends StatelessWidget {
  final Car car;
  final Function(int) updateWarranty;

  const WarrantyWidget({required this.car, required this.updateWarranty, super.key});

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      onChanged: (years) {
        updateWarranty(years as int);
      },
      groupValue: car.warranty,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Warranty '),
        Radio(value: 1),
        const Text('1 year '),
        Radio(value: 5),
        const Text('5 year '),
      ]),
    );
  }
}

