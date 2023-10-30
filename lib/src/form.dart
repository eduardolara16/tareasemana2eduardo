
import 'package:flutter/material.dart';


class FormBasico extends StatefulWidget {
  const FormBasico({Key? key}) : super(key: key);

  @override
  _FormBasicoState createState() => _FormBasicoState();
}

class _FormBasicoState extends State<FormBasico> {
  String dropdownValue = 'Suma';
  String result = 'Resultado';

  void calculateResult(String num1, String num2) {
    double parsedNum1 = double.tryParse(num1) ?? 0;
    double parsedNum2 = double.tryParse(num2) ?? 0;

    setState(() {
      if (dropdownValue == 'Suma') {
        result = (parsedNum1 + parsedNum2).toStringAsFixed(2);
      } else if (dropdownValue == 'Resta') {
        result = (parsedNum1 - parsedNum2).toStringAsFixed(2);
      } else if (dropdownValue == 'Multiplicación') {
        result = (parsedNum1 * parsedNum2).toStringAsFixed(2);
      } else if (dropdownValue == 'División') {
        result = parsedNum2 != 0 ? (parsedNum1 / parsedNum2).toStringAsFixed(2) : 'Error';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController num1Controller = TextEditingController();
    TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Operaciones Aritmeticas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 70,
                width: 250,
                child: TextFormField(
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Ingrese un número',
                    labelText: 'Primer valor',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: 250,
                child: TextFormField(
                  controller: num2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Ingrese un número',
                    labelText: 'Segundo valor',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              
              SizedBox(height: 40),
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple[200],
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Suma',
                      'Resta',
                      'Multiplicación',
                      'División'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    num1Controller.text.isEmpty ? '' : 'Valor correcto',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    num2Controller.text.isEmpty ? '' : 'Valor correcto',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          calculateResult(num1Controller.text, num2Controller.text);
        },
        elevation: 2.0,
        fillColor: Colors.purple[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
        child: Icon(
          Icons.play_arrow_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}