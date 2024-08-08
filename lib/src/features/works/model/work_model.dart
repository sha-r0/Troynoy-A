class WorkModel {
  final String id;
  final String workTitle;
  final String companyName;
  final String date;
  final String workDescription; // Corrected the field name to be consistent
  final String fileUrl;

  WorkModel({
    required this.id,
    required this.workTitle,
    required this.companyName,
    required this.date,
    required this.workDescription, // Corrected the field name to be consistent
    required this.fileUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Included the id field in the map
      'title': workTitle,
      'date': date,
      'companyName': companyName,
      'workDescription': workDescription, // Ensured consistency in field naming
      'fileUrl': fileUrl,
    };
  }

  factory WorkModel.fromFirestore(Map<String, dynamic> map, String id) {
    return WorkModel(
      id: id,
      workTitle: map['title'] ?? '', // Added default values to avoid null issues
      companyName: map['companyName'] ?? '',
      date: map['date'] ?? '',
      workDescription: map['workDescription'] ?? '', // Corrected field name to be consistent
      fileUrl: map['fileUrl'] ?? '',
    );
  }
}
