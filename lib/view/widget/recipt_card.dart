import 'package:flutter/material.dart';

class RecpietCard extends StatelessWidget {
  final String name;
  final double rating;
  final String totalTime;
  final String hostedLargeUrl;
  const RecpietCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.totalTime,
    required this.hostedLargeUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(hostedLargeUrl),
                fit: BoxFit.fill,
              ),
            ),
            height: 150,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black45.withOpacity(.3),
            ),
            height: 150,
            width: double.infinity,
          ),
          Positioned(
            child: Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  rating.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 245,
                ),
                Text(
                  totalTime.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
