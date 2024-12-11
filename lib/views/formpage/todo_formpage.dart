import 'package:do_it_cutely2/domain/repository/todo_repo.dart';
import 'package:do_it_cutely2/views/formpage/todo_formview.dart';
import 'package:do_it_cutely2/views/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoFormpage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoFormpage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoFormview(),
    );
  }
}
