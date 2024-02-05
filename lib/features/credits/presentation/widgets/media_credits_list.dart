part of'../screens/media_credits_screen.dart';
class MediaCreditsList extends StatelessWidget {
  final List<CastMember> mediaCredits;
  const MediaCreditsList({super.key, required this.mediaCredits});
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: mediaCredits.length,
      itemBuilder: (context, index) => CastMemberWidget(member: mediaCredits[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:0.7,crossAxisCount:3,mainAxisSpacing:10,crossAxisSpacing:6));
  }
}