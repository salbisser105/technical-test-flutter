import 'package:intl/intl.dart';

// Función para capitalizar la primera letra de un string
String capitalizeFirstOfEach(String text) {
  return text.split(' ').map((str) {
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }).join(' ');
}

/// Función para formatear una fecha al estilo "17 Nov"
String formatDateToDayMonth(DateTime date) {
  // Formato sin capitalizar
  String formattedDate = DateFormat('d MMM', 'es').format(date);
  // Capitalizamos la primera letra del mes
  return capitalizeFirstOfEach(formattedDate);
}
