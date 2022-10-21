class Hospital {
  final String nom;
  final List<ServiceHopital> services;
  final String lieu;
  final String imgpath;
  final String telephone;
  final String fax;
  final String email;
  final String rue;
  final String longitude;
  final String latitude;
  bool reservation = false;

  Hospital(
      {required this.lieu,
      required this.imgpath,
      required this.nom,
      required this.services,
      required this.email,
      required this.fax,
      required this.latitude,
      required this.longitude,
      required this.rue,
      required this.telephone,
      required this.reservation});
}

class ServiceHopital {
  final String nom;
  ServiceHopital({required this.nom});
}

var allHospital = [
  Hospital(
      lieu: 'Dakar, Avenue Pasteur',
      imgpath: 'assets/2.png',
      nom: 'Hôpital Aristide le Dantec(HALD)',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
        ServiceHopital(nom: 'Gynécologie Obstétrique'),
        ServiceHopital(nom: 'Tête et Cou'),
        ServiceHopital(nom: 'Urgences'),
        ServiceHopital(nom: 'Anesthésie'),
        ServiceHopital(nom: 'Hémodialyse'),
        ServiceHopital(nom: 'Réanimation')
      ],
      email: 'h.dantec@sentoo.sn',
      telephone: '33 823 53 95',
      fax: '33 823 58 96',
      longitude: '14.657349622',
      latitude: '-17.4373105966',
      rue: '',
      reservation: true),
  Hospital(
      lieu: 'Dakar 1,Avenue Nelson Mandela',
      imgpath: 'assets/3.png',
      nom: 'Hôpital Principal de Dakar (HPD)',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Hémodialyse'),
        ServiceHopital(nom: 'Réanimation')
      ],
      email: 'hopital.principal@hpd.sn',
      telephone: '33 839 50 50',
      fax: '33 839 50 88',
      longitude: '14.657349622',
      latitude: '-17.4373105966',
      rue: 'BP: 3006',
      reservation: false),
  Hospital(
      lieu: 'Dakar,Avenue Cheikh Anta Diop',
      imgpath: 'assets/4.png',
      nom: 'Centre Hospitalier Abass Ndao ',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Hémodialyse'),
        ServiceHopital(nom: 'Réanimation')
      ],
      email: 'hopital.principal@hpd.sn',
      telephone: '33 839 50 50',
      fax: '33 839 50 88',
      longitude: '14.7001575193',
      latitude: '-17.4706236277',
      rue: 'B.P 3006 - Dakar',
      reservation: true),
  Hospital(
      lieu: 'Dakar,Avenue Cheikh Anta Diop',
      imgpath: 'assets/4.png',
      nom: 'Centre Hospitalier National Universitaire(CHNU) FANN ',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'hfann.jum@sentoo.sn',
      telephone: '33 869 18 18',
      fax: '33 839 50 08',
      longitude: '14.6960076',
      latitude: '-17.4656426',
      rue: 'B.P 5035',
      reservation: true),
  Hospital(
      lieu: 'Dakar,Grand Yoff',
      imgpath: 'assets/5.png',
      nom: 'Hôpital Général de Grand Yoff (HOGGY)',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'epshoggy@gmail.com',
      telephone: '33 827 47 34',
      fax: '33 869 40 50',
      longitude: '14.7321263',
      latitude: ' -17.4451345',
      rue: 'B.P 3270',
      reservation: true),
  Hospital(
      lieu: 'Ex Camp Militaire de Thiaroye',
      imgpath: 'assets/6.png',
      nom: 'Hôpital de Pikine',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'hoppikine@orange.sn',
      telephone: '33 853 00 71',
      fax: '33 853 00 69',
      longitude: '14.754289',
      latitude: '-17.3759812',
      rue: 'B.P 20 630 - 17024',
      reservation: false),
  Hospital(
      lieu: 'Route de QUAKAM',
      imgpath: 'assets/7.png',
      nom: 'Hôpital Militaire de QUAKAM(HMO)',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'hopital.principal@hpd.sn',
      telephone: '33 849 63 00',
      fax: '33 849 63 00',
      longitude: '14.7152539',
      latitude: '-17.4823138',
      rue: '',
      reservation: true),
  Hospital(
      lieu: 'Dakar,Avenue Cheikh Anta DIOP',
      imgpath: 'assets/7.png',
      nom: "Hôpital d'Enfant Albert Royer(HEAR)",
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'hear.jum@sentoo.sn.sn',
      telephone: '33 825 03 08',
      fax: '33 825 80 05',
      longitude: '14.6926211778',
      latitude: '-17.4671673775',
      rue: 'BP: 25755',
      reservation: false),
  Hospital(
      lieu: 'Route de Rufisque,km 18',
      imgpath: 'assets/7.png',
      nom: 'Hôpital Psychiatrique de Thiaroye',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Chirurgie Orthopédique'),
        ServiceHopital(nom: 'Traumatologie'),
        ServiceHopital(nom: 'Neurochirurgie'),
        ServiceHopital(nom: 'Chirurgie Viscérale'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'htia.jumaro@sentoo.sn',
      telephone: '33 879 34 34',
      fax: '33 834 04 40',
      longitude: '14.7416823',
      latitude: '-17.3530998',
      rue: 'BP: 20833',
      reservation: true),
  Hospital(
      lieu: 'Notaire Guédiawaye',
      imgpath: 'assets/7.png',
      nom: 'Centre de Santé Baudoin de Guédiawaye',
      services: [
        ServiceHopital(nom: 'Pédiatrie'),
        ServiceHopital(nom: 'Urologie'),
      ],
      email: 'roibaudoin@sentoo.sn',
      telephone: '33 837 05 15',
      fax: '33 823 58 96',
      longitude: '14.657349622',
      latitude: '-17.4373105966',
      rue: '',
      reservation: false)
];
