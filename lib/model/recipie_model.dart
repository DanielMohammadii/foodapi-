class FoodApi {
  final String name;
  final double rating;
  final String totalTime;
  final String hostedLargeUrl;
  FoodApi({
    required this.name,
    required this.rating,
    required this.totalTime,
    required this.hostedLargeUrl,
  });

  factory FoodApi.fromJson(dynamic json) {
    return FoodApi(
      name: json['name'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      hostedLargeUrl: json['images'][0]['hostedLargeUrl'] as String,
    );
  }

  static List<FoodApi> foodApifromsnapshot(List snapshot) {
    return snapshot.map((data) {
      return FoodApi.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'FoodApi {name: $name, hostedLargeUrl: $hostedLargeUrl, rating: $rating, totalTime: $totalTime}';
  }
}
