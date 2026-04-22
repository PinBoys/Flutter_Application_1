import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart'; 

class DetailProfile extends StatefulWidget {
  final Profile profile;
  const DetailProfile({super.key, required this.profile});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {

  void _navigateToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(profile: widget.profile),
      ),
    );

    if (result != null && result is Profile) {
      setState(() {
        widget.profile.name = result.name;
        widget.profile.bio = result.bio;
        widget.profile.desc52 = result.desc52;
      });
      Fluttertoast.showToast(msg: "Data berhasil diperbarui!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: const Color.fromARGB(255, 216, 220, 168),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://easydrawingguides.com/wp-content/uploads/2021/04/Patrick-Star-Step-10.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.profile.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.profile.bio,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            Text(
              widget.profile.desc52,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navigateToEdit,
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}