import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/pokemon_cubit/pokemon_cubit.dart';
import '../../view_model/cubit/pokemon_cubit/pokemon_state.dart';
import '../components/details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokeCubit, Pokestate>(
      listener: (context, state) {},
        builder: (context, state) {
          var cubit = PokeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.cyan,
                toolbarHeight: 80,
                centerTitle: true,
                title: Text(
                  "Poke App",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                itemCount: cubit.pokemonModel?.pokemon?.length,
                itemBuilder: (context, index) =>
                    DetailsScreen(pokemon: cubit.pokemonModel?.pokemon?[index]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          );
        },
        
        );
  }
}
