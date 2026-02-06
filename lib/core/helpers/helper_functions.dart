String getChatId(String uid1, String uid2) {
  List<String> uids = [uid1, uid2];
  uids.sort();
  return uids.join('_');
}
