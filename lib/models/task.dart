class Task {
  String id;
  String title;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  // Converter Task para Map (útil para salvar no banco ou Supabase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'is_completed': isCompleted,
    };
  }

  // Criar Task a partir de Map (exemplo de dado do banco)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['is_completed'] as bool? ?? false,
    );
  }
}
