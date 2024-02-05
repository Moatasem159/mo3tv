part of'../../screens/media_credits_screen.dart';
class CastMemberWidget extends StatelessWidget {
  final CastMember member;
  const CastMemberWidget({super.key, required this.member});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CastImage(image: member.profilePath),
        Container(
          width: double.maxFinite,
          height: 45,
          decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(child: Text(member.originalName,style: AppTextStyles.get14BoldText())).addSymmetricPadding(h:5),
              if(member.character!=''||member.job!="")
              FittedBox(child: Text(member.character!=''?member.character:member.job,style: AppTextStyles.get14NormalText())).addSymmetricPadding(h:5)
            ],
          ),
        ),
      ],
    );
  }
}