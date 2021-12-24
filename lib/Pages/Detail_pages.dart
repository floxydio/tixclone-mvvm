import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixclone/Provider/Movie_Provider.dart';

class DetailPages extends StatelessWidget {
  final int id;
  const DetailPages({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).getMovieById(id);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Detail"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Consumer<MovieProvider>(
        builder: (_, state, value) => state.listMovie == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image.network(
                      state.UPLOAD_PATH + state.listMovie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8,
                    child: Container(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      state.listMovie.title,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8,
                    child: Container(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellowAccent),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: Text(
                                            "Sedang dialihkan, Sebentar..."),
                                      ));
                            },
                            child: Text(
                              "🎫 Buy Ticket Now",
                              style: TextStyle(color: Colors.black),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Release Date",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            Text(
                                "${state.listMovie.releaseDate.day.toString()} ${state.listMovie.releaseDate.month.toString()} ${state.listMovie.releaseDate.year.toString()}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tagline",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            Text(state.listMovie.tagline,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Vote",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            Text(state.listMovie.voteAverage.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Overview",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(state.listMovie.overview,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 0.8,
                          child: Container(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Production Company",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0;
                                i < state.listMovie.productionCompanies.length;
                                i++)
                              Expanded(
                                child: Text(
                                  state.listMovie.productionCompanies[i].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ))),
    );
  }
}
