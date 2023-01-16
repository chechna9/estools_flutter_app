//notes class
class Note {
  String id;
  String title;
  String description;
  String add_date;
  String category;
  Note({
    this.id = '',
    required this.title,
    required this.description,
    required this.add_date,
    required this.category,
  });

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['add_date'] = add_date;
    data['category'] = category;
    return data;
  }

  factory Note.fromJson(Map<String, dynamic> data) {
    return Note(
      id: data['_id'],
      title: data['title'],
      description: data['description'],
      add_date: data['add_date'],
      category: data['category'],
    );
  }
}
