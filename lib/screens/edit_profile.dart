import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.id});

  final int id;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _phone20Controller;
  late TextEditingController _nimController;

  @override
  void initState() {
    super.initState();

    final provider = context.read<ProfileProvider>();
    final profile = provider.getById(widget.id);

    _nameController = TextEditingController(text: profile?.name ?? '');
    _bioController = TextEditingController(text: profile?.bio ?? '');
    _phone20Controller = TextEditingController(text: profile?.phone20 ?? '');
    _nimController = TextEditingController(text: profile?.nim ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _phone20Controller.dispose();
    _nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(labelText: 'NIM'),
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
              TextFormField(
                controller: _phone20Controller,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = Profile(
                      name: _nameController.text,
                      bio: _bioController.text,
                      phone20: _phone20Controller.text,
                      id: widget.id,
                      nim: _nimController.text,
                    );
                    Navigator.pop(context, updatedProfile);
                  }
                }, child: Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}