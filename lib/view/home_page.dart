import 'package:flutter/material.dart';
import 'package:pi3/controler/food_api.dart';
import 'package:pi3/model/recipie_model.dart';
import 'package:pi3/view/widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodApi>? foodApi;
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmm();
  }

  Future<void> getmm() async {
    foodApi = await Fetchdata.getRecipe();

    if (foodApi != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Recpie Resuturant',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: isLoading,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.builder(
                itemCount: foodApi?.length,
                itemBuilder: (context, index) {
                  return RecpietCard(
                    totalTime: foodApi![index].totalTime,
                    name: foodApi![index].name,
                    hostedLargeUrl: foodApi![index].hostedLargeUrl,
                    rating: foodApi![index].rating,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
