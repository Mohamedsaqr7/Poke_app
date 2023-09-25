import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/view/screens/homeScreen.dart';
import 'package:pokeapp/view_model/cubit/pokemon_cubit/pokemon_cubit.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>PokeCubit()..getPokemon()),
    ], child:MaterialApp(home: HomeScreen(),));
  }
}
