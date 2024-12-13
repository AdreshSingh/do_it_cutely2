import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:do_it_cutely2/views/todo_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomeview extends StatefulWidget {
  const TodoHomeview({super.key});

  @override
  State<TodoHomeview> createState() => _TodoHomeviewState();
}

class _TodoHomeviewState extends State<TodoHomeview> {
  final List<Todo> todoData = [
    Todo(id: 1, title: "first", text: "we are at one step"),
    Todo(id: 2, title: "second", text: "we are at 2nd step", isDone: true),
    Todo(id: 3, title: "first-1", text: "we are at one step"),
    Todo(id: 4, title: "second", text: "we are at 2nd step", isDone: true),
    Todo(id: 5, title: "first-2", text: "we are at one step"),
    Todo(id: 6, title: "second", text: "we are at 2nd step", isDone: true),
  ];

  @override
  void initState() {
    super.initState();

    // emitting default stored list to create UI
    context.read<TodoCubit>().loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    // final List<Todo> todo = todoData.where((item) => !item.isDone).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // todo pic
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/bear.png",
                fit: BoxFit.fitWidth,
                // height: MediaQuery.of(context).size.height * .4,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                if (kDebugMode) {
                  print((await todoCubit.todoRepo.getTodos()).length);
                }
              },
              child: const Text("check")),
          // To To-do
          Text(
            "To To-do",
            style: TextStyle(
                color: Colors.red[100],
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child:
                BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
              //? filtering out incomplelte one
              final todoIncomplete =
                  todos.where((todo) => (!todo.isDone)).toList();

              //? Build Todo UI
              return ListView.builder(
                itemBuilder: (context, index) {
                  Todo data = todoIncomplete[index];

                  return GestureDetector(
                    onLongPress: () {
                      todoCubit.toggleCompletion(data);
                    },
                    child: TodoWidget(
                      title: data.title,
                      text: data.text,
                    ),
                  );
                },
                itemCount: todoIncomplete.length,
                scrollDirection: Axis.horizontal,
              );
            }),
          ),

          const SizedBox(
            height: 10,
          ),

          // Todos' i done
          Text(
            "Todos' I done",
            style: TextStyle(
                color: Colors.red[100],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),

          // spacing
          const SizedBox(
            height: 10,
          ),

          Expanded(
            child:
                BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
              // filtering completeone
              final List<Todo> todoDone =
                  todos.where((item) => item.isDone).toList();
              return ListView.builder(
                itemBuilder: (context, index) {
                  Todo data = todoDone[index];

                  return TodoWidget(
                    title: data.title,
                    text: data.text,
                  );
                },
                itemCount: todoDone.length,
                scrollDirection: Axis.horizontal,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String title;
  final String text;

  const TodoWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: (Colors.red[300])!.withOpacity(.27),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icon
            Icon(
              Icons.cruelty_free,
              color: Colors.red[100],
              size: 60,
            ),
            // short heading
            Text(
              title,
              style: TextStyle(
                  color: Colors.red[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
