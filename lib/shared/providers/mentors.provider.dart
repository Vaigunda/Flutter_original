import 'package:collection/collection.dart';
import 'package:mentor/shared/enums/unit.enum.dart';
import 'package:mentor/shared/models/certificate.model.dart';
import 'package:mentor/shared/models/experience.model.dart';
import 'package:mentor/shared/models/review.model.dart';
import 'package:mentor/shared/providers/categories.provider.dart';

import '../models/mentor.model.dart';

class MentorsProvider {
  static MentorsProvider get shared => MentorsProvider();

  List<MentorModel> get mentors => [
        MentorModel(
            id: "1",
            name: "Jessie Morrison",
            avatarUrl: "assets/images/avatar-1.png",
            bio:
                "Don’t let small minds convince you that your dreams are too big. Follow your heart make your dreams come true",
            numberOfMentoree: 1000,
            rate: 4.9,
            categories: [
              CategoriesProvider.shared.getCategory("1")!,
              CategoriesProvider.shared.getCategory("2")!,
            ],
            experiences: [
              ExperienceModel(
                  role: "Product Manager",
                  companyName: "Kiotviet",
                  startDate: DateTime(2023, 2)),
              ExperienceModel(
                  role: "Project Director",
                  companyName: "Educa Corp",
                  startDate: DateTime(2021, 11),
                  endDate: DateTime(2023, 1)),
              ExperienceModel(
                  role: "Global Product Supervisor",
                  companyName: "Dai Viet Group DVG",
                  description:
                      "<ul><li>Managing Product Owner team of 10 Junior/Senior Level.</li><li>Organizing training courses, training program for Product Team.</li><li>Building Product management framework & process to improve product team's quality of decision and efficiency.</li><li>Consulting and reviewing Product roadmap for 7 markets monthly and quarterly (Vietnam, Thailand, Philippines, India, Indonesia, Mexico, Nigeria) aligning with business strategies.</li></ul>",
                  startDate: DateTime(2020, 10),
                  endDate: DateTime(2021, 10)),
            ],
            reviews: [
              ReviewModel(
                  message:
                      "He is awesome teacher. After taking his course  now I can make awesome graffiti drawing.",
                  createDate: DateTime.now(),
                  createById: "1"),
              ReviewModel(
                  message:
                      "It would be nice to see the graffiti at a closer angle.",
                  createDate: DateTime.now(),
                  createById: "2")
            ],
            certificates: [
              CertificateModel(
                  name: "PAY IT FORWARD - GRADUATE MENTORING",
                  provideBy: "Certification of Appreciation",
                  createDate: DateTime.now(),
                  imageUrl: "assets/images/cert.jpg")
            ],
            role: "Graffiti Artist",
            free: const FreeModel(price: 2, unit: Unit.hour),
            verified: true),
        MentorModel(
            id: "2",
            name: "Gradditti Mastery",
            avatarUrl: "assets/images/avatar-2.png",
            bio: "",
            numberOfMentoree: 900,
            rate: 4.5,
            categories: [
              CategoriesProvider.shared.getCategory("3")!,
            ],
            verified: false),
        MentorModel(
            id: "3",
            name: "Toro",
            avatarUrl: "assets/images/avatar-3.png",
            bio: "",
            numberOfMentoree: 850,
            rate: 4.0,
            categories: [
              CategoriesProvider.shared.getCategory("4")!,
              CategoriesProvider.shared.getCategory("5")!,
            ],
            verified: true),
        MentorModel(
            id: "4",
            name: "Phuoc Nguyen",
            avatarUrl: "assets/images/avatar-4.png",
            bio: "",
            numberOfMentoree: 800,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("6")!,
              CategoriesProvider.shared.getCategory("7")!,
            ],
            verified: false),
        MentorModel(
            id: "5",
            name: "Toan K Nguyen",
            avatarUrl: "assets/images/avatar-5.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("8")!,
              CategoriesProvider.shared.getCategory("2")!,
            ],
            verified: false),
        MentorModel(
            id: "6",
            name: "Nhu Tu",
            avatarUrl: "assets/images/avatar-6.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("1")!,
              CategoriesProvider.shared.getCategory("6")!,
            ],
            verified: false),
        MentorModel(
            id: "7",
            name: "Sushi",
            avatarUrl: "assets/images/avatar-7.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("4")!,
              CategoriesProvider.shared.getCategory("8")!,
            ],
            verified: false),
        MentorModel(
            id: "8",
            name: "Amy",
            avatarUrl: "assets/images/avatar-8.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("3")!,
              CategoriesProvider.shared.getCategory("7")!,
            ],
            verified: true),
        MentorModel(
            id: "9",
            name: "Chloe",
            avatarUrl: "assets/images/avatar-9.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("8")!,
              CategoriesProvider.shared.getCategory("5")!,
            ],
            verified: false),
        MentorModel(
            id: "10",
            name: "Bella",
            avatarUrl: "assets/images/avatar-10.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("6")!,
              CategoriesProvider.shared.getCategory("2")!,
            ],
            verified: true),
        MentorModel(
            id: "11",
            name: "Carolyn",
            avatarUrl: "assets/images/avatar-11.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.9,
            categories: [
              CategoriesProvider.shared.getCategory("3")!,
              CategoriesProvider.shared.getCategory("2")!,
            ],
            verified: true),
        MentorModel(
            id: "12",
            name: "Emily",
            avatarUrl: "assets/images/avatar-12.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.0,
            categories: [
              CategoriesProvider.shared.getCategory("5")!,
              CategoriesProvider.shared.getCategory("2")!,
            ],
            verified: true),
        MentorModel(
            id: "13",
            name: "Fiona",
            avatarUrl: "assets/images/avatar-1.png",
            bio: "",
            numberOfMentoree: 799,
            rate: 3.0,
            categories: [
              CategoriesProvider.shared.getCategory("6")!,
              CategoriesProvider.shared.getCategory("4")!,
            ],
            verified: false),
      ];

  Iterable<MentorModel> topRated(int take) {
    return mentors
        .sortedByCompare<num>((a) => a.rate, (a, b) => b.compareTo(a))
        .take(take);
  }

  Iterable<MentorModel> topMentorees(int take) {
    return mentors
        .sortedByCompare<num>(
            (x) => x.numberOfMentoree, (a, b) => b.compareTo(a))
        .take(take);
  }

  Iterable<MentorModel> verified(int take) {
    return mentors.where((e) => e.verified == true).take(take);
  }

  MentorModel? getMentor(String id) {
    return mentors.firstWhereOrNull((x) => x.id == id);
  }
}
