
import 'package:flutter/material.dart';

class MoviesDescription extends StatefulWidget {
  const MoviesDescription({super.key});

  @override
  State<MoviesDescription> createState() => _MoviesDescriptionState();
}

class _MoviesDescriptionState extends State<MoviesDescription> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.7,
          width: MediaQuery.sizeOf(context).width * 0.75,
          decoration: backGradient(),
          child: Column(
            children: [
              titlePart(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('./images/shadowPiano.jpg'),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.play_circle,
                      size: 100,
                      color: Colors.white.withOpacity(0.8),
                    )
                  )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration backGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: convertirListeCouleurs([
          Colors.indigo[900],
          Colors.purple[900],
          Colors.indigo[800],
          Colors.purple[800],
          Colors.indigo[700],
          Colors.purple[700],
          Colors.indigo[600],
          Colors.purple[600],
          Colors.indigo[500],
          Colors.purple[500],
        ]), 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  List<Color> convertirListeCouleurs(List<Color?> listeCouleursNulles) {
    return listeCouleursNulles
      .where((couleur) => couleur != null)
      .map((couleurNonNulle) => couleurNonNulle!)
      .toList();
  }

  Row titlePart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: IconButton(
            alignment: Alignment.centerRight,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
              weight: 30,
            ),
          ),
        ),
        Text(
          "Shadow",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white, // Couleur de l'ombre
                offset: Offset(1, 1), // Décalage de l'ombre par rapport au texte
                blurRadius: 10 , // Flou de l'ombre
              ),
            ],
          ),
        ),
        const SizedBox(width: 50, height: 65,)
      ]
    );
  }
}