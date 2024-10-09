import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Local & Network Image Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Local Image
              Image.asset(
                'assets/image.jpg', // Local image path
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Space between images

              // Network Image
              Image.network(
                'https://parade.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MTkwNTgxNDY5Mzk2NjczNjYx/earth-facts-jpg.webp', // earth Network image URL
                width: 500,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
