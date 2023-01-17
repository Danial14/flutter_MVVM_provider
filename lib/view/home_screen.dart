import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/data/response/status.dart';
import 'package:mvvm_flutter_prac/utils/utils.dart';
import 'package:mvvm_flutter_prac/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../view_model/user_view_Model.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}
class _HomeScreenState extends State<HomeScreen>{
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeViewModel = HomeViewModel();
    _homeViewModel.fetchMoviesList();
  }
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userViewModel.remove();
            },
            child: Center(
                child: Padding(padding: EdgeInsets.only(right: 10),child:Text("Logout"))
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider(
        create: (ctx){
          return _homeViewModel;
        },
        builder: (ctx, child){
          return Consumer<HomeViewModel>(
            builder: (ctx, data, child){
              var res = data.getMoviesList();
              switch(res.status!){
                case Status.COMPLETED:
                  return ListView.builder(itemBuilder: (ctx, position){
                    return Card(
                        child: ListTile(
                          leading: Image.network(res.data!.movies[position].posterurl.toString(),
                          errorBuilder: (ctx, data, stack){
                            return Icon(Icons.error);
                          },
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(res.data!.movies[position].title!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(Utils.calculateAverage(res.data!.movies[position].ratings!)),
                              Icon(Icons.star, color: Colors.yellow,)
                            ],
                          ),
                    )
                    );
                  }, itemCount: res.data!.movies.length,);
                case Status.ERROR:
                  return Center(child: Text(res.Message!));

                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      )
    );
  }
}