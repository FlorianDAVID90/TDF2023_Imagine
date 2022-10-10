DROP TABLE IF EXISTS est_classe, participe, COUREUR, COL, ETAPE, CLASSEMENT, EQUIPE, VILLE_ARRIVEE, VILLE_DEPART,
    PAYS, TYPE_CLASSEMENT, TYPE_ETAPE;

CREATE TABLE IF NOT EXISTS TYPE_ETAPE(
   id_type_etape INT AUTO_INCREMENT,
   libelle_type_etape VARCHAR(255),
   PRIMARY KEY(id_type_etape)
);

INSERT INTO TYPE_ETAPE(libelle_type_etape) VALUES
('Étape de plaine'),('Étape accidentée'),
('Contre-la-montre individuel'),('Contre-la-montre par équipes'),
('Étape de montagne'),('Étape de haute-montagne');

CREATE TABLE IF NOT EXISTS TYPE_CLASSEMENT(
   id_type_classement INT AUTO_INCREMENT,
   libelle_type_classement VARCHAR(255),
   PRIMARY KEY(id_type_classement)
);

INSERT INTO TYPE_CLASSEMENT(libelle_type_classement) VALUES
(NULL),('Classement à points'),('Classement au temps');

CREATE TABLE IF NOT EXISTS PAYS(
   id_pays INT AUTO_INCREMENT,
   nom_pays VARCHAR(255),
   drapeau_svg VARCHAR(3),
   PRIMARY KEY(id_pays)
);

INSERT INTO PAYS(nom_pays, drapeau_svg) VALUES
('France','FRA'),('Espagne','ESP'),('Émirats Arabes Unis','UAE'),('Slovénie','SLV'),('Portugal','POR'),('Danemark','DEN'),
('Italie','ITA'),('Suisse','SUI'),('Pologne','POL'),('États-Unis','USA'),('Pays-Bas','NED'),('Belgique','BEL'),
('Australie','AUS'),('Grande-Bretagne','GBR'),('Équateur','EQU'),('Allemagne','GER'),('Russie','RUS'),('Irlande','IRL'),('Autriche','AUT'),
('Colombie','COL'),('Bahrain','BRN'),('Israël','ISR'),('Canada','CAN'),('Nouvelle-Zélande','NZL'),('Afrique du Sud','RSA'),('Lettonie','LET'),
('Slovaquie','SVQ'),('Estonie','EST'),('Kazakhstan','KAZ'),('Biélorussie','BLR'),('Norvège','NOR'),('Érythrée','ERI'),('République Tchèque','RTC'),
('Hongrie','HUN'),('Luxembourg','LUX');

CREATE TABLE IF NOT EXISTS VILLE_DEPART(
   id_ville_depart INT AUTO_INCREMENT,
   nom_ville_depart VARCHAR(255),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_ville_depart),
   FOREIGN KEY(id_pays) REFERENCES PAYS(id_pays)
);

INSERT INTO VILLE_DEPART(nom_ville_depart,id_pays) VALUES
('Bilbao',2),('Vitoria-Gasteiz',2),('Amorebieta-Etxano',2),
('Saint-Geours-de-Marenne',1),('Royan',1),('Cognac',1),
('Sarran',1),('Cournon-d’Auvergne',1),('Aurillac',1),
('Laguiole',1),('Fleurance',1),('Pau',1),
('Salies-du-Salat',1),('Lavelanet',1),('Le Barcarès',1),
('Nîmes',1),('Valensole',1),('Embrun',1),
('Briançon',1),('Saint-Jean-de-Maurienne',1),('Maurepas',1);

CREATE TABLE IF NOT EXISTS VILLE_ARRIVEE(
   id_ville_arrivee INT AUTO_INCREMENT,
   nom_ville_arrivee VARCHAR(50),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_ville_arrivee),
   FOREIGN KEY(id_pays) REFERENCES PAYS(id_pays)
);

INSERT INTO VILLE_ARRIVEE(nom_ville_arrivee, id_pays) VALUES
('Bilbao',2),('Donostia San Sebsatian',2),('Bayonne',1),
('Cap Ferret',1),('Royan',1),('Tulle',1),
('Chastreix-Sancy',1),('Saint-Flour',1),('Murat',1),
('Montauban',1),('Pau',1),('Piau-Engaly',1),
('Plateau de Beille',1),('Narbonne',1),('Col de Mantet',1),
('Toulon',1),('Digne-les-Bains',1),('Embrun',1),
('Val-Cenis',1),('La Plagne',1),('Paris Champs-Élysées',1);

CREATE TABLE IF NOT EXISTS REPOS(
    id_repos INT AUTO_INCREMENT,
    lieu_repos VARCHAR(255),
    date_repos DATE,
    PRIMARY KEY (id_repos)
);

INSERT INTO REPOS(lieu_repos, date_repos) VALUES
('Puy-de-Dôme','2023-07-10'),('Nîmes','2023-07-17');

CREATE TABLE IF NOT EXISTS EQUIPE(
   id_equipe INT AUTO_INCREMENT,
   nom_equipe VARCHAR(255),
   abrev_equipe VARCHAR(3),
   img_equipe VARCHAR(255),
   img_maillot_equipe VARCHAR(255),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_equipe),
   FOREIGN KEY(id_pays) REFERENCES PAYS(id_pays)
);

