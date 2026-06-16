import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key});

  final String jsonString = '''
{
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "ingredients": ["tomatoes", "mozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "ingredients": ["bananas", "milk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "ingredients": ["berries", "yogurt", "granola"]
    }
  ]
}
''';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> decodedJson = jsonDecode(jsonString);

    final RecipeResponse recipeResponse =
    RecipeResponse.fromJson(decodedJson);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipeResponse.recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipeResponse.recipes[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}