import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/helpers/logger.dart';
import 'package:recipe_book/l10n/app_localizations.dart';
import 'package:recipe_book/providers/recipes_provider.dart';
import 'package:recipe_book/screens/favorites_screen.dart';
import 'package:recipe_book/screens/home_screen.dart';

void main() {
	AppLoggerHelper.initialize();
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
				supportedLocales: [
					Locale('en'),
					Locale('es')
				],
				localizationsDelegates: [
					AppLocalizations.delegate,
					GlobalCupertinoLocalizations.delegate,
					GlobalWidgetsLocalizations.delegate,
					GlobalMaterialLocalizations.delegate
				],
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
			length: 2, 
			child: Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.teal,
				title: const Text('Recipe Book', style: TextStyle(color: Colors.white)),
				bottom: TabBar(
					indicatorColor: Colors.white,
					labelColor: Colors.white,
					tabs: [
						Tab( icon: Icon(Icons.home), text: 'Home',),
						Tab( icon: Icon(Icons.favorite), text: 'Favorites',)
				]),
			),
			body: TabBarView(children: [
				HomeScreen(),
				FavoriteScreen(),
			])
		));
	}
}