INSERT INTO EQUIPE(nom_equipe, abrev_equipe, img_equipe, img_maillot_equipe, id_pays) VALUES
('Team Jumbo Visma','TJV','TJV.png','TJV_maillot.png',11),('UAE Team Emirates','UAD','UAD.png','UAD_maillot.png',3),
('Team Ineos Grenadiers','IGD','IGD.png','IGD_maillot.png',14),('Groupama-FDJ','GFC','GFC.png','GFC_maillot.png',1),
('Bora-Hansgrohe','BOH','BOH.png','BOH_maillot.png',16),('Team DSM','DSM','DSM.png','DSM_maillot.png',16),
('AG2R Citroën Team','ACT','ACT.png','ACT_maillot.png',1),('Quick-Step Alpha Vinyl Team','QST','QST.png','QST_maillot.png',12),
('Cofidis','COF','COF.png','COF_maillot.png',1),('Alpecin-Fenix','AFC','AFC.png','AFC_maillot.png',12),
('Uno-X Pro Cycling Team','UXT','UXT.png','UXT_maillot.png',31),('Movistar Team','MOV','MOV.png','MOV_maillot.png',2),
('Team Bahrain Victorious','TBV','TBV.png','TBV_maillot.png',21),('Team Arkéa-Samsic','ARK','ARK.png','ARK_maillot.png',1),
('EF Education EasyPost','EFE','EFE.png','EFE_maillot.png',10),('Intermarché-Wanty-Gobert Matériaux','IWG','IWG.png','IWG_maillot.png',12),
('Lotto-Soudal','LTS','LTS.png','LTS_maillot.png',12),('Team TotalEnergies','TEN','TEN.png','TEN_maillot.png',1),
('Astana Qazaqstan Team','AST','AST.png','AST_maillot.png',29),('Trek-Segafredo','TFS','TFS.png','TFS_maillot.png',10),
('Team BikeExchange-Jayco','BEX','BEX.png','BEX_maillot.png',13),('Israel Premier-Tech','IPT','IPT.png','IPT_maillot.png',22),
('B&B Hotels-KTM','BBK','BBK.png','BBK_maillot.png',1);



CREATE TABLE IF NOT EXISTS CLASSEMENT(
   id_classement INT AUTO_INCREMENT,
   nom_classement VARCHAR(255),
   id_type_classement INT NOT NULL,
   PRIMARY KEY(id_classement),
   FOREIGN KEY(id_type_classement) REFERENCES TYPE_CLASSEMENT(id_type_classement)
);

INSERT INTO CLASSEMENT(nom_classement, id_type_classement) VALUES
('Classement général',3),('Classement par points',2),('Classement de la montagne',2),
('Classement des jeunes',3),('Prix de la combativité',1),('Classement par équipes',3);

CREATE TABLE IF NOT EXISTS ETAPE(
   id_etape INT AUTO_INCREMENT,
   libelle_etape VARCHAR(255),
   longueur DECIMAL(4,1),
   date_etape DATE,
   descriptif1 VARCHAR(5000),
   descriptif2 VARCHAR(5000),
   descriptif3 VARCHAR(5000),
   id_type_etape INT NOT NULL,
   id_ville_depart INT NOT NULL,
   id_ville_arrivee INT NOT NULL,
   PRIMARY KEY(id_etape),
   FOREIGN KEY(id_type_etape) REFERENCES TYPE_ETAPE(id_type_etape),
   FOREIGN KEY(id_ville_arrivee) REFERENCES VILLE_ARRIVEE(id_ville_arrivee),
   FOREIGN KEY(id_ville_depart) REFERENCES VILLE_DEPART(id_ville_depart)
);

INSERT INTO ETAPE(libelle_etape, longueur, date_etape, id_type_etape, id_ville_depart, id_ville_arrivee, descriptif1,descriptif2,descriptif3) VALUES
('Étape 1',184.5,'2023-07-01',2,1,1,'Cette boucle entièrement tracée en Biscaye sillonnera les sauvages collines qui bordent la mer Cantabrique et passera deux fois par Gernika, lieu de mémoire.',
    'Très exigeante, avec 3 300 m de dénivelé cumulé, elle promet le premier Maillot Jaune à un crack. Il s’agira de digérer l’enchaînement des difficultés avant de basculer en bonne place, à 10 km du but, au sommet de la côte de Pike (2 km à 9 % de moyenne avec des passages à 15 %) qui surplombe Bilbao et d’avoir gardé du punch pour l’arrivée, jugée en haut d’une pente à 5 %.',''),

('Étape 2',210,'2023-07-02',2,2,2,'Vitoria-Gasteiz, capitale du Pays Basque et d’Alava, offrira un départ sur un plateau, à 600m d’altitude.',
    'Le profil général d’une étape qui se dirige vers la mer apparaîtra donc trompeusement descendant. En effet, usés par un parcours accidenté, sans répit, les coureurs auront ensuite buté sur le Jaizkibel.',
    'Il sera emprunté dans le sens inverse – mais pas moins dur – de celui qui en a fait, eux abords de la capitule du Gipuzkoa, le juge de paix de la Clásica de San Sebastián. Attaques garanties !'),

('Étape 3',174.5,'2023-07-03',1,3,3,'Le départ vers la France, par le chemin des écoliers, donnera peut-être leur première chance aux sprinteurs.',
    'Encore devront-ils surmonter les éventuels pièges que tendra le parcours. À travers les terres de Biscaye d’abord, pour rejoindre le bord de mer par le magnifique port de Lekeitio. Puis au long des petites difficultés qu’offriront, avec de superbes points de vue à chacun de leurs nombreux détours, 80 km de route côtière. Pour ensuite filer, après un dernier salut à Saint-Sébastien, vers Irun et l’entrée en France par Hendaye et Saint-Jean-de-Luz avant de longer la Corniche Basque et d’arriver au pays du rugby et du jambon.',
    'Les sprinteurs auront évidemment de l’appétit après deux jours difficiles. Ceci dit, attention au vent après Saint-Jean-de-Luz, des bordures peuvent être possibles.'),

('Étape 4',196.5,'2023-07-04',1,4,4,'Une étape de carte postale pour les estivants du mois de juillet dans les Landes et la Gironde.',
    'En effet, l’Océan Atlantique sera souvent à la vue des coureurs avec le passage dans des stations balnéaires connues : Mimizan, Biscarrosse, Arcachon et le Cap Ferret pour ne citer qu’elles.',
    'En tout cas, cette nouvelle étape de plaine est une donc nouvelle chance possible pour les sprinteurs de l’emporter.'),

('Étape 5',25.5,'2023-07-05',4,5,5,'Premier gros rendez-vous entre les grands favoris à la conquête de cette 110ème édition avec ce contre-la-montre par équipes autour de la perle de la Côte de Beauté.',
    'Pas le temps de profiter de Royan, de ses belles plages et de son centre-ville pour les 22 équipes de ce Tour. Place au sportif et ce chrono exigeant où la station balnéaire et le Zoo de la Palmyre seront également mis en avant : un rendez-vous à ne manquer sous aucun prétexte.',''),

