import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenido a SeatUp, Empezemos!",
      "image": "assets/images/Presentation.png"
    },
    {
      "text":
          "Descubre la comodidad sin límites: la silla perfecta para tu descanso y productividad",
      "image": "assets/images/Presentation2.png"
    },
    {
      "text": "Sumérgete en la elegancia y ergonomía de nuestra silla, \n un nivel superior de confort.",
      "image": "assets/images/Presentation3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black, // Color negro
                 Colors.black, // Color negro     
                 Colors.black, // Color negro       
                 Colors.black, // Color negro           
                // Colors.white, // Color blanco
                Colors.grey, // Color gris
                Color.fromARGB(255, 237, 216, 189), // Color negro
               
              ],
              begin: Alignment.topCenter, // Punto de inicio del degradado
              end: Alignment.bottomCenter, // Punto de finalización del degradado
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: "Ok",
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: Colors.white, // Puedes ajustar el color del borde aquí
          width: 1,
        ),
      ),
    );
  }
}
