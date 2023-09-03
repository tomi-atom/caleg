class Koordinator {
  final String id_karyawan;
  final String password;
  final String username;
  final String jabatan;

  const Koordinator({
    required this.id_karyawan,
    required this.username,
    required this.password,
    required this.jabatan,
  });

  factory Koordinator.fromJson(Map<String, dynamic> json) => Koordinator(
        id_karyawan: json['id_karyawan'],
        username: json['username'],
        password: json['password'],
        jabatan: json['jabatan'],
      );

  Map<String, dynamic> toJson() => {
        'id_karyawan': id_karyawan,
        'password': password,
        'username': username,
        'jabatan': jabatan,
      };
}