('Étape 6',229.5,'2023-07-06',2,6,6,'Au lendemain d’un contre-la-montre par équipes exigeant, viendra la plus longue étape de cette édition 2023 avec un final qui porte bien le nom de la ville d’arrivée du jour : la ville aux sept collines.',
    'Et pour cause : 3 difficultés sont placées dans les 12 derniers kilomètres et représentent près de 5 kilomètres à 11% de pente moyennes. L’une d’entre elles, la côte de la Croix de Bar et ses 1,9km à 10,5% avec un pied rude à 21% au pied peut servir de tremplin à plusieurs attaques.',
    '230km remplis d’audace et d’attaques à n’en point douter : le spectacle est attendu dans la préfecture de la Corrèze.'),

('Étape 7',168.5,'2023-07-07',2,7,7,'Première étape de fin de première semaine et une entrée en matière (presque) en douceur dans le massif du Sancy.',
    'Et en effet, au vu du final présent, avec 3 difficultés marquantes : la côte des Orgues (avec le premier tiers de la montée à 11%), la montée de la Stèle et celle menant à Chastreix, qui après avoir reçu le Critérium du Dauphiné l’an passé, aura les honneurs de la Grande Boucle pour une arrivée inédite qui promet beaucoup.',
    'Ce sera une étape où tous les scénarios sont possibles entre échappée victorieuse ou non, changements de maillots distinctifs, attaques des favoris. Il risque d’y en avoir pour tous les goûts.'),

('Étape 8',168,'2023-07-08',2,8,8,'Changement de programme, ou presque car les baroudeurs seront à nouveau à l’honneur dans le massif Central.',
    'Et en effet, au vu du parcours, les gros pourcentages seront à l’honneur : 23km d’ascensions à 8,5%. En plus de la montée vers Saint-Flour, la côte de Belvezet sera l’un des juges de paix pour la victoire d’étape avec son 1,4km à 11,9% de moyenne et des passages terribles oscillant entre 15 et 17%.',
    'Cette étape aura des airs de mini-classique ardennaise avec des difficultés aux gros pourcentages et la même arrivée qu’en 2011 à Saint-Flour. Pas de quoi s’ennuyer !'),

('Étape 9',159.5,'2023-07-09',5,9,9,'Dernière étape avant la journée de repos, et une étape aux similitudes avec l’arrivée au Puy Mary en 2020.',
    'Une nouvelle fois, beaucoup de scénarios possibles, mais ce qui est sûr, c’est que la vraie bagarre entre les favoris au classement général pourrait débuter sur les pentes du Col de Néronne ou du Puy Mary avant l’arrivée à Murat.',
    'Et pour la deuxième fois en trois jours, de nombreux scénarios sont possibles allant d’une échappée victorieuse, une bagarre entre les favoris et encore ...'),

('Étape 10',178,'2023-07-11',1,10,10,'C’est après une journée de repos amplement méritée en ayant profité de l’Aubrac et du fief des chefs Bras que les coureurs se dirigeront vers le Tarn-et-Garonne et sa préfecture, lieu d’arrivée après 7 ans d’absence.',
    'Ce qui est sûr, c’est qu’après une semaine de disette, les sprinteurs auront plus que faim pour s’offrir une victoire à Montauban',
    'Et en effet, même si le début d’étape est très escarpé, au vu du final présent, les sprinteurs et leurs équipes ramèneront certainement les échappés à la raison.'),

('Étape 11',153,'2023-07-12',1,11,11,'40 ans après son dernier passage, La Grande Boucle retrouvera Fleurance et lancera une étape ou les fauves du peloton vont remettre le couvert après l’étape de la veille avant les Pyrénées.',
    'Les paysages du Gers et des Pyrénées-Atlantiques seront d’autres points d’orgue de cette journée même si les coureurs auront certainement la tête au sprint final.',
    'Le final sera le même que lors de la dernière arrivée en 2018 dans LA ville du Tour avec Paris et Bordeaux : Pau.'),

('Étape 12',170,'2023-07-13',6,12,12,'Beau programme pour cette première étape pyrénéenne et la première vraie explication entre les favoris.',
    'Et en effet, 57km d’ascension au total : un tiers de l’étape en montée et un beau quatuor : Spandelles, Tourmalet, Hourquette d’Ancizan et Piau-Engaly.',
    'Piau-Engaly, où le tour revient 24 ans après son premier et seul passage. Qui sera là au rendez-vous, qui manquera à l’appel ?'),

('Étape 13',177.5,'2023-07-14',6,13,13,'Deuxième volet du triptyque pyrénéen en ce jour de fête nationale pour une 7e arrivée au Plateau de Beille.',
    '6 difficultés au programme dont la plupart sont habituées de la Grande Boucle mais également une inédite parmi le lot qui se distinguera juste avant la montée finale : la côte des Métairies d’Endoumens et ses 4,7km à 7,6% avec des passages à 13% qui pourrait déjà faire un tri à tous les échelons de la course.',
    'Une nouvelle explication entre favoris est attendue mais pour la victoire d’étape, rien n’est moins sûr avec une échappée de costauds.'),

('Étape 14',155.5,'2023-07-15',1,14,14,'Étape de transition au départ de Lavelanet pour un sprint massif possible dans la sous-préfecture de l’Aude.',
    'L’étape sera marquée par la traversée de Mirepoix et Carcassonne, les deux cités fortifiées avant le sprint attendu pour les morts-de-faim du peloton dans les rues de Narbonne.',''),

('Étape 15',197,'2023-07-16',6,15,15,'Dernier volet du triptyque pyrénéen avant la deuxième journée de repos, et une longue étape 100% Pyrénées-Orientales avec des difficultés inédites sur le Tour au coeur des Pyrénées Catalanes.',
    'Beaucoup de scénarios possibles, et une étape taillée pour les baroudeurs malgré une arrivée à haute altitude (1761m).',
    'Cette arrivée sera inédite en haut du Col de Mantet et ses 14,6km à 7,4% de moyenne et des passages à 12-13% sur des routes étroites et à découvert : des routes qui peuvent rappeler la montée du Prat d’Albis en 2019. En tout cas du spectacle, là encore il y en aura à n’en point douter.'),

