import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/main_screens.dart';
import 'package:todo_list/provider/todo_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MainScreens(),
    ),
  );
}
