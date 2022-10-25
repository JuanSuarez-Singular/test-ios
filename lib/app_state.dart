import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _wattlogicToken = prefs.getString('ff_wattlogicToken') ?? _wattlogicToken;
  }

  late SharedPreferences prefs;

  bool dumiToggle = false;

  String appoimentFmtid = '';

  String totalLenghtAccesories = '';

  String hourInstallDate = '';

  String mmDdyyyy = '';

  String _wattlogicToken = '';
  String get wattlogicToken => _wattlogicToken;
  set wattlogicToken(String _value) {
    _wattlogicToken = _value;
    prefs.setString('ff_wattlogicToken', _value);
  }

  bool loadingIndicator = false;

  String reasonForChange = '';

  DateTime? newInstallDate = DateTime.fromMillisecondsSinceEpoch(1665176520000);

  String dmy = '';

  String jms = '';

  String timeRunningLate = '';

  bool IsAddNotes = false;

  String totalChargeOrder = '';

  String reasonSelected = '';

  String urlStaticMap = '';

  List<String> instalationTaskListPhotos = [
    'inicial',
    'inicial',
    'inicial',
    'inicial'
  ];

  String timerOnMyWay = '';

  int travelTimeMinutes = 0;

  List<String> CustomerSatisfiedListPhotos = [
    'inicial',
    'inicial',
    'inicial',
    'inicial',
    'inicial'
  ];

  String customerSignOffIssue = '';

  String currentApoimentId = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
