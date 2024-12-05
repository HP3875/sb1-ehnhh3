class Workout {
  final String id;
  final String name;
  final String description;
  final int duration;
  final String difficulty;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final String description;
  final int sets;
  final int reps;
  final String imageUrl;

  Exercise({
    required this.name,
    required this.description,
    required this.sets,
    required this.reps,
    required this.imageUrl,
  });
}