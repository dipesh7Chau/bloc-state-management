import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_bloc.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_event.dart';
import 'package:state_provider/bloc/Switch_example/switch_dart_state.dart';
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc,SwitchStates>(
                    buildWhen: (previous,current) => previous.isSwitch !=current.isSwitch,
                    builder: (context,state){
                  return Switch(value: state.isSwitch, onChanged: (newValue){
                    context.read<SwitchBloc>().add(EnableNotification());
                    print('notification build');
                  });
                })
              ],
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc,SwitchStates>(
                buildWhen: (previous,current) => previous.slider !=current.slider,
                builder: (context,state){
              print('color swap');
              return  Container(
                height: 200,
                color: Colors.green.withOpacity(state.slider),
              );
            })
            ,
            const SizedBox(height: 50,),
            BlocBuilder<SwitchBloc,SwitchStates>(builder: (context,state){
              return  Slider(value: state.slider, onChanged: (value){
                context.read<SwitchBloc>().add(ColorSwap(slider: value));
              });
            })
          ],
        ),
      ),
    );
  }
}
