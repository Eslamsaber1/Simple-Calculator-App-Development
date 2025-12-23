import 'package:calculatorapp/features/calculator_operations/presentation/component/custom_buttom.dart';
import 'package:calculatorapp/features/calculator_operations/presentation/controllers/CalculatorService.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  final CalculatorService calculatorService = CalculatorService();

  double result = 0;

  void calculate(String operation) {
    final double num1 = double.tryParse(num1Controller.text) ?? 0;
    final double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          result = calculatorService.add(num1, num2);
          break;
        case '-':
          result = calculatorService.subtract(num1, num2);
          break;
        case '*':
          result = calculatorService.multiply(num1, num2);
          break;
        case '/':
          result = calculatorService.divide(num1, num2);
          break;
      }
    });
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator App Development'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalcButton(
                  text: '+',
                  onPressed: () => calculate('+'),
                ),
                CalcButton(
                  text: '-',
                  onPressed: () => calculate('-'),
                ),
                CalcButton(
                  text: '*',
                  onPressed: () => calculate('*'),
                ),
                CalcButton(
                  text: '/',
                  onPressed: () => calculate('/'),
                ),
              ],
            ),

            const SizedBox(height: 32),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Result: $result',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
