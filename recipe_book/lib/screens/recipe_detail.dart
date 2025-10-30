import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/providers/recipes_provider.dart';

class RecipeDetail extends StatefulWidget {
	final Recipe recipesData;

	const RecipeDetail({super.key, required this.recipesData});


	@override
	State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
	bool isFavorite = false;

	@override
  void didChangeDependencies() {
    super.didChangeDependencies();
		isFavorite = Provider
			.of<RecipesProvider>(context, listen: false)
			.favotireRecipe
			.contains(widget.recipesData);
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.recipesData.name, style: TextStyle(color: Colors.white),),
				backgroundColor: Colors.teal,
				leading: IconButton(
					onPressed: () => { Navigator.pop(context) }, 
					icon: Icon(Icons.arrow_back, color: Colors.white,)
				),
				actions: [
					IconButton(
						onPressed: () async {
							await Provider.of<RecipesProvider>(context, listen: false).toogleFavorite(widget.recipesData);
							setState(() {
							  isFavorite = !isFavorite;
							});
						}, 
						icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border))
				],
			),
		);
	}
}