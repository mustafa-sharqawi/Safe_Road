import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/services_post/Show_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Select City",
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddressAccessories(),
    );
  }
}

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Country'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}

class AddressAccessories extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AddressAccessories> {
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;

  void getData() {
    print(value);
  }

  final amman = {
    "1": '1st Circle',
    "2": '2nd Circle',
    "3": '3rd Circle',
    "4": '4th Circle',
    "5": '5th Circle',
    "6": '6th Circle',
    "7": '7th Circle',
    "8": '8th Circle',
    "9": 'Abdali',
    "10": 'Abdoun',
    "11": 'Abu Al-Sous',
    "12": 'Abu Alanda',
    "13": 'Abu Nsair',
    "14": 'Dunes Bridge',
    "15": 'Madaba Bridge',
    "16": 'Manaseer Gs',
    "17": 'Nakheel Village',
    "18": 'Al-Adlyeh',
    "19": 'Al-Amir Hamzah',
    "20": 'Al-Awdeh',
    "21": 'Al-Dia\'',
    "22": 'Al-Diyar',
    "23": 'Al-Feisal',
    "24": 'Al-Fuhais',
    "25": 'Al-Jabal Al-Akhdar',
    "26": 'Al-Jweideh',
    "27": 'Al-Khaznah',
    "28": 'Al-Kom Al-Gharbi',
    "29": 'Al-Kom Al-Sharqi',
    "30": 'Al-Ma\'adi',
    "31": 'Al-Mansour',
    "32": 'Al-Mustanada',
    "33": 'Al-Muwaqqar',
    "34": 'Al-Naharyah',
    "35": 'Al-Oroubah',
    "36": 'Al-Qasabat',
    "37": 'Al-Qusour',
    "38": 'Al-Rabwa',
    "39": 'Al-Rjoum',
    "40": 'Al-Shabah',
    "41": 'Al-Thra',
    "42": 'Al-Thuheir',
    "43": 'Al-Wehdat',
    "44": 'Al-Yarmouk',
    "45": 'Al-Zahra',
    "46": 'Al Ashrafyeh',
    "47": 'Al Bayader',
    "48": 'Al Bnayyat',
    "49": 'Al Gardens',
    "50": 'Al Hashmi Al Janobi',
    "51": 'Al Hashmi Al Shamali',
    "52": 'Al Hummar',
    "53": 'Al Hurryeh',
    "54": 'Al Jandaweel',
    "55": 'Al Jizah',
    "56": 'Al Kamaliya',
    "57": 'Al Kursi',
    "58": 'Al Lubban',
    "59": 'Al Manarah',
    "60": 'Al Muqabalain',
    "61": 'Al Qastal',
    "62": 'Al Qwaismeh',
    "63": 'Al Rabiah',
    "64": 'Al Rajeeb',
    "65": 'Al Rawabi',
    "66": 'Al Rawnaq',
    "67": 'Al Ridwan',
    "68": 'Al Sahl',
    "69": 'Al Sina\'a',
    "70": 'Al Tuneib',
    "71": 'Al Urdon Street',
    "72": 'Al Yadudah',
    "73": 'Arjan',
    "74": 'Ayn Rbat',
    "75": 'Badr',
    "76": 'Badr Jdedeh',
    "77": 'Baqa\'a Camp',
    "78": 'Basman',
    "79": 'Bilal',
    "80": 'Birayn',
    "81": 'Dabouq',
    "82": 'Daheit Al-Haj Hassan',
    "83": 'Daheit Al Ameer Hasan',
    "84": 'Daheit Al Aqsa',
    "85": 'Daheit Al Rasheed',
    "86": 'Daheit Al Yasmeen',
    "87": 'Daheit Al Ameer Ali',
    "88": 'Daheit Al Ameer Rashed',
    "89": 'Daheit Al Hussain',
    "90": 'Deir Ghbar',
    "91": 'Downtown',
    "92": 'Hai Nazzal',
    "93": 'Hay Al Rahmanieh',
    "94": 'Hay Albarakeh',
    "95": 'Hay AlKhaledeen',
    "96": 'Hay Alsaleheen',
    "97": 'Hettin',
    "98": 'Hjar Al Nawailseh',
    "99": 'Husban',
    "100": 'Iraq Al Ameer',
    "101": 'Jabal Al-Jofah',
    "102": 'Jabal Al-Lweibdeh',
    "103": 'Jabal Al-Marrikh',
    "104": 'Jabal Al-Nathif',
    "105": 'Jabal Al-Taj',
    "106": 'Jabal Al Hussain',
    "107": 'Jabal Al Naser',
    "108": 'Jabal Al Nuzha',
    "109": 'Jabal Al Zohor',
    "110": 'Jabal Amman',
    "111": 'Jawa',
    "112": 'Jubaiha',
    "113": 'Khalda',
    "114": 'Khirbet Sooq',
    "115": 'Mahes',
    "116": 'Marj El Hamam',
    "117": 'Marka',
    "118": 'Mecca Street',
    "119": 'Medina Street',
    "120": 'Naour',
    "121": 'Rajm Amesh',
    "122": 'Ras El Ain',
    "123": 'Rujm ash Shami',
    "124": 'Safut',
    "125": 'Sahab',
    "126": 'Salem',
    "127": 'Salihiyat Al-Abid',
    "128": 'Shafa Badran',
    "129": 'Shmaisani',
    "130": 'Sports City',
    "131": 'Swefieh',
    "132": 'Swelieh',
    "133": 'Tabarboor',
    "134": 'Tla\'Ali',
    "135": 'Tloo\'Al-Misdar',
    "136": 'Um al Basateen',
    "137": 'Um El Summaq',
    "138": 'Um Rummanah',
    "139": 'Um Uthaiena',
    "140": 'Umm al Kundum',
    "141": 'Umm Al-Usoud',
    "142": 'Umm Nowarah',
    "143": 'Umm Shterat',
    "144": 'University Street',
    "145": 'Uyun Al-Dhib',
    "146": 'Wadi Al-Srour',
    "147": 'Wadi Al Haddadeh',
    "148": 'Wadi El Seer',
    "149": 'Wadi Saqra',
    "150": 'Yajouz',
    "151": 'Other',
  };

