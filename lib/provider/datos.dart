class Datos {
  List<Map<String, dynamic>> _datos;

  static final Datos _instancia = Datos._privado();

  Datos._privado() {
    _datos = [];
  }

  factory Datos() {
    return _instancia;
  }

  List<Map<String, dynamic>> get datos {
    return _datos;
  }

  void agregarDatos(Map<String, dynamic> nuevosDatos) {
    _datos.add(nuevosDatos);
  }
}
