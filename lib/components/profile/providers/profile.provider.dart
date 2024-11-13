import '../models/profile.model.dart';

class ProfileProvider {
  static ProfileProvider get shared => ProfileProvider();

  MentorProfileModel getProfile() {
    return MentorProfileModel(
      name: "Sushi",
      avatar: "",
      title: "Squalling baby",
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.",
      experiences: List.from([
        WorkExperienceModel(
            company: "Amazon Inc",
            jobTitle: "Manager",
            period: "Jan 2015 - Feb 2022 - 5 years"),
        WorkExperienceModel(
            company: "Amazon Inc",
            jobTitle: "Supper Manager",
            period: "Jan 2022 - Now - 2 years")
      ]),
      skills: List.from([
        "Leadership",
        "Teamwork",
        "Visioner",
        "Target oriented",
        "Consistent"
      ]),
    );
  }
}
