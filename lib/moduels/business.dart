
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapi/Cubit/Cubit.dart';
import 'package:learnapi/Cubit/States.dart';

import '../components/articleitem.dart';

class BusinesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsState>(


          listener: ( context,  state) {  },
    builder: ( context, state) {
      var list=NewsCubit.get(context).Business;

      return
        Articlebuilder(list);
          });

    }
  }