  final irbid = {
    "1": '30 Street',
    "2": 'Abu Sidu',
    "3": 'Al-Adasiya',
    "4": 'Al-Baqoura',
    "5": 'Al-Kharaj',
    "6": 'Al-Mahari\'a',
    "7": 'Al-Manshiya',
    "8": 'Al-Mughayer',
    "9": 'Al-Tal',
    "10": 'Al-Zamaliya',
    "11": 'Al Afrah',
    "12": 'Al Andalus',
    "13": 'Al Ashrafiyah',
    "14": 'Al Balad',
    "15": 'Al Barha',
    "16": 'Al Barha Street',
    "17": 'Al Dorra Circle',
    "18": 'Al Eiadat Circle',
    "19": 'AlHashmy',
    "20": 'Al Hay Al Gharby',
    "21": 'Al Hay Al Janooby',
    "22": 'Al Hay Al Sharqy',
    "23": 'Al Hisbeh Al Markizeya',
    "24": 'Al Husn',
    "25": 'Al Huson Street',
    "26": 'Al Lawazem Circle',
    "27": 'Al Madinah Al Sena\'eiah',
    "28": 'Al Madrase Al Shamela',
    "29": 'Al Mal\'ab Al Baladi',
    "30": 'AlMatla\'',
    "31": 'Al Mazer Al-Shamali',
    "32": 'Al Naseem Circle',
    "33": 'Al Nuzha',
    "34": 'Al Qubeh Circle',
    "35": 'Al Quds Street',
    "36": 'Al Rabiah',
    "37": 'Al Rahebat Al Wardiah',
    "38": 'Al Sareeh',
    "39": 'Al Sonbola',
    "40": 'Al Souq',
    "41": 'Al Thaqafa Circle',
    "42": 'Albayyada Circle',
    "43": 'An-Nuayyimah',
    "44": 'Arhaba',
    "45": 'Aydoun',
    "46": 'Bait Ras',
    "47": 'Basila',
    "48": 'Bayt ldis',
    "49": 'Behind Safeway',
    "50": 'Bushra',
    "51": 'Daheit Al Ameer Rashed',
    "52": 'Daheit Al Hussain',
    "53": 'Dayr as Si\'nah',
    "54": 'Der Abi Saeed',
    "55": 'Eidoon Military Hospital',
    "56": 'Fo\'ara Street',
    "57": 'Ghorfat Al Tejara',
    "58": 'Hakama',
    "59": 'Hakama Street',
    "60": 'Hartha',
    "61": 'Hasan Al Tal Mosque',
    "62": 'Hatim village',
    "63": 'Hay Al Abraar',
    "64": 'Hay Al Qaselah',
    "65": 'Hay Al Turokman',
    "66": 'Hay Al Worood',
    "67": 'Hay Al Zohoor',
    "68": 'Hay Alia',
    "69": 'Hay Altlool',
    "70": 'Hay Twaal',
    "71": 'Hofa',
    "72": 'Honaina',
    "73": 'Howara',
    "74": 'Inba',
    "75": 'Irbid Girl\'s College',
    "76": 'Irbid Mall',
    "77": 'Isharet Al Darawshe',
    "78": 'Isharet Al Iskan',
    "79": 'Isharet Al Malika Noor',
    "80": 'Iskan Al A\'mileen',
    "81": 'Iskan Al Atiba\'',
    "82": 'Iskan Al Dobbat',
    "83": 'Iskan Al Mohandeseen',
    "84": 'Judayta',
    "85": 'Kharja',
    "86": 'Kherbet Qasem',
    "87": 'King Abdullah University Hospital',
    "88": 'Kofor Youba',
    "89": 'Kufr Abeel',
    "90": 'Kufr Asad',
    "91": 'Kufr Awan',
    "92": 'Kufr Ma\'',
    "93": 'Kufr Rakeb',
    "94": 'Kufr Sown',
    "95": 'Kuraimah',
    "96": 'Makhraba',
    "97": 'Malka',
    "98": 'Mandah',
    "99": 'Maru',
    "100": 'Mojamma\' Al Aghwaar Al Jadeed',
    "101": 'Mojamma\' Al Shamal',
    "102": 'Mojamma\' Alshaikh Khaleel',
    "103": 'Mojamma\' Amman Al Jadeed ',
    "104": 'North Shuna',
    "105": 'Palestine Street',
    "106": 'Petra Street',
    "107": 'Princess Basma Hospital',
    "108": 'Qum',
    "109": 'Qumaym',
    "110": 'Sahara Circle',
    "111": 'Sahm',
    "112": 'Saidour',
    "113": 'Sal Circle',
    "114": 'Salet Al Sharq',
    "115": 'Samad',
    "116": 'Sammou',
    "117": 'Marka',
    "118": 'Mecca Street',
    "119": 'Seil Al-Himma',
    "120": 'Shajara',
    "121": 'Sharekat Al Kahraba Circle',
    "122": 'Shatna',
    "123": 'Shaykh Hussein',
    "124": 'Smma',
    "125": 'Tabaqet Fahel',
    "126": 'Taybeh District',
    "127": 'Tibneh',
    "128": 'University of Science and Technology',
    "129": 'University Street',
    "130": 'Wadi Al-Rayyan',
    "131": 'Waqqas',
    "132": 'Zabda',
    "133": 'Zubiya',
    "134": 'Other',
  };

