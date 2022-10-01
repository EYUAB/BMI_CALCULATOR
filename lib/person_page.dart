//import 'package:flutter/cupertino.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'build_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'formula_bmi.dart';
class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  int height=180;
  int weight=60;
  final _textController=TextEditingController();
  String name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 15,
        backgroundColor: Colors.transparent,
        title: const Text('BMI CALCULATOR',style: TextStyle(color: Color(0xFF190242),fontSize: 30,fontWeight: FontWeight.w900),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'What is your name?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 8, color: Colors.white, ),
                ),
                
              ),
              style: const TextStyle(fontSize: 22,color: Color(0xFF190242),),
            ),
          Expanded(child: BuildCard(colour: cardColor, childCard: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('HEIGHT',style: labelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),style: heightWeightStyle,),
                  const Text('cm',style: labelTextStyle ,),
                ],
              ),
              Slider(value: height.toDouble(),
                  min: 130.0,
                  max: 300.0,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black12,
                  onChanged: (double newValue){
               setState((){
                 height=newValue.round();
               }
               );
                  }
              )
            ],
          ),
          ),
          ),
          Expanded(child: BuildCard(colour: cardColor, childCard: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Weight',style: labelTextStyle,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(weight.toString(),style: heightWeightStyle,),
                  const Text('Kg',style:labelTextStyle,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               RoundedShape(plusMinus: FontAwesomeIcons.plus,
                   onPressed: () {
                 setState((){
                 weight++;
                }
                 );
                   }
               ),
                  const SizedBox(width: 10,),
                  RoundedShape(plusMinus: FontAwesomeIcons.minus,
                      onPressed: (){
                       setState((){
                       weight--;
                       }
                       );
                      }
                  ),
                ],
              ),
            ],
          ),
          ),
          ),
          GestureDetector(
            onTap: (){
              setState((){name=_textController.text;});
              
              FormulaBmi calc= FormulaBmi(height: height, weight: weight,name: name);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                  CalculateBmi: calc.CalculateBmi(),
                  Recommendation: calc.Recommendation(),
                  getResult: calc.getResult(),
              ),),);

            },
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFCBCBCB),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 80,
              child: Center(child: const Text('Calculate My BMI',style: TextStyle(color:Color(0xFF190242),fontWeight: FontWeight.bold,fontSize: 25),)),
            ),
          ),
        ],
      )
    );
  }
}

class RoundedShape extends StatelessWidget {
   RoundedShape({required this.plusMinus, required this.onPressed});
  final IconData plusMinus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 14,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF190242),
  child: Icon(plusMinus,color: Colors.white,),

    );
  }
}
