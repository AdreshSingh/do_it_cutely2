import 'package:do_it_cutely2/domain/model/todo.dart';
import 'package:flutter/material.dart';

class TodoDetailpage extends StatelessWidget {
  const TodoDetailpage({super.key, required this.todo});

  final Todo? todo;

  final String title = """
Create todos, you see them in detail, and make a lot of them. 
 1. double tap to complete todos.
 2. single to see them in details.
 3. Goodluck 🍀+ 🔥 
 ---------------- 
 While on cleaning up: 
 1. press single one tap to see in detail.
 2. long press on a single todo makes it delete forever.
 Once gone, Never come back,
 There are still bugs but if u encounter, happy to say it to me....
 Arpit 
 email: arpit20096063242@gmail.com """;

  @override
  Widget build(BuildContext context) {
    Todo backupTodo = Todo(
        id: 1734138298662278,
        title: "Help Here! 🔥",
        text: title,
        isDone: true);
    backupTodo = todo ?? backupTodo;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (Colors.red[300])!.withOpacity(.27),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 8.0,
                    bottom: 8.0,
                    right: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //? title
                      SingleChildScrollView(
                        child: Text(
                          backupTodo.title,
                          style: TextStyle(
                            color: Colors.red[100],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //gaps
                      const SizedBox(height: 10),

                      // ? date
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${DateTime.fromMicrosecondsSinceEpoch(backupTodo.id).toLocal()}",
                          style: TextStyle(
                            color: Colors.red[100],
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),

                      // gaps
                      const SizedBox(height: 10),
                      //? content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            backupTodo.text,
                            style: TextStyle(
                              color: Colors.red[100],
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //? completed or incompleted
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red[300],
              ),
              child: Text(
                backupTodo.isDone ? "<- Completed" : "<- Incomplete",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
