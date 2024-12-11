import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:isar/isar.dart';

// ? to genrate the isar code
// ? dart run build_runner build
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String title;
  late String text;
  late bool isDone;

  // ? converts Isar todo to pure Todo
  Todo toDomain() {
    return Todo(
      id: id,
      title: title,
      text: text,
      isDone: isDone,
    );
  }

  // ? converts pure to Isar todo
  IsarTodo fromDomain(Todo todo) {
    return IsarTodo()
      ..id = todo.id
      ..title = todo.title
      ..text = todo.text
      ..isDone = todo.isDone;
  }
}
