class Meal {
  final int id, kununuliwa, kuuzwa;
  final String picha, idadi;

  Meal({
    required this.id,
    required this.kununuliwa,
    required this.picha,
    required this.kuuzwa,
    required this.idadi,
  });
}

List<Meal> meal = [
  Meal(
    id: 1,
    kununuliwa: 10000,
    kuuzwa: 14000,
    idadi: 'Cereals',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 2,
    kununuliwa: 44000,
    kuuzwa: 60000,
    idadi: 'White Meat',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 3,
    kununuliwa: 40000,
    kuuzwa: 53000,
    idadi: 'Red Meat',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 4,
    kununuliwa: 60000,
    kuuzwa: 85000,
    idadi: 'Vegetables',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 5,
    kununuliwa: 10000,
    kuuzwa: 18000,
    idadi: 'Fruits',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 6,
    kununuliwa: 20000,
    kuuzwa: 25000,
    idadi: 'Water',
    picha: 'assets/logo2.jpg',
  ),
  Meal(
    id: 7,
    kununuliwa: 20000,
    kuuzwa: 25000,
    idadi: 'Table Salt',
    picha: 'assets/logo2.jpg',
  ),
];
