class TherapistListItemModel {
  final String therapistName;
  final String therapistImage;
  final String therapistID;
  final int index;

  const TherapistListItemModel(
      {required this.therapistName,
      required this.therapistID,
      required this.index,
      required this.therapistImage});
}
