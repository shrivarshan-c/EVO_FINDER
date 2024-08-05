import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evo_finder/pages/profile/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit " + field),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter a new $field",
            hintStyle: TextStyle(
              color: Colors.green[700],
            ),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser!.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Section"),
        backgroundColor: Colors.green[50],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 10.w,
                  height: 50.h,
                  child: Image.asset(
                    "assets/images/user.png",
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  currentUser!.email!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "My Details",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                MyTextBox(
                  text: userData["username"],
                  sectionName: "Username",
                  onPressed: () => editField("username"),
                ),
                MyTextBox(
                  text: userData["vehicle-name"],
                  sectionName: "Vehicle Name",
                  onPressed: () => editField("vehicle-name"),
                ),
                MyTextBox(
                  text: userData["vehicle-number"],
                  sectionName: "Vehicle Number",
                  onPressed: () => editField("vehicle-number"),
                ),
                MyTextBox(
                  text: userData["mobile-number"],
                  sectionName: "Mobile Number",
                  onPressed: () => editField("mobile-number"),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error${snapshot.error}"));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
