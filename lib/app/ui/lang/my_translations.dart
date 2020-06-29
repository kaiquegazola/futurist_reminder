import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'places': 'Places',
          'helpers': 'Helpers',
          'addImage': 'Add Image',
          'addPlace': 'Add new place',
          'slogan': 'futurist reminder',
          'cropper': 'Crop Image',
          'save': 'Save',
          'description': 'Description'
        },
        'pt': {
          'places': 'Locais',
          'helpers': 'Ajuda/Atalho',
          'addImage': 'Adicionar Imagem',
          'addPlace': 'Adicionar novo local',
          'slogan': 'lembrete futurista',
          'cropper': 'Recortar Imagem',
          'save': 'Salvar',
          'description': 'Descrição'
        },
      };
}
