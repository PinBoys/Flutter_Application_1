import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/provider/profile_provider.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    final provider = context.read<ProfileProvider>();
    final newProfile = Profile(
      id: null,
      nim: "52",
      name: "Govin",
      bio: "Flutter Developer",
      phone20: "0812345678952",
    );
    provider.addProfile(newProfile);
  }

  void deleteItem(int index) {
    final provider = context.read<ProfileProvider>();
    final targetId = provider.profiles[index].id;
    if (targetId != null) {
      provider.deleteProfile(targetId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Profile')),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          final profiles = profileProvider.profiles;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profileProvider.profiles[index];

              return Dismissible(
                key: Key(profile.id.toString()),
                onDismissed: (direction) {
                  deleteItem(index);
                  Fluttertoast.showToast(msg: "${profile.name} dihapus");
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://easydrawingguides.com/wp-content/uploads/2021/04/Patrick-Star-Step-10.png',
                    ),
                  ),
                  title: Text(profile.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.bio),
                      SizedBox(height: 4),
                      Text(
                        profile.phone20,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "NIM: ${profile.nim}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProfile(profileId: profile.id!),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "fab_add",
            onPressed: addItem,
            child: Icon(Icons.add)
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "fab_remove",
            onPressed: () {
              final provider = context.read<ProfileProvider>();
              if (provider.profiles.isNotEmpty) {
                deleteItem(provider.profiles.length - 1);
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}