import 'package:do_it_cutely2/views/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoFormview extends StatefulWidget {
  const TodoFormview({super.key});

  @override
  State<TodoFormview> createState() => _TodoFormviewState();
}

class _TodoFormviewState extends State<TodoFormview> {
  final title = TextEditingController();
  final text = TextEditingController();
  final symbol = 0;

  static const List<IconData> data = [
    Icons.cruelty_free,
    Icons.pets,
    Icons.emoji_nature,
    Icons.nightlight,
  ];
  IconData dropDownValue = data.first;

  // store new todo
  void addTodo(BuildContext context) async {
    // created cubit reference
    final todoCubit = context.read<TodoCubit>();

    // added new todo to database
    await todoCubit.addTodo(title.text, text.text);

    // cleared old data
    title.clear();
    text.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Colors.red[100] as Color,
          Colors.blue[100] as Color,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            TextField(
              controller: title,
              decoration: InputDecoration(
                filled: true,
                hintText: "add title your here",
                label: const Text("Heading"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // text
            TextField(
              controller: text,
              minLines: 4,
              maxLines: 8,
              decoration: InputDecoration(
                filled: true,
                hintText: "now define it here",
                label: const Text("Your todo here.."),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //space
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // submit button
                OutlinedButton(
                  onPressed: () {
                    addTodo(context);
                  },
                  child: const Text("Note✒"),
                ),

                DropdownButton(
                  hint: const Text("select type"),
                  items: data
                      .map<DropdownMenuItem<int>>(
                        (icon) => (DropdownMenuItem(
                          value: data.indexOf(icon),
                          child: Icon(icon),
                        )),
                      )
                      .toList(),
                  onChanged: (value) {
                    debugPrint(value.toString());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
