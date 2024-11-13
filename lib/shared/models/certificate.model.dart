class CertificateModel {
  const CertificateModel(
      {required this.name,
      required this.provideBy,
      required this.createDate,
      required this.imageUrl});

  final String name;
  final String provideBy;
  final DateTime createDate;
  final String imageUrl;
}
