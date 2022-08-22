import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget{
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({Key ? key, 
  required this.onCreate, 
  required this.onUpdate, 
  this.originalItem,}):isUpdating = (originalItem != null),super(key: key);

  @override 
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen>{
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override 
  Widget build(BuildContext context){
    return Container(color: Colors.orange,);
    // TODO: Add buildNameField()

    // TODO: Add buildImportanceField()

    // TODO: ADD buildDateField()

    // TODO: Add buildTimeField()

    // TODO: Add buildColorPicker()

    // TODO: Add buildQuantityField()
  }
}