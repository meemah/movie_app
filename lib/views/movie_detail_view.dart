import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/yellow_text.dart';
import 'package:movie_app/custom_widgets/white_text.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/networking/api_response.dart';
import 'package:movie_app/utils/spacing.dart';
import 'package:movie_app/viewmodels/movie_list_viewmodel.dart';
import 'package:movie_app/views/response_views.dart';
import 'package:provider/provider.dart';

class MovieDetailView extends StatelessWidget {
  final Item movieItem;

  const MovieDetailView({Key key, this.movieItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(
              movieItem.image,
              width: double.infinity,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.75,
            ),
            kSizedBoxH10,
            Center(
              child: YellowText(
                text: movieItem.title,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            kSizedBoxH10,
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      YellowText(
                        text: movieItem.runtime.isEmpty
                            ? "Duration: Unavilable"
                            : "Duration: ",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      WhiteText(
                        text: movieItem.runtime,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      Spacer(),
                      YellowText(
                        text: movieItem.released.isEmpty
                            ? "Released Date: Unavilable"
                            : "Released Date: ",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      WhiteText(
                        text: movieItem.released,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                  kSizedBoxH10,
                  WhiteText(text: movieItem.synopsis),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
