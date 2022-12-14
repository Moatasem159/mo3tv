import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/core/widgets/credits/cast_widget.dart';

class MediaCreditsList extends StatelessWidget {
  final List<CastMember> mediaCredits;
  const MediaCreditsList({Key? key, required this.mediaCredits}) : super(key: key);

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
                    "Cast : ${mediaCredits.length}",
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
              childCount: mediaCredits.length,
                  (context, index) {
                return CastMemberWidget(
                    member:mediaCredits[index]);
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