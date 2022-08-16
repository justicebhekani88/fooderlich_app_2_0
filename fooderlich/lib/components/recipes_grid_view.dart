import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget{
  final List<SimpleRecipe> recipes;

  const RecipesGridView({Key? key, required this.recipes}):super(key: key);

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        itemCount: recipes.length,
        //answer to second assignment chapter 5, display the grid in singular column form. 
        //the maxCrossAxiseExtent is set to value greater than the device's width so the column fills the entire 
        //width of the screen
        //gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
          itemBuilder: (context, index){
            final simpleRecipe = recipes[index];
            return RecipeThumbnail(recipe: simpleRecipe);
          }
      ),
    );
  }
}