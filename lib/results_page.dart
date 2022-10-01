import 'package:flutter/material.dart';
import 'build_card.dart';
import 'constants.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({required this.CalculateBmi,required this.getResult,required this.Recommendation,});
  final String CalculateBmi;
  final String getResult;
  final String Recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 15,
        backgroundColor: Colors.transparent,
        title: const Text('BMI CALCULATOR',style:
        TextStyle(color: Color(0xFF190242),
            fontSize: 30,fontWeight:
            FontWeight.w900),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
           child: Container(
             padding: EdgeInsets.all(15),
           alignment: Alignment.bottomLeft,
           child: const Text('Your Result',style: ResultsPageStyle,),
           ),
         ),
          Expanded(
            flex: 5,
            child: BuildCard(childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(getResult,style: ResultsPageResponseStyle,),
                Text(CalculateBmi,style: ResultNumberStyle,),
                Text(Recommendation,textAlign: TextAlign.center,style: ResultRecommendationStyle,),
              ],
            ), colour: cardColor,),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
    },
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFCBCBCB),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 80,
              child: const Center(child: Text('RE-CALCULATE',style: TextStyle(color:Color(0xFF190242),fontWeight: FontWeight.bold,fontSize: 25),)),
            ),
          ),

        ],
      ),
    );

  }
}
