import 'package:flutter/material.dart';
import 'edit_profile.dart';

class DetailProfile extends StatefulWidget {
  final String nama;
  final int angka;

  const DetailProfile({
    super.key,
    required this.nama,
    required this.angka,
  });

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  late String nama;
  late int angka;

  bool isChanged = false;
  String teks = "I Made Govinda Janottama";

  @override
  void initState() {
    super.initState();
    nama = widget.nama;
    angka = widget.angka;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: const Color.fromARGB(255, 205, 168, 220),
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
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
              nama,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              '2415354052',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Counter saat ini: $angka',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                'nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isChanged = !isChanged;
                  teks = isChanged
                      ? "Gopin"
                      : "I Made Govinda Janottama";
                });
              },
              child: Text(teks),
            ),

            const SizedBox(height: 20),

            // 🔥 BUTTON EDIT (TAMBAHAN JOBSHEET)
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      profile: {
                        "nama": nama,
                        "angka": angka,
                      },
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    nama = result["nama"];
                    angka = result["angka"];
                  });
                }
              },
              child: const Text("Edit"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}