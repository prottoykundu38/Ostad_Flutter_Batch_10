import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();

  String fromUnit = 'meter';
  String toUnit = 'cm';
  String result = '';

  final Map<String, double> conversion = {
    'meter': 1.0,
    'cm': 100,
    'kilometer': 0.001,
    'inches': 39.37,
    'feet': 3.28,
  };

  void convert() {
    double? input = double.tryParse(_controller.text);
    if (input != null) {
      double baseValue = input / conversion[fromUnit]!;
      double convertedValue = baseValue * conversion[toUnit]!;
      setState(() {
        result = '$input $fromUnit = ${convertedValue.toStringAsFixed(4)} $toUnit';
      });
    } else {
      setState(() {
        result = 'Please enter a valid number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unit Converter',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'From:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                DropdownButton(
                  value: fromUnit,
                  items: conversion.keys.map((index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                ),
                const SizedBox(width: 30),
                const Text(
                  'To:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                DropdownButton(
                  value: toUnit,
                  items: conversion.keys.map((index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
