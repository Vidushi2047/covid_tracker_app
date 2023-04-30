import 'package:covid_tracker/Services/Utilities/state_services.dart';
import 'package:covid_tracker/constant.dart';
import 'package:covid_tracker/screen/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'DetailScreen.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

TextEditingController searchController=TextEditingController();


class _CountryListState extends State<CountryList> with TickerProviderStateMixin{
  
  
  @override
  Widget build(BuildContext context) {
    StateService stateService=StateService();
   Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body:SafeArea(child: 
      Column(
        children: [
         Padding(padding:const EdgeInsets.all(kdefaultPadding)
         ,child:  TextFormField(
          controller: searchController,
          onChanged: (value) {
            setState(() {
              
            });
          },
            decoration: InputDecoration(
              hintText: 'country name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0.1,color: kbcolor)
              )

            ),
          ),),

          FutureBuilder(
            future: stateService.fetchCountryList(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
           if(!snapshot.hasData)
            {
              return const Text('Loading....');
              
            }   
            else
            {
              return Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                
                  itemBuilder: (context, index) {
                      String name=snapshot.data![index]['country'];
                      if(searchController.text.isEmpty){
              
                         return  Column(
                    children: [
                     InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            name: snapshot.data![index]['country'],
                            image: snapshot.data![index]['countryInfo']['flag'],
                            active:snapshot.data![index]['active'], 
                            critical: snapshot.data![index]['critical'],
                            test: snapshot.data![index]['tests'],
                            todayrecovered: snapshot.data![index]['todayRecovered'],
                            totalCases: snapshot.data![index]['cases'],
                            totalDeath: snapshot.data![index]['deaths'],
                            totalRecoverd: snapshot.data![index]['recovered'],
                            
                          );
                        },));
                      },
                      child:  ListTile(
                        leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag'],)
                        ,height: 50,
                        width: 50,
                        ),
                        title: Text(snapshot.data![index]['country'].toString()),
                         subtitle: Text(snapshot.data![index]['cases'].toString()),
                        ),
                     )
                    ],
                  );
                           
              
                      }
                      else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                           
                              return  InkWell(
                                onTap: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            name: snapshot.data![index]['country'],
                            image: snapshot.data![index]['countryInfo']['flag'],
                            active:snapshot.data![index]['active'], 
                            critical: snapshot.data![index]['critical'],
                            test: snapshot.data![index]['tests'],
                            todayrecovered: snapshot.data![index]['todayRecovered'],
                            totalCases: snapshot.data![index]['cases'],
                            totalDeath: snapshot.data![index]['deaths'],
                            totalRecoverd: snapshot.data![index]['recovered'],
                            
                          );
                        },));
                                },
                                child: Column(
                    children: [
                      ListTile(
                        leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag'],)
                        ,height: 50,
                        width: 50,
                        ),
                        title: Text(snapshot.data![index]['country'].toString()),
                         subtitle: Text(snapshot.data![index]['cases'].toString()),
                        )
                    ],
                  ),
                              );
                      }
                      else{
                                 return Container();
                      }
              
                    
                },),
              );
            }        
          },)
        ],
      ))
    );
  }
}