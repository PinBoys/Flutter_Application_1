class Profile {
  int id;
  int step;
  String phone;
  String name;
  String bio;

  Profile({required this.id, required this.step, required this.name, required this.bio, required this.phone});

  String displayName(int index) => "$name ${(index + 1) * step}";
  String displayPhone(int index) => "$phone${(index + 1) * step}";
}