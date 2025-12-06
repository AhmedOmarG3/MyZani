class CategoryEntity {

  final String name;
  final String imagePath;

  CategoryEntity({ required this.name, required this.imagePath});

@override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is CategoryEntity &&
        runtimeType == other.runtimeType &&
        name == other.name &&
        imagePath == other.imagePath;

@override
int get hashCode => name.hashCode ^ imagePath.hashCode;
}