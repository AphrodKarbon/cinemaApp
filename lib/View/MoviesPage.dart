
import 'package:cinema/View/MoviesComponent/MoviesDescription.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  

  @override
  Widget build(BuildContext context) {
    double larg = MediaQuery.sizeOf(context).width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            6,
            (index) {
              return Column(
                children: [
                  typeMoviesList(),
                  moviesSrcoll(larg)
                ],
              );
            }
          ),
        ),
      )
    );
  }

  Row typeMoviesList() {
    return Row(
      children: [
        SizedBox(
          width: 10,
          height: 70,
          ),
        Text(
          'En Famille',
          style: TextStyle(
           color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  Container moviesSrcoll(double larg) {
    return Container(
      height: 180,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: larg * 0.01),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                theFadeAnim()
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: larg * 0.01),
              child: ClipRRect (
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('./images/images.jpeg'),
              )
            )     
          );
        }
      )
    );
  }

  PageRouteBuilder theFadeAnim() {
    return PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context,animation,__) {
        const beginOpacity = 0.0;
        const endOpacity = 1.0;
        var opacityTween = Tween<double>(begin: beginOpacity, end: endOpacity);
        var fadeTransition = opacityTween.animate(animation);
        return FadeTransition(
          opacity: fadeTransition,
          child: MoviesDescription(),
        );
      }
    );
  }

}
