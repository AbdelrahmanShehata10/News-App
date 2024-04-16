import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapi/Cubit/Cubit.dart';
import 'package:learnapi/Cubit/States.dart';

import '../components/articleitem.dart';

class Search extends StatelessWidget {
  var searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return
      BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var list=NewsCubit.get(context).Search;

          return Scaffold(
            appBar: AppBar(
            ),
            body:
             Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(

                      onChanged: ( value){
                        NewsCubit.get(context).getsearch(value);

                      },
                      textAlign: TextAlign.start,
                      controller: searchcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'What are you looking for',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                  ),
                    ),
                    Expanded(child: Articlebuilder(list,issearch:true))
                  ]
              ),
            );
        },
      );
  }
}
