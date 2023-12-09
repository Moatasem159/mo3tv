import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_alert.dart';
class AccountListWidget extends StatefulWidget{
  final String image;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String mediaType;
  final String listType;
  const AccountListWidget(
      {super.key,
      required this.image,
      required this.icon,
      required this.iconColor,
      required this.title,
      required this.mediaType,
      required this.listType});
  @override
  State<AccountListWidget> createState() => _AccountListWidgetState();
}
class _AccountListWidgetState extends State<AccountListWidget> {
  AssetImage ?assetImage;
  @override
  void initState() {
    super.initState();
    assetImage = AssetImage(widget.image);
  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage!,context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(AppStrings.sessionId!='')
          {
            GoRouter.of(context).pushNamed(Routes.accountMediaLists,
                pathParameters: {"title":widget.title, "mediaType":widget.mediaType,"listType":widget.listType});
            AccountListsCubit.get(context).getAccountList(mediaType: widget.mediaType,listType:widget.listType);
          }
        else{
          showDialog(context: context, builder:(context) => const LoginAlert());
        }
        },
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0, 0.5, 0.5, 1],
          )
              .createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.dstATop,
        child: Container(
          width: 130,
          height:170,
          alignment: Alignment.center,
          decoration:BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(fit: BoxFit.cover,image: assetImage!)
          ),
          child:Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon,color: widget.iconColor),
                10.ph,
                FittedBox(child: Text(widget.title.tr(context)!,style:AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()))
              ],
            ),
          ),
        ),
      ).addAllPadding(8),
    );
  }
}