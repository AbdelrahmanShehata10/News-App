import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:learnapi/moduels/webview.dart';

Widget buildArticleitem(article,context)=>InkWell(
  onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Webview(article['url'])));
  },
  child:   Padding(

    padding: const EdgeInsets.all(8.0),



      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Expanded(

            child: Container(

                height: 120.0,

                child: Image.network("${article['urlToImage']}",fit: BoxFit.cover,),),

          )   ,

          SizedBox(width: 20,),

          Expanded(

            child: Container(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                crossAxisAlignment: CrossAxisAlignment.start,

                children:

                [

                  Text("${article['title']}",style:Theme.of(context).textTheme.bodyText1,

                 maxLines: 4,)

                  , Text("${article['publishedAt']}",style: TextStyle(

                    color: Colors.grey,

                    fontSize: 15,

                    fontWeight: FontWeight.w600



                ),maxLines: 1,)

                  ,],

              ),

            ),

          )

        ],

      ),



  ),
);
Widget Articlebuilder(list,{issearch=false})=>ConditionalBuilder(

    condition: list.length>0,
    builder: (context)=>ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index)=>buildArticleitem(list[index],context), separatorBuilder: (context,index)=>
        const Divider(
      color: Colors.black,
      thickness: 2,
    ), itemCount:list.length),
    fallback: (context)=> issearch ? Container() : const Center(child: CircularProgressIndicator()))

;
