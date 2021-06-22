class Todo {
  String title;
  bool isComplete = false;
  Todo(this.title);
  toggleComplete() {
    isComplete = !isComplete;
  }

  update(String val) {
    title = val;
  }
}
