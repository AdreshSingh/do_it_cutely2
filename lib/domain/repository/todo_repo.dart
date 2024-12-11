//? Phase 2
//* Outlines what app can do, a pure abstract dart class file
/*
* Technology Agnostic
? must not be dependent on other technology
*/
import 'package:do_it_cutely2/domain/model/todo.dart';

abstract class TodoRepo {
//? get the list of todos
  Future<List<Todo>> getTodos();

//? add new todo
  Future<void> addTodo(Todo newTodo);

//? update the existing todo
  Future<void> updateTodo(Todo todo);

//? delete the todo
  Future<void> deleteTodo(Todo todo);
}
