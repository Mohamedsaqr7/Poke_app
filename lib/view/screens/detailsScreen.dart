import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/pokemon_model.dart';
import '../../view_model/cubit/pokemon_cubit/pokemon_cubit.dart';
import '../../view_model/cubit/pokemon_cubit/pokemon_state.dart';

class detailscreen extends StatelessWidget {
  Pokemon? pokemon;

  detailscreen({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokeCubit, Pokestate>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PokeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              pokemon?.name ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22, top: 70),
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pokemon?.name ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        'height:${pokemon?.height}' ?? "",
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "weight:${pokemon?.weight}" ?? "",
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Types",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      SizedBox(
                        height: 35,
                      ),
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(
                          pokemon?.type?.length ?? 0,
                          (index) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange),
                            child: Text(
                              pokemon?.type?[index] ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Weakness",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(
                          pokemon?.weaknesses?.length ?? 0,
                          (index) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Text(
                              pokemon?.weaknesses?[index] ?? "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Hero(
                  tag: pokemon?.id ?? 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Image.network(
                      pokemon?.img ?? "",
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
