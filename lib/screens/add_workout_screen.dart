import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workout_provider.dart';
import 'package:fitness_app/utils/id_generator.dart';
import 'package:fitness_app/widgets/workout_form.dart';
import 'package:fitness_app/widgets/exercise_form.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  String _difficulty = 'Beginner';
  final List<Exercise> _exercises = [];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _addExercise(Exercise exercise) {
    setState(() {
      _exercises.add(exercise);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exercise added successfully')),
    );
  }

  void _saveWorkout() {
    if (_formKey.currentState!.validate()) {
      final workout = Workout(
        id: generateId(),
        name: _nameController.text,
        description: _descriptionController.text,
        duration: int.parse(_durationController.text),
        difficulty: _difficulty,
        exercises: _exercises,
      );

      context.read<WorkoutProvider>().addWorkout(workout);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Workout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutForm(
              formKey: _formKey,
              nameController: _nameController,
              descriptionController: _descriptionController,
              durationController: _durationController,
              difficulty: _difficulty,
              onDifficultyChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _difficulty = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Add Exercises',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ExerciseForm(onExerciseAdded: _addExercise),
            const SizedBox(height: 16),
            if (_exercises.isNotEmpty) ...[
              const Text(
                'Added Exercises',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  final exercise = _exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text('${exercise.sets} sets × ${exercise.reps} reps'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _exercises.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveWorkout,
                child: const Text('Save Workout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}