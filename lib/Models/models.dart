class Todo {
  String? id;
  String? todoText;
  bool? isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false, // Default value
  });

  static List<Todo> todolist(){
    return [
      Todo(id: '1', todoText: "review client requirements." , isDone: true),
      Todo(id: '2', todoText: "Write a blog about the app development process." , isDone: false),
      Todo(id: '3', todoText: "Walk for 30 minutes as part of daily health goals." , isDone: true),
      Todo(id: '4', todoText: "Research new features to improve the app’s functionality." , isDone: true),
      Todo(id: '5', todoText: "Test and debug the app." , isDone: true),
    ];
  }

}
