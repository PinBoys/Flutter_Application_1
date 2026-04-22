import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> profile;

  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController angkaController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.profile["nama"],
    );

    angkaController = TextEditingController(
      text: widget.profile["angka"].toString(),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    angkaController.dispose();
    super.dispose();
  }

  void submit() {
    Navigator.pop(context, {
      "nama": namaController.text,
      "angka": int.parse(angkaController.text),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: angkaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Counter",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}