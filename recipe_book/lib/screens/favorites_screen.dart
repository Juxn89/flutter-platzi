import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/providers/recipes_provider.dart';
import 'package:recipe_book/screens/recipe_detail.dart';

class FavoriteScreen extends StatelessWidget {
	const FavoriteScreen({ super.key });

	@override
  Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			body: Consumer<RecipesProvider>(
				builder: (context, recipeProvider, child) {
					final favorites = recipeProvider.favotireRecipe;

					return favorites.isEmpty
						? Center(child: Text('No favorites recipes'))
						: ListView.builder(
							itemCount: favorites.length,
							itemBuilder: (context, index) {
								final recipe = favorites[index];
								FavoriteRecipeCard(recipe: recipe,);
							},
						);
				},
			)
		);
  }
}

class FavoriteRecipeCard extends StatelessWidget {
	final Recipe recipe;
	const FavoriteRecipeCard({super.key, required this.recipe});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.push(
					context, 
					MaterialPageRoute(
						builder: (context) => RecipeDetail(recipesData: recipe))
					);
			},
			child: Card(
				color: Colors.white,
				child: Column(
					children: [
						Text(recipe.name),
						Text(recipe.author),
					],
				),
			),
		);
	}
}