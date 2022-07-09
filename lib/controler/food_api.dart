import 'dart:convert';

import 'package:pi3/model/recipie_model.dart';
import 'package:http/http.dart' as http;

class Fetchdata {
  static Future<List<FoodApi>?> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "bb48fb94c0msh4581e723b63ca07p13a75djsn466ed3f87505",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return FoodApi.foodApifromsnapshot(_temp);
  }
}
