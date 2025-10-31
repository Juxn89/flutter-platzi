// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Recipe book';

  @override
  String get noRecipes => 'There are no recipes available 😭.';

  @override
  String get addNewRecipeLabel => 'Add new recipe';

  @override
  String get recipeNameLabel => 'Recipe name';

  @override
  String get recipeNameLabelError => 'Please enter a recipe name';

  @override
  String get authorLabel => 'Author';

  @override
  String get authorLabelError => 'Please enter an author';

  @override
  String get imageURLLabel => 'Image URL';

  @override
  String get imageURLLabelError => 'Please enter an image URL';

  @override
  String get recipeLabel => 'Recipe';

  @override
  String get recipeLabelError => 'Please enter a recipe';

  @override
  String get submitRecipeButton => 'Save recipe';
}
