class FormaPago {
  final String clave;
  final String descripcion;

  FormaPago({required this.clave, required this.descripcion});

  factory FormaPago.fromJson(Map<String, dynamic> json) {
    return FormaPago(
      clave: json['clave'] as String,
      descripcion: json['descripcion'] as String,
    );
  }
}

class UsoCfdi {
  final String clave;
  final String descripcion;

  UsoCfdi({required this.clave, required this.descripcion});

  factory UsoCfdi.fromJson(Map<String, dynamic> json) {
    return UsoCfdi(
      clave: json['clave'] as String,
      descripcion: json['descripcion'] as String,
    );
  }
}
