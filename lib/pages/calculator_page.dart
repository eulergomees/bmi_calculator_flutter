import 'package:flutter/material.dart';
import 'package:imc_calculator/functions/functions.dart';

class imcPage extends StatefulWidget {
  const imcPage({super.key});

  @override
  State<imcPage> createState() => _imcPageState();
}

class _imcPageState extends State<imcPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFCBE4DE),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('IMC Calculator'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                resetFields();
                setState(() {
                  info = "Enter your data";
                  formKey = GlobalKey<FormState>();
                });
              }, //reset data
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(Icons.person_outlined,
                        size: 120, color: Colors.teal),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Weight:',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please, enter your weight";
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: 70 kg',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Height:',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please, enter your height";
                              }
                            },
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: 170 cm',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 2),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: const EdgeInsets.all(14),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                calculate();
                                setState(() {});
                              }
                            },
                            child: const Text(
                              'Calculate',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            info,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal, fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
