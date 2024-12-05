import 'package:flutter/foundation.dart';
import 'package:fitness_app/models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  List<Workout> get workouts => [..._workouts];

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void removeWorkout(String id) {
    _workouts.removeWhere((workout) => workout.id == id);
    notifyListeners();
  }

  Workout? getWorkoutById(String id) {
    return _workouts.firstWhere((workout) => workout.id == id);
  }
}