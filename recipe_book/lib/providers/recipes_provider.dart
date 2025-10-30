import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_book/helpers/logger.dart';
import 'package:recipe_book/models/recipe_model.dart';

class RecipesProvider extends ChangeNotifier {
	bool isLoading = false;
	List<Recipe> recipes = [];
	List<Recipe> favotireRecipe = [];
		
		final RECIPE_URL = Uri.parse('http://10.0.2.2:4576/recipe');

	Future<void> fetchRecipe() async {
		isLoading = true;
		notifyListeners();

		try {
			final response = await http.get(RECIPE_URL);

			if(response.statusCode != 200){
				AppLoggerHelper.error('Error fetching recipes: ${response.statusCode}');
				recipes = [];
				isLoading = false;
				return;
			}

			final data = jsonDecode(response.body);

			recipes = List<Recipe>
				.from( 
					data
					.map((recipe) => Recipe.fromJSON(recipe))
				);

		} catch (error) {
			AppLoggerHelper.error('Somthing was wrong: $error');
			recipes = [];
		}
		finally {
			isLoading = false;
			notifyListeners();
		}
	}

	Future<void> toogleFavorite(Recipe recipe) async {
		final isFavorite = favotireRecipe.contains(recipe);

		try {
			final response = isFavorite 
				? await http.delete(RECIPE_URL, body: json.encode({"id": recipe.id}))
				: await http.post(RECIPE_URL, body: json.encode(recipe.toJSON()));

				if(response.statusCode == 200){
					if(isFavorite){
						favotireRecipe.remove(recipe);
					}else {
						favotireRecipe.add(recipe);
					}

					notifyListeners();
				}
				else {
					throw Exception('Failed to update favorite recipes.');
				}
		} catch (e) {
		  AppLoggerHelper.error('Something was wrong $e');
		}
	}
}