abstract class AccountCustomListActionEvents {}
class ClearListEvent extends AccountCustomListActionEvents{
  final String listId;
  ClearListEvent(this.listId);
}
