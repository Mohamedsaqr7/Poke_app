class PokemonModel {
  List<Pokemon>? pokemon=[];
  PokemonModel({this.pokemon});
  PokemonModel.fromJson(Map<String,dynamic> json){
    json['pokemon'].forEach((index) {
      pokemon?.add(Pokemon.fromJson(index));
    });
  }}
class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List <String>? type=[];
  String? height;
  String? weight;
  List<String>? weaknesses=[];
  Pokemon({this.id,this.num,this.name,required this.img,this.type,this.height,this.weight, this.weaknesses});
  Pokemon.fromJson(Map<String,dynamic> json){
    id=json["id"];
    num=json["num"];
    name=json["name"];
    img=json["img"];
    type = json['type'].cast<String>();
    height=json["height"];
    weight=json["weight"];
    weaknesses = json['weaknesses'].cast<String>();
  }}
