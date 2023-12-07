import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';



class MyHomePageone extends StatelessWidget {
  final String imageUrl =
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg'; // Replace with your actual image URL

  final DefaultCacheManager cacheManager = DefaultCacheManager();

  Future<void> _loadImage() async {
    FileInfo? fileInfo = await cacheManager.getFileFromCache(imageUrl);

    if (fileInfo == null || fileInfo.file == null) {
      print('Image not found in cache. Downloading...');
      await cacheManager.downloadFile(imageUrl);
    } else {
      print('Image found in cache.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cache Manager Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _loadImage,
              child: Text('Load Image'),
            ),
            SizedBox(height: 20),
            FutureBuilder<FileInfo?>(
              future: cacheManager.getFileFromCache(imageUrl),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data?.file == null) {
                  return Text('Image not found in cache.');
                } else {
                  return Image.network(snapshot.data!.originalUrl,height: 500,);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
