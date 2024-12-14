/*
todo homepage cubit
? repomsible for handling statement
*/
import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:do_it_cutely2/domain/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // reference to todo repository
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]);

  // ! LOAD
  Future<void> loadTodos() async {
    // fetch the todos
    final todoList = await todoRepo.getTodos();

    // notify for state changes
    emit(todoList);
  }

  // ! ADD
  Future<void> addTodo(String title, String text) async {
    final todo = Todo(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title,
      text: text,
    );

    // ? add new todo to the database
    await todoRepo.addTodo(todo);

    // reloading the state
    loadTodos();
  }

  // ! DELETE
  Future<void> deleteTodo(Todo todo) async {
    // delete todo from Repo
    await todoRepo.deleteTodo(todo);

    // reloading the state
    loadTodos();
  }

  // ! UPDATE
  Future<void> updateTodo(Todo todo) async {
    // update the todo from Repo
    await todoRepo.updateTodo(todo);

    // reloading the state
    loadTodos();
  }

  // ! toggleCompletion
  Future<void> toggleCompletion(Todo todo) async {
    final updatedTodo = todo.toggleCompletion(todo);

    // update the repository
    await todoRepo.updateTodo(updatedTodo);

    // forgot to reload the new state
    loadTodos();
  }
}