('Étape 16',183.5,'2023-07-18',1,16,16,'Lendemain de journée de repos pour les coureurs qui profiteront des beaux paysages autour de la Méditerranée.',
    'Et ce malgré quelques difficultés, les stations balnéaires seront très en vue : Martigues, Marseille, Cassis, Sanary-sur-Mer et Toulon : un paysage de carte postale.',
    'En revanche, ce sera la dernière chance pour les sprinteurs avant les Champs-Élysées. Alors autant qu’ils la saisissent.'),

('Étape 17',167,'2023-07-19',2,17,17,'Il en fallait bien une dernière aussi pour les baroudeurs du peloton dans une étape 100% Alpes-de-Haute-Provence et des difficultés à foison.',
    'Les coureurs passeront de la senteur de lavande de Valensole à celle de la sueur jusqu’à l’arrivée vu les chaleurs estivales.',
    'Dire que les coureurs auront eu une sacrée entrée avec la Montagne de Lure, enfin empruntée par le Tour après de nombreuses passages sur le Tour de la Provence et Paris-Nice, le final escarpé prévu fera très mal avec la côte de Valavoire qui fera le tri dans l’échappée avant un ouvel enchaînement de diffcultés puis l’arrivée à Digne-les-Bains 18 ans après la dernière arrivée dans la préfecture et la victoire d’un français un 14 juillet : David Moncoutié. Un français va-t-il remettre cela ? Réponse le jour même.'),

('Étape 18',27.5,'2023-07-20',3,18,18,'Comme on dirait pour certaines étapes de plaine, le Tour ne se gagne pas, mais peut se perdre sur une seule étape. Ça sera le cas pour ce chrono autour d’Embrun déjà décisif avant les deux grandes étapes alpestres.',
    'Un chrono pratiquement plat sur les 2 tiers du parcours, puis une difficulté ardue pour pimenter le final : la côte du Haut Pibou et ses 4,8km à 7,6% avec un pied rude à 14%, un versant plus difficile de la côte de Puy-Sanières empruntée en 2013 lors d’un chrono entre Embrun et Chorges.',
    'Les purs rouleurs n’auront peut être pas forcément la loi sur ce chrono, quoique ? Tous les scénarios sont possibles.'),

('Étape 19',116.5,'2023-07-21',6,19,19,'C’est certainement l’étape reine de cette édition 2023 : un géant, une montée déjà empruntée et reconnue et un final ardu inédit. Voilà comment résumer cette étape.',
    'Et en effet, au départ de Briançon, le Galibier et la montée d’Aussois serviront d’entrée et de plat de résistance pour les coureurs du classement général. Des attaques fusionneront certainement de partout au moment de la montée finale.',
    'Cette montée au-dessus de Val-Cenis à Bellecombe avec 13km d’ascension à près de 8% de moyenne et plusieurs passages à 10% voire 14% par endroits. Qui sera consacré ? Une échappée ? Un homme fort du général ?'),

('Étape 20',170.5,'2023-07-22',6,20,20,'Dernière étape alpestre de la 110ème édition très montagne avec un retour 21 ans après à la Plagne.',
    'Et en effet, retour à la Plagne après la victoire de Michaël Boogerd en 2001 et avant la montée finale vers la station, il y a 4 difficultés qui la précédent dont le doublé Col du Pré et Cormet de Roselend ainsi qu’une inédité juste avant la montée finale : la Côte de l’Euillon et ses 6,1km à 7,4%.',
    'Du spectacle pour cette avant-dernière du Tour avec certainement des attaques entre favoris.'),

('Étape 21',108,'2023-07-23',1,21,21,'La der et la libération pour les coureurs après trois semaines difficiles et ardues.',
    'La dernière étape au final habituel sur les Champs mais cette fois-ci, les coureurs arriveront dans Paris par le Nord-Ouest via la Tour Eiffel et le Louvre pour consacrer un sprinteur et les vainqueurs des classements généraux sur la plus belle avenue du monde.','');

CREATE TABLE IF NOT EXISTS COL(
    id_col INT AUTO_INCREMENT,
    cat_col INT,            -- Catégorie du col (NULL si non répertorié, 0 pour Hors Cat., 1 pour 1ère cat., etc...)
    nom_col VARCHAR(255),
    nb_km FLOAT,
    poucentage_moyen FLOAT,
    altitude INT,
    situation_km FLOAT,  -- Se situe au km ...
    img_profil_col VARCHAR(255),
    id_etape INT,
    PRIMARY KEY (id_col),
    FOREIGN KEY (id_etape) REFERENCES ETAPE(id_etape)
);

INSERT INTO COL(cat_col, nom_col, nb_km, poucentage_moyen, altitude, situation_km, img_profil_col, id_etape) VALUES
(3,'Côte de Laukiz',2.3,6.8,221,13.5,'',1),(3,'Côte d’Arrastrakulo',4.2,5.6,285,57,'',1),(3,'Côte de San Juan de Gaztelugatxe',3.5,7.6,291,68,'',1),
(4,'Côte de Morga',3.9,4.2,302,143,'',1),(2,'Côte de Vivero',4.2,7.4,361,157,'cote-de-vivero.png',1),(2,'Côte de Pike',2,9,211,175,'cote-de-pike.png',1),

(4,'Côte d’Albina',1.3,6.4,643,41,'',2),(4,'Côte d’Udana',4.6,4.7,504,80,'',2),(3,'Côte d’Aztiria',2.8,6.1,595,86.5,'',2),
(4,'Côte d’Altzo',2.1,6.7,243,126.5,'',2),(3,'Côte d’Alkiza',4.2,5.9,324,140.5,'',2),(4,'Côte de Gurutze',2.6,4.7,150,175,'',2),
(2,'Jaizkibel',8.1,5.4,455,193,'jaizkibel.png',2),

(3,'Côte de Trabakua',5.3,5.5,434,17.5,'',3),(4,'Côte de Milloi',2.6,4.7,161,35,'',3),(3,'Côte d’Itziar',4,5,223,73.5,'',3),
(2,'Côte de Orioko-Benta',4.5,6.8,311,105,'',3),

