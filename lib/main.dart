import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_bloc.dart';
import 'package:state_provider/bloc/counter/counter_bloc.dart';
import 'package:state_provider/ui/switch_example/switch_examole.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CounterBloc()),
        BlocProvider(create: (_)=>SwitchBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Bloc',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
      ),
      home: SwitchExample(),
      ),
      );
  }
}
