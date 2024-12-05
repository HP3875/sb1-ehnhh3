import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> exercises;

  const ExerciseList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(exercise.description),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('Sets: ${exercise.sets}'),
                    const SizedBox(width: 16),
                    Text('Reps: ${exercise.reps}'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}