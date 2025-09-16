class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    this.active = false,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['imageUrl'] ?? '',
      targetScreen: map['targetScreen'] ?? '',
      active: map['active'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }
}
