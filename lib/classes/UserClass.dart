class UserClass {
  final int idUser;
  final String lastName;
  final String firstName;
  final String mdp;
  final String email;
  final String tel;
  final int perm;
  final String identifiant;

  const UserClass({
    required this.idUser,
    required this.lastName,
    required this.firstName,
    required this.mdp,
    required this.email,
    required this.tel,
    required this.perm,
    required this.identifiant,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      idUser: json['id'] as int,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      mdp: json['mdp'] as String,
      email: json['email'] as String,
      tel: json['tel'] as String,
      perm: json['perm'] as int,
      identifiant: json['identifiant'] as String,
    );
  }
}
