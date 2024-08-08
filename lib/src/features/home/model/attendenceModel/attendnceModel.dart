import 'dart:io';

class Attendncemodel {
  final String? imageUrl; // Use a String for image URL/path
  final String Address;
  final String currentDate;
  final String currentTime;

  Attendncemodel({
    this.imageUrl,
    required this.Address,
    required this.currentDate,
    required this.currentTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'image_url': imageUrl,
      'Address': Address,
      'currentDate': currentDate,
      'currentTime': currentTime,
    };
  }

  factory Attendncemodel.fromFirebase(Map<String, dynamic> json) {
    return Attendncemodel(
      imageUrl: json['image_url'],
      Address: json['Address'],
      currentDate: json['currentDate'],
      currentTime: json['currentTime'],
    );
  }
}
