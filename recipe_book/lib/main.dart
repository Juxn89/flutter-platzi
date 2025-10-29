import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/providers/recipes_provider.dart';
import 'package:recipe_book/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (_) => RecipesProvider())
			],
			child: const MaterialApp(
				title: 'Flutter Demo',
				home: RecipeBook(),
			),
		);
  }
}

class RecipeBook extends StatelessWidget {
	const RecipeBook({ super.key });

	@override
	Widget build(BuildContext context){ 
		return DefaultTabController(
			length: 1, 
			child: Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.teal,
				title: const Text('Recipe Book', style: TextStyle(color: Colors.white)),
				bottom: TabBar(
					indicatorColor: Colors.white,
					labelColor: Colors.white,
					tabs: [
						Tab( icon: Icon(Icons.home), text: 'Home',)
				]),
			),
			body: TabBarView(children: [
				HomeScreen()
			])
		));
	}
}
