class Perm {
  final int perm;
  final String aut;
  final String libelle;


  const Perm({
    required this.perm,
    required this.aut,
    required this.libelle,
  });

  factory Perm.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'perm': int perm,
      'aut': String aut,
      'libellé': String libelle,
      } =>
          Perm(
            perm: perm,
            aut: aut,
            libelle: libelle,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
