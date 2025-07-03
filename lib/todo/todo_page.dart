import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  bool done;

  Todo({
    required this.id,
    required this.title,
    this.done = false,
  });
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todos = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    final text = _taskController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos.add(Todo(id: DateTime.now().toString(), title: text));
      _taskController.clear();
    });
  }

  void _toggleDone(Todo todo) {
    setState(() {
      todo.done = !todo.done;
    });
  }

  void _editTask(Todo todo) {
    _taskController.text = todo.title;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Editar Tarefa'),
        content: TextField(
          controller: _taskController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Nova descrição'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _taskController.clear();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final newText = _taskController.text.trim();
              if (newText.isNotEmpty) {
                setState(() {
                  todo.title = newText;
                });
              }
              _taskController.clear();
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _deleteTask(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _todos.isEmpty
                ? const Center(child: Text('Nenhuma tarefa ainda.'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (_, index) {
                      final todo = _todos[index];
                      return ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.done
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.done,
                          onChanged: (_) => _toggleDone(todo),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editTask(todo),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteTask(todo),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}