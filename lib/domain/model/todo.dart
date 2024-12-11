//* phase 1
/* 
?Todo MODEL
* app has features:
-----------------
- id
- text
- isDone
-----------------
* mehod
toggleCompletion -> to toggle the completion
*/
class Todo {
  final int id;
  final String title;
  final String text;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.text,
    this.isDone = false, //? initialized with uncompleted status
  });

  Todo toggleCompletion(Todo todo) {
    return Todo(
      id: todo.id,
      title: todo.title,
      text: todo.text,
      isDone: !todo.isDone,
    );
  }
}
