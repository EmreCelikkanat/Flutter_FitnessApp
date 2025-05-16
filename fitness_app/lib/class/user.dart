class UserProfile {
  String name;
  String surname;
  String email;
  String password;
  int age;
  double heightCm;
  double weightKg;
  String gender;
  String? profileImagePath;

  UserProfile({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.age,
    required this.heightCm,
    required this.weightKg,
    required this.gender,
    this.profileImagePath,
  });
}