import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
class AccountListWidget extends StatefulWidget{
  final String image;
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  final bool moviesWatchlist;
  const AccountListWidget(
      {super.key,
      required this.image,
      required this.icon,
      required this.iconColor,
      required this.title,
      this.favMovies=false,
      this.ratedMovies=false,
      this.favTv=false,
      this.ratedTv=false,
      this.tvWatchlist=false,
      this.moviesWatchlist=false
      });

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
      onTap: ()=> GoRouter.of(context).pushNamed(
        Routes.accountMediaLists,
        queryParameters: {
          "title":widget.title,
          "favMovies":widget.favMovies.toString(),
          "ratedMovies":widget.ratedMovies.toString(),
          "favTv":widget.favTv.toString(),
          "ratedTv":widget.ratedTv.toString(),
          "tvWatchlist":widget.tvWatchlist.toString(),
          "moviesWatchlist":widget.moviesWatchlist.toString()},
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon,color: widget.iconColor),
                  10.ph,
                  FittedBox(
                    child: Text(widget.title,style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}