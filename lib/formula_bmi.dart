import 'dart:math';
import 'package:bmi_calculator/Person_Page.dart';
class FormulaBmi{
  FormulaBmi( {required this.height, required this.weight,required this.name});
  final int height;
  final int weight;
  final String name;
  double _bmi=0;
  String CalculateBmi(){
_bmi=weight/pow(height/100, 2);
return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return '$name you are overweight.';
    }
          else if(_bmi>18.5){
            return '$name you are  normal';
    }
          else {
            return '$name you are under weight';
          }
  }
  String Recommendation(){
    if(_bmi>=25){
      return '$name you must go to GYM.';
    }
    else if(_bmi>18.5){
      return '$name you are in good health';
    }
    else {
      return '$name you must eat more!';
    }
  }

}