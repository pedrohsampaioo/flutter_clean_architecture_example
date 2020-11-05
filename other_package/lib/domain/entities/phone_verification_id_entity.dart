class PhoneVerificationIdEntity {
  final String id;

  const PhoneVerificationIdEntity(this.id) : assert(id != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PhoneVerificationIdEntity &&
      o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
