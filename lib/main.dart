import 'package:do_it_cutely2/data/model/isar_todo.dart';
import 'package:do_it_cutely2/data/repository/isar_repo.dart';
import 'package:do_it_cutely2/domain/repository/todo_repo.dart';
import 'package:do_it_cutely2/views/todo_detailpage.dart';
import 'package:do_it_cutely2/views/formpage/todo_formpage.dart';
import 'package:do_it_cutely2/views/homepage/todo_homepage.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // initialize all widget
  WidgetsFlutterBinding.ensureInitialized();

  // get the directory for the data storage
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);

  // initialize the repo
  final isarTodoRepo = IsarRepo(db: isar);

  // inject the database
  runApp(MyApp(
    todoRepo: isarTodoRepo,
  ));
}

class MyApp extends StatefulWidget {
  // getting the injection through main point
  final TodoRepo todoRepo;
  const MyApp({super.key, required this.todoRepo});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.bookmark_add),
      icon: Icon(Icons.bookmark_add_outlined),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.collections_bookmark_outlined),
      activeIcon: Icon(Icons.collections_bookmark),
      label: "Details",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final TodoRepo todoRepo = widget.todoRepo;
    final List<Widget> views = [
      TodoHomepage(todoRepo: todoRepo),
      TodoFormpage(todoRepo: todoRepo),
      const TodoDetailpage(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink[200],
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 38, 40),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          body: views[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            items: items,
            backgroundColor: const Color.fromARGB(255, 54, 52, 54),
            showUnselectedLabels: false,
            selectedItemColor: Colors.red[100],
            unselectedItemColor: Colors.red[200],
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
