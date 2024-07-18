import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provides/news_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String countryCode = 'us';
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: const Text('MyNews',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: const [
            Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text("IN",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Consumer<NewsProvider>(
          builder: (context, newsProvider, child) {
            if (newsProvider.newsArticles.isEmpty) {
              newsProvider.fetchNews(countryCode);
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: newsProvider.newsArticles.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsProvider.newsArticles[index].title,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                newsProvider.newsArticles[index].description,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                  newsProvider
                                      .newsArticles[index].timePostedAgo,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                        if (newsProvider
                            .newsArticles[index].urlToImage.isNotEmpty)
                          Container(
                            width: 140,
                            height: 140,
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  newsProvider.newsArticles[index].urlToImage,
                                  fit: BoxFit.cover,
                                )),
                          )
                      ],
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
