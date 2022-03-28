import 'package:flutter/material.dart';
import 'package:movie_flix_flutter/view/movie_detail_screen.dart';

import '../constants.dart';
import '../model/movie.dart';

class NewCard extends StatelessWidget {
  const NewCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Movie item;

  @override
  Widget build(BuildContext context) {
    var mytheme = Theme.of(context);
    return Card(
      color: mytheme.primaryColorLight,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetails(
                        movie: item,
                      )));
        },
        child: SizedBox(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.network(
                    'https://image.tmdb.org/t/p/w342${item.posterPath}'),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 2.0, 0.0),
                    //from here
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kTitleTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: kDescriptionTextStyle,
                        ),
                      ],
                    )
                    //to here
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
