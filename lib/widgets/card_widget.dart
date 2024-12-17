import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int? id;
  final String? name;
  final int? age;
  final double? salary;
  const CardWidget({
    super.key,
    required this.age,
    required this.name,
    required this.salary,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(

              child: SizedBox(
                child: Row(
                  children: [
                    Text("$id )"),
                    const SizedBox(width: 8),
                    Text(name.toString()),
                  ],
                ),
              ),
            ),
Container(
              width: 1, 
              height: 40, 
              color: Colors.green, 
              margin: const EdgeInsets.symmetric(horizontal: 16), 
            ),
             Expanded(child: Text(age.toString(), textAlign: TextAlign.center,)),
             Container(
              width: 1, 
              height: 40, 
              color: Colors.green, 
              margin: const EdgeInsets.symmetric(horizontal: 16), 
            ),
            Expanded(child: Text(salary.toString(),textAlign: TextAlign.end,))
          ],
        ),
      ),
    );
    
  }
}