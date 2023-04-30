import 'package:covid_tracker/Services/Utilities/state_services.dart';
import 'package:covid_tracker/constant.dart';
import 'package:covid_tracker/models/WorldStateModel.dart';
import 'package:covid_tracker/screen/CountryList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widget/RowCard.dart';


class WorldPage extends StatefulWidget {
  const WorldPage({super.key});

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> with TickerProviderStateMixin{

  
  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 3),
    vsync: this)..repeat();
@override
    void dispose(){
      super.dispose();
      _controller.dispose();
    }

    final colorList =<Color>[
      kgcolor,
      krcolor,
      kbcolor
    
    ];

  @override
  Widget build(BuildContext context) {
    
    Size size=MediaQuery.of(context).size;
   StateService stateService =StateService(); 
   
    return Scaffold(
      body: SafeArea(child:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Column(
        children: [
         SizedBox(height: 20,),
         
         FutureBuilder(
          future: stateService.fetchData(),
          builder:(context, AsyncSnapshot<WorldStateModel>snapshot) {
            if(!snapshot.hasData)
            {
             return Expanded(
              flex: 1,
              
              child: SpinKitFadingCircle(
                color: kbcolor,
                controller: _controller,
                size: 50,
              ),
             );
            }
            else{
              return Column(
                children: [
                         PieChart(
                        
                        dataMap: {
                        'Total':double.parse(snapshot.data!.cases!.toString()),
                        'Recovered':double.parse(snapshot.data!.recovered!.toString()),
                        'Death':double.parse(snapshot.data!.deaths!.toString()),
                      },
                      chartRadius: size.height/4,
                      animationDuration:const  Duration(milliseconds: 1200),
                      chartType: ChartType.disc,
                      colorList:colorList,
                      ),
                     Padding(
                        padding:  EdgeInsets.symmetric(horizontal: kdefaultPadding),
                        child: Card(
                        
              child: Column(
                children: [
                 RowCard(
                  text: 'Total Cases',
                  value:snapshot.data!.cases!.toString() ,
                 ),
                   RowCard(
                  text: 'todayCases',
                  value:snapshot.data!.todayCases!.toString() ,
                 ),
                   RowCard(
                  text: 'deaths',
                  value:snapshot.data!.deaths!.toString() ,
                 ),
                   RowCard(
                  text: 'active',
                  value:snapshot.data!.active!.toString() ,
                 ),
                   RowCard(
                  text: 'critical',
                  value:snapshot.data!.critical!.toString() ,
                 ),
                   RowCard(
                  text: 'tests',
                  value:snapshot.data!.tests!.toString() ,
                 ),
                   RowCard(
                  text: 'affectedCountries',
                  value:snapshot.data!.affectedCountries!.toString() ,
                 ),
                
                ],
              ),
                        ),
                      ),
                      Padding(padding: const EdgeInsetsDirectional.all(kdefaultPadding),
                      child: GestureDetector(
                        onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return CountryList();
              },),
              );
                        },
                        child: Container(
              decoration: BoxDecoration(
                color: kgcolor,
                borderRadius: BorderRadius.circular(20),
                
              ),
              child:const Padding(padding: EdgeInsetsDirectional.all(kdefaultPadding), 
              child:  Text('Track World Record',style: TextStyle(fontSize: 20,color: Colors.white),),)
                        ),
                      ),)
                ],
              );

            }
          },),

        
        ],
      ),
      )),
    );
  }
}

