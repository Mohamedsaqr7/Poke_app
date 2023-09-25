import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/pokemon_model.dart';
import '../../view_model/cubit/pokemon_cubit/pokemon_cubit.dart';
import '../../view_model/cubit/pokemon_cubit/pokemon_state.dart';
import '../screens/detailsScreen.dart';

class DetailsScreen extends StatelessWidget {
  Pokemon? pokemon;

  DetailsScreen({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokeCubit, Pokestate>(
      listener: (context, state) {},
      builder: (context, state) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => detailscreen(pokemon: pokemon,)));
        },
        child: Card(
        shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(13),),
          color: Colors.white, elevation: 15, borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(tag: pokemon?.id ?? 0,
                    child: Image.network(pokemon?.img ?? "")),
                Text(pokemon?.name ?? "error",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],),
          ),),);
    }, 
    );
  }
}