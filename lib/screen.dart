import 'package:assignment2/cityCard.dart';
import 'package:flutter/material.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  final List<Map<String, String>> cityData = [
    {
      'name': 'Bangladesh',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWG0NfwhJETYaARU2nUeRJIzU_M8qLsa85vg&s',
    },
    {
      'name': 'India',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdxf0km-LMUMRec9qQFPmcQ7PBrbI1FzBIxg&s',
    },
    {
      'name': 'Pakistan',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqzgTWff9Z1NxvKeiZKngAAVkVDyRabxYXGw&s',
    },
    {
      'name': 'India',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdxf0km-LMUMRec9qQFPmcQ7PBrbI1FzBIxg&s',
    },
    {
      'name': 'UK',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
    },
    {
      'name': 'UK',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
    },
    {
      'name': 'India',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdxf0km-LMUMRec9qQFPmcQ7PBrbI1FzBIxg&s',
    },
    {
      'name': 'UK',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
    },
    {
      'name': 'Bangladesh',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWG0NfwhJETYaARU2nUeRJIzU_M8qLsa85vg&s',
    },
    {
      'name': 'UK',
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
    },
    {
      'name': 'Bangladesh',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWG0NfwhJETYaARU2nUeRJIzU_M8qLsa85vg&s',
    },
    {
      'name': 'Bangladesh',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWG0NfwhJETYaARU2nUeRJIzU_M8qLsa85vg&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (screenWidth >= 1200) {
      crossAxisCount = 4;
    } else if (screenWidth >= 800) {
      crossAxisCount = 3;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text(
          "Grid View",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: cityData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return CityCard(
              name: cityData[index]['name']!,
              url: cityData[index]['url']!,
            );
          },
        ),
      ),
    );
  }
}
