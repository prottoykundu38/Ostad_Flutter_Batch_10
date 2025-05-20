import 'package:flutter/material.dart';

class Livetest2 extends StatefulWidget {
  const Livetest2({super.key});

  @override
  State<Livetest2> createState() => _Livetest2State();
}

class _Livetest2State extends State<Livetest2> {
  void _addTask() {
    if (taskController.text.isNotEmpty && numbercontroller.text.isNotEmpty) {
      setState(() {
        _tasks.add(taskController.text);
        _numbers.add(numbercontroller.text);
        taskController.clear();
        numbercontroller.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _numbers.removeAt(index);
    });
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: Text("Are you sure for delete ${_tasks[index]}"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {
                _deleteTask(index);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        );
      },
    );
  }

  final List<String> _tasks = [];
  final List<String> _numbers = [];
  
  final TextEditingController taskController = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Contact List",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numbercontroller,
              decoration: const InputDecoration(
                labelText: "Enter Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTask,
              child: const Text("Add"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => _showDeleteDialog(index),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          _tasks[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(_numbers[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
