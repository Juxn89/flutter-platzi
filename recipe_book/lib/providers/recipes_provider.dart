import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_book/models/recipe_model.dart';

class RecipesProvider extends ChangeNotifier {
	bool isLoading = false;
	List<Recipe> recipes = [];

	Future<void> fetchRecipe() async {
		isLoading = true;
		notifyListeners();
		
		final RECIPE_URL = Uri.parse('https://static.platzi.com/media/public/uploads/recipes_5c04ed3a-72d2-497a-afb8-2d49c297101a.json');

		try {
			final response = await http.get(RECIPE_URL);

			if(response.statusCode != 200){
				print('Error fetching recipes: ${response.statusCode}');
				recipes = [];
				isLoading = false;
				return;
			}

			final data = jsonDecode(response.body);
			recipes = List<Recipe>
				.from(
					data['recipes']
					.map((recipe) => Recipe.fromJSON(recipe))
				);

		} catch (error) {
			print('Somthing was wrong: $error');
			recipes = [];
		}
		finally {
			isLoading = false;
			notifyListeners();
		}
	}
}