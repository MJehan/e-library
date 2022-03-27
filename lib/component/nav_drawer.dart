import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_screen.dart';
import '../screens/profile.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           const DrawerHeader(
            decoration: BoxDecoration (
              gradient: LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(""), //images/scom_logo.png
              ),
            ),
            child: Text(
              'E-Library ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.red,),
            title: const Text('Profile'),
            onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Profile()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                FirebaseAuth.instance.signOut().then((_){
                  Navigator.pushNamed(context, LoginScreen.id);
                });
              },
            // onTap: () async {
            //   await _signOut();
            //   if (_firebaseAuth.currentUser == null) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const LoginScreen()),
            //     );
            //   }
            // },
          ),
        ],
      ),
    );
  }
}
