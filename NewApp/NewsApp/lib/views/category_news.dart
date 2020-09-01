import 'package:NewsApp/helper/news.dart';
import 'package:NewsApp/models/articale_model.dart';
import 'package:NewsApp/models/category_model.dart';
import 'package:NewsApp/views/article_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Categorynews extends StatefulWidget {
  final String category;
  Categorynews({this.category});
  @override
  _CategorynewsState createState() => _CategorynewsState();
}

class _CategorynewsState extends State<Categorynews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Flutter'),
            Text('News', style: TextStyle(color: Colors.blue)),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTitle(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogTitle(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 17, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
