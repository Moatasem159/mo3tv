part of'../../screens/media_reviews.dart';
class _ReviewLoadingWidget extends StatelessWidget {
  const _ReviewLoadingWidget();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: 350,
        height: 210,
        decoration:  BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(5)
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),),
                ),
                5.pw,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[600]!,
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey
                            ),
                          ),
                        ),
                        5.pw,
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey
                          ),
                          padding:const EdgeInsets.all(2),
                          margin:const EdgeInsets.all(2),
                        )
                      ],
                    ),
                    5.ph,
                    Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: 20,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            7.ph,
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            ),
            10.ph,
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height:25,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}