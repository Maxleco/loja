import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/loja/models/loja_model.dart';

class LojaRepository extends Disposable {
  final Dio dio;

  LojaRepository(this.dio);

  Future<List<LojaModel>> obterLojas() async {
    return _data;
  }

  //dispose will be called automatically
  @override
  void dispose() {
    dio.close();
  }
}

get _data => [
      LojaModel(id: 1, nome: "Cat Lovers", logo: "cat_lovers.png"),
      LojaModel(id: 2, nome: "Dog Foods", logo: "dog_foods.png"),
      LojaModel(id: 3, nome: "Pet Lovers", logo: "pet_lovers.png"),
      LojaModel(id: 4, nome: "Pet Shops", logo: "pet_shops.png"),
    ];
