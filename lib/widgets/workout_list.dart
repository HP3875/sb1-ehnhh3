import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_app/providers/workout_provider.dart';
import 'package:fitness_app/widgets/workout_card.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, workoutProvider, child) {
        final workouts = workoutProvider.workouts;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return WorkoutCard(workout: workouts[index]);
          },
        );
      },
    );
  }
}