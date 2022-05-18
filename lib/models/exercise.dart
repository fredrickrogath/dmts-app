class Exercise {
  final int id, kununuliwa, kuuzwa;
  final String picha, idadi;

  Exercise({
    required this.id,
    required this.kununuliwa,
    required this.picha,
    required this.kuuzwa,
    required this.idadi,
  });
}

List<Exercise> exercise = [
  Exercise(
    id: 1,
    kununuliwa: 10000,
    kuuzwa: 14000,
    idadi: 'Jogging',
    picha: 'assets/jogging.jpg',
  ),
  Exercise(
    id: 2,
    kununuliwa: 44000,
    kuuzwa: 60000,
    idadi: 'Bicycle riding',
    picha: 'assets/bicycle.jpg',
  ),
  Exercise(
    id: 3,
    kununuliwa: 40000,
    kuuzwa: 53000,
    idadi: 'Rope jumping',
    picha: 'assets/jump-rope.jpg',
  ),
  Exercise(
    id: 4,
    kununuliwa: 60000,
    kuuzwa: 85000,
    idadi: 'Push ups',
    picha: 'assets/pushups.jpg',
  ),
  Exercise(
    id: 4,
    kununuliwa: 60000,
    kuuzwa: 85000,
    idadi: 'Music dance',
    picha: 'assets/dance.jpg',
  ),
];
