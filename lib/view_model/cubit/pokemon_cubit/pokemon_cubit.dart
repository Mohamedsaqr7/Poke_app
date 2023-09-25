
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/view_model/cubit/pokemon_cubit/pokemon_state.dart';
import '../../../model/pokemon_model.dart';


class PokeCubit extends Cubit<Pokestate> {
  PokeCubit() : super(Initstate());

  static PokeCubit get(context) => BlocProvider.of<PokeCubit>(context);
  PokemonModel? pokemonModel;
  Future<void> getPokemon()async{
    var dio=Dio();
    try{ emit(PokemonLoadingstate());
    var response=await dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var value=jsonDecode(response.data);
    pokemonModel=PokemonModel.fromJson(value);
    print(pokemonModel);
    emit(PokemonSuccessstate()); }
    catch(e){
      print(e);
      emit(PokemonErrorstate());}}
}
