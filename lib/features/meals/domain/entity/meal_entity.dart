class MealEntity {
  final String? id;
  final String name;
  final String imagePath;
  final int calories;
  final int proteins;
  final int carbohydrates;
  final int fats;

  MealEntity({
    this.id,
    required this.name,
    required this.imagePath,
    required this.calories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
  });
}