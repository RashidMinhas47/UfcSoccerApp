import 'package:flutter/material.dart';
import 'package:ufc_soccer/utils/image_urls.dart';

class NextGameDetailTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8), // Border radius
      ),
      child: ListTile(
        leading: Container(
          width: 50, // Adjust width as needed
          height: 50, // Adjust height as needed
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image:
                  AssetImage(AppImages.appIcon), // Replace with your image icon
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'Next Game',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text.rich(
          TextSpan(
            text: 'Date: ',
            children: [
              TextSpan(
                text:
                    '{Next Match Date Time}', //TOdo: Replace with actual next game date
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: '\nSpots available: '),
              TextSpan(
                text:
                    '{Spots Available}', //Todo: Replace with actual spots available
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
