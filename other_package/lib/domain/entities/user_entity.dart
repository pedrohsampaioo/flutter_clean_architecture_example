class UserEntity {
  final String uid;

  const UserEntity(this.uid) : assert(uid != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserEntity && o.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
