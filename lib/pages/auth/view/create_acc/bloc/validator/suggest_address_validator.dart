class AddressValidator {
  AddressValidator({
    this.address,
  });
  final String? address;

  bool validate() => address!.length > 3 ? true : false;
  
}
