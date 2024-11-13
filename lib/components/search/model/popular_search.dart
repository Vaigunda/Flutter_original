// To parse this JSON data, do
//
//     final PopularSearch = PopularSearchFromJson(jsonString);

class PopularSearch {
  PopularSearch({
    required this.id,
    required this.totalResult,
    required this.title,
  });

  final int id;
  final int totalResult;
  final String title;

  PopularSearch copyWith({
    int? id,
    int? totalResult,
    String? title,
  }) =>
      PopularSearch(
        id: id ?? this.id,
        totalResult: totalResult ?? this.totalResult,
        title: title ?? this.title,
      );

  factory PopularSearch.fromJson(Map<String, dynamic> json) => PopularSearch(
        id: json["id"],
        totalResult: json["totalResult"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalResult": totalResult,
        "title": title,
      };
}
