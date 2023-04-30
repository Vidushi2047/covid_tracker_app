import 'package:covid_tracker/widget/RowCard.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
 
   DetailScreen({super.key, @required this.name,@required this.image,
   @required this.totalCases,
   @required this.totalDeath,@required this.totalRecoverd,@required this.active,@required this.critical,@required this.todayrecovered,
   @required this.test});
 String ?name;
 String ?image;
 int ?totalCases;
 int ? totalDeath;
 int ? totalRecoverd;
 int? active;
  int  ?critical;
 int  ?todayrecovered;
int ?test;



  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.name!,style: const TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back,color: Colors.black,))
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
           
              Card(
                
                child: Column(
                  children: [
                  CircleAvatar(
                radius: 40,
               backgroundImage:NetworkImage(widget.image!),
              ),
                    RowCard(
                      text:'Total Cases' ,
                      value:widget.totalCases.toString() ,
                    ),
                     RowCard(
                      text:'Total Death' ,
                      value:widget.totalDeath.toString() ,
                    ),
                     RowCard(
                      text:'Total Recover ' ,
                      value:widget.totalRecoverd.toString() ,
                    ),
                     RowCard(
                      text:'Active Cases' ,
                      value:widget.active.toString() ,
                    ),
                     RowCard(
                      text:'Critical Cases' ,
                      value:widget.critical.toString() ,
                    ),
                     RowCard(
                      text:'today Recovered' ,
                      value:widget.todayrecovered.toString() ,
                    ),
                     RowCard(
                      text:'Total Test' ,
                      value:widget.test.toString() ,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      )
    );
  }
}