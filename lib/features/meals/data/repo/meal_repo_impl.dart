import 'package:food_nutrition/features/meals/domain/entity/meal_entity.dart';
import 'package:food_nutrition/features/meals/domain/repo/meal_repo.dart';

import '../../../../core/services/firebase_firestore_service.dart';
import '../models/meal_model.dart';

class MealRepoImpl implements MealRepo {
  final FirebaseFirestoreService firebaseFirestore;

  MealRepoImpl({required this.firebaseFirestore});
  @override
  Future<List<MealEntity>> getAllMeals() async{
    try {
      var meals = await firebaseFirestore.getMeals();
      return meals.map((meal) => MealModel.fromFireStore(meal, meal['id'])).toList();
    } catch (e) {
      throw Exception('Failed to fetch meals: $e');
    }
  }

  @override
  Future<MealEntity> getMealById(String id) async{
    try{
      final doc = await firebaseFirestore.getDocument('meals', id);
      if(doc.exists){
        return MealModel.fromFireStore(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        throw Exception('Meal not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch meal: $e');
    }
  }
}