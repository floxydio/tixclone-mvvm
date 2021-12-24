import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixclone/Pages/Detail_pages.dart';
import 'package:tixclone/Pages/Seeall_pages.dart';
import 'package:tixclone/Provider/Movie_Provider.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).movieTrendingData();
    Provider.of<MovieProvider>(context, listen: false).tvTrendingData();
    Provider.of<MovieProvider>(context, listen: false).latestData();
    Provider.of<MovieProvider>(context, listen: false).getGenreTV();
    Provider.of<MovieProvider>(context, listen: false).getGenreMovie();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("TEX ID",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.yellowAccent)),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<MovieProvider>(
                  builder: (_, state, value) => state.movieTrending.isEmpty &&
                          state.tvTrending.isEmpty &&
                          state.latest == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.latest == null
                                ? CircularProgressIndicator()
                                : Stack(
                                    children: [
                                      Center(
                                          child: InnerShadow(
                                        blur: 2,
                                        offset: const Offset(-3, -8),
                                        color: Colors.black12.withOpacity(0.2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                              state.UPLOAD_PATH +
                                                  state.latest.backdropPath),
                                        ),
                                      )),
                                      Positioned(
                                          bottom: 30,
                                          left: 10,
                                          child: Text(state.latest.title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.remove_red_eye,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  state.latest.popularity
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ))
                                    ],
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 13,
                                  height: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100.0))),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Center(
                                  child: Container(
                                    width: 13,
                                    height: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Center(
                                  child: Container(
                                    width: 13,
                                    height: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0))),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Mau Nonton Apa...",
                                  hintStyle: TextStyle(
                                      color: Colors.white60, fontSize: 12),
                                  enabledBorder: const OutlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      Icon(Icons.search, color: Colors.white)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Movie Trending
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Movie Trending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SeeAllPages()));
                                    },
                                    child: Icon(Icons.arrow_right,
                                        color: Colors.white),
                                  )
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < state.genreMovie.genres.length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              side: BorderSide(
                                                  color: Colors.yellowAccent,
                                                  width: 1)),
                                          onPressed: () {
                                            print(
                                                state.genreMovie.genres[i].id);
                                          },
                                          child: Text(
                                              state.genreMovie.genres[i].name,
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    )
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    state.movieTrending.isEmpty ||
                                            state.movieTrending.length == 0
                                        ? SizedBox()
                                        : InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DetailPages(
                                                            id: state
                                                                .movieTrending[
                                                                    i]
                                                                .id,
                                                          )));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              width: 150,
                                              height: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      state.UPLOAD_PATH +
                                                          state.movieTrending[i]
                                                              .backdropPath,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    state
                                                        .movieTrending[i].title,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Text(
                                                        state.movieTrending[i]
                                                            .releaseDate,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                ],
                              ),
                            ),
                            // TV Trending
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("TV Trending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.arrow_right,
                                        color: Colors.white),
                                  )
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  for (int i = 0;
                                      i < state.genreTV.genres.length;
                                      i++) // nyontek lu yak iya bang
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              side: BorderSide(
                                                  color: Colors.yellowAccent,
                                                  width: 1)),
                                          onPressed: () {
                                            print(state.genreTV.genres[i].id);
                                          },
                                          child: Text(
                                              state.genreTV.genres[i].name,
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    )
                                ])),
                            SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    state.tvTrending.isEmpty ||
                                            state.tvTrending.length == 0
                                        ? SizedBox()
                                        : InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              width: 150,
                                              height: 250,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      state.UPLOAD_PATH +
                                                          state.tvTrending[i]
                                                              .backdropPath,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    state.tvTrending[i].name,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Text(
                                                        state.tvTrending[i]
                                                            .firstAirDate,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                ],
                              ),
                            ),
                          ],
                        ))
            ],
          ),
        ),
      )),
    );
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    Widget child,
  }) : super(child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double blur;
  Color color;
  double dx;
  double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child, offset);
    context.canvas..restore()..restore()..restore();
  }
}
