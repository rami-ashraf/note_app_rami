class NoteModel {
  String headline;
  String description;
  DateTime createdAt;

  NoteModel({
    required this.headline,
    required this.description,
    required this.createdAt,
  });

  // Convert NoteModel to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create NoteModel from JSON (Map)
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      headline: json['headline'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  String toString() {
    return 'NoteModel(headline: $headline, description: $description, createdAt: $createdAt)';
  }
}
