import 'option_item.dart';

class Pizza {
  final String id;
  final String title;
  final String imagePath;
  final String description;
  final double basePrice;

  final List<OptionItem> pates;
  final List<OptionItem> tailles;
  final List<OptionItem> sauces;

  OptionItem selectedPate;
  OptionItem selectedTaille;
  OptionItem selectedSauce;

  Pizza({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.basePrice,
    required this.pates,
    required this.tailles,
    required this.sauces,
  })  : selectedPate = pates.first,
        selectedTaille = tailles.first,
        selectedSauce = sauces.first;

  double get total =>
      basePrice +
          (selectedPate.supplement) +
          (selectedTaille.supplement) +
          (selectedSauce.supplement);

  Pizza copyWithSelected({
    OptionItem? pate,
    OptionItem? taille,
    OptionItem? sauce,
  }) {
    final copy = Pizza(
      id: id,
      title: title,
      imagePath: imagePath,
      description: description,
      basePrice: basePrice,
      pates: pates,
      tailles: tailles,
      sauces: sauces,
    );
    copy.selectedPate = pate ?? selectedPate;
    copy.selectedTaille = taille ?? selectedTaille;
    copy.selectedSauce = sauce ?? selectedSauce;
    return copy;
  }
}
