import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';
import '../blocs/counter_event.dart';
import '../blocs/counter_state.dart';
import '../blocs/theme_bloc.dart';
import '../blocs/theme_event.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Counter App')),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter == 10 || state.counter == -10) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Counter reached ${state.counter}!')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter: ${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                  child: const Text('Toggle Theme'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
