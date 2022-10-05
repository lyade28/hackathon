class Hospital {
  final String nom;
  final List<String> services;
  final String lieu;
  final String imgpath;

  Hospital(
      {required this.lieu,
      required this.imgpath,
      required this.nom,
      required this.services});
}

var allHospital = [
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/2.png',
      nom: 'Hôpital Aristide le Dantec(HALD)',
      services: ['Dermatologie']),
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/3.png',
      nom: 'Hôpital Principal de Dakar (HPD)',
      services: ['Anesthésie']),
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/4.png',
      nom: 'Centre Hospitalier Abass Ndao ',
      services: ['Traumatologie']),
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/5.png',
      nom: 'Hôpital Général de Grand Yoff (HOGGY)',
      services: ['Neurochirurgie']),
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/6.png',
      nom: 'Hôpital de Pikine',
      services: ['Traumatologie']),
  Hospital(
      lieu: 'Dakar',
      imgpath: 'assets/7.png',
      nom: 'Hôpital Militaire de QUAKAM',
      services: ['Pédiatrie'])
];
