part of'../../screens/account_screen.dart';
class _AccountAppBarWidget extends StatelessWidget {
  final Account account;
  const _AccountAppBarWidget(this.account);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          height: 70,
          width: 70,
          imageUrl: EndPoints.logoUrl(account.avatar),
          imageBuilder: (context, imageProvider) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider)),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                      account.name == ""
                          ? account.username[0]
                          : account.name[0],
                      style: AppTextStyles.get25BoldText())),
            );
          },
        ),
        Text(account.name == "" ? account.username : account.name,
            style: AppTextStyles.get14NormalText(height: 0)),
      ]
    );
  }
}