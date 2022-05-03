import 'package:flutter/material.dart';
import 'package:todo_crud/main.dart';

import '../widgets/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [Container(), Container()];
    return Scaffold(
      appBar: AppBar(
        title: const Text(TodoApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (selectedIndex) {
            setState(() {
              _selectedIndex = selectedIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Todos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'Completed',
            ),
          ]),
      body: tabs[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AddTodoDialogWidget()),
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
      ),
    );
  }
}
