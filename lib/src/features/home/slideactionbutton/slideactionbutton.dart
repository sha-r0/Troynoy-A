import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideActionbutton extends StatelessWidget {
  const SlideActionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16, // Adjust bottom position as needed
      child: Padding(
        padding: EdgeInsets.only(right: 85, left: 16),
        child: SlideAction(
          sliderButtonIconPadding: 10,
          height: 57,
          onSubmit: () async{
            // QuerySnapshot snap = await FirebaseFirestore.instance
            //     .collection('Employee Details').where('EmployeeId',isEqualTo: user?.EmployeeId)
            //     .get();
            // print(snap.docs[0].id);
            //
            // DocumentSnapshot snap2 = await FirebaseFirestore.instance
            //     .collection('Employee Details')
            //     .doc(snap.docs[0].id)
            //     .collection('Attendence')
            //     .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            //     .get();

            try{
              // String CheckIn = snap2['Check In'];
              // setState(() {
              //   CheckOut = DateFormat('hh:mm').format(DateTime.now());
              // });
              // await FirebaseFirestore.instance
              //     .collection('Employee Details')
              //     .doc(snap.docs[0].id)
              //     .collection('Attendence')
              //     .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              //     .update({
              //   'Check In' : CheckIn,
              //   'Check Out' : DateFormat('hh:mm').format(DateTime.now()),
              // });
            }catch(e){
              // setState(() {
              //   CheckIn = DateFormat('hh:mm').format(DateTime.now());
              // });
              // await FirebaseFirestore.instance
              //     .collection('Employee Details')
              //     .doc(snap.docs[0].id)
              //     .collection('Attendence')
              //     .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              //     .set({
              //   'Check In' : DateFormat('hh:mm').format(DateTime.now()),
              //   'Check Out' : CheckOut
              // });
            }
            // openCamera();
            // _getCurrentLocation();
            // fetchdateandtime();
          },
          text: 'Slide to check in',
          textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          innerColor: Colors.white.withOpacity(0.5),
          outerColor: Color(0xff13322A),
        ),
      ),
    );
  }
}