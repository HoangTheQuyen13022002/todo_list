import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/todo_provider.dart';

import '../models/todo.dart';
import '../widgets/text_form.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.todo});

  final Todo? todo;

  static const routeName = "/update_todo";

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final _keyForm = GlobalKey<FormState>();

  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    // Initialize the fields if editing an existing Todo
    _title = widget.todo?.title ?? "";
    _content = widget.todo?.content ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.todo == null ? "Thêm mới" : "Chỉnh sửa",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextForm(
                  label: 'title',
                  value: _title,
                  onSaved: (value) {
                    _title = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextForm(
                  label: 'content',
                  value: _content,
                  onSaved: (value) {
                    _content = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();

                        if (widget.todo == null) {
                          // Adding new Todo
                          final todo = Todo(
                              title: _title,
                              content: _content,
                              isCompleted: false);
                          context.read<TodoProvider>().addTodo(todo);
                        } else {
                          // Updating an existing Todo
                          final updatedTodo = Todo(
                            title: _title,
                            content: _content,
                            isCompleted: widget.todo!.isCompleted,
                          );
                          final todoIndex = context
                              .read<TodoProvider>()
                              .todos
                              .indexOf(widget.todo!);
                          context
                              .read<TodoProvider>()
                              .updateTodo(todoIndex, updatedTodo);
                        }
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      widget.todo == null ? "Thêm mới" : "Chỉnh sửa",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
