import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 74, 74, 74),
            Color.fromARGB(255, 180, 149, 70)
          ], // Colores del degradado
          begin: Alignment.topLeft, // Punto de inicio del degradado
          end: Alignment.bottomRight, // Punto de finalización del degradado
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column( // Usar un Column para separar los TextSpan
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Una Sorpresa de verano\n",
                  style: TextStyle(
                    color: Color.fromARGB(255, 228, 158, 73), // Color del texto "Una Sorpresa de verano"
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Espacio de 10 unidades entre los TextSpan
          Text.rich(
            TextSpan(
              text: "Descuentos Hasta del 20%",
              style: TextStyle(
                color: Colors.white, // Color del texto "Descuentos Hasta del 20%"
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
