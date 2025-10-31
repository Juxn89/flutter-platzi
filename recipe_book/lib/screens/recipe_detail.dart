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

class _RecipeDetailState extends State<RecipeDetail> with SingleTickerProviderStateMixin {
	bool isFavorite = false;
	late AnimationController _animationController;
	late Animation<double> _scaleAnimation;

	@override
  void initState(){
		super.initState();

		_animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

		_scaleAnimation = Tween<double>(begin: 1.0, end: 1.5)
			.animate(
				CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
			)..addStatusListener((status){
				if(status == AnimationStatus.completed) { _animationController.reverse(); }
			});
	}

	@override
	void dispose(){
		_animationController.dispose();
		super.dispose();
	}

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
						icon: ScaleTransition(
							scale: _scaleAnimation,
							child: Icon(
								isFavorite ? Icons.favorite : Icons.favorite_border,
								color: Colors.red,
							),
						)
					)
				],
			),
			body: Padding(
				padding: EdgeInsets.all(18),
				child: Column(
					children: [
						Image.network(
							widget.recipesData.image_link,
							errorBuilder: (context, error, stackTrace) {
								return Image.asset('assets/images/image_not_found.jpg');
							},
						),
						Text(widget.recipesData.name),
						SizedBox(height: 8,),
						Text('by ${widget.recipesData.author}'),
						SizedBox(height: 8,),
						Text('Recipes steps:'),
						for(var step in widget.recipesData.recipe) Text("- $step")
					],
				),
			),
		);
	}
}