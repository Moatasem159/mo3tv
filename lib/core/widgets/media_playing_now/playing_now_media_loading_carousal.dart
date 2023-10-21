import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_loading_card.dart';
class PlayingNowMediaLoadingCarousal extends StatelessWidget {
  const PlayingNowMediaLoadingCarousal({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3.5,
        viewportFraction: .89,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items:const [PlayingNowMediaLoadingCard()],
    );
  }
}