part of'../../screens/media_reviews.dart';
class _ReviewAuthorDetails extends StatelessWidget {
  final Review review;
  const _ReviewAuthorDetails(this.review);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Row(
            children: [
              FittedBox(
                child: Text(
                    review.authorDetails.name == '' ?
                    review.authorDetails.username :
                    review.authorDetails.name,
                    style: AppTextStyles.get14BoldText()),
              ),
              2.pw,
              if(review.authorDetails.rating!=0)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  margin:const EdgeInsets.all(2),
                  child:  Row(
                    children: [
                      const Icon(Icons.star_rate,size: 10),
                      Text("${review.authorDetails.rating}",style: AppTextStyles.get14NormalText()),
                    ],
                  ),
                )
            ],
          ),
        ),
        FittedBox(
          child: Text("Written By ${review.authorDetails.name == '' ?
          review.authorDetails.username :
          review.authorDetails.name}",style: AppTextStyles.get10NormalText()),
        ),
        2.ph,
        Text("on ${review.createdAt.substring(0,10)}",style:AppTextStyles.get10NormalText())
      ],
    );
  }
}