
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  

  @override
  Widget build(BuildContext context) {
    double long = MediaQuery.sizeOf(context).height;
    double larg = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(top: 100),
      color: Colors.black87,
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

            },
            child: Container(
              margin: EdgeInsets.only(right: larg * 0.01),
              child: ClipRRect (
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('./images/images.jpeg'),
              )
            )     
          );
        }
      )
    );
  }

}
