class Profile {
  int? id;
  String name;
  String bio;
  String phone20;
  String nim;

  Profile({
    required this.id,
    required this.name,
    required this.bio,
    required this.phone20,
    required this.nim
  });

  Profile copyWith({
    int? id,
    String? name,
    String? bio,
    String? phone20,
    String? nim,
    }) {
      return Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        bio: bio ?? this.bio,
        phone20: phone20 ?? this.phone20,
        nim: nim ?? this.nim,
      );
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      bio: map['bio'],
      phone20: map['phone20'],
      nim: map['nim'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'bio': bio,
      'phone20': phone20,
      'nim': nim,
    };

    return map;
  }
}