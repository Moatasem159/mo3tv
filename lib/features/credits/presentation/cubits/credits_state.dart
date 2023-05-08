import 'package:mo3tv/features/credits/domain/entities/cast.dart';

abstract class CreditsStates {}
class CreditsInitialState extends CreditsStates {}
class GetMediaCreditsLoadingState extends CreditsStates{}
class GetMediaCreditsSuccessState extends CreditsStates{
  final List<CastMember> credits;
  GetMediaCreditsSuccessState(this.credits);
}
class GetMediaCreditsErrorState extends CreditsStates{
  final String msg;
  GetMediaCreditsErrorState({required this.msg});
}