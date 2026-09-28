import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/cubit/tasbeh_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 139, 37),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Digital Tasbeeh'),
        centerTitle: true,
      ),
      body: BlocBuilder<TasbehCubit, TasbehState>(
        builder: (context, state) {
          final cubit = context.read<TasbehCubit>();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.grey,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          cubit.tasbeh[state.tasbehIndex],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: cubit.previousTasbeh,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      '${state.count}/32',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: cubit.nextTasbeh,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Text(
                  'Round ${state.round}',
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: cubit.reset,
                  child: const Text('Reset'),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: 160,
                  height: 160,
                  child: ElevatedButton(
                    onPressed: cubit.increment,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'سبّح',
                      style: TextStyle(fontSize: 25,color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}