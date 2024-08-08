import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigationdrawer extends StatelessWidget {
  const Navigationdrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 150,
          child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF13322A),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline,
                        color: Color(0xFF13322A)),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Rohit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        'App Developer',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title:
          Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => {}, // Navigate to Home tab
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title:
          Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () =>
          {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()))
          }
        ),
        ListTile(
          leading: Icon(Icons.meeting_room),
          title:
          Text('Meeting', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () =>
          {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => WorkScreen()))
          }
        ),
        ListTile(
          leading: Icon(Icons.work),
          title:
          Text('Work', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () =>
          {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => WorkScreen())),
          }
        ),
        ListTile(
          leading: Icon(Icons.money),
          title: Text('Expense',
              style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ExpanseScreen()))
          }, // Navigate to ExpanseScreen
        ),
        ListTile(
          leading: Icon(Icons.directions_walk),
          title: Text('Site Visit',
              style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SiteVisitScreen()))
          }, // Navigate to SiteVisitScreen
        ),
        ListTile(
          leading: Icon(Icons.remove),
          title:
          Text('Leave', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveScreen()))
          }, // Navigate to LeaveScreen
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text(
            'LogOut',
            style:
            TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          onTap: () => {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => LoginScreen()))
          }, // Navigate to LeaveScreen
        ),
      ],
    ),
  );
}