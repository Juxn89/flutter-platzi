// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Recetario';

  @override
  String get noRecipes => 'No hay recetas disponibles 😭.';

  @override
  String get addNewRecipeLabel => 'Nueva receta';

  @override
  String get recipeNameLabel => 'Nombre';

  @override
  String get recipeNameLabelError => 'Agregue el nombre';

  @override
  String get authorLabel => 'Autor';

  @override
  String get authorLabelError => 'Agregue el autor';

  @override
  String get imageURLLabel => 'Image URL';

  @override
  String get imageURLLabelError => 'Agregue la URL de la imagen';

  @override
  String get recipeLabel => 'Receta';

  @override
  String get recipeLabelError => 'Agregue la receta';

  @override
  String get submitRecipeButton => 'Guardar';
}
