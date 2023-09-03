class Relawan {

   final String idRelawan;
   final String noDaftar;
   final String noKtp;
   final String tglDaftar;
   final String nama;
   final String tempatLahir;
   final String tglLahir;
   final String alamat;
   final String email;
   final String jk;
   final String idProv;
   final String idKab;
   final String idKec;
   final String kelurahan;
   final String rt;
   final String rw;
   final String hp;
   final String referensi;
   final String foto;
   final String ktp;
   final String status;
   final String jenis;
   final String namaTps;
   final String username;
   final String password;
   final String idKaryawan;
   final String namaKaryawan;


  const Relawan({
      required this.idRelawan,
      required this.noDaftar,
      required this.noKtp,
      required this.tglDaftar,
      required this.nama,
      required this.tempatLahir,
      required this.tglLahir,
      required this.alamat,
      required this.email,
      required this.jk,
      required this.idProv,
      required this.idKab,
      required this.idKec,
      required this.kelurahan,
      required this.rt,
      required this.rw,
      required this.hp,
      required this.referensi,
      required this.foto,
      required this.ktp,
      required this.status,
      required this.jenis,
      required this.namaTps,
      required this.username,
      required this.password,
      required this.idKaryawan,
      required this.namaKaryawan,
  });

   factory Relawan.fromJson(Map<String, dynamic> json) => Relawan(
    idRelawan : json['id_relawan'],
    noDaftar : json['no_daftar'],
    noKtp : json['no_ktp'],
    tglDaftar : json['tgl_daftar'],
    nama : json['nama'],
    tempatLahir : json['tempat_lahir'],
    tglLahir : json['tgl_lahir'],
    alamat : json['alamat'],
    email : json['email'],
    jk : json['jk'],
    idProv : json['id_prov'],
    idKab : json['id_kab'],
    idKec : json['id_kec'],
    kelurahan : json['kelurahan'],
    rt : json['rt'],
    rw : json['rw'],
    hp : json['hp'],
    referensi : json['referensi'],
    foto : json['foto'],
    ktp : json['ktp'],
    status : json['status'],
    jenis : json['jenis'],
    namaTps : json['nama_tps'],
    username : json['username'],
    password : json['password'],
    idKaryawan : json['id_karyawan'],
    namaKaryawan : json['nama_karyawan'],
  );

Map<String, dynamic> toJson() => {
    'id_relawan': idRelawan,
    'no_daftar': noDaftar,
    'no_ktp': noKtp,
    'tgl_daftar': tglDaftar,
    'nama': nama,
    'tempat_lahir': tempatLahir,
    'tgl_lahir': tglLahir,
    'alamat': alamat,
    'email': email,
    'jk' : jk,
    'id_prov': idProv,
    'id_kab': idKab,
    'id_kec': idKec,
    'kelurahan': kelurahan,
    'rt': rt,
    'rw': rw,
    'hp': hp,
    'referensi': referensi,
    'foto': foto,
    'ktp': ktp,
    'status': status,
    'jenis' : jenis,
    'nama_tps': namaTps,
    'username': username,
    'password': password,
    'id_karyawan': idKaryawan,
    'nama_karyawan': namaKaryawan,
  };

}