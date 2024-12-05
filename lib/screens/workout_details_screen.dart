import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/widgets/exercise_list.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailsScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  label: Text('${workout.duration} min'),
                  avatar: const Icon(Icons.timer),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(workout.difficulty),
                  avatar: const Icon(Icons.fitness_center),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Exercises',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ExerciseList(exercises: workout.exercises),
          ],
        ),
      ),
    );
  }
}