class Messagemodel {
  final String message;
  final String id;
  Messagemodel(this.message, this.id);
  factory Messagemodel.fromjson(jsondata) {
    return Messagemodel(jsondata['message'], jsondata['id']);
  }
}
