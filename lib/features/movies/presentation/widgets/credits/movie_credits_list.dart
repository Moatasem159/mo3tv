import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/cast.dart';
import 'package:mo3tv/features/movies/presentation/widgets/credits/cast_widget.dart';

class MovieCreditsList extends StatelessWidget {
  final List<CastMember> movieCredits;
  const MovieCreditsList({Key? key, required this.movieCredits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "Cast : ${movieCredits.length}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: movieCredits.length,
                  (context, index) {
                return CastMemberWidget(
                    member:movieCredits[index]);
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}