import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/screens/update_todo.dart';
import 'package:todo_list/widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  static const routeName = '/todo';

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Công việc",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            final todos = todoProvider.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, UpdateTodo.routeName,
                        arguments: todo);
                  },
                  child: TodoItem(
                    title: todo.title,
                    content: todo.content,
                    deleteCallback: () {
                      context.read<TodoProvider>().deletedTodo(index);
                    },
                    completedCallback: () {
                      context.read<TodoProvider>().checkCompleted(index);
                    },
                    iconCheck: Icon(todo.isCompleted == true
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, UpdateTodo.routeName, arguments: null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
