class SellerModel {
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;
  SellerModel({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  SellerModel copyWith({
    String? cpu,
    String? camera,
    List<String>? capacity,
    List<String>? color,
    String? id,
    List<String>? images,
    bool? isFavorites,
    int? price,
    double? rating,
    String? sd,
    String? ssd,
    String? title,
  }) {
    return SellerModel(
      cpu: cpu ?? this.cpu,
      camera: camera ?? this.camera,
      capacity: capacity ?? this.capacity,
      color: color ?? this.color,
      id: id ?? this.id,
      images: images ?? this.images,
      isFavorites: isFavorites ?? this.isFavorites,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      sd: sd ?? this.sd,
      ssd: ssd ?? this.ssd,
      title: title ?? this.title,
    );
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      cpu: map['CPU'],
      camera: map['camera'],
      capacity: List<String>.from(map['capacity']),
      color: List<String>.from(map['color']),
      id: map['id'],
      images: List<String>.from(map['images']),
      isFavorites: map['isFavorites'],
      price: map['price']?.toInt(),
      rating: map['rating']?.toDouble(),
      sd: map['sd'],
      ssd: map['ssd'],
      title: map['title'],
    );
  }
}
