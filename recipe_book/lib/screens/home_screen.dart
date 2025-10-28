import 'package:flutter/material.dart';

import 'recipe_detail.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({ super.key });

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					recipesCard(context),
					recipesCard(context)
				],
			),
			floatingActionButton: FloatingActionButton(
				backgroundColor: Colors.orangeAccent,
				child: Icon(Icons.add, color: Colors.black,),
				onPressed: () {  _showButton(context); },),
		);
	}

	Future<void> _showButton(BuildContext context) {
		return showModalBottomSheet(
			context: context,
			isScrollControlled: true, 
			builder: (context) => GestureDetector(
				behavior: HitTestBehavior.opaque,
				onTap: () => FocusScope.of(context).unfocus(),
				child: Padding(
					padding: EdgeInsets.only(
						bottom: MediaQuery.of(context).viewInsets.bottom,
					),
					child: Container(
						padding: EdgeInsets.all(16.0),
						width: MediaQuery.of(context).size.width,
						height: 600,
						color: Colors.white,
						child: RecipeForm()
					)
				),
			)
		);
	}

	Widget recipesCard(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetail(recipeName: 'Lassagna')));
			},
			child: Padding(
				padding: const EdgeInsets.all(8.0),
				child: Container(
					width: MediaQuery.of(context).size.width,
					height: 125,
					child: Card(
						child: Row(
							children: <Widget>[
								Container(
									height: 125,
									width: 100,
									child: ClipRRect(
										borderRadius: BorderRadius.circular(12),
										child: Image.network('https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg', fit: BoxFit.cover,),
									),
								),
								SizedBox(width: 26,),
								Column(
									mainAxisAlignment: MainAxisAlignment.center,
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Text('Lassagna', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
										SizedBox(height: 4),
										Container(
											height: 2,
											width: 75,
											color: Colors.lightBlueAccent,
										),							
										Text('Juan Gómez', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
										SizedBox(height: 4)
								])
							],
						),
					),
				),
			)
		);
	}
}


class RecipeForm extends StatelessWidget {
	const RecipeForm({super.key});

	@override
	Widget build(BuildContext context) {
		final formKey = GlobalKey<FormState>();

		final TextEditingController nameController = TextEditingController();
		final TextEditingController authorController = TextEditingController();
		final TextEditingController imageUrlController = TextEditingController();
		final TextEditingController recipeController = TextEditingController();

		return Padding(
			padding: EdgeInsets.all(12),
			child: Form(
				key: formKey,
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
							'Add new recipe', 
							style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
							),
						SizedBox(height: 16,),
						_buildTextField(labelText: 'Recipe name', controller: nameController, validator: (value) { if(value == null || value.isEmpty) { return 'Please enter a recipe name'; } return null; }),
						SizedBox(height: 16,),
						_buildTextField(labelText: 'Author', controller: authorController, validator: (value) { if(value == null || value.isEmpty) { return 'Please enter an author'; } return null; }),
						SizedBox(height: 16,),
						_buildTextField(labelText: 'Image URL', controller: imageUrlController, validator: (value) { if(value == null || value.isEmpty) { return 'Please enter an image URL'; } return null; }),
						SizedBox(height: 16,),
						_buildTextField(labelText: 'Recipe', controller: recipeController, validator: (value) { if(value == null || value.isEmpty) { return 'Please enter a recipe'; } return null; }, maxLines: 4),
						SizedBox(height: 16,),
						Center(
							child: ElevatedButton(
								onPressed: () => {
									if(formKey.currentState!.validate()) {
										Navigator.pop(context)
									}
								},
								style: ElevatedButton.styleFrom(
									backgroundColor: Colors.teal,
									shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
								),
								child: Text('Submit', style: TextStyle(fontFamily: 'Quicksand', fontSize: 16, fontWeight: FontWeight.bold, ),),
							),
						)
					],
				),
			),
		);
	}

	Widget _buildTextField({
		required String labelText, 
		required TextEditingController controller, 
		required String? Function(String?)? validator,
		int maxLines = 1
	}) {
		return TextFormField(
			controller: controller,
			validator: validator,
			maxLines: maxLines,
			decoration: InputDecoration(
				labelText: labelText,
				labelStyle: TextStyle(fontFamily: 'Quicksand', color: Colors.teal),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
				focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal, width: 1), borderRadius: BorderRadius.circular(10)),
			),
		);
	}
}