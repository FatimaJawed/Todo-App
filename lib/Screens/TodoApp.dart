import 'package:flutter/material.dart';
import '../ColorPlatte/color.dart'; // Ensure these files are correctly imported
import '../Models/models.dart';
import '../items.dart';
import 'About.dart';
import 'LoginScreen.dart';
import 'Profile.dart';
import 'Settings.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  final List<Todo> todoList = Todo.todolist();
  final List<Todo> _foundTasks = []; // List for filtered tasks
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foundTasks.addAll(todoList); // Initially display all tasks
    _searchController.addListener(_filterTasks); // Listen to search input
  }

  void _addTask(String taskText) {
    setState(() {
      todoList.add(Todo(
        id: DateTime.now().toString(),
        todoText: taskText,
      ));
      _foundTasks.add(todoList.last); // Add to filtered list as well
    });
    _taskController.clear();
  }

  void _deleteTask(String id) {
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
      _foundTasks.removeWhere((todo) => todo.id == id);
    });
  }

  void _toggleTask(String id) {
    setState(() {
      final todo = todoList.firstWhere((todo) => todo.id == id);
      todo.isDone = !(todo.isDone ?? false);
    });
  }

  void _filterTasks() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      _foundTasks.clear();
      if (searchText.isEmpty) {
        _foundTasks.addAll(todoList);
      } else {
        _foundTasks.addAll(todoList.where(
              (todo) => todo.todoText!.toLowerCase().contains(searchText),
        ));
      }
    });
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Add Your Task Here"),
        content: TextField(
          cursorColor: Colors.blue,
          controller: _taskController,
          decoration: const InputDecoration(
            hintText: "Enter your task here",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                _addTask(_taskController.text);
              }
              Navigator.of(context).pop();
            },
            child: const Text("Add", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Column(
                  children: [
                    // Profile Image
                    Container(
                      height: 130,
                      width: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: const Image(
                          image: AssetImage('assets/fatimajawed.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Name
                    const Text(
                      'Fatima Jawed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Bio/Description
                    Text(
                      'Flutter Developer | Tech Enthusiast',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Divider
            Divider(color: Colors.blue[300], thickness: 1),
            const SizedBox(height: 10),
            // Navigation Items
            Expanded(
              child: ListView(
                children: [
                  _drawerItem(
                    icon: Icons.home ,
                    title: 'Home',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Todoapp()));
                    },
                  ),
                  _drawerItem(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                  ),
                  _drawerItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      // Close the drawer first
                      Navigator.pop(context);

                      // Navigate to the settings screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TodoNotificationSettingView()),
                      );
                    },
                  ),

                  _drawerItem(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                    },
                  ),
                ],
              ),
            ),
            // Logout Section
            Divider(color: Colors.blue[300], thickness: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.blue),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
              },
            ),
          ],
        ),
      ),
      backgroundColor: whitecolor,
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: _searchBar(),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
                  child: const Text(
                    'Your Tasks, All Set!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                for (Todo todo in _foundTasks)
                  TodoItems(
                    todo: todo,
                    onDelete: _deleteTask,
                    onToggle: _toggleTask,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: whitecolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(image: AssetImage("assets/fatimajawed.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "Find your task here!",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _drawerItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}
