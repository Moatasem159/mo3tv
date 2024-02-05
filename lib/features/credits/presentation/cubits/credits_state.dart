part of'credits_cubit.dart';
abstract class CreditsStates {}
class GetMediaCreditsLoadingState extends CreditsStates{}
class GetMediaCreditsSuccessState extends CreditsStates{
  final List<CastMember> credits;
  GetMediaCreditsSuccessState(this.credits);
}
class GetMediaCreditsErrorState extends CreditsStates{}