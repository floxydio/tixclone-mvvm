import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixclone/Provider/Movie_Provider.dart';

class SeeAllPages extends StatelessWidget {
  const SeeAllPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).movieTrendingData();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<MovieProvider>(
              builder: (_, state, value) => state.movieTrending.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Top Movies",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        SizedBox(
                          height: 30,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20, crossAxisCount: 2),
                          itemBuilder: (_, index) => Stack(
                            children: [
                              Image.network(
                                state.UPLOAD_PATH +
                                    state.movieTrending[index].backdropPath,
                                fit: BoxFit.fitWidth,
                              ),
                              Positioned(
                                  bottom: 50,
                                  left: 5,
                                  child: Text(
                                    state.movieTrending[index].title.length > 15
                                        ? state.movieTrending[index].title
                                                .substring(0, 12) +
                                            ".."
                                        : state.movieTrending[index].title,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 5,
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,
                                          size: 14, color: Colors.yellowAccent),
                                      Text(
                                        state.movieTrending[index].popularity
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          itemCount: 8,
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
