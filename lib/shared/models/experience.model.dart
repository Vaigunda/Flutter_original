class ExperienceModel {
  const ExperienceModel(
      {required this.role,
      required this.companyName,
      required this.startDate,
      this.endDate,
      this.logo,
      this.description});

  final String role;
  final String companyName;
  final DateTime startDate;
  final DateTime? endDate;
  final String? logo;
  final String? description;
}
