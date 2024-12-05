import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/screens/workout_details_screen.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text(workout.description),
        trailing: Text('${workout.duration} min'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutDetailsScreen(workout: workout),
            ),
          );
        },
      ),
    );
  }
}