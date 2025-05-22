import 'package:food_nutrition/features/meals/domain/entity/meal_entity.dart';

class MealModel extends MealEntity{
  MealModel({
    super.id,
    required super.name,
    required super.imagePath,
    required super.calories,
    required super.proteins,
    required super.carbohydrates,
    required super.fats,
    });



  factory MealModel.fromFireStore(Map<String, dynamic> doc, String id) {
    return MealModel(
        id: id,
        name: doc['name'] as String,
        imagePath: doc['imagePath'] as String,
        calories: doc['calories'] as int,
        carbohydrates: doc['carbohydrates'] as int,
        fats: doc['fats'] as int,
        proteins: doc['proteins'] as int,);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imagePath': imagePath,
      'calories': calories,
      'proteins': proteins,
      'carbohydrates': carbohydrates,
      'fats': fats,
    };
  }
}
