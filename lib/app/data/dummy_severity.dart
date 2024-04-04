import 'package:board_uikit/app/models/severity_model.dart';

final List<SeverityModel> severitiesDummy = [
  // minor, major, critical, blocker
  SeverityModel(
    id: '1',
    name: 'Minor',
    color: 'FF0000',
  ),
  SeverityModel(
    id: '2',
    name: 'Major',
    color: '00FF00',
  ),
  SeverityModel(
    id: '3',
    name: 'Critical',
    color: '0000FF',
  ),
  SeverityModel(
    id: '4',
    name: 'Blocker',
    color: 'FFFF00',
  ),
];
