class SiteVisitModel {
  final String id;
  String siteName;
  String location;
  String purpose;
  String contactpersonname;
  String contactno;
  String date;
  String time;
  bool isvisit;

  SiteVisitModel({
    required this.id,
    required this.siteName,
    required this.location,
    required this.purpose,
    required this.contactpersonname,
    required this.contactno,
    required this.date,
    required this.time,
    required this.isvisit,
  });


  factory SiteVisitModel.fromFirebase(Map<String, dynamic> map, String id) {
    return SiteVisitModel(
      id: id,
      siteName: map['siteName'] ?? '',
      location: map['location'] ?? '',
      purpose: map['purpose'] ?? '',
      contactpersonname: map['contact_person_name'] ?? '',
      contactno: map['contact_no'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      isvisit: map['mark_as_visited'] ?? false,
    );
  }
}
