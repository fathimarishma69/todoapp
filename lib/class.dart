class Task {
  final String title;
  final String description;
  final DateTime dateTime; // New property for date and time
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dateTime, // Initialize the new property
    this.isCompleted = false, // Default value for isCompleted
  });
}
