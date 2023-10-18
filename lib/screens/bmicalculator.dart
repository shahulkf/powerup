import 'package:flutter/material.dart';

class BmiCalculators extends StatefulWidget {
  const BmiCalculators({super.key});

  @override
  State<BmiCalculators> createState() => _BmiCalculatorsState();
}

class _BmiCalculatorsState extends State<BmiCalculators> {

  String result = '';
   late double height = 0;
  late double weight = 0;
  String interpretation= '';

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Height in Cm :',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Your Height in Cm ',
                  fillColor: Colors.grey[900],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Weight in Kg:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Your Weight in Kg ',
                  fillColor: Colors.grey[900],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                    height = double.parse(heightController.value.text);
                    weight = double.parse(weightController.value.text);
                    interpretation = 
                     calculateBmi(height, weight);
                    heightController.clear();
                    weightController.clear();
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    'Calculate',
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: const Text(
                  'YOUR BMI IS : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
               const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child:  Text(
                  ' $result',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
               Container(
                width: double.infinity,
                child:  Text(
                  ' $interpretation',
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: interpretation=='Under Weight'?Colors.blue:interpretation=='Normal Weight'?Colors.green:interpretation=='Over Weight'?Colors.orange:Colors.red
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

 calculateBmi(double height , double weight){
double finalresult = weight / (height * height/10000);
String bmi = finalresult.toStringAsFixed( 2);
setState(() {
  result = bmi;
});
 return interpretBmi(double.tryParse(result)??0);
}


String interpretBmi(double bmi){
  String interpretation;
  if(bmi<18.5){
     interpretation = 'Under Weight';
  }else if (bmi <24.9){
    interpretation = 'Normal Weight';
  }else if (bmi < 29.9){
    interpretation = 'Over Weight';
  }else{
    interpretation = 'Obese';
  }
  return interpretation;
}

}

