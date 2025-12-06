import 'package:hive/hive.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imagePath;


  CategoryModel({
    
    required this.name,
    required this.imagePath,
  });



  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      
      name: entity.name,
      imagePath: entity.imagePath, 
    );
  }


  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
      imagePath: imagePath,
    );
  }
}
