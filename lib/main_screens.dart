import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/screens/todo_page.dart';
import 'package:todo_list/screens/update_todo.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1F1338),),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: TodoPage.routeName,
      onGenerateRoute: (settings){
        switch(settings.name){
          case TodoPage.routeName :
            return MaterialPageRoute(builder: (context){
              return const TodoPage();
            },
              settings: const RouteSettings(
                name: TodoPage.routeName,
              ),
            );
          case UpdateTodo.routeName:  
            return MaterialPageRoute(builder: (context){
              return UpdateTodo(todo: settings.arguments as Todo?);
            },
            settings: const RouteSettings(
              name: UpdateTodo.routeName,
            ),
            );
        }
        return null;
      },
    );
  }
}