  final maan = {
    "1": 'Al-Hussainiyyah',
    "2": 'Al-Mraigha',
    "3": 'Al-Shobak',
    "4": 'Ayl',
    "5": 'Bayda',
    "6": 'Jafr',
    "7": 'Jaya',
    "8": 'Ma\'an Qasabah',
    "9": 'Najl',
    "10": 'Petra',
    "11": 'Sath Ma\'an',
    "12": 'Shmakh',
    "13": 'Um Sayhoon',
    "14": 'Wadi Musa',
    "15": 'Other',
  };
  final ajloun = {
    "1": "a\'anjara",
    "2": "a\'fna",
    "3": "al-hashimiyyah",
    "4": "alqala'a",
    "5": "Barqash",
    "6": "downtown",
    "7": "e\'in jana",
    "8": "I\'bbeen",
    "9": "kuforanja",
    "10": "sakhra",
    "11": "other",
  };
  final karak = {
    "1": "a'\i",
    "2": "ader",
    "3": "al-adnanya",
    "4": "al-marj",
    "5": "al-mazer al-janoubi",
    "6": "al-qasr",
    "7": "al-qatraneh",
    "8": "al-rabba",
    "9": "al-smeikhiyyeh",
    "10": "al-thaniyyah",
    "11": "al masherifeh",
    "12": "manshiyyet abu hammour",
    "13": "mu\'ta",
    "14": "qusoor bashir",
    "15": "that ras",
    "16": "zohoom",
    "17": "other",
  };
  final aqaba = {
    "1": "al-alamiya",
    "2": "al-markaziya",
    "3": "al-nakhil",
    "4": "al-sakaneyeh 8",
    "5": "al-shaabiyah",
    "6": "al-shamiyah",
    "7": "al atiba",
    "8": "al balad al qadeemeh",
    "9": "al herafeyeh",
    "10": "al mahdood al gharby",
    "11": "al mahdood al sharqy",
    "12": "al mahdood al wasat",
    "13": "al manarah",
    "14": "al mulqan",
    "15": "al ridwan",
    "16": "al rimaal",
    "17": "al sakaneyeh 10",
    "18": "al sakaneyeh 3",
    "19": "al sakaneyeh 5",
    "20": "al sakaneyeh 6",
    "21": "al sakaneyeh 7",
    "22": "al sakaneyeh 9",
    "23": "al shalalah",
    "24": "karama",
    "25": "mulqan janoubi",
    "26": "mulqan shamali",
    "27": "qweira",
    "28": "sakan al asmedah",
    "29": "tala bay",
    "30": "wadi rum",
    "31": "other",
  };
  final jerash = {
    "1": "al-haddadeh",
    "2": "al-hashimiyyah",
    "3": "al-kittah",
    "4": "al-majdal",
    "5": "al-mastaba",
    "6": "al-masherifeh",
    "7": "al-naseem",
    "8": "al-rashaida",
    "9": "amamah",
    "10": "borma",
    "11": "dahl",
    "12": "debbin",
    "13": "kufair",
    "14": "kufor khal",
    "15": "marsa",
    "16": "qafqafa",
    "17": "sakib",
    "18": "salhoub",
    "19": "soof",
    "20": "tal al-rumman",
    "21": "unaybah",
    "22": "other",
  };
  final mafraq = {
    "1": 'Ain wa Al-Ma\'mariyyeh',
    "2": 'Al-Ba\'ij',
    "3": 'Al-Badiah Ash-Shamaliyah',
    "4": 'Al-Badiah Ash-Shamaliyah Al-Gharbiya',
    "5": 'Al-Bustan',
    "6": 'Al-Dafyana',
    "7": 'Al-Dajaniya',
    "8": 'Al-Daqusma',
    "9": 'Al-Hamra',
    "10": 'Al-Hey Al-Hashmi',
    "11": 'Al-Hey Al-Janoubi',
    "12": 'Al-Khalidya',
    "13": 'Al-Khirba Al-Samra',
    "14": 'Al-Mabruka',
    "15": 'Al-Marajim',
    "16": 'Al-Mazraa',
    "17": 'Al-Nithamiya',
    "18": 'Al-Rashada',
    "19": 'Al-Rfa\'iyat',
    "20": 'Al-Salhiya',
    "21": 'Al-Za\'atari',
    "22": 'Al-Zaytouna',
    "23": 'Al Ghadeer Al Abyad',
    "24": 'Al Mazzeh',
    "25": 'Bala\'ama',
    "26": 'Bowaydet Al Hawamdeh',
    "27": 'Bweida Al-Ilimat',
    "28": 'Dahiyat Al-Jamaa',
    "29": 'Dahl',
    "30": 'Dayr Al-kahf',
    "31": 'Fa\'',
    "32": 'Hai Nowarah',
    "33": 'Hawshah',
    "34": 'Hay Al-Dobbat',
    "35": 'Hay Al-Hussein',
    "36": 'Hay Al-Zohoor',
    "37": 'Hayyan Al Moshref',
    "38": 'Hayyan Rwaibed',
    "39": 'Hweishan',
    "40": 'Idoun',
    "41": 'Koum Al-Ahmar',
    "42": 'Manshiyyet Bani Hassan',
    "43": 'Mansoura',
    "44": 'Mughayyer Al-Sarhan',
    "45": 'Nadira',
    "46": 'Nayfa',
    "47": 'rahbat Rakad',
    "48": 'Rhab',
    "49": 'Ruwaished',
    "50": 'Sabha',
    "51": 'Safawi',
    "52": 'Sama As-Sirhan',
    "53": 'Tayeb Isim',
    "54": 'Thaghrat Al-Gub',
    "55": 'Um Al-Lula',
    "56": 'Um Al Jimal',
    "57": 'Um Al Na\'am Al Gharbiyyeh',
    "58": 'Um Al Na\'am Al Sharqiyyeh',
    "59": 'Um Batima',
    "60": 'Um Sweiweina',
    "61": 'Umm Al-Quttayn',
    "62": 'Zamlat Al-Amir Ghazi',
    "63": 'Znaya',
    "64": 'Other',
  };
  final madaba = {
    "1": "al-faisaliyyah",
    "2": "al-fayha",
    "3": "al-jbeil",
    "4": "al-mokhayam",
    "5": "al-zafaran",
    "6": "dalilet al-hamaideh",
    "7": "hanina",
    "8": "hanina al-gharbiyyah",
    "9": "jelul",
    "10": "lob",
    "11": "madaba center",
    "12": "mai\'n",
    "13": "manja",
    "14": "mkawer",
    "15": "thiban",
    "16": "umm al amad",
    "17": "other",
  };
  final salt = {
    "1": 'A\'llan',
    "2": 'Abu Nsair',
    "3": 'Al Balqa\'',
    "4": 'Al I\'zariyyeh',
    "5": 'Al Jada\'a',
    "6": 'Al Jadoor',
    "7": 'Al Khader',
    "8": 'Al Khandaq',
    "9": 'Al Maghareeb',
    "10": 'Al Manshiyyeh',
    "11": 'Al Midan',
    "12": 'Al NAqab',
    "13": 'Al Qala\'a',
    "14": 'Al Remeimeen',
    "15": 'Al Salalem',
    "16": 'Al Saro',
    "17": 'Al Sawarfeh',
    "18": 'Al Subeihi',
    "19": 'Al Zohour',
    "20": 'Ein Al-Basha',
    "21": 'Hay Al Kharabsheh',
    "22": 'I\'ra',
    "23": 'Jala\'d',
    "24": 'Kafr Hooda',
    "25": 'Naqb Al Daboor',
    "26": 'Seehan',
    "27": 'Shafa Al-Amriya',
    "28": 'South Shuna',
    "29": 'Swemeh',
    "30": 'Um Jozeh',
    "31": 'Wadi Shua\'ib',
    "32": 'Yarga',
    "33": 'Zay',
    "34": 'Other',
  };
  final tafila = {
    "1": 'A\'llan',
    "2": "al-ayes",
    "3": "al-hasa",
    "4": "al-qadisiyyah",
    "5": "al-qasr",
    "6": "al-rashadiyyah",
    "7": "bseira",
    "8": "dana",
    "9": "jurf al-daraweesh",
    "10": "other",
  };
  final zarqa = {
    "1": 'Abu Al-Zighan',
    "2": 'Al-Alouk',
    "3": 'Al-Kamsha',
    "4": 'Al-Misfat st.',
    "5": 'Al-Qadisyeh - Rusaifeh',
    "6": 'Al-Qnaiya',
    "7": 'Al-Saadeh st.',
    "8": 'Al Autostrad',
    "9": 'Al ghweariyyeh',
    "10": 'Al Hashemieh',
    "11": 'Al Hawooz',
    "12": 'Al Jaish Street',
    "13": 'Al mantika Al Hurra',
    "14": 'Al Souq',
    "15": 'Al Sukhneh',
    "16": 'Al Tatweer Al Hadari',
    "17": 'Al Tatweer Al Hadari Rusaifah',
    "18": 'Al Zarqa Al Jadeedeh',
    "19": 'Al Zawahra',
    "20": 'Awajan',
    "21": 'Azraq',
    "22": 'Birayn',
    "23": 'Daheit Makka Al-Mokarameh',
    "24": 'Daheit Al Amera Haya',
    "25": 'Daheit Al Madena Al Monawwara',
    "26": 'Dhlail',
    "27": 'Douqara',
    "28": 'Graiba',
    "29": 'Graisa',
    "30": 'Hay Al-Rasheed - Rusaifah',
    "31": 'Hay Al Ameer Mohammad',
    "32": 'Hay Al Hussain',
    "33": 'Hay Al Iskan',
    "34": 'Hay Al Jundi',
    "35": 'Hay Al Nuzha',
    "36": 'Hay Ja\'far Al-Tayyar',
    "37": 'Hay Ma\'ssom',
    "38": 'Hay Ramzi',
    "39": 'Hay Shaker',
    "40": 'Iskan Al Batrawi',
    "41": 'Iskan Talal - Rusaifeh',
    "42": 'Jabal Al Abyad',
    "43": 'Jabal Al Ameer Hamza',
    "44": 'Jabal Al Ameer Hasan',
    "45": 'Jabal Al Ameer Rahma',
    "46": 'Jabal Al Mugheir',
    "47": 'Jabal El Shamali Rusaifeh ',
    "48": 'Jabal Tareq',
    "49": 'Jana\'a',
    "50": 'Khou',
    "51": 'Madinet El Sharq',
    "52": 'Qasr al-Hallabat Al-Gharbi',
    "53": 'Qasr al-Hallabat Al-Sharqi',
    "54": 'Rajm Al Shawk',
    "55": 'Rusaifeh El Janoobi',
    "56": 'Russayfah',
    "57": 'Sarout',
    "58": 'Shomer',
    "59": 'Um Rummanah',
    "60": 'Umm Sleih',
    "61": 'Wadi Al Aash',
    "62": 'Wadi Al Hajar',
    "63": 'Zarq Private University',
    "64": 'Other',
  };

  void populateamman() {
    for (String key in amman.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(amman[key]),
        ),
        value: amman[key],
      ));
    }
  }

  void populateirbid() {
    for (String key in irbid.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(irbid[key]),
        ),
        value: irbid[key],
      ));
    }
  }

  void populatemaan() {
    for (String key in maan.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(maan[key]),
        ),
        value: maan[key],
      ));
    }
  }

  void populatemafraq() {
    for (String key in mafraq.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(mafraq[key]),
        ),
        value: mafraq[key],
      ));
    }
  }

  void populateajloun() {
    for (String key in ajloun.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(ajloun[key]),
        ),
        value: ajloun[key],
      ));
    }
  }

  void populatekarak() {
    for (String key in karak.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(karak[key]),
        ),
        value: karak[key],
      ));
    }
  }

  void populateaqaba() {
    for (String key in aqaba.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(aqaba[key]),
        ),
        value: aqaba[key],
      ));
    }
  }

  void populatejerash() {
    for (String key in jerash.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(jerash[key]),
        ),
        value: jerash[key],
      ));
    }
  }

  void populatemadaba() {
    for (String key in madaba.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(madaba[key]),
        ),
        value: madaba[key],
      ));
    }
  }

  void populatesalt() {
    for (String key in salt.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(salt[key]),
        ),
        value: salt[key],
      ));
    }
  }

  void populatetafila() {
    for (String key in tafila.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(tafila[key]),
        ),
        value: tafila[key],
      ));
    }
  }

  void populatezarqa() {
    for (String key in zarqa.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(zarqa[key]),
        ),
        value: zarqa[key],
      ));
    }
  }

  void selected(_value) {
    if (_value == "amman") {
      menuitems = [];
      populateamman();
    } else if (_value == "irbid") {
      menuitems = [];
      populateirbid();
    } else if (_value == "maan") {
      menuitems = [];
      populatemaan();
    } else if (_value == "ajloun") {
      menuitems = [];
      populateajloun();
    } else if (_value == "karak") {
      menuitems = [];
      populatekarak();
    } else if (_value == "aqaba") {
      menuitems = [];
      populateaqaba();
    } else if (_value == "jerash") {
      menuitems = [];
      populatejerash();
    } else if (_value == "madaba") {
      menuitems = [];
      populatemadaba();
    } else if (_value == "mafraq") {
      menuitems = [];
      populatemafraq();
    } else if (_value == "salt") {
      menuitems = [];
      populatesalt();
    } else if (_value == "tafila") {
      menuitems = [];
      populatetafila();
    } else if (_value == "zarqa") {
      menuitems = [];
      populatezarqa();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
    });
  }

  void secondselected(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[500],
          elevation: 0.0,
          title: Text(
            "Accessories Service",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey,
          )),
      body: Container(
        color: Colors.grey[500],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "irbid",
                    child: Center(
                      child: Text("irbid"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "amman",
                    child: Center(
                      child: Text("amman"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "maan",
                    child: Center(
                      child: Text("maan"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "zarqa",
                    child: Center(
                      child: Text("zarqa"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "salt",
                    child: Center(
                      child: Text("salt"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "tafila",
                    child: Center(
                      child: Text("tafila"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "aqaba",
                    child: Center(
                      child: Text("aqaba"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "karak",
                    child: Center(
                      child: Text("karak"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "mafraq",
                    child: Center(
                      child: Text("mafraq"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "madaba",
                    child: Center(
                      child: Text("madaba"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "jerash",
                    child: Center(
                      child: Text("jarash"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "ajloun",
                    child: Center(
                      child: Text("ajloun"),
                    ),
                  ),
                ],
                onChanged: (_value) => selected(_value),
                hint: Text(
                  "City",
                  style: TextStyle(fontSize: 36.0, color: Colors.black),
                ),
              ),
              DropdownButton<String>(
                items: menuitems,
                onChanged:
                    disabledropdown ? null : (_value) => secondselected(_value),
                hint: Text(
                  "Region",
                  style: TextStyle(fontSize: 36.0, color: Colors.black),
                ),
                disabledHint: Text("First Select Your Field"),
              ),
              Text(
                "$value",
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                  child: Text(
                    "Search",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  onPressed: () {
                    if (value.isNotEmpty) {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PromotionScreen("Wheel Service", "$value"),
                            ));
                      });
                      getData();
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'َWarning',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                'Please Choice City And Region',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: Text('OK'),
                                ),
                              ],
                              //child: const Text('Show Dialog'),
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
