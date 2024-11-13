import 'package:mentor/shared/models/category.model.dart';
import 'package:mentor/shared/models/certificate.model.dart';
import 'package:mentor/shared/models/experience.model.dart';
import 'package:mentor/shared/models/review.model.dart';

import '../enums/unit.enum.dart';

class MentorModel {
  const MentorModel(
      {required this.id,
      required this.name,
      required this.avatarUrl,
      required this.bio,
      required this.numberOfMentoree,
      required this.rate,
      required this.categories,
      required this.verified,
      this.role,
      this.free,
      this.experiences,
      this.reviews,
      this.certificates});

  final String id;
  final String name;
  final String avatarUrl;
  final String bio;
  final int numberOfMentoree;
  final double rate;
  final List<CategoryModel> categories;
  final bool verified;
  final String? role;
  final FreeModel? free;
  final List<ExperienceModel>? experiences;
  final List<ReviewModel>? reviews;
  final List<CertificateModel>? certificates;
}

class FreeModel {
  const FreeModel({required this.price, required this.unit});

  final double price;
  final Unit unit;
}
