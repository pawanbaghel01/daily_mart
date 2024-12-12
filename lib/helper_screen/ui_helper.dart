
import 'package:flutter/material.dart';

class UiHelper {

 static buildProductCard({
    required String image,
    required String title,
    required String price,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    const Text(
                      'Tradly',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 7,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  helloPawan(){

  }
}