(4,'Côte des Grands Moulins',0.9,5.7,128,62,'',6),(4,'Côte de la Lande',1.8,4.3,331,159.5,'',6),(4,'Côte du Bois Coutal',1.3,6.3,362,189.5,'',6),
(3,'Côte de Poissac',0.8,12.8,314,217,'',6),(2,'Côte de la Croix de Bar',1.9,10.4,407,221,'cote-de-la-croix-de-bar.png',6),
(3,'Côte des Treize Vents',2,8.8,388,226,'',6),

(4,'Côte de la Croix de Bouix',2.4,5.8,570,17,'',7),(3,'Côte de Champagnac',5.5,5.6,640,48.5,'',7),(2,'Côte des Orgues',4.5,7.5,764,69,'cote-des-orgues.png',7),
(3,'Côte de Conflent-Port-Dieu',4.7,5,778,103,'',7),(4,'Côte de Chavanon',3.2,5.3,753,117,'',7),(2,'Montée de la Stèle',6.8,5.7,1237,150,'montee-de-la-stele.png',7),
(2,'CHASTREIX-SANCY',6.2,5.7,1396,168.5,'chastreix-sancy.png',7),

(4,'Côte de Bessadet',1.7,8.7,600,17.5,'',8),(3,'Côte de Léotoing',1.3,9.9,594,70,'',8),(3,'Côte de Coste Chaude',2.2,7.6,690,76.5,'',7),
(3,'Côte de Vernières',2.6,6.3,802,89.5,'',8),(2,'Côte de Coussargues',4.1,7.7,902,108.5,'',8),(2,'Côte de Saint-Mary-le-Plain',3.6,7.4,859,118.5,'',8),
(2,'Mur d’Anval',2.9,9.3,971,126.5,'mur-danval.png',8),(3,'Côte de Belvezet',1.4,11.9,1041,151,'cote-de-belvezet.png',8),(NULL,'SAINT-FLOUR',1.3,7.9,882,168,'',8),

(3,'Côte de Sazergues',3.5,6.8,912,7.5,'',9),(2,'Col du Perthus',5.7,5.4,1309,45,'',9),(2,'Col du Légal',8.3,5.7,1230,72,'',9),
(3,'Côte de Salers',3.8,6.7,937,90,'',9),(2,'Col de Néronne',3.8,8.9,1242,124.5,'col-de-neronne.png',9),
(1,'Pas de Peyrol (Puy Mary)',5.4,8.1,1589,136,'pas-de-peyrol-puy-mary.png',9),(4,'Col d’Entremont',1.2,8.1,1161,150.5,'',9),

(3,'Côte de Marty',2.7,7.2,502,26,'',10),(4,'Côte de Muret-le-Château',3.9,4.9,524,40,'',10),
(3,'Côte de la Carrière de Cassanges',3.9,5.6,555,59.5,'',10),(4,'Côte du Bout de la Côte',1.5,7.1,301,128.5,'',10),

(4,'Côte d’Embats',3.2,4.1,277,43.5,'',11),(4,'Côte de Castelnau-Rivière-Basse',1,6,235,101,'',11),
(4,'Côte du Chemin de Madiran',1.5,6.7,302,117,'',11),(4,'Côte de Notre-Dame de la Rencontre',1.7,6.6,305,124.5,'',11),

(1,'Col de Spandelles',10.3,8.3,1378,47,'col-de-spandelles.png',12),(0,'Col du Tourmalet',19,7.4,2115,99.5,'col-du-tourmalet.png',12),
(2,'Hurquette d’Ancizan',8.2,5.1,1564,133.5,'',12),(1,'PIAU-ENGALY',19.5,5.3,1800,170,'piau-engaly.png',12),

(1,'Col de la Core',14.1,5.8,1395,47,'col-de-la-core.png',13),(3,'Côte de Cornillac',3.8,6.9,789,68,'',13),(1,'Col d’Agnés',10,8.3,1570,92,'col-dagnes.png',13),
(3,'Port de Lers',4.4,5.6,1517,100.5,'',13),(2,'Côte des Métairies d’Endoumens',4.7,7.6,901,140,'cote-des-metairies-dendoumens.png',13),
(0,'PLATEAU DE BEILLE',15.8,7.9,1780,177.5,'plateau-de-beille.png',13),

(3,'Côte de Cazès',3.3,6.6,395,69.5,'',14),

(2,'Coll Dels Gascons',5.8,6.5,385,49.5,'',15),(4,'Coll de la Serra',1.4,7.6,335,55,'',15),(2,'Côte de Còrrec de Clocamina',7.1,5.9,643,109,'',15),
(3,'Côte de Saint-Marsal',5,4.7,763,123,'',15),(2,'Col de Palomère',7.4,5.1,1034,135.5,'',15),(0,'COL DE MANTET',14.6,7.4,1761,197,'col-de-mantet.png',15),

(4,'Côte du Vallon du Douard',1.5,5.3,155,101,'',16),(3,'Col de la Gineste',5.4,4.6,326,132.5,'',16),(4,'Côte du Pas de Bellefille',2.9,5.7,201,145,'',16),
(4,'Côte de Bandol',1.9,5.1,160,164,'',16),

(4,'Côte des Mourres',4.9,4.6,691,32,'',17),(1,'Montagne de Lure',17.8,5.9,1744,60,'montagne-de-lure.png',17),
(2,'Côte de Valavoire',7.8,6,1122,122,'cote-de-valavoire.png',17),(3,'Côte de Théous',3.4,6.6,1313,127,'',17),(4,'Col de Fontbelle',4,4.7,1306,134.5,'',17),
(4,'Côte de Campanellle',4.5,4.1,897,153,'',17),

(2,'Côte du Haut Pibou',4.8,7.6,1147,20,'cote-du-haut-pibou.png',18),

(0,'Col du Galibier',22.9,5.2,2642,33,'col-du-galibier.png',19),(2,'Montée d’Aussois',6.5,6.1,1467,92,'montee-daussois.png',19),
(0,'VAL-CENIS Bellecombe',13.1,7.7,2308,116.5,'val-cenis-bellecombe.png',19),

(2,'Côte du Fort de Montperché',6.3,7,756,41.5,'',20),(0,'Col du Pré',12.6,7.9,1748,93,'col-du-pre.png',20),(2,'Cormet de Roselend',5.7,6.6,1968,105.5,'',20),
(2,'Côte de l’Euillon',6.1,7.4,1168,140,'cote-de-leuillon.png',20),(0,'LA PLAGNE',17.1,7.5,2072,170.5,'la-plagne.png',20),

(4,'Côte de Saint-Rémy-lès-Chevreuse',1.3,6.4,157,14,'',21);


CREATE TABLE IF NOT EXISTS COUREUR(
   id_coureur INT,  -- Numéro de dossard du coureur
   nom_coureur VARCHAR(255),
   prenom_coureur VARCHAR(255),
   date_naissance DATE,
   img_coureur VARCHAR(255),
   est_present BOOLEAN DEFAULT TRUE,
   id_pays INT NOT NULL,
   id_equipe INT NOT NULL,
   PRIMARY KEY(id_coureur),
   FOREIGN KEY(id_pays) REFERENCES PAYS(id_pays),
   FOREIGN KEY(id_equipe) REFERENCES EQUIPE(id_equipe)
);

INSERT INTO COUREUR(id_coureur, nom_coureur, prenom_coureur, date_naissance, img_coureur, id_pays, id_equipe) VALUES
(1,'VINGEGAARD','Jonas','1996-12-10','vingegaard.png',6,1),(2,'ROGLIČ','Primoz','1989-10-29','roglic.png',4,1),
(3,'BENOOT','Tiesj','1994-03-11','benoot.png',12,1),(4,'KUSS','Sepp','1994-09-13','kuss.png',10,1),
(5,'LAPORTE','Christophe','1992-12-11','laporte.png',1,1),(6,'VALTER','Attila','1998-06-12','valter.png',34,1),
(7,'VAN AERT','Wout','1994-09-15','van_aert.png',13,1),(8,'VAN BAARLE','Dylan','1992-05-21','van_baarle.png',11,1),

(11,'POGAČAR','Tadej','1998-09-21','pogacar.png',4,2),(12,'ALMEIDA','João','1998-08-05','almeida.png',5,2),
(13,'BENNETT','George','1990-04-07','bennett.png',24,2),(14,'BJERG','Mikkel','1998-11-03','bjerg.png',6,2),
(15,'MAJKA','Rafal','1989-09-12','majka.png',9,2),(16,'MCNULTY','Brandon','1998-04-02','mcnulty.png',10,2),
(17,'SOLER','Marc','1993-11-22','soler.png',2,2),(18,'WELLENS','Tim','1991-05-10','wellens.png',12,2),

(21,'BERNAL','Egan','1997-01-13','bernal.png',20,3),(22,'THOMAS','Geraint','1986-05-25','g_thomas.png',14,3),
(23,'CASTROVIEJO','Jonathan','1987-04-27','castroviejo.png',2,3),(24,'GANNA','Filippo','1996-07-25','ganna.png',7,3),
(25,'KWIATKOWSKI','Michal','1990-06-02','kwiatkowski.png',9,3),(26,'PIDCOCK','Tom','1999-07-30','pidcock.png',14,3),
(27,'RODRIGUEZ','Carlos','2001-02-02','rodriguez.png',2,3),(28,'SIVAKOV','Pavel','1997-07-11','sivakov.png',1,3),

(31,'GAUDU','David','1996-10-10','gaudu.png',1,4),(32,'ARMIRAIL','Bruno','1994-04-11','armirail.png',1,4),
(33,'GENIETS','Kévin','1997-01-09','geniets.png',35,4),(34,'KÜNG','Stefan','1993-11-16','kung.png',8,4),
(35,'MADOUAS','Valentin','1996-07-12','madouas.png',1,4),(36,'PACHER','Quentin','1992-01-06','pacher.png',1,4),
(37,'PINOT','Thibaut','1990-05-29','pinot.png',1,4),(38,'STORER','Michael','1997-02-28','storer.png',13,4),

(41,'VLASOV','Alexandr','1996-04-23','vlasov.png',17,5),(42,'HALLER','Marco','1991-04-01','haller.png',19,5),
(43,'HIGUITA','Sergio','1997-08-01','higuita.png',20,5),(44,'HINDLEY','Jai','1996-05-05','hindley.png',13,5),
(45,'KÄMNA','Lennard','1996-09-09','kamna.png',16,5),(46,'KONRAD','Patrick','1991-10-13','konrad.png',19,5),
(47,'POLITT','Nils','1994-03-06','politt.png',16,5),(48,'SCHACHMANN','Maximilian','1994-01-09','schachmann.png',16,5),

(51,'BARDET','Romain','1990-11-09','bardet.png',1,6),(52,'COMBAUD','Romain','1991-04-01','combaud.png',1,6),
(53,'DAINESE','Alberto','1998-03-25','dainese.png',16,6),(54,'DENZ','Nico','1994-02-15','denz.png',16,6),
(55,'EEKHOFF','Nils','1998-01-23','eekhoff.png',11,6),(56,'HAMILTON','Chris','1995-05-18','C_hamilton.png',13,6),
(57,'LEKNESSUND','Andreas','1999-05-21','leknessund.png',31,6),(58,'VERMAERKE','Kevin','2000-10-16','vermaerke.png',34,6),

(61,'O’CONNOR','Ben','1995-11-25','oconnor.png',13,7),(62,'BERTHET','Clément','1997-08-02','berthet.png',1,7),
(63,'BOUCHARD','Geoffrey','1992-04-01','bouchard.png',1,7),(64,'CHÉREL','Mikaël','1986-03-17','cherel.png',1,7),
(65,'COSNEFROY','Benoît','1995-10-17','cosnefroy.png',1,7),(66,'SCHÄR','Michaël','1986-09-29','schar.png',8,7),
(67,'NAESEN','Oliver','1990-09-16','naesen.png',12,7),(68,'PARET-PEINTRE','Aurélien','1996-02-27','paret_peintre.png',1,7),

(71,'ALAPHILIPPE','Julian','1992-06-11','alaphilippe.png',1,8),(72,'ASGREEN','Kasper','1995-02-08','asgreen.png',6,8),
(73,'CAVAGNA','Rémi','1995-08-10','cavagna.png',1,8),(74,'DECLERCQ','Tim','1989-03-21','declercq.png',12,8),
(75,'EVENEPOEL','Remco','2000-01-25','evenepoel.png',12,8),(76,'JAKOBSEN','Fabio','1996-08-31','jakobsen.png',11,8),
(77,'MORKOV','Michael','1985-04-30','morkov.png',6,8),(78,'SÉNÉCHAL','Florian','1993-07-10','senechal.png',1,8),

(81,'MARTIN','Guillaume','1993-06-09','martin.png',1,9),(82,'COQUARD','Bryan','1992-04-25','coquard.png',1,9),
(83,'GESCHKE','Simon','1986-03-13','geschke.png',16,9),(84,'HERRADA','Jesús','1990-07-26','herrada.png',2,9),
(85,'IZAGUIRRE','Ion','1989-02-04','i_izaguirre.png',2,9),(86,'LAFAY','Victor','1996-01-17','lafay.png',1,9),
(87,'THOMAS','Benjamin','1995-09-12','thomas.png',1,9),(88,'WALSCHEID','Maximilian','1993-06-13','walscheid.png',16,9),

(91,'VAN DER POEL','Mathieu','1995-01-19','van_der_poel.png',11,10),(92,'DILLIER','Silvan','1990-08-03','dillier.png',8,10),
(93,'HERMANS','Quinten','1995-07-29','hermans.png',12,10),(94,'KRAGH ANDERSEN','Søren','1994-08-10','kragh_andersen.png',6,10),
(95,'KRIEGER','Alexander','1991-11-28','krieger.png',16,10),(96,'PHILIPSEN','Jasper','1998-03-02','philipsen.png',12,10),
(97,'RIESEBEEK','Oscar','1992-12-23','riesebeek.png',11,10),(98,'VINE','Jay','1995-11-16','vine.png',13,10),

(101,'JOHANSSEN','Tobias','1999-08-23','johanssen.png',31,11),(102,'ANDERSEN','Idar','1999-04-30','andersen.png',31,11),
(103,'EG','Niklas','1995-01-06','eg.png',6,11),(104,'HALVORSEN','Kristofer','1996-04-13','halvorsen.png',31,11),
(105,'HANSEN','Lasse Norman','1992-02-11','hansen.png',6,11),(106,'KRISTOFF','Alexander','1987-07-05','kristoff.png',31,11),
(107,'SKAARSETH','Anders','1995-05-07','skaarseth.png',31,11),(108,'TRÆEN','Torstein','1995-07-16','træen.png',31,11),

(111,'MAS','Enric','1995-01-07','mas.png',2,11),(112,'ERVITI','Imanol','1983-11-15','erviti.png',2,11),
(113,'IZAGUIRRE','Gorka','1987-10-07','G_izaguirre.png',2,11),(104,'JACOBS','Johan','1997-03-01','jacobs.png',8,11),
(105,'JORGENSON','Matteo','1999-07-01','jorgenson.png',10,11),(106,'MÜHLBERGER','Gregor','1994-04-04','muhlberger.png',19,11),
(107,'OLIVEIRA','Nelson','1989-03-06','oliveira.png',5,11),(108,'VERONA','Carlos','1992-11-04','verona.png',2,11),

(111,'LANDA','Mikel','1989-12-13','landa.png',2,12),(112,'BILBAO','Pello','1990-02-25','bilbao.png',2,12),
(113,'COLBRELLI','Sonny','1990-05-17','colbrelli.png',7,12),(114,'HAIG','Jack','1993-09-06','haig.png',13,12),
(115,'MÄDER','Gino','1997-01-04','mader.png',8,12),(116,'MOHORIČ','Matej','1994-10-19','mohoric.png',4,12),
(117,'POELS','Wout','1987-10-01','poels.png',11,12),(118,'TEUNS','Dylan','1992-03-01','teuns.png',12,12),

(121,'BARGUIL','Warren','1991-10-28','barguil.png',1,13),(122,'CAPIOT','Amaury','1993-06-25','capiot.png',12,13),
(123,'GESBERT','Élie','1995-07-01','gesbert.png',1,13),(124,'GUGLIELMI','Simon','1997-07-01','guglielmi.png',1,13),
(125,'LOUVEL','Matis','1999-07-19','louvel.png',1,13),(126,'QUINTANA','Nairo','1990-02-04','quintana.png',20,13),
(127,'RUSSO','Clément','1995-01-20','russo.png',1,13),(128,'SWIFT','Connor','1995-10-30','swift.png',14,13),

(131,'WOODS','Michael','1986-10-12','woods.png',23,14),(132,'BEVIN','Patrick','1991-02-15','bevin.png',24,14),
(133,'FUGLSANG','Jakob','1985-03-22','fuglsang.png',6,14),(134,'GOLDSTEIN','Omer','1996-08-13','goldstein.png',22,14),
(135,'IMPEY','Daryl','1984-12-06','impey.png',25,14),(136,'NEILANDS','Krists','1994-08-18','neilands.png',26,14),
(137,'NIZZOLO','Giacomo','1989-01-30','nizzolo.png',7,14),(138,'VAN ASBROECK','Tom','1990-04-19','van_asbroeck.png',12,14),

(141,'URÁN','Rigoberto','1987-01-26','uran.png',20,15),(142,'BISSEGGER','Stefan','1998-09-13','bissegger.png',8,15),
(143,'CARTHY','Hugh','1994-07-09','carthy.png',14,15),(144,'CHAVES','Esteban','1990-01-17','chaves.png',20,15),
(145,'CORT NIELSEN','Magnus','1993-01-16','cort_nielsen.png',6,15),(146,'GUERREIRO','Rúben','1994-07-06','guerreiro.png',5,15),
(147,'POWLESS','Neilson','1996-09-03','powless.png',10,15),(148,'RUTSCH','Jonas','1998-01-24','rutsch.png',16,15),

(151,'SAGAN','Peter','1990-01-26','sagan.png',27,16),(152,'BURGAUDEAU','Matthieu','1998-11-17','burgaudeau.png',1,16),
(153,'DOUBEY','Fabien','1993-10-21','doubey.png',1,16),(154,'FERRON','Valentin','1998-02-08','ferron.png',1,16),
(155,'LATOUR','Pierre','1993-10-12','latour.png',1,16),(156,'OSS','Daniel','1987-01-13','oss.png',7,16),
(157,'TURGIS','Anthony','1994-05-16','turgis.png',1,16),(158,'VUILLERMOZ','Alexis','1988-06-01','vuillermoz.png',1,16),

