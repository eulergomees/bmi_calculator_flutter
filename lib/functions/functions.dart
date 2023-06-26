import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/calculator_page.dart';

TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

void resetFields() {
  weightController.text = "";
  heightController.text = "";
}

String info = "Enter your data";

void calculate() {
  double weight = double.parse(weightController.text);
  double height = double.parse(heightController.text) / 100;
  double imc = weight / (height * height);
  if (imc < 18.6) {
    info = "Underweight! IMC: ${imc.toStringAsPrecision(3)}";
  } else if( imc >= 18.6 && imc < 24.9){
    info = "Healthy weight! IMC: ${imc.toStringAsPrecision(3)}";
  } else if(imc >= 25.0 && imc < 29.9){
    info = "Overweight! IMC: ${imc.toStringAsPrecision(3)}";
  } else if (imc >= 30.0){
    info = "Obesity! IMC: ${imc.toStringAsPrecision(3)}";
  }
}
