import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget{
  final GroceryManager manager;

  const GroceryListScreen({Key? key, required this.manager}):super(key: key);

  @override 
  Widget build(BuildContext context){
    final groceryItems  = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index){
          final item = groceryItems[index];
          //TODO 28: Wrap in a Dismissible
          //TODO 29: Wrap in an inkwell
          return GroceryTile(
            key: Key(item.id),
            item: item,
            onComplete: (change){
              manager.completeItem(index, change!);
            },
          );
        }, 
        separatorBuilder: (context, index){
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}