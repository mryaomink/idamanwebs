class AppData {
  final String id;
  final String deskripsi;
  final Uri aksi;
  final String icon;
  final String nama;
  final List<OrtuData> ortunya;

  AppData({
    required this.id,
    required this.deskripsi,
    required this.aksi,
    required this.icon,
    required this.nama,
    required this.ortunya,
  });
}

class OrtuData {
  final String id;
  final String nama;
  final String deskripsi;
  final String icon;

  OrtuData({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.icon,
  });
}
