class MentorProfileModel {
  final String name;
  final String avatar;
  final String title;
  final String about;
  final List<WorkExperienceModel> experiences;
  final List<String> skills;

  MentorProfileModel(
      {required this.name,
      required this.avatar,
      required this.title,
      required this.about,
      required this.experiences,
      required this.skills});
}

class WorkExperienceModel {
  final String company;
  final String jobTitle;
  final String period;

  WorkExperienceModel(
      {required this.company, required this.jobTitle, required this.period});
}
