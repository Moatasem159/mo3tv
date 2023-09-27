abstract class CheckConnectivityStates {}
class CheckConnectivityInitialState extends CheckConnectivityStates {}
class CheckConnectivityLoadingState extends CheckConnectivityStates {}
class ConnectedState extends CheckConnectivityStates {}
class DisconnectedState extends CheckConnectivityStates {}
class ErrorState extends CheckConnectivityStates {}
