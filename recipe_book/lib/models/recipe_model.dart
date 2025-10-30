import 'package:flutter/material.dart';

class Recipe {
	String id;
	String name;
	String author;
	String image_link;
	List<String> recipe;

	Recipe({
		required this.id,
		required this.name,
		required this.author,
		required this.image_link,
		required this.recipe,
	});

	factory Recipe.fromJSON(Map<String, dynamic> json){
		return Recipe(
			id: json['id'],
			name: json['name'],
			author: json['author'],
			image_link: json['image_link'],
			recipe: List<String>.from(json['recipe']),
		);
	}

	Map<String, dynamic> toJSON(){
		return {
			'id': id,
			'name': name,
			'author': author,
			'image_link': image_link,
			'recipe': recipe,
		};
	}

	@override
	String toString() {
		return 'Recipe{id: $id, name: $name, author: $author, image_link: $image_link, recipe: $recipe}';
	}
}