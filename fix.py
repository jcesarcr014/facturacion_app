import re

with open('lib/features/isla/presentation/views/printer_settings_view.dart', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('\"\\n\"', '\"\\\\\n\"')
content = content.replace('\"PAGINA DE PRUEBA\n\"', '\"PAGINA DE PRUEBA\\\\n\"')
content = content.replace('\"Tipo Imp : \\n\"', '\"Tipo Imp : \\\\\n\"')
content = content.replace('\"Ancho    : \ (\ col)\n\"', '\"Ancho    : \ (\ col)\\\\n\"')
content = content.replace('\"Estado   : CONECTADA\n\"', '\"Estado   : CONECTADA\\\\n\"')
content = content.replace('\"   IMPRESION DE PRUEBA EXITOSA  \n\"', '\"   IMPRESION DE PRUEBA EXITOSA  \\\\n\"')
content = content.replace('\"\\n\n\n\n\";', '\"\\\\\n\\\\n\\\\n\\\\n\";')

content = content.replace(\"'58mm\n(32 col)'\", \"'58mm\\\\n(32 col)'\")
content = content.replace(\"'58mm\n(38 col)'\", \"'58mm\\\\n(38 col)'\")
content = content.replace(\"'58mm\n(42 col)'\", \"'58mm\\\\n(42 col)'\")
content = content.replace(\"'80mm\n(48 col)'\", \"'80mm\\\\n(48 col)'\")

with open('lib/features/isla/presentation/views/printer_settings_view.dart', 'w', encoding='utf-8') as f:
    f.write(content)
