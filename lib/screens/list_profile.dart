import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugas1/models/profile.dart';
import 'package:tugas1/screens/detail_profile.dart';
import 'package:tugas1/screens/edit_profile.dart';

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
          step: 52,
          name: "Gopin ${lastIndex + 1}",
          bio: "Flutter Developer",
          phone: "009111111$lastIndex",
        ),
      );
    });
  }

  void deleteItem(int index) {
    setState(() {
      final deleted = profiles[index];
      profiles.removeAt(index);
      Fluttertoast.showToast(msg: "${deleted.name} dihapus");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Profile')),
      body: profiles.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];

                return Dismissible(
                  key: Key(profile.id.toString()),
                  onDismissed: (direction) {
                    deleteItem(index);
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://easydrawingguides.com/wp-content/uploads/2021/04/Patrick-Star-Step-10.png'),
                    ),
                    title: Text(profile.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profile.bio),
                        const SizedBox(height: 4),
                        Text(
                          profile.phone,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final updatedProfile = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProfile(
                            nama: profile.name,
                            angka: profile.step,
                          ),
                        ),
                      );

                      if (updatedProfile != null) {
                        setState(() {
                          profiles[index] = updatedProfile;
                        });
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: addItem,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              if (profiles.isNotEmpty) {
                deleteItem(profiles.length - 1);
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}