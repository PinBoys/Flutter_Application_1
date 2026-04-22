import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id: lastIndex + 1,
          name: "Gopin ${lastIndex + 1}",
          bio: "Mahasigma",
          desc52: "Harharhar",
        ),
      );
    });
  }

  void deleteItem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Profile')),

      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];

          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteItem(index);

              Fluttertoast.showToast(
                msg: "Profile ${deletedItem.name} dihapus",
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://easydrawingguides.com/wp-content/uploads/2021/04/Patrick-Star-Step-10.png',
                ),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.bio),

              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProfile(profile: profile),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}