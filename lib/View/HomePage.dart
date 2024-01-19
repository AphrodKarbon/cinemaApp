import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double long = MediaQuery.sizeOf(context).height;
    double larg = MediaQuery.sizeOf(context).width;
    return Container(
      child:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: long * 0.6,
              width: larg * 0.9,
              color: Colors.red,
              margin: const EdgeInsets.only(bottom: 10),
            ),
            Row(
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
            ),
            Container(
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
            )
          ]
        ),
      )
    );
    
  }

}
