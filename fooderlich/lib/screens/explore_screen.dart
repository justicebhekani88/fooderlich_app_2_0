import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class ExploreScreen extends StatefulWidget{
  const ExploreScreen({Key? key}):super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State{
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override 
  Widget build(BuildContext context){
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          final recipes = snapshot.data?.todayRecipes ?? [];
          // return Center(
          //   child: Container(
          //     child: const Text('Show TodayRecipeView')
          //   ),
          return ListView(
            scrollDirection: Axis.vertical,
            controller: _controller,
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16),
              FriendPostListView(friendPost: snapshot.data?.friendPosts ??[]),
            ],
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ));
        }
      },
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
        print("I am at the bottom!");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
        print("I am at the top!");
    }
  }

  @override 
  void dispose(){
    _controller.removeListener(_scrollListener);
    super.dispose();
  }
}