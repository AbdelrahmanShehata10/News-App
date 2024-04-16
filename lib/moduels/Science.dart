
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/Cubit.dart';
import '../Cubit/States.dart';
import '../components/articleitem.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsState>(


          listener: ( context,  state) {  },
          builder: ( context, state) {
            var list=NewsCubit.get(context).Science;

            return        Articlebuilder(list);
              });

  }
}
