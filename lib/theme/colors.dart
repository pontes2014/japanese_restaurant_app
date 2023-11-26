import 'package:flutter/material.dart';

var primaryColor = const Color.fromARGB(255, 138, 60, 55);
var secondaryColor = const Color.fromARGB(109, 140, 94, 91);

/*
Scaffold(
      appBar: AppBar(
        title: Text('Validação de CPF'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite um CPF para validar:',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (cpf) {
                  bool isValid = CPFValidator.isValid(cpf);
                  print('CPF é válido? $isValid');
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'CPF'),
              ),
            ),
          ],
        ),
      ),
    );
*/

/*
showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text("Empty cart",
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: primaryColor,
                          content: const Text(
                              "Add items to cart before proceeding to delivery and payment.",
                              style: TextStyle(color: Colors.white)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
*/