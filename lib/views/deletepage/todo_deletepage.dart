import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:do_it_cutely2/views/todo_cubit.dart';
import 'package:do_it_cutely2/views/todo_detailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDeletepage extends StatefulWidget {
  const TodoDeletepage({super.key});

  @override
  State<TodoDeletepage> createState() => _TodoDeletepageState();
}

class _TodoDeletepageState extends State<TodoDeletepage> {
// for navigating to detail page
  void gotoScreen(Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => (TodoDetailpage(
          todo: todo,
        )),
      ),
    );
  }

  @override
  void initState() {
    context.read<TodoCubit>().loadTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, List<Todo>>(
      builder: (context, todos) {
        final deleteableTodos = todos.where((todo) => todo.isDone).toList();
        return ListView.builder(
          itemCount: deleteableTodos.length,
          itemBuilder: (context, index) {
            final todo = deleteableTodos[index];
            return GestureDetector(
              onLongPress: () {
                context.read<TodoCubit>().deleteTodo(todo);
              },
              onTap: () => (gotoScreen(todo)),
              child: Card(
                color: (Colors.red[300])!.withOpacity(.27),
                child: ListTile(
                  trailing: Icon(
                    Icons.cruelty_free,
                    color: Colors.red[100],
                    size: 50,
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                        color: Colors.red[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    todo.text,
                    style: TextStyle(
                        color: Colors.red[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
