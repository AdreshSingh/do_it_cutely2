import 'package:do_it_cutely2/data/model/isar_todo.dart';
import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:do_it_cutely2/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

class IsarRepo extends TodoRepo {
  // database object
  final Isar db;

  IsarRepo({required this.db});

  // ? add new todo
  @override
  Future<void> addTodo(Todo newTodo) async {
    // ? convert the pure todo to Isar todo
    final isarTodo = IsarTodo().fromDomain(newTodo);

    // ? add into the isar database
    return db.writeTxn(() => db.isarTodos.put(isarTodo));
  }

  // ? to delete exisiting todo
  @override
  Future<void> deleteTodo(Todo todo) {
    // ? convert the pure todo to Isar todo
    final isarTodo = IsarTodo().fromDomain(todo);

    // ? delete todo from  the isar database
    return db.writeTxn(() => db.isarTodos.delete(isarTodo.id));
  }

  // ? to get the todos
  @override
  Future<List<Todo>> getTodos() async {
    // ?fetch from db
    final todos = await db.isarTodos.where().findAll();

    // ?return a list of todo and give them to domain layer
    return todos.map((todo) => todo.toDomain()).toList();
  }

  // ? to update the todos
  @override
  Future<void> updateTodo(Todo todo) {
    // ? convert the pure todo to Isar todo
    final isarTodo = IsarTodo().fromDomain(todo);

    // ? update the todo  the isar database
    return db.writeTxn(() => db.isarTodos.put(isarTodo));
  }
}
