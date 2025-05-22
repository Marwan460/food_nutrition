import 'package:food_nutrition/features/meals/domain/entity/meal_entity.dart';

abstract class MealRepo {
  Future<List<MealEntity>> getAllMeals();
  Future<MealEntity> getMealById(String id);
}