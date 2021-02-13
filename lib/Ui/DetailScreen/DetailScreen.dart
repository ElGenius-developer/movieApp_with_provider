import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:provider/provider.dart';
import 'Alternative_AppBar_create.dart';
import 'VotePopularityRow.dart';
import 'imageAndTitleRowFunction.dart';

class DetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final int index;

  final CachedNetworkImageProvider poster;
  final CachedNetworkImageProvider cover;
  DetailScreen({Key key, this.index, this.poster, this.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final results = MoviesProvider.movies.results;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.pink[900],
      body: SafeArea(
        child: Consumer<MoviesProvider>(builder: (context, provider, child) {
          return Stack(children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  //cover
                  Hero(
                    tag: index,
                    child: Container(
                        width: width,
                        height: height / 2.6,
                        child: Image(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fitHeight,
                            filterQuality: FilterQuality.high,
                            image: cover)),
                  ),
                  Expanded(
                    //body after the cover  ......
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            width: width - 5,
                            height: height / 2.89,
                            child: imageAndTitleRowFunction(
                              globalKey: _scaffoldKey,
                              context: context,
                              index: index,
                              imageProvider: poster,
                            ),
                          ), //first row
                          Container(
                              width: width - 5,
                              height: height / 8,
                              child: Card(
                                child: FittedBox(
                                  child: VotePopularityRow(
                                    index: index,
                                  ),
                                ),
                              )),
                          //second row
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(results[index].overview),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment(.9, -.25),
                child: Container(
                    width: width / 6.5,
                    height: height / 14,
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: 25,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            Align(
              child: alternativeAppBar(context, index),
              alignment: Alignment.topLeft,
            )
          ]);
        }),
      ),
    );
  }
}
