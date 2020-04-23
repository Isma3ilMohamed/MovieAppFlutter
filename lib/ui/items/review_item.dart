import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/MovieReviews.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  ReviewItem(this.review);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Author: ${review.author}",
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "${review.content}",
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                maxLines: 3,overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        navigateToWebView(context);
      },
    );
  }

  navigateToWebView(BuildContext context){

   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewContainer(review.url,"Review")));
  }
}
