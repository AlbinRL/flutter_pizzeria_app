class OptionItem {
  final String name;
  final double supplement;

  const OptionItem({
    required this.name,
    this.supplement = 0.0,
  });

  @override
  String toString() => name;
}
