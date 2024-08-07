// class WorkModel{
//   String id;
//   String workTitle;
//   String companyName;
//   String date;
//   String workdescription;
//   String fileUrl;
//
//   WorkModel({
//     required this.id,
//     required this.workTitle,
//     required this.companyName,
//     required this.date,
//     required this.workdescription,
//     required this.fileUrl
// })
//
//   Map<String, dynamic> toMap(){
//     return{
//       'title': workTitle,
//       'date': date,
//       'companyName': companyName,
//       'workdescription': workdescription,
//       'fileUrl': fileUrl,
//     };
//   }
//
//   factory WorkModel.fromFirestore(Map<String, dynamic> map )
//
// }