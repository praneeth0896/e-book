class Profile {
  String name;
  int age;
  String mobileNumber;

  Profile({
    required this.name,
    required this.age,
    required this.mobileNumber,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      age: json['age'],
      mobileNumber: json['mobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'mobileNumber': mobileNumber,
    };
  }

  @override
  String toString() {
    return 'Profile{name: $name, age: $age, mobileNumber: $mobileNumber}';
  }
}
