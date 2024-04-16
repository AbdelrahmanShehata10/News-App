import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapi/API/Dio_Helper.dart';
import 'package:learnapi/Cubit/States.dart';

import 'Cubit/Cubit.dart';
import 'Cubit/darklightcubit_cubit.dart';
import 'moduels/Search.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsState>(
      listener: ( context,  state) {  },

    builder: (BuildContext context, state) {
      var Cubit=NewsCubit.get(context);
      var Cubit2=languageanddarkCubit.get(context);

      return
            Scaffold(
            appBar: AppBar(
              title: Text("News") ,
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                  
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  Cubit2.chandemode();
                }, icon: Icon(Icons.brightness_4_rounded))

              ],
            ),
            body: Cubit.Screens[Cubit.Currentindex],
              bottomNavigationBar: BottomNavigationBar(
              currentIndex: Cubit.Currentindex,
              onTap: (index){
Cubit.onTap(index);
              },
              items:Cubit.bottomitems ,),
          );

        },

    );
  }
}
