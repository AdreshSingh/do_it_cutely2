import 'package:flutter/material.dart';

class TodoDetailpage extends StatefulWidget {
  const TodoDetailpage({super.key});

  @override
  State<TodoDetailpage> createState() => _TodoDetailpageState();
}

class _TodoDetailpageState extends State<TodoDetailpage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cute_board.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 35,
              right: 30,
              left: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            width: 200,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(243, 224, 224, 224),
                  Color.fromARGB(245, 182, 182, 182),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  color: Color.fromARGB(130, 0, 0, 0),
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 10.0,
                    color: Colors.grey,
                    spreadRadius: 1.0)
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),

                    // date
                    Text(
                      "29-july-2024",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                // text
                Text("I am creating cute app"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
