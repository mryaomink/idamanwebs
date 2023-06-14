class Place {
  final String? name;
  final String? type;
  final double lattitude;
  final double longitude;
  final String? icon;
  final List<String> imgUrl;

  Place(
      {this.name,
      this.type,
      required this.lattitude,
      required this.longitude,
      this.icon,
      required this.imgUrl});
}
