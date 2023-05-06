import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class TvShowPlayingNowCardWidget extends StatelessWidget {
  final ImageProvider image;
  final TvShow tvShow;
  const TvShowPlayingNowCardWidget({Key? key, required this.image, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3.5,
      width: MediaQuery.of(context).size.width-50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: image
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'now playing'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight:FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        4.pw,
                        const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.circle,
                            color: Colors.redAccent,
                            size: 12,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 2,vertical:3),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      tvShow.name!,
                      style:  const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Text(
                      tvShow.voteAverage.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    4.pw,
                    const Icon(Icons.star_rounded,size: 15,color: Colors.yellow,)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}