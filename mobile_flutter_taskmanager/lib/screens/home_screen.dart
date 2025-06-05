import 'package:flutter/material.dart';
import 'package:mobile_flutter_taskmanager/screens/task_tile.dart';
import '../controller/task_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _controller = TaskController();
  final TextEditingController _textController = TextEditingController();

  void _addTask() {
    setState(() {
      _controller.addTask(_textController.text);
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _controller.tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional To-Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text('No tasks yet!'))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskTile(
                        task: task,
                        onToggle: () {
                          setState(() => _controller.toggleComplete(index));
                        },
                        onDelete: () {
                          setState(() => _controller.deleteTask(index));
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