(161,'YATES','Simon','1992-08-07','S_yates.png',14,17),(162,'CRADDOCK','Lawson','1992-02-20','craddock.png',10,17),
(163,'DURBRIDGE','Luke','1991-04-09','durbridge.png',13,17),(164,'HAMILTON','Lucas','1996-02-12','L_hamilton.png',13,17),
(165,'GRØNDHAL JANSEN','Amund','1994-02-11','grondhal_jansen.png',31,17),(166,'KANGERT','Tanel','1987-03-11','kangert.png',28,17),
(167,'MATTHEWS','Michael','1990-09-26','matthews.png',13,17),(168,'MEZGEC','Luka','1988-06-27','mezgec.png',4,17),

(171,'EWAN','Caleb','1994-07-11','ewan.png',13,18),(172,'CAMPENAERTS','Victor','1991-10-28','campenaerts.png',12,18),
(173,'DE BUYST','Jasper','1993-11-24','de_buyst.png',12,18),(174,'DE GENDT','Thomas','1986-11-06','de_gendt.png',12,18),
(175,'GILBERT','Philippe','1982-07-05','gilbert.png',12,18),(176,'VAN MOER','Brent','1998-01-12','van_moer.png',12,18),
(177,'VERMEERSCH','Florian','1999-04-12','vermeersch.png',12,18),

(181,'LUTSENKO','Alexey','1992-09-07','lutsenko.png',29,19),(182,'DE BOD','Stefan','1996-11-17','de_bod.png',25,19),
(183,'DE LA CRUZ','David','1989-05-06','de_la_cruz.png',2,19),(184,'DOMBROWSKI','Joe','1991-05-12','dombrowski.png',10,19),
(185,'FEDOROV','Yevgeniy','2000-02-16','fedorov.png',29,19),(186,'MOSCON','Gianni','1994-04-20','moscon.png',7,19),
(187,'RIABUSHCENKO','Alexandr','1995-10-12','riabuschenko.png',30,19),(188,'TEJADA','Harold','1997-04-27','tejada.png',20,19),

(191,'PEDERSEN','Mads','1995-12-18','pedersen.png',6,20),(192,'BERNARD','Julien','1992-03-17','bernard.png',1,20),
(193,'ELISSONDE','Kenny','1991-07-22','elissonde.png',1,20),(194,'GALLOPIN','Tony','1988-05-24','gallopin.png',1,20),
(195,'MOLLEMA','Bauke','1994-04-04','mollema.png',11,20),(196,'SKJELMOSE','Mattias','2000-09-26','skjelmose.png',6,20),
(197,'SKUJINS','Tom','1991-06-15','skujins.png',26,20),(198,'STUYVEN','Jasper','1992-04-17','stuyven.png',12,20),

(201,'GIRMAY','Biniam','2000-04-02','girmay.png',32,21),(202,'DEVRIENDT','Tom','1991-10-29','devriendt.png',12,21),
(203,'HERMANS','Quinten','1995-07-29','hermans.png',12,21),(204,'HIRT','Jan','1991-01-21','hirt.png',33,21),
(205,'MEINTJES','Louis','1992-02-21','meintjes.png',25,21),(206,'PETIT','Adrien','1990-09-26','petit.png',1,21),
(207,'TAARAMÄE','Rein','1987-04-24','taaramae.png',28,21),(208,'VAN DER HOORN','Taco','1993-12-04','van_der_hoorn.png',11,21),

(211,'ROLLAND','Pierre','1986-10-10','rolland.png',1,22),(212,'BOILEAU','Alan','1999-06-25','boileau.png',1,22),
(213,'BONNAMOUR','Franck','1995-06-20','bonnamour.png',1,22),(214,'CHEVALIER','Maxime','1999-05-16','chevalier.png',1,22),
(215,'GAUTIER','Cyril','1987-09-26','gautier.png',1,22),(216,'GOUGEARD','Alexis','1993-03-05','gougeard.png',1,22),
(217,'KORETZKY','Victor','1994-08-26','koretzky.png',1,22),(218,'MOZZATO','Luca','1998-02-15','mozzato.png',7,22);


CREATE TABLE IF NOT EXISTS participe(
   id_etape INT,
   id_coureur INT,
   DATE_PARTICIPATION DATETIME,
   PRIMARY KEY(id_etape, id_coureur, DATE_PARTICIPATION),
   FOREIGN KEY(id_etape) REFERENCES ETAPE(id_etape),
   FOREIGN KEY(id_coureur) REFERENCES COUREUR(id_coureur)
);

CREATE TABLE IF NOT EXISTS est_classe(
   id_coureur INT,
   id_classement INT,
   classement INT,
   total VARCHAR(255),
   PRIMARY KEY(id_coureur, id_classement),
   FOREIGN KEY(id_coureur) REFERENCES COUREUR(id_coureur),
   FOREIGN KEY(id_classement) REFERENCES CLASSEMENT(id_classement)
);

/*SELECT id_coureur, CONCAT(prenom_coureur,' ',nom_coureur) AS coureur, nom_pays, nom_equipe FROM COUREUR
INNER JOIN EQUIPE ON COUREUR.id_equipe = EQUIPE.id_equipe
INNER JOIN PAYS on COUREUR.id_pays = PAYS.id_pays
-- WHERE 2023 - YEAR(date_naissance) <= 25          -- Classement jeunes
WHERE nom_equipe = 'Groupama-FDJ'
GROUP BY id_coureur, nom_equipe;

SELECT id_etape, libelle_etape, date_etape, longueur, libelle_type_etape, CONCAT(nom_ville_depart,' > ',nom_ville_arrivee) AS villes
FROM ETAPE
INNER JOIN TYPE_ETAPE ON ETAPE.id_type_etape = TYPE_ETAPE.id_type_etape
INNER JOIN VILLE_DEPART ON ETAPE.id_ville_depart = VILLE_DEPART.id_ville_depart
INNER JOIN VILLE_ARRIVEE ON ETAPE.id_ville_arrivee = VILLE_ARRIVEE.id_ville_arrivee
ORDER BY id_etape;*/
