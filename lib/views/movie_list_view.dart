import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/red_text.dart';
import 'package:movie_app/custom_widgets/yellow_text.dart';
import 'package:movie_app/custom_widgets/white_text.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/networking/api_response.dart';
import 'package:movie_app/networking/api_serivce.dart';
import 'package:movie_app/utils/spacing.dart';
import 'package:movie_app/viewmodels/movie_list_viewmodel.dart';
import 'package:movie_app/views/movie_detail_view.dart';
import 'package:movie_app/views/response_views.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<MovieListViewmodel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ListView(
            // physics: ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WhiteText(
                    text: "Movie ",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  Text(
                    "List",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 20),
                  )
                ],
              ),
              kSizedBoxH10,
              kSizedBoxH10,
              _model.allMovies.status == Status.LOADING
                  ? Loading(
                      loadingMessage: "Loading",
                    )
                  : _model.allMovies.status == Status.ERROR
                      ? Error(
                          errorMessage: _model.allMovies.message,
                          onRetryPressed: () {
                            _model.fetchMovies();
                          },
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _model.allMovies.data.items.length,
                          itemBuilder: (ctx, index) {
                            Item _item = _model.allMovies.data.items[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailView(
                                      movieItem: _item,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: _item.image.isNotEmpty
                                              ? Image.network(
                                                  _item.image,
                                                  errorBuilder:
                                                      (ctc, exception, stack) {
                                                    return Icon(
                                                        Icons.error_outline);
                                                  },
                                                )
                                              : WhiteText(text: "Unavailable")),
                                      kSizedBoxW10,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _item.title,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.2),
                                            ),
                                            kSizedBoxH10,
                                            RedText(
                                              text: _item.released,
                                            ),
                                            kSizedBoxH10,
                                            kSizedBoxH10,
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(8.0),
                                                child: RedText(
                                                  text: "View Details",
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          })
            ],
          ),
        ),
      ),
    );
  }
}
