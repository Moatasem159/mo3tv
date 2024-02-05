part of'../screens/media_credits_screen.dart';
class _MediaCreditsList extends StatelessWidget {
  final List<CastMember> mediaCredits;
  const _MediaCreditsList(this.mediaCredits);
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: mediaCredits.length,
      itemBuilder: (context, index) => _CastMemberWidget(mediaCredits[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:0.7,crossAxisCount:3,mainAxisSpacing:10,crossAxisSpacing:6));
  }
}