import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/extension/screen_size_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/on_boarding/presentation/cubits/genres_cubit/genres_cubit.dart';
import 'package:mo3tv/features/on_boarding/presentation/widgets/background_image.dart';
part '../widgets/genres_screen_widgets/app_logo.dart';
part '../widgets/genres_screen_widgets/finish_button.dart';
part '../widgets/genres_screen_widgets/genres_screen_body.dart';
part '../widgets/genres_screen_widgets/genres_screen_title.dart';
part '../widgets/genres_screen_widgets/choose_keyword_title.dart';
part '../widgets/genres_screen_widgets/choose_keyword_section.dart';
part '../widgets/genres_screen_widgets/keyword_widgets/keyword_list.dart';
part '../widgets/genres_screen_widgets/keyword_widgets/keyword_widget.dart';
part '../widgets/genres_screen_widgets/keyword_widgets/keyword_list_title.dart';
part '../widgets/genres_screen_widgets/keyword_widgets/keyword_list_widget.dart';
class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
      ),
      child: BlocProvider(
        create: (_) => GenresCubit(sl()),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const _GenresScreenBody(),
        ),
      ),
    );
  }
}