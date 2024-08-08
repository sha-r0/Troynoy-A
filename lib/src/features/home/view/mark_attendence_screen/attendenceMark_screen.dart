import 'dart:io';
import 'package:flutter/material.dart';

class AttendenceScreen extends StatefulWidget {
  final File? imageFile;
  final String Address;
  final String currentDate;
  final String currentTime;

  const AttendenceScreen({
    Key? key,
    this.imageFile,
    required this.Address,
    required this.currentDate,
    required this.currentTime,
  }) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF13322A),
        title: Text(
          'Attendance',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Rohit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF13322A),
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Employee id :',
                  style: TextStyle(
                    color: Color(0xFF13322A),
                    fontSize: 20,
                  ),
                ),
                Text(
                  'TA01',
                  style: TextStyle(
                    color: Color(0xFF13322A),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              height: 200,
              width: 200,
              color: Colors.grey,
              child: widget.imageFile != null
                  ? Image.file(
                widget.imageFile!,
                height: 200,
                fit: BoxFit.fill,
              )
                  : CircularProgressIndicator(),
            ),
            SizedBox(height: 25),
            Text(
              'Check In',
              style: TextStyle(
                color: Color(0xFF13322A),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.currentTime,
              style: TextStyle(
                color: Color(0xFF13322A),
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.Address,
                      style: TextStyle(
                        color: Color(0xFF13322A),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(Icons.map, color: Color(0xFF13322A), size: 40),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF13322A),
              ),
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  'Check In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
