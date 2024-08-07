class Leavemodel {
  final String fromDate;
  final String toDate;
  final String purpose;
  final String resumeDate;

  Leavemodel(
      {required this.fromDate,
        required this.toDate,
        required this.purpose,
        required this.resumeDate}
      );

  Map<String, dynamic> toMap(){
    return {
      'FromDate' : fromDate,
      'ToDate' : toDate,
      'Purpose' : purpose,
      'ResumeDate' : resumeDate
    };
  }

  factory Leavemodel.fromJson(Map<String, dynamic> json){
    return Leavemodel(
        fromDate: json['FromDate'],
        toDate: json['ToDate'],
        purpose: json['Purpose'],
        resumeDate: json['ResumeDate']);
  }
}
