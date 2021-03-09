-- Deploy potterworld:migrationPotterWorld to pg

BEGIN;


-- -------------------------------
-- table friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "friend" (
     "id" SERIAL PRIMARY KEY,
    "character_name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "blood" (
     "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);



-- --------------------------------------------
-- table organisation
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "organisation" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "description_courte" TEXT,
    "descritpion_longue" TEXT NULL,
    "image" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table family
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "family" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table sort
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "spell" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "description_courte" TEXT,
    "description_longue" TEXT NULL,
    "category" TEXT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table magic_school
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "school" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "descritpion_courte" TEXT,
    "description_longue" TEXT,
    "director_name" TEXT,
    "localisation" TEXT,
    "embleme" TEXT,
    "image" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table maison
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "maison" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "creator" TEXT,
    "embleme" TEXT NULL,
	"director_list" TEXT NULL,
    "school_id" int REFERENCES school(id),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);
-- --------------------------------------------
-- table character
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character" (
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT,
    "lastname" TEXT,
    "birthday" TIMESTAMP DEFAULT NOW(),
    "deaththday" TIMESTAMP,
    "surnom" TEXT,
    "patronus" TEXT,
    "maison" TEXT,
    "school_id" INTEGER REFERENCES "school"("id"),
    "blood_id" INTEGER REFERENCES "blood"("id"),
    "family_id" INTEGER REFERENCES "family"("id"),
    "father_id" INTEGER REFERENCES "character"("id"),
    "mother_id" INTEGER REFERENCES "character"("id"),
    "brother_sister" TEXT,
    "cousin" TEXT,
    "oncle_tante" TEXT,
    "married" TEXT,
    "child" TEXT,
    "neveu" TEXT,
    "beau_frere" TEXT,
    "animal" TEXT,
    "home" TEXT,
    "url" TEXT,
    "other_feature" TEXT, 
    "job" TEXT,
    "lieu_naissance" TEXT,
    "why_this_name" TEXT,
    "cause_deces" TEXT,
    "other_family" TEXT,
    "father_name" TEXT,
    "mother_name" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- --------------------------------------------
-- table character_has_school
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character_has_school" (
    "character_id" INT REFERENCES "character"("id"),
    "school_id" INT REFERENCES "school"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "school_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- --------------------------------------------
-- table character_has_maison
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS "character_has_maison" (
    "character_id" INT REFERENCES "character"("id"),
    "school_id" INT REFERENCES "school"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "school_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);



-- -------------------------------
-- table character_has_organisation
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_organisation" (
    "character_id" INT REFERENCES "character"("id"),
    "organisation_id" INT REFERENCES "organisation"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "organisation_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);


-- -------------------------------
-- table character_has_friend
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_friend" (
    "character_id" INT REFERENCES "character"("id"),
    "friend_id" INT REFERENCES "friend"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "friend_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table school_has_maison
-- -------------------------------

CREATE TABLE IF NOT EXISTS "school_has_maison" (
    "school_id" INT REFERENCES "school"("id"),
    "maison_id" INT REFERENCES "maison"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("school_id", "maison_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);

-- -------------------------------
-- table character_has_family
-- -------------------------------

CREATE TABLE IF NOT EXISTS "character_has_family" (
    "character_id" INT REFERENCES "character"("id"),
    "family_id" INT REFERENCES "family"("id"),
    -- on ne peut pas utiliser le mot-clé PRIMARY KEY sur plusieurs champs
    -- pour indiquer une clé primaire sur plusieurs champs, on la définit à part, après les champs
    PRIMARY KEY ("character_id", "family_id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP
);



---------------------------------------------
-- PARTIE QUIZ ET USER ----------------------
---------------------------------------------


CREATE TABLE IF NOT EXISTS "level" (

  "id" serial PRIMARY KEY,
  "name" text NOT NULL
);

-- -----------------------------------------------------
-- Table "answer"
-- -----------------------------------------------------
-- On ne peut pas référencé le champ id de la table question ici, car la table n'existe pas encore. On fera une modification à la fin du script pour ajouter la référence.
CREATE TABLE IF NOT EXISTS "answer" (
  "id" serial PRIMARY KEY,
  "description" text NOT NULL,
  "question_id" integer NOT NULL
);

-- -----------------------------------------------------
-- Table "app_user"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "user" (
  "id" serial PRIMARY KEY,
  "email" text NOT NULL,
  "password" text NOT NULL,
  "firstname" text NULL,
  "lastname" text NULL
);

-- -----------------------------------------------------
-- Table "quiz"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "quiz" (
  "id" serial PRIMARY KEY,
  "title" text NOT NULL,
  "description" text NULL,
  "user_id" integer NOT NULL REFERENCES "user" ("id")
);

-- -----------------------------------------------------
-- Table "question"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "question" (
  "id" serial PRIMARY KEY,
  "question" text NOT NULL,
  "anecdote" text NULL,
  "wiki" text NULL,
  "level_id" integer NOT NULL REFERENCES "level" ("id"),
  -- 'Good answer',
  "answer_id" integer NOT NULL REFERENCES "answer" ("id"),
  "quiz_id" integer NOT NULL REFERENCES "quiz" ("id")
);

-- -----------------------------------------------------
-- Table "tag"
CREATE TABLE IF NOT EXISTS "tag" (
  "id" serial PRIMARY KEY,
  "name" text NOT NULL
);

-- -----------------------------------------------------
-- Table "quiz_has_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "quiz_has_tag" (
  "quiz_id" integer REFERENCES "quiz"("id"),
  "tag_id" integer REFERENCES "tag" ("id"),
  PRIMARY KEY ("quiz_id", "tag_id")
);

-- Maintenant on peut créer la référence vers la table question pour le champ "question_id" dans la table "answer" afin de réprésenter notre clé étrangère.
-- On remarquera ici la présence de l'instruction FOREIGN KEY qui dit explicitement que ceette colonne sert de clé étrangère faisaint référence à la colonne question de la table question
-- Lors de la création d'une table ce détail est implicite
ALTER TABLE "answer"
  ADD FOREIGN KEY ("question_id") REFERENCES "question" ("id");



-- --------------------------------------------------
-- PARTIE INSERTIONS DES DONNEES --------------------
-- --------------------------------------------------

-- -----------------------------
-- table school
-- -----------------------------

INSERT INTO "school"("name", "director_name", "localisation", "descritpion_courte", "description_longue", "embleme", "image") VALUES
('Poudlard', 'Godric Gryffondor, Rowena Serdaigle, Helga Poufsouffle, Salazar Serpentard (Xème siècle), Edessa Sakndenberg(XVème siècle), Elizabeth Burke et Vindictus Viridian (XVII ème siècle), Phineas Black (1847 à 1925), Armando Dippet(1925 à 1956), Albus Dumbledore (1956 à 1996), Dolores Ombrage(quelques mois en 1996), Albus Dumbledore (1996 au 30 juin 1997), Severus Rogue (1er septembre 1997 au 1er mai 1998), Minerva McGonagall (depuis 1998).', 'Pré-au-Lard en Ecosse', 'Le collège Poudlard, école de sorcellerie, est un établissement formant les jeunes sorcières et sorciers britanniques à l art et à la pratique de la magie. Il est situé en Écosse.

Poudlard est un large château de sept étages supportés par la magie, avec de nombreuses tours ainsi que de très profonds donjons. Le château a été construit par Godric Gryffondor, Helga Poufsouffle, Rowena Serdaigle et Salazar Serpentard.', 'Poudlard se situe dans le Nord du Royaume-Uni, en Écosse. endroit est décrit comme montagneux et est situé à proximité d un lac. école se situe également non loin de Pré-au-Lard, un village exclusivement habité par des sorciers.


Le château de Poudlard est incartable, il n’apparaît jamais sur une carte géographique.

Les élèves de première année sont conduits au château en barques alors que les autres élèves y accèdent en diligences. Ces dernières remontent une longue route qui contourne le lac et qui se termine devant les grilles de fer forgé du portail de l enceinte de Poudlard.

Il existe aussi huit passages secrets qui conduisent hors de l enceinte de Poudlard dont sept sont visibles depuis la Carte du Maraudeur. Le dernier fût construit en 1998 par la Salle sur Demande. Argus Rusard et les jumeaux Weasley semblent faire partie de ceux qui les connaissent.

Dans le château, on retrouve :
Un passage caché derrière un miroir du quatrième étage, rendu impraticable suite à un éboulement.
Un passage caché sous la statue d une sorcière borgne et qui mène à la boutique Honeydukes de Pré-au-Lard.
Un passage dans la salle sur demande menant à La Tête de Sanglier, une auberge de Pré-au-Lard.
Dans le Parc du château, on retrouve :
Un passage sous le Saule cogneur menant à la Cabane Hurlante.

Le château est invisible aux yeux des Moldus, car il est protégé par un sortilège. En effet, si un Moldu s approche de Poudlard il ne verra que des ruines et poursuivra son chemin. Il est également protégé des Forces du Mal. Il est par exemple impossible pour un sorcier de transplaner dans l enceinte de Poudlard.

Les mesures de sécurité furent renforcées à partir de 1996 après l annonce du retour officiel de Voldemort. Mais ces dernières n empêchèrent pas les Mangemorts de pénétrer l enceinte de l école car il existe une faille dans le système : il s agit de l Armoire à disparaître de la Salle sur Demande. Drago Malefoy en était le responsable.

Le collège Poudlard a été construit au 10ème siècle, alors que les sorciers souffraient encore de persécution de la part des Moldus. Les quatre plus grands sorciers de l époque, amis de longue date, décident de s unir pour créer un lieu d épanouissement, d apprentissage pouvant également servir de refuge aux sorciers. Godric Gryffondor, Helga Poufsouffle, Rowena Serdaigle et Salazar Serpentard bâtissent leur propre école de sorcellerie, qu ils baptisent Poudlard et partent très vite à la recherche de sorciers possédant les aptitudes nécessaires pour enseigner la magie aux élèves.

Mais les premières divergences apparaissent. En effet, les différences de point de vue concernant le choix des élèves et les matières enseignées se multiplient, l école est alors divisée en quatre maisons distinctes. Chaque maison prend le nom de son fondateur. Les quatre fondateurs, dont les jours sont comptés, ont l idée de donner à un chapeau ensorcelé le pouvoir de répartir chaque nouvel élève dans la maison qui lui correspond.

Malgré tout, les tensions s intensifient. Salazar Serpentard refuse catégoriquement l admission d enfants nés-Moldus, personnes qui, selon lui, ne sont pas dignes d étudier la magie. À l inverse, les trois autres fondateurs s opposent et insistent pour que tous puissent se former. Serpentard quitte finalement le château, non sans raison. Aujourd hui encore, les tensions entre les maisons, en particulier entre les élèves de Gryffondor et ceux de Serpentard, sont toujours aussi vives.

Poudlard sera le thêatre de moulte péripéthie, et notamment la bataille de Poudlard en mai 1998, qui verra la fin du règne de terreur de Lord Voldemort, mais aussi la dispariton de nombreuses personnes chère au coeur d Harry Potter et de ses amis, comme Albus Dumbledore, Fred Weasley, Nymphadora Thonks, Remus Lupin, ...', 'poudlard.png', 'chateau-poudlard.jpg'),

('Académie Beauxbâtons', 'Godefroy Beauxbatons(1313 à 1320), Ambelion Ballessaim(1323 à ?), Maxime Olympe(1994 à aujourd hui)', 'En France, dans les pyrénées, entre Andorre et le Perthus' , 'Académie de Beauxbâtons est un établissement formant les jeunes sorcières et sorciers Français à l art et à la pratique de la magie. Elle est située au cœur des Pyrénées, dans le Sud de la France.', 'Académie de Beauxbâtons est située dans l’Est des Pyrénées, entre Andorre et Le Perthus. Elle se trouve au cœur de la chaîne montagneuse, au sommet d une montagne décapitée communément appelée Mont Creux, dissimulée sous une, sinon la plus grande illusion du monde. Le seul moyen d y accéder est un Tunnel de Transportation à l accès très réglementé, dont la seule entrée est située dans la Gare Centrale de Transportation, au Bourg Enchanteur.

 Académie a été originellement fondée en 1313, sur mes terres de St Renaud, au sein même de mon château. C était une période de crise économique importante, et la persécution de l Inquisition incitait la noblesse sorcière à faire profil bas. Le roi connaissait notre existence, et nous protégeait des rafles meurtrières du clergé, mais nous n étions pas en mesure de réclamer de l argent à la Couronne.

J eus alors l idée de réunir autour de moi les plus grands précepteurs afin d enseigner toutes les subtilités de l Art aux enfants jusque-là pourris-gâtés de la Grande Noblesse. Moi, je n étais que fils puîné du Duc d Aquitaine, et à sa mort j ai hérité d un palais d été dont mon estimé frère n avait pas l usage, situé dans la commune sorcière de St Renaud-lès-Artois.

À ma mort, en 1320, ma fille unique Griselda n était pas mariée, et n était donc pas en mesure, d après les lois de l époque, de conserver le domaine. Elle a donc décidé de vendre le domaine à la Prévôté, qui en a fait une école ouverte à tous les sangs-purs. Mais surtout gratuite, l éducation n étant plus l apanage des riches.

Le premier directeur, institué en 1323, répondait au nom d Ambelion Ballessaim. Un cousin éloigné de l Empereur byzantin Andronic II. En 1337 commence la plus longue guerre connue de l histoire française. La Guerre de Cent Ans, qui en aura en fait duré 116. Cette guerre opposant principalement les familles nobles françaises et anglaises pour la prétention au Trône de France, les dynasties sorcières étaient elles aussi impliquées, malgré la relative indépendance de la Prévôté. Aussi, lors de la conquête des terres d Aquitaine par les Anglais, décision fut prise de déplacer l Académie. La légende raconte qu ils auraient fait transplaner le château entier. c est tout bonnement grotesque. Et qui plus est illogique, car les plans de l Académie actuelle ont été inspirés du château de Chambord, et non du mien. l emplacement de l actuelle Académie a posé un problème plus grand.

Fondée en période de guerre, la priorité était de la cacher aux Anglais, afin de préserver le savoir magique Français. Aussi, le château fut établi dans un col encaissé, au cœur même des Pyrénées, à proximité d une source naturelle. Cependant, cela suffisait peut-être à se protéger des armées ennemies, majoritairement moldue, mais pas des sorciers. Le directeur Ballessaim, un des plus grands illusionnistes de tous les temps, eut l idée, à l aide de ses pairs les plus prestigieux, et de l expert en runes Jacquemin d Éperonsang de mettre en place une dissimulation parfaite, cachant toute la vallée. Et c est ainsi qu est né le Mont Creux, une véritable montagne pour ceux qui la voient de l extérieur, mais totalement invisible pour ceux qui se trouvent en dessous.

En 1420, face à la persécution croissante de l Inquisition, décision fut prise de rendre obligatoire l éducation des jeunes sorciers, peu importait la pureté de leur sang. La priorité était d éviter les incidents magiques involontaires, afin de ne pas mettre en danger la communauté magique. La meilleure défense étant l attaque, comme on le pensait à l époque, les jeunes sorciers étaient formés au combat, incité à craindre le monde moldu comme celui-ci nous craignait. Je me rappelle d ailleurs d un fait intéressant : les parents des nés-moldus étaient soumis au sortilège de mémoire. Difficile de naître sorcier dans une famille où vos parents vous considérais comme un démon. Je pense que c est ça qui a amené au fait qu on fasse si peu cas de la pureté du sang en France. On est sorcier avant tout. Mais je m égare encore.

l Académie a ensuite connu une longue période de calme, jusqu en 1789. Les nombreuses attaques contre les familles nobles affectèrent beaucoup les grande lignée sorcières, et les parents commencèrent à retirer leurs enfants de l Académie, les envoyant dans les lointaines écoles, notamment à l école de Salem, jouissant à l époque d une réputation sanglante pour qui osait s en prendre aux sorciers. Je vous invite à vous renseigner sur les procès de Salem et sur Abigail Williams. Le 24 février 1792, le directeur Régis de Lauréac est tué par un Cocatris, et furent blessés les directeurs de Poudlard et de Durmstrang. Suite à cet évènement, le Tournoi des Trois Sorciers a été définitivement arrêté, après 498 ans d existence. Le 14 septembre de la même année, un convoi de diligence qui menait des élèves de Paris à l Académie est attaqué, et s en suit un violent affrontement qui causera la mort de dizaines d enfants sorciers, et de la totalité des agresseurs. Cependant, devant le danger encouru par les élèves, l Académie décida de fermer ses portes.

Cette fermeture dura jusqu à 1804, date à laquelle furent fondés les Ordres, et construit les Pavillons. Jusque-là, l internat se situait dans les étages aujourd hui appelés Pavillon de Chasse. c est aussi à cette époque qu ont été créés les tunnels de Transportation. À l époque, il n y en avait qu un, reliant un bâtiment secret situé dans Paris à l Académie. En 1808 furent crées les diplômes de C.H.A.S.S.E, directement liés à la création de l Université de Chevalier-Lys, même si celle-ci a connu son véritable essor dans les années 1980, notamment avec l arrivé à la direction de Beauxbâtons d Olympe Maxime en 1982, menant à une refonte globale de l éducation sorcière Française, et au regroupement des flux d élèves par le Bourg Enchanteur.
', 'beauxbatons.png', 'neant'),
('Durmstrang', 'Igor Karkaroff', 'Région de Krasnïarsk en Russie', 'L Institut Durmstrang est l une des deux écoles russes de Magie. Parmi les onze principales écoles de magie existantes, c est celle qui a la plus mauvaise réputation, connue pour ses liens avec la magie noire.', 'Château de quatre étages qui s est étendu jusqu à constituer une petite ville cramponnée à flanc de montagne, l Institut de Durmstrang est aussi appelé la Citadelle par ses résidents.

Le château en lui-même est une école: mais on y trouve aussi, dans le reste de la Citadelle, des centres de recherches réservés à des professionnels, comme des Maîtres des Potions ou des experts en Magie Noire.

Il n est pas rare pour les étudiants de faire des sorties. En cours de Soins aux Crétaures Magiques, certaines de ces excursions pouvaient durer jusqu à une semaine, souvent dans des milieux hostiles tels que la Sibérie.
Bien que personne ne sache dans quel pays il se trouve, l institut se situe probablement dans le Grand Nord(vers la Russie ou la Scandinavie), comme le prouve l épaisse cape de fourrure de l uniforme, ainsi qu une des paroles de Viktor Krum lors du Bal de Noël :  En hiver, il ne fait pas jour longtemps. c est aussi un lieu avec des lacs et des montagnes.

Durmstrang est sûrement la plus secrète des écoles de magie. Les visiteurs se voient obligés de subir un Sortilège d Amnésie quand ils la quittent pour oublier son emplacement.

l institut Durmstrang ( Angl.  Durmstrang Institute ) est l une des trois écoles de magie d Europe participant au Tournoi des Trois Sorciers en 1994 - 1995. Elle était dirigée à cette période par Igor Karkaroff. Parmi les onze principales écoles de magie existantes, c est celle qui a la plus mauvaise réputation, connue pour ses liens avec la magie noire.

l institut est plus petit que Poudlard : il ne possède que quatre étages. Il est aussi beaucoup moins confortable. Il doit y faire froid car les feux ne sont allumés que pour pratiquer la magie. Cela explique pourquoi les élèves de la délégation de Durmstrang sont si émerveillés quand ils arrivent à Poudlard pour le Tournoi des Trois Sorciers.

Le parc de Durmstrang est en revanche bien plus grand, recouvrant des lacs et des montagnes. Si les élèves ne peuvent pas trop en profiter en hiver à cause de la courte durée du jour, ils aiment parcourir le domaine en été avec leurs balais volants. l institut possède également un immense navire d apparence spectrale, celui-là même que la délégation de Durmstrang utilise pour aller à Poudlard à l occasion du Tournoi des Trois Sorciers de 1994 - 1995. Le vaisseau est habituellement amarré sur un lac situé derrière l école, et les élèves s entraînent à plonger depuis le pont, comme le fait Viktor Krum pour se préparer à la Deuxième tâche.

La fondatrice de l institut Durmstrang est une grande sorcière bulgare : Nérida Vulchanova.

La mauvaise réputation de Durmstrang est principalement due à trois sorciers : deux directeurs et un élève.

Harfang Munter, qui prit la direction de l école après la mort suspecte de Nérida Vulchanova. c est lui qui intégra les duels et la magie offensive dans le programme de l institut.
Igor Karkaroff, directeur au moment du Tournoi des Trois Sorciers, ancien Mangemort qui a maintenu un climat de peur et de tensions dans l école durant la période de sa direction. De nombreux parents retirèrent d ailleurs leurs enfants de l institut, ayant peur de ses méthodes d enseignement.
Gellert Grindelwald, un des mages noirs les plus célèbres et les plus meurtriers avec Voldemort du XXème siècle. Cet ancien élève est sûrement le sorcier qui a le plus nui à la réputation de l école. d après Viktor Krum, il avait dessiné sa marque sur le mur d un couloir de l école, marque qui était en réalité le symbole des Reliques de la Mort qu il avait essayé de retrouver avec Dumbledore dans leur jeunesse.
Après le mandat d Igor Karkaroff, la réputation de Durmstrang s est améliorée, notamment grâce à de fameux sorciers comme Viktor Krum.', 'durmstrang.png', 'neant'),
('Aucune', 'Aucun', 'Aucun', 'Néant', 'Néant', 'aucune', 'aucun');
-- ------------------------
-- table family
-- ------------------------

INSERT INTO "family"("id", "name") VALUES
('1', 'Londubat'),
('2', 'Potter'),
('3', 'Evans'),
('4', 'Weasley'),
('5', 'Malefoy'),
('6', 'Dumbledore'),
('7', 'Black'),
('8', 'Inconnu');

-- ------------------------
-- table Maison
-- ------------------------

INSERT INTO "maison"("id", "name", "creator", "school_id", "embleme") VALUES
('1', 'Gryffondor', 'Godric Gryffondor', '1', 'gryffondor.png'),
('2', 'Serpentard', 'Salazar Serpentard', '1', 'serpentard.png'),
('3', 'Serdaigle', 'Rowena Serdaigle', '1', 'serdaigle.png'),
('4', 'Poufsouffle', 'Helga Poufsouffle', '1', 'poufsoufle.png'),
('5', 'Aloysia', 'Godefroy Beauxbâtons', '2', 'aloysia.png'),
('6', 'Lonicera', 'GodeFroy Beauxbâtons', '2', 'lonicera.png'),
('7', 'Urtica', 'Godefroy Beauxbâtons', '2', 'urtica.png');

-- ------------------------
-- table sort
-- ------------------------

INSERT INTO "spell"("name", "description_courte") VALUES
-- ---('Expelliarmus', 'Pour désarmer un adversaire. Peut aussi le projeter.');
('Accio', 'Le sortilège qui permet d attirer un objet vers soit. Accio suvi du nom de l objet. Ex: Accio livre!'),
('Aguamenti', 'Le sortilège d Eau (  Angl.  Water-Making Spell ) est un enchantement qui permet au sorcier de faire apparaître de l eau propre et potable au bout de sa baguette. La puissance du jet est variable, et peut aussi bien servir à étancher la soif qu à éteindre un incendie. Son incantation est Aguamenti.'),
('Alohomora', 'Le sortilège de Déverrouillage (  Angl.  Unlocking Spell ), également appelé l Ami des Voleurs, est un enchantement qui permet à un sorcier d ouvrir discrètement une porte verrouillée sans utiliser la clé. Son incantation est Alohomora.'),
('Amplificatum', 'Le sortilège d Engorgement ou Sortilège de Gavage ou sortilège d Empiffrement (  Angl.  Engorgement Charm ) est un enchantement qui permet de grossir des objets et de petits animaux. Son incantation est Amplificatum'),
('Arania Exumai', 'Arania Exumai est un sort utilisé pour repousser une Acromentule ou d autres grosses araignées.'),
('Arresto Momentum', 'C est un sort utilisé pour ralentir ou arrêter le mouvement d un objet ou d une personne. Par exemple en cas de chute!'),
('Bombarda', 'Sortilège d explosion'),
('Bombarda Maxima','C est une variation du sortilège Bombarda. Il créer une explosion plus importante!'),
('Brackium Emendo', 'Sortilège qui permet de réparer un os cassé. Gilderoy Lockhart l utilise sur Harry Potter lors du match de Quidditch dans le tôme 2(La chambre des secrets)'),
('Confundo', 'Sortilège de confusion, qui créé une confusion chez celui qui est visé. Utilisé par Hermione Granger sur Cormac McLaggen lors des sélections pour l equipe de Quidditch Gryffondor'),
('Expecto Patronum', 'Le sortilège du Patronus (  Angl.  Patronus Charm ) est un enchantement visant à faire apparaître un Patronus, un esprit protecteur, qui peut servir de bouclier contre certaines créatures ou faire office de messager. Il prend généralement la forme d un animal propre à la personne qui lance ce sortilège. (ex: Harry fait apparaître un Cerf). Sa formule est Spero Patronum (  Angl.  Expecto Patronum ). La formule anglaise est également utilisée des les films.'),
('Incarcerem', 'Sortilège permettant de faire apparaître des cordes autour de la personne visée dans le but de la ligoter. Dolores Ombrage s en sert contre Magorian, un centaures présent dans la fôret interdite, dans le cinquième tôme d Harry Pooter(l Ordre du Phénix)'),
('Incendio', 'Sortilège du feu, qui permet d incendier un objet visé. Utilisé en vain par Hermione Granger pour tenter de détruire le médiallon Horcruxe de Voldemort dans les Reliques de la mort '),
('Levicorpus', 'Sortilège qui permet de suspendre une personne par les chevilles. Harry l enseigne à l armee de Dumbledore dans le cinquième tôme de la saga.'),
('Limacius Eructo', 'Le sortilège de crache limace, comme son nom l indique, fait vomir des limaces à la personne visée. Exemple: Ron tente ce sort contre Drago Malefoy dans le second tôme de la saga, mais le sort se retourne contre lui à cause de sa baguette cassé!'),
('Locomotor', 'le sort est utilisé en visant un objet, dont le nom précède la formule. Il permet de faire s animer un objet visé. Exemple : McGonagall l utilise au début de la bataille de Poudlard, sur les statuts de guerrier qui ornent la façade du château, dans le but de les utiliser comme soldats pour les protéger.'),
('Lumos', 'Sortilège permettant de faire apparaître de la lumière au bout de sa baguette, comme une lampe torche. Une variation de ce sort est Lumos Maxima, qui permet de faire apparaître une lumière beacuoup plus importante. Souvent utilisé par Harry Potter pour sde balader dans les couloirs du chateau la nuit.'),
('Nox', 'Sortilège qui permet d éteindre un faisceau lumineux au bout de sa baguette. Par exemple pour pour arrêter le sortilège Lumos!'),
('Oculus Reparo', 'Sortilège permettant de réparer des lunettes. Existe en une autre variation appelé Reparo, pour réparer tous type d objets. Hermione l utilise sur Harry dans le premier tôme.'),
('Oubliettes', 'Sortilège provoquant une amnésie chez la personne visée. Hermione l utilise sur ses parents dans le but de les protéger, dans les reliques de la mort, afin de leur faire oublier son existence'),
('Periculum', 'Sortilège permettant de lancer une fusée éclairante rouge dans le ciel. Utilisé par Harry Potter dans le quatrième tôme, en vue de faire délcaré la présence de Fleur Delacour qui a été capturé par des plantes, lors de la dernière épreuve du trois des trois(4) sorciers.'),
('Petrificus Totalus', 'Le sortilège du saucisson permet de pétrifier une personne visée, la paralysant totalement, mais la laissant consciente. Utilisé par Hermione Granger sur Neville Londubat dans le premier tôme, arlos que ce dernier voulait les empêcher de sortir du dortoir pour aller protéger la pierre philosophale.'),
('Priori Incantatum', ' également appelé la remontée des sortilèges, est un sortilège qui sert à dévoiler la dernière action d une baguette magique. Rencontré dans le quatrième opus de la sage, lors de l affrontement entre Harry Potter et Voldemort. Deux baguettes jumelles ne peuvent agir l une contre l autre. Si leurs propriétaires les forcent à combattre, un phénomène se produit et relie les deux baguettes. L une d elle finit par obliger l autre à régurgiter les sorts qu elle a jetés, du plus récent au plus ancien. Si l un de ces sorts étaient un sortilège de la Mort, un écho du défunt, conservant son apparence et sa personnalité, apparaît.'),
('Protego', 'Le charme du Bouclier (  Angl.  Shield Charm ) est un enchantement utilisé pour se protéger de n importe quel sortilège mineur jeté. Plus simplement, il protège le sorcier qui l utilise des sorts jetés par son adversaire. La barrière ainsi créée est solide, donc elle peut aussi servir à prévenir les attaques physiques. Son incantation est Protego.'),
('Protego Totalum', 'Protego totalum est une variation du charme du Bouclier qui est probablement utilisée pour créer un dôme de protection. Utilisé souvent dans les reliques de la mort, soit par Hermione pour protéger leur campement dans la fôret, ou par les membres de l Ordre du Phénix pour portéger Poudlard.'),
('Reducto', 'Sortilège qui permet de briser des objets solides. Un des sorts favoris de Ginny Weasley qui le maitrise parfaitement, et dont la puissance est importante.'),
('Stupefix', 'Le sortilège de stupéfixion est un sort qui permet d endormir quelqu un, de le faire entrer dans un état second, semblable à un coma ou de renvoyer un projectile. On dit alors qu il est stupéfixé. Peut provoquer la mort d une personne visée par plusieurs stupefix sur un même endroit du corps.'), ('Wingardium Leviosa', 'Le sortilège de Lévitation (  Angl.  Levitation Charm ) est un enchantement qui permet au sorcier qui l utilise de faire flotter des objets dans les airs et de les déplacer. Son incantation est Wingardium Leviosa.(cf Hermione Granger dans le premier tôme de la saga : On dit leviOsa, pas leviosA!!!'),
('Avada Kedavra', 'Sortilège de la mort qui est sans doute le sortilège le plus puissant! Utilisé avec passion par les mangemort et surtout favoris de Voldemort! Il est l un des trois sortilèges impardonnables.'),
('Doloris', 'Le sortilège Doloris (  Angl.  Cruciatus Curse ) est l un des trois Sortilèges Impardonnables. Son incantation est Endoloris (  Angl.  Crucio ). Ce sortilège impardonnable provoque une douleur extrême à quiconque le subit. Il ne laisse aucune marque sur le corps. Il faut vouloir la souffrance de l autre et y prendre du plaisir pour que le sortilège soit efficace.'),
('Impero', 'Le sortilège de l Imperium (  Angl.  Imperius Curse ) est l un des trois Sortilèges Impardonnables. Son incantation est Impero (  Angl.  Imperio ). Il contrôle totalement la personne touchée et n est pas détectable à l œil nu. C est pour cette raison qu on ne peut prouver qui a travaillé pour Voldemort de son plein gré ou sous l influence du mage noir.');


INSERT INTO blood (id, name, created_at, updated_at) VALUES
(1, 'Sang-pure', '2020-08-26 23:08:18.041532', NULL),
(2, 'Sang-mêlé', '2020-08-26 23:08:18.041532', NULL),
(3, 'Né moldu', '2020-08-26 23:08:18.041532', NULL),
(4, 'Moldu', '2020-08-26 23:08:18.041532', NULL),
(5, 'Elf', '2020-08-26 23:08:18.041532', NULL),
(6, 'Gobelin', '2020-08-26 23:08:18.041532', NULL),
(7, 'Animaux', '2020-08-26 23:08:18.041532', NULL),
(8, 'Hybride', '2020-08-26 23:08:18.041532', NULL),
(9, 'Géant', '2020-08-26 23:08:18.041532', NULL),
(10, 'Cracmol', '2020-08-26 23:08:18.041532', NULL);



-- ------------------------------
-- table organisation
-- ------------------------------

INSERT INTO "organisation"("id", "name", "description_courte", "image") VALUES
('1', 'Aurors','Les Aurors sont un groupe de sorciers et sorcières d élite qui luttent contre l utilisation de la magie noire.', 'auror.png'),
('2', 'Ordre du phénix','Durant la première prise de pouvoir de Voldemort dans les années 1970, Dumbledore rassembla un groupe de personnes pour le combattre. Ils se nommèrent eux-mêmes l’Ordre du Phénix. Il était composé d’une grande variété de gens, sorciers ou Cracmols.', 'phoenix.png'),
('3', 'Mangemort','Les Mangemorts sont les sorciers qui suivirent Voldemort. Ils étaient probablement une centaine – ceux qui transplanèrent auprès de Voldemort après la réapparition de la Marque des Ténèbres sur leur bras ne doivent constituer que ses partisans les plus importants.', 'mangemort.png'),
('4', 'Equipe de Quidditch','c est le sport favori des sorciers', 'quidditch.png'),
('5', 'Brigade Inquisitoriale','La Brigade Inquisitoriale était un groupe d étudiants censé mettre des bâtons dans les roues de Dumbledore pour le compte du ministère, mais il soutenait surtout Ombrage. Il semble que tous les membres étaient des Serpentard.', 'brigade.png'),
('6', 'Club de Slughorn','Slughorn a créé un groupe club de slug composé de l élite des élèves,choisis pour leurs parents influents ou parce qu il pensait qu ils deviendraient des personnalités importantes dans le futur.', 'slug.png'),
('7', 'Ministère de la magie','Le ministre et ministère de la magie régit et dicte les lois dans le monde des sorciers. C est la plus haute autorité présente dans le monde des sorciers', 'ministere.png'),
('8', 'Armée de Dumbledore','Lorsque le professeur Ombrage interdit à ses élèves l’utilisation de la magie. Hermione eut l idée de créer un cours de défense contre les forces du Mal que dispenserait Harry à un groupe limité d élèves volontaires, en dehors des heures de cours. Ils décidèrent de s appeler l A.D., ce qui au départ était l abréviation de Association de Défense, mais qui fut rapidement changé en Armée de Dumbledore', 'dumb-army.png'),
('9', 'Professeurs et employées de Poudlard','Il s agit de l ensemble de l équipe pédagogique et des employés travaillant à Poudlard', 'prof-poudlard.png'),
('10', 'Fondateurs de Poudlard','Il s agit des créateurs de l école Poudlard.','fondateurs-poudlard.png'),
('11', 'Maraudeurs','C est un groupe de garçons qui mirent au point une carte, nommée la Carte du Maraudeur, qui montrait Poudlard en détails, incluant chaque passage secret et l’emplacement de chaque personne se trouvant dans l’enceinte.', 'maraudeurs.png'),
('12', 'Animagus',' un Animagus est une sorcière ou un sorcier qui a la capacité de se métamorphoser en l animal qu’il souhaite tout en gardant ses facultés mentales, comme par exemple la capacité de réfléchir comme un humain.', 'animagus.png'),
('13', 'Auteurs et journalistes','Il s agit des auteurs et des journalistes présents dans le monde des sorciers.', 'auteur.png');


----------------------------------------------------
-- CHARACTERS --------------------------------------
-- -------------------------------------------------

INSERT INTO "character"("firstname", "lastname", "birthday", "deaththday", "surnom", "patronus", "maison", "school_id", "blood_id", "family_id", "father_id", "mother_id", "brother_sister", "cousin", "oncle_tante", "married", "child", "neveu", "beau_frere", "animal", "home", "url", "other_feature", "job", "created_at", "updated_at", "lieu_naissance", "why_this_name", "cause_deces", "other_family") VALUES
('Molly','Weasley (Prewett)','1950-10-30 00:00:00', '2030-01-01 00:00:00','Molynette (Mollywobbles) par son époux','inconnu','Gryffondor',1,1,4,1,NULL,'Fabian et Gideon Prewett','inconnu','Ignatius Prewett et Lucretia Black','Arthur Weasley',' Bill, Charlie, Percy, Fred, George, Ron et Ginny. ','inconnu','inconnu','Errol, le hibou de la famille, la goule familiale.','Le Terrier','molly-weasley','perdre patience, excellent cordon bleu, experte en entretien ménager, sait se battre en duel (RM36).','mère au foyer','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Molly  provient peut-être du mot mollycoddle  qui signifie surprotéger  ou dorloter . Prewett : Jill Prewett, ami de JKR à Porto au Portugal. ','aucune','Elle considère Harry comme son fils.'),
('Alphard','Black','1930-01-01 00:00:00','1976-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,7,1,NULL,'Walburga et Cygnus II Black','Aucun','inconnu','inconnu','inconnu','Sirius et Regulus Black, Bellatrix Lestrange, Andromeda Tonks, Narcissa Malefoy','inconnu','inconnu','inconnu','alphard-black','Déshérité car, d après Sirius, il le soutint lorsqu’il partit du square Grimmaurd (il lui laissa une assez belle quantité d or, ce qui lui permit de vivre par ses propres moyens) (OP6).','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','provient de l étoile Alphard, le cœur du Serpent dans la constellation de l Hydre. ','inconnue','Parents : Pollux Black et Irma Crabbe.'),
('Harry James','Potter','1980-07-31 00:00:00','1998-05-02 00:00:00',' L enfant qui a survécu , Saint Potter, l’ami des Sang-de-Bourbe  (Drago [CS12]),  l’Élu  (PSM3),  Parry Otter, l’Élu  (Horace Slughorn, [PSM22]). ','Cerf (comme son père Cornedrue)','Gryffondor',1,2,2,2,3,'Aucun','Dudley Dursley ','Pétunia et Vernon Dursley ','Ginny Weasley','James Sirius, Albus Severus, Lily Luna (RM/e)','Molly Weasley II, Lucy Weasley, Rose, Hugo, Victoire Weasley, Dominique Weasley, Louis Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1) ','Bill Weasley, Charlie Weasley, Percy Weasley, Fred Weasley, Fleur Delacour, Hermione Granger, George Weasley et Ron Weasley. ','Hedwige, un hiboux blanc, (31 juillet 1991 – 27 juillet 1997)','un cottage à Godric s Hollow (1980 – 31 octobre 1981), 4, Privet Drive, Little Whinging, Surrey (1er novembre 1981 – 27 juillet 1997). ','harry-potter','Il est  naturellement  joueur de Quidditch, Fourchelang, peut jeter des sortilèges sans baguette, sent la présence des autres, fait des rêves prémonitoires, est particulièrement doué en défense contre les forces du Mal. Il se révèle capable de résister au sortilège de l’Imperium et aux Vélanes. A éprouvé des difficultés apprendre l’Occlumancie. ','Harry commença sa formation d’Auror à 17 ans puis devint directeur du Bureau des Aurors en 2007 (BB, JKR). ','2020-08-27 00:00:00', '2030-01-01 00:00:00','Godric s Hollow  ','JKR dit sur son site qu’un certain Harry Potter était un horloger londonien du XIXe siècle (JKR).Harry a toujours été mon prénom de garçon préféré. Si ma fille avait été un fils, il aurait été Harry Rowling. Mais je devais choisir un nom différent pour  Harry  dans les livres, car il aurait été trop cruel de le nommer comme mon propre fils.  Potter  était le nom d’une famille vivant près de chez moi lorsque j’avais sept ans. J’ai toujours aimé ce nom, je l’ai donc emprunté!. Harry est le diminutif de Harold, qui fut le dernier roi saxon d’Angleterre. Il fut vaincu durant la bataille de Hastings en 1066 par Guillaume le Conquérant et fut tué d’une flèche plantée dans son œil.  Potter  signifie  potier  en anglais. ','Tué par Voldemort dans la Forêt interdite puis  ressuscité  (RM34, 35, 36) .','Sirius Black(Parrain), Ted Luppin (Filleul)'),
('James','Potter','1960-03-27 00:00:00','1981-10-31 00:00:00','Cornedrue (Prongs). Des prongs sont les cornes du cerf, ou plus généralement des pointes (d andouiller par ex.). L andouiller dénomme la ramification des bois du cerf et des autre cervidés, permettant notamment de déterminer l âge de l animal. La version française fonctionne relativement bien.','Cerf (d ou son surnom de Cornedrue)','Gryffondor',1,1,2,4,5,'Aucun','Aucun','Aucun','Lily Evans','Harry Potter','Dudley Dursley','Pétunia et Vernon Dursley','inconnu','un cottage à Godric s Hollow','james-potter','à 15 ans : effronté, suffisant, arrogant et quelque peu cruel (OP28), avait une réputation de fauteur de troubles et de briseur de règles, a effectué de nombreuses retenues (PSM), métamorphose (ES5, PA22), une des seules personnes de l Ordre du Phénix à défier Voldemort personnellement trois fois de suite et à en survivre (OP37).','d après JKR, James a hérité d une grosse somme d argent et n avait donc pas besoin d un travail bien payé. (AOL). Où James a-t-il eu tout cet argent ? Une personne maligne de HP4GU a suggéré que la famille Potter était peut-être de Godric s Hollow, puisque James et Lily y ont vécu après leur mariage. La Vif d or fut inventé à Godric s Hollow dans les années 1300, peut-être son inventeur, Bowman Wright, était l ancêtre de James. Sa fortune ce serait faite grâce à toutes ces balles de Quidditch vendues chaque année.','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Tué par Voldemort à Godric s Hollow. La tombe qu il partage avec Lily dans le cimetière de Godric s Hollow porte l inscription Le dernier ennemi à vaincre sera la mort.  La mort de James n a pas protégé Lily et Harry parce qu elle [Lily] aurait pu vivre et qu elle a choisi de mourir. James allait être tué de toute façon. (…) On ne lui a pas laissé le choix [alors que Lily] aurait pu se sauver elle-même.','Sirius Black (qu il considérait comme son frère, puisque ce dernier a vécu chez lui pendant la 6ème année d école)'),
('Lily','Evans','1960-01-30 00:00:00','1981-10-31 00:00:00','Aucun','Biche (comme Severus Rogue)','Gryffondor',1,3,2,6,7,'Pétunia Evans épouse Dursley','inconnu','inconnu','inconnu','Harry Potter','Dudley Dursley ','Aucun','inconnu','un cottage à Godric s Hollow','lily-evans-potter','sortilèges, probablement (ES5), d après Horace Slughorn, Lily avait une façon intuitive d aborder les potions (PSM9, 18), une des seules personnes de l Ordre du Phénix à défier Voldemort personnellement trois fois de suite et à en survivre (OP37).','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Tué par <a href=/character/id/<%= character.id %>>Voldemort</a> à Godric s Hollow. La tombe qu il partage avec James dans le cimetière de Godric s Hollow porte l inscription Le dernier ennemi à vaincre sera la mort.  ','Sirius Black qu elle considérait de sa famille, Severus Rogue qui était son meilleur ami jusqu à qu il devienne Mangemort'),
('Ronald Bilius','Weasley','1980-03-01 00:00:00', '2030-01-01 00:00:00','Ron, Dobby l appelle Whisky, Luna l appelle Ronald au lieu de Ron (OP), et Lavande Brown le surnomme Ron-Ron (Won-Won) (PSM17). ','Jack Russel terrier(chien)','Gryffondor',1,1,4,16,17,'Bill, Charlie, Percy, Fred, George et Ginny Weasley.','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','Hermione Granger','Rose et Hugo Weasley','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Victoire Weasley, Dominique Weasley, Louis Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1).','Audrey Weasley, Fleur Delacour, Harry Potter, Angelina Johnson. ','d abord Croûtard (alias Peter Pettigrow jusqu’en 1994), ensuite Coquecigrue (dit Coq ), un petit hibou.','Le Terrier (enfance)','ron-weasley','échecs, analyse et stratégie. A tendance à se tromper quand il est sérieux et à avoir raison quand il plaisante.
Métier : aida quelques temps son frère George à gérer Weasley, Farces pour sorciers facétieux (BB) puis devint Auror aux côtés de Harry.','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Ronald vient du norvégien archaïque Rögnvaldr, signifiant possède le pouvoir des dieux (OED).
Bilius signifie bilieux, une des quatres humeurs médiévales, caractérisant la colère et la maussaderie. Ron doit son deuxième nom à son oncle Bilius (WBD).','aucune','Aucun'),
('Hermione Jean ','Granger','1979-09-19 00:00:00', '2030-01-01 00:00:00','Sang-de-bourbe (Malefoy [CS], Scabior [RM23]). ','Une loutre','Gryffondor',1,3,8,1,NULL,'Aucun','inconnu','inconnu','Ron Weasley','Rose et Hugo Weasley','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Victoire Weasley, Dominique Weasley, Louis Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1).','Bill Weasley, Charlie Weasley, Percy Weasley, Fred Weasley, George Weasley et Ginny Weasley.','Uson chat Pattenrond','inconnu','hermione-granger','Flammes Bleues, logique (ES), arithmancie, feux portables résistant à l eau (CS), transplanage (PSM22). JKR dit que Hermione parle parfois toute seule (CS 2003).','carrière au Département de contrôle et régulation des créatures magiques où elle contribua grandement à l amélioration du niveau de vie et du statut des elfes de maison. Elle passa ensuite, en dépit des remarques de Scrimgeour, au Département de la justice magique (BB).','2020-08-27 00:00:00', '2030-01-01 00:00:00','Londres ?','JKR s’est inspirée d un personnage de la pièce de Shakespeare Un conte d hiver pour le nom d Hermione, mais elle précise que leurs caractères sont très différents. Elle a pensé que ça aurait été normal qu un couple de dentistes appellent leur unique fille de cette manière pour montrer à quel point ils sont intelligents et cultivés. Mais Rowling a choisi un nom peu usuel car elle n aurait pas voulu qu il y ait quelque part une gamine intelligente et pourvue de dents d une longueur supérieure à la moyenne qui porte le même prénom que le personnage. On aurait pu se moquer d elle (NPC). Hermione était également le prénom de deux actrices britanniques qui ont joué des sorcières. Hermione Baddely a interprété Elspeth dans la série télé Ma sorcière bien-aimée et était également dans Mary Poppins, alors qu Hermione Gingold a joué dans le film L’adorable voisine. ','aucune','amie de Harry Potter (il la considère comme sa sœur [RM19]), amie de Ron Weasley, amie de Ginny Weasley, amie de Luna Lovegood, s’entend assez bien avec ses camarades de dortoir, Lavande Brown (mais un peu moins à une époque) et Parvati Patil, ses camarades de dortoir, elle est considérée par la famille Weasley comme faisant partie de la famille, les membres de l Armée de Dumbledore, elle s’inquiète aussi pour le sort des elfes de maison. On ne sait pas si elle a encore des amis et amies moldus.'),
('Drago','Malefoy','1980-06-05 00:00:00', '2030-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,5,1,NULL,'Aucun','Nymphadora Tonks, Sirius Black, Regulus Black.','Bellatrix Black(Lestrange), Rodolphus Lestrange, Andromeda Black, Ted Tonks.','Astoria Greengrass','Scorpius Malefoy','Aucun','inconnu','aucun. Bien qu il possède un Hibou Grand-Duc','Manoir Malefoy(enfance)','drago-malefoy','potions, Occlumancie (PSM15), simuler des blessures, trouver votre faille et remuer le couteau dans la plaie, se plaindre à son père. ','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Draco = grand serpent, dragon en latin, législateur athénien tyrannique, l un des chiens de chasse d Acteon (ils tuèrent leur propre maître). Le Dragon (Draco) est également la constellation contenant Thuban, l ancienne étoile égyptienne indiquant le pôle nord (plusieurs pyramides égyptiennes étaient alignées dans sa trajectoire).','aucune','Grands-parents paternels : Abraxas Malefoy et Mrs Malefoy. / Grands-parents maternels : Cygnus Black et Druella Rosier (AGB).'),
('Tom Elvis','Jedusor','1926-12-31 00:00:00','1998-05-02 00:00:00',' Lord Voldemort , Vous-Savez-Qui , Tu-Sais-Qui (Ndt : puisque you comporte deux nuances en français), Celui-Dont-On-Ne-Doit-Pas-Prononcer-Le-Nom , Le Seigneur des Ténèbres , Tom (Dumbledore déclara que Tom commença à se faire appeler Lord Voldemort quelques années après le début de ses études à Poudlard [PSM13]), Mangemort en chef (RM22, TNO).','inconnu','Serpentard',1,2,8,1,NULL,'Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Un serpent Nagini','orphelinat (1926 – 1938), Albanie (1981 – c. 1990), quelques temps au Manoir Jedusor, quelques temps au Manoir Malefoy.','voldemort','Fourchelang (CS), Legilimancie (OP24), vol (RM4, 5). Création d Horcruxes pour séparer son âme, ma potion de magie noire pour renaître (sang de licorne, venin du serpent Nagini, os de son père, chair de Queudver et sang de Harry) (CF32, CF33). Voldemort utilisa délibérément le sang de Harry parce qu il voulait que la magie protectrice venant de Lily coule aussi dans ses propres veines (CF33).','aucun particulier. Après avoir quitté Poudlard en 1944, Jedusor commença travailla quelques temps chez Barjow et Beurk, sur l Allée des Embrumes. Il était chargé de collecter des objets de valeur et de les acheter au prix le plus bas. Il quitta brusquement son travail et disparut après avoir tué Hepzibah Smith pour obtenir un médaillon et une coupe en or qui appartenaient respectivement à Serpentard et Poufsouffle (PSM20)','2020-08-27 00:00:00', '2030-01-01 00:00:00','Little Hangleton ? ',' Riddle signifie énigme, devinette .
Voldemort ( vol de mort ) est emprunté soit au français, soit au latin. Volatus signifie vol en latin, de signifie de en latin et en français, mort signifie mort en latin et en français. Rowling a peut-être crée ce nom en partant du latin, mais on peut imaginer qu elle l a emprunté au français, car elle le comprend et le parle parfaitement. Il doit de toute façon être prononcé à la francaise, ce qui n est par exemple pas le cas dans les films (en v.o.). Dans une interview, on demanda à Rowling comment il fallait prononcer le nom de Voldemort :
– Est-ce Voldemor-T, ou Voldemor ? demanda quelqu’un à propos du terrible ennemi de Harry.
– Je dis Voldemor, mais je suis bien la seule, répondit Rowling.','Grande Salle de Poudlard dans le livre, dans la cour devant le château dans le film, tué par Harry Potter durant la bataille de Poudlard (RM36).','Aucun'),
('Severus','Rogue','1960-01-09 00:00:00','1998-05-02 00:00:00','Servilus (Snivellus), donné par ses camarades James Potter et Sirius Black pour le ridiculiser, Le Prince de Sang-Mêlé, un jeu de mots fait à partir du nom de jeune fille de sa mère et de son ascendance.','Biche (par amour pour Lily Evans)','Serpentard',1,2,8,1,NULL,'Aucun','inconnu','inconnu','non. Il ne s est jamais remis de la mort de l amour de sa vie à savoir Lily Evans.','Aucun','Aucun','Aucun','aucun','une maison de briques, dans l impasse du Tisseur, qui semble se trouver dans une ville industrielle du Nord de l Angleterre (PSM2), non loin de chez les Evans (enfance et adulte) (PSM1, RM33).
L’intérieur est aussi triste que lui : un minuscule salon qui faisait penser à une cellule capitonnée, plongée dans la pénombre. Les murs étaient entièrement couverts de livres, la plupart reliés en vieux cuir noir ou marron, un canapé élimé, un fauteuil délabré et une table branlante étaient regroupés dans le faible rond de lumière que projetaient les chandelles d une lampe accrochée au plafond. L’endroit paraissait négligé, comme s’il n était habité qu occasionnellement. (PSM2) Queudver y a également vécu peu après le retour de Voldemort.','rogue','il excelle en potions (i.e. Potion Tue-loup et Veritaserum) puis défense contre les forces du Mal en 1996-97, Rogue est aussi un excellent Occlumens/Legilimens. A créé le sortilège <a href=/sortilege/<%= sort.id %>>Sectumsempra</a>','Maître des Potions et directeur de Serpentard (1981 – 1996) (OP17), professeur de défense contre les forces du mal ( 1996 – 1997), directeur de Poudlard (1997 – 1998) (RM).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' si Severus peut facilement être rapproché du mot sévère (Ndt : même sens en français qu en anglais), on peut aussi le rapprocher du verbe to sever qui, en anglais, signifie couper, rompre . Severus est peut-être aussi une allusion à l empereur romain Lucius Septimius Severus, qui fit reconstruire le mur d Hadrien et vainquit Clodinus Albinus et Pescennius Niger. Il existe aussi plusieurs saint portant le nomSeverus.
Vers 1300, Snape était un verbe signifiant être dur avec, réprimander, affront . C’est un mot dérivé d un autre mot en vieux norvégien, sneypa, signifiant outrager, déshonorer, mettre en disgrâce . (etymonline). Le verbe sneap signifie mordre, pincer, rabaisser, réprimer, affront (phrontistery). Snape ressemble aussi au verbe to snap qui signifie se casser net, claquer, se moquer, mordre ou ronchonner . Ces significations correspondent très bien à son caractère, toujours prompt au sarcasme.','tué par Nagini sur les ordres de Voldemort (RM32) dansla cabane hurlante','Père : Tobias Rogue(Moldu) et Mère : Eileen Prince(sorcière)'),
('Albus Perceval Wulfric Brian','Dumbledore','1881-07-01 00:00:00','1997-06-01 00:00:00','Voldemort l appelle ce défenseur des gens du commun, des Sang-de-Bourbe et des Moldus (CF33), Rita Skeeter l a qualifié de vieil ahuri d un autre âge .','un Phénix','Gryffondor',1,2,6,1,NULL,'Abelforth et Ariana Dumbledore','inconnu','inconnu','aucune. Dumbledore était homosexuel (OBT). Aura eu une aventure amoureuse avec Grindelwald','Aucun','Aucun','inconnu','Fumseck un phoenix','Mould-on-the-Wold et Godric s Hollow (enfance).','albus-dumbledore','Président-Sorcier du Magenmagot (temporairement démis [OP5]), Manitou suprême de la Confédération internationale des mages et sorciers (temporairement démis [OP5]), Ordre de Merlin, première classe, et Enchanteur-en-chef, directeur de Poudlard (CF, OP5). alchimie, métamorphose, Legilimancie (OP38), tolérance envers les Moldus, peut lancer des sorts sans baguette, peut se rendre invisible sans cape (ES12), il se peut qu il puisse voir à travers les capes d invisibilité (ES12, CS14). Comment a-t-il appris tout cela ? JKR dit qu il a eu d excellents professeurs à Poudard, mais qu il est essentiellement autodidacte (TLC).','professeur de métamorphose à Poudlard (fin des années 30 – c. 1955) (CS17) et directeur de la maison Gryffondor, directeur de Poudlard (c. 1955 – 1997).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Albus vient du mot latin signifiant blanc, mais évoque également Albion, un ancien nom désignant la Grande-Bretagne à l époque d Arthur.
Perceval était l un des chevaliers d Arthur qui trouva le Saint-Graal. Dumbledore partage ce nom avec Percy Weasley. Il tient peut-être ce deuxième prénom de son père, Perceval Dumbledore (RM).
Wulfric a l étymologie la plus intéressante. J’ai reçu cela dans un e-mail d un membre du forum du Lexicon : Le nom Grindelwald m’a marqué parce qu il ressemble beaucoup celui du monstre Grendel dans l épopée nordique du 8e siècle de Beowulf et Grendel. Quelqu’un vous l a peut-être déjà signalé, mais j’ai fait un autre lien avec le profil de Dumbledore. Son troisième prénom est Wulfric. Si vous séparez les noms, Beowulf est composé de Beo = ours puissant et Wulf = loup . Quant à Wulfric, il se décompose en WULF = loup et RIC = pouvoir, règle . Si l on considère la victoire de Dumbledore sur Grindelwald en 1945, je dirais qu il y a de grandes chances pour que le troisième nom de Dumbledore soit une allusion à Beowulf et que le nom de Grindelwald se réfère au GRENDEL. C’est bien sûr une supposition, mais étant donné que Rowling a étudié les lettres classiques à l université d Exeter, il est quasiment certain qu elle connaît le mythe du Beowulf.
Dumbledore est un vieux mot anglais pour bumblebee ( bourdon ), d après JKR, qui déclare l imaginer en train de errer dans le château, chantonnant tout seul. Chose intéressante, le mot dumbledore a une autre signification possible. Dans un e-mail, Christopher Woosley écrit : Bien que beaucoup ne le sachent pas, une signification alternative pour le mot Dumbledore désigne un style de chapeau qui était devenu assez populaire à Londres dans les années 1880-90. Si on prend en compte cette information, le nom d Albus Dumbledore voudrait dire Chapeau blanc. Comme vous le savez peut-être, c’est un terme employé pour désigner le héros ou le protagoniste d une histoire. Mrs Rowling a nommé son grand défenseur du bien Chapeau blanc … J’ai découvert cette solution en cherchant un essai sur la littérature britannique du 19e siècle. ','tué par séverus Rogue dans le sixième tôme de la saga, suite à une promesse de ce dernier. En effet Albus Dumbledore était mourrant et il a fait promettre à Severus Rogue de ne pas laisser Drago Malefoy le tué mais de le faire à sa place quand le moment serait venu.','Père : Perceval Dumbledore (dont il tient son deuxième prénom).
Mère : Kendra Dumbledore.'),
('Cédric','Diggory','1977-01-01 00:00:00','1995-06-24 00:00:00','Aucun','inconnu','Poufsouffle',1,1,8,1,NULL,'Aucun','Aucun','Aucun','non','Aucun','Aucun','Aucun','inconnu','inconnu','cedric-diggory','Cedric a été sélectionné par la Coupe de Feu pour représenter Poudlard au Tournoi des Trois Sorciers, ce qui montre qu il aurait parfaitement pu devenir un sorcier puissant. Capitaine (1993 – 1995) et attrapeur (? – 1995) de l équipe de Quidditch de Poufsouffle. Préfet en chef de la maison Poufsouffle (1992-1995).','Aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Possible inspiration pour le nom des Diggory, Digory Kirke est le personnage principal du Neveu du Magicien de C.S. Lewis, un des sept volumes des Chroniques de Narnia (un des livres préférés de JKR). Dans cette série, Kirke devenu adulte est le professeur Kirke, qui comme C.S. Lewis recueillit plusieurs enfants exilés de Londres durant la Seconde Guerre mondiale. Son nom est inspiré par l un des enseignants les plus influents dans la vie de C.S. Lewis, le tuteur chez qui son père l envoya après l avoir retiré du pensionnat, et appelé Kirk par la famille Lewis (raccourci de son nom de famille, Kirkpatrick). Pour plus de détails, voir Surprised by Joy: The Shape of My Early Life (Surpris par la joie : les détails de ma petite enfance) par C.S. Lewis, dont les expériences précoces en pensionnat ressemble à la vie à Poudlard sous la direction d Ombrage. Il est aussi à noter que Kirke est interprété dans l adapation 2005 du premier Narnia par Jim Broadbent, lui-même interprète de Slughorn dans PSM/f.','tué par Queudver (Peter Pettigrow) avec la baguette de Voldemort dans le cimetière de Goldric s Holow','Son père : Amos Diggory'),
('Luna','Lovegood','1981-01-01 00:00:00', '2030-01-01 00:00:00','Loufoca (Loony). Loony est un mot d argot anglais pour dire fou . Cela provient de lunatic (en français fou, et pas lunatique comme on pourrait le supposer, même si il y a certains connections), qui vient lui-même de luna, lune en latin : certaines personnes croient en effet que la santé mentale est affectée par les phases de la lune (Ndt : Loufoca vient de loufoque, un mot d argot pour dire fou ).','Un lièvre','Serdaigle',1,1,8,1,NULL,'Aucun','Aucun','Aucun','Rolf Scamander(petit fils de Newt Scammander ou Norbert Dragoneau en VF)','Les jumeaux Lorcan et Lysander','Aucun','Aucun','inconnu','un grand cylindre noir qui ressemble à une tour d échecs géante (TNO) au sommet d une colline à quelques kilomètres du village de Loutry Ste Chaspoule, où vit la famille Weasley au Terrier (enfance).','luna-lovegood','ne déteste personne, est plus intelligence qu elle n y paraît.','naturaliste, comme son mari ','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Luna : lune en latin. Luna est assez lunatique et imprévisible.
 Lovegood = love ( amour ) + good ( bon, bien ), qui pourrait se rapporter au fait que Luna aime ceux qui ne montrent aucune affection à son égard (à en juger par la façon dont elle se comporte envers ceux qui la ridiculise et qui lui volent ses affaires).','aucune','Son père Xenophilius Lovegood'),
('Arthur','Weasley','1950-02-06 00:00:00', '2030-01-01 00:00:00','inconnu','Un furet','Gryffondor',1,1,4,1,NULL,'Bilius Weasley','inconnu','Callidora Black, Harfang Londubat, Charis Black, Caspar Croupton','Molly Prewett Weasley','Bill, Charlie, Percy, Fred, George, Ron et Ginny.','inconnu','inconnu','inconnu','Le Terrier','arthur-weasley','Arthur Weasley est un sorcier compétent, un bon père de famille. C est un passionné des Moldus.',' sous le mandat de Cornelius Fudge : Service des détournements de l artisanat moldu (avec Perkins). Sous le mandat de Rufus Scrimgeour : directeur du Bureau de détection et de confiscation des faux sortilèges et objets de protection (PSM5).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Harry Potter qu il a toujours considéré comme un fils adoptif'),
('Lucius','Malefoy(Malfoy en VO)','1954-10-01 00:00:00', '2030-01-01 00:00:00','Aucun','Aigle Royal','Serpentard',1,1,5,1,NULL,'inconnu','inconnu','inconnu','Narcissa Black','Drago Malefoy','Nymphadora Tonks','Andromeda Black, Bellatrix Black(Lestrange)','Un hibou Grand-Duc','Le Manoir Malefoy','lucius-malefoy','fayoter, comploter, corrompre, insinuer, mépriser et terroriser les Moldus. ','Mangemort avant tout, mais que fait-il de ses journées ? Il ne semble pas avoir d emploi salarié.','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Lucius était un prénom commun chez les nobles romains. Référence possible à Lucifer.
Lucius était aussi le nom d un empereur romain qui combattit le légendaire roi Arthur. Fait intéressant, sachant que Lucius Malefoy et Arthur Weasley sont de farouches ennemis et qu ils en sont déjà venus aux mains. Il est également intéressant de signaler que le roi Arthur tua l empereur Lucius d un coup sur la tête porté par son épée Excalibur. Au cours de la bagarre chez Fleury et Bott, Arthur projeta Lucius contre une étagère et ce dernier reçut L’Encyclopédie des champignons vénéneux sur la tête (CS4).','aucune','Père : Abraxas Malefoy'),
('Narcissa','Malefoy(Black)','1955-01-01 00:00:00', '2030-01-01 00:00:00',' Cissy  par sa sœur Bellatrix','Ourson','Serpentard',1,1,5,1,NULL,'Bellatrix Lestrange(Black)','Sirius Black, Régulus Black','Orion et Wallburga Black','Lucius Malefoy','Drago Malefoy','Nymphadora Tonks','Rodolphus Lestrange, Ted Tonks','Un hibou Grand-Duc','Le Manoir Malefoy','narcissa-malefoy','aime sa famille ','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Narcissa est la forme féminine de Narcisse . Dans la mythologie grecque, Narcisse est tombé amoureux de son reflet et s’est noyé dans un cours d eau alors qu il s’admirait.','aucune','Père : Phineas Black, Mère : Durella Rosier'),
('Bellatrix ','Lestrange(Black)','1951-01-01 00:00:00','1998-05-02 00:00:00','Bella','inconnu','Serpentard',1,1,7,1,NULL,'soeur aînée d Andromeda Black (elles se ressemblent beaucoup) et Narcissa Black.','Sirius Black, Régulus Black','Orion et Wallburga Black','Rodolphus Lestrange','Aucun','Drago Malefoy, Nymphadora Tonks','Lucius Malefoy, Rabastan Lestrange, Ted Tonks','inconnu','Le Manoir Malefoy','bellatrix-lestrange','sadisme, fanatisme. ','aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Bellatrix signifie en latin guerrière , c’est également le nom d une brillante étoile de la constellation d Orion (qui est d ailleurs le nom de son oncle, le père de Sirius) qui est aussi appelée l étoile amazone .','tué par Molly Weasley dans la grande salle de Poudlard, lors de la bataille de Poudlard.','Anc^tre : Phineas Black, Père : Cygnus Black, Mère : Druella Rosier'),
('Andromeda','Tonks (Black)','1953-01-01 00:00:00', '2030-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,7,1,NULL,'Bellatrix Lestrange(Black), Narcissa Malefoy(Black)','Siruis et Regulus Black','Orion et Walburga Black','Ted Tonks','Nymphadora Tonks','Drago Malefoy','Lucius Malefoy, Rodulphus Lestrange','inconnu','inconnu','andromeda-tonks','A élevé son petit-fils Ted Lupin après la mort de ses parents','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','dans la mythologie grecque, Andromède (en grec ancien celle qui dirige les hommes ), était la fille de Céphée et Cassiopée, roi et reine d Éthiopie. Cassiopée, ayant proclamé que sa fille (ou selon d autres versions, elle-même) était de beauté égale à celle des Néréides, s’était attirée la colère de Poséidon, qui pour se venger provoqua une inondation et envoya un monstre marin (la baleine Cétus) qui se mit à détruire hommes et bétails. L’oracle d Ammon révéla qu aucun répit ne serait possible tant que le roi ne livrerait pas sa fille au monstre. Celle-ci fut donc attachée nue à un rocher sur la côte. Persée, monté sur Pégase et qui revenait de sa victoire sur la Méduse, trouva Andromède et la libéra (il transforma Cétus en pierre, grâce à la tête de Méduse). Après sa mort, Andromède fut placée par Athéna parmi les constellations, près de Persée et de Cassiopée.','aucune','Ted Lupin (petit-fils)'),
('Sirius','Black','1960-01-01 00:00:00','1996-06-17 00:00:00','Patmol (Padfoot) ','Chien','Gryffondor',1,1,7,1,NULL,'Regulus Black','Narcissa Black, Andromeda Black (sa cousine préférée), Bellatrix Black, Nymphadora Tonks, Drago Malefoy, Scorpius Malefoy.Arthur Weasley est son second cousin au deuxième degré, via son père Septimus Weasley (AGB).','Lucretia Black, Ignatius Prewett (Molly Prewettest parente avec les Black via ce côté), Alphard Black (qui lui légua une grosse somme d argent), Cygnus Black et Druella Rosier. La tante Elladora est en fait l arrière-arrière-arrière-grand-tante de Sirius.','Aucun','Aucun','Aucun','Aucun','aucun','12, square Grimmaurd Londres (enfance), chez les Potter, prisonnier à Azkaban, à nouveau 12, square Grimmaurd (adulte).','sirius-black','assez doué pour devenir un Animagus et créer la Carte du Marauder. Téméraire comme James Potter.','aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Black : un clin d oeil au fait qu il peut se changer en gros chien noir. Sirius pourrait provenir du grec seirios, signifiant brûlant , Sirius est l étoile du Chien, la plus brillante de la constellation de Canis Major (du Grand Chien).','tué par Bellatrix Lestrange, dans la salle de la mort au ministère de la magie.','Parrain d Harry Potter, à qui il léga tous ses biens'),
('Regulus Artcturus','Black','1961-01-01 00:00:00','1979-01-01 00:00:00','RAB','inconnu','Serpentard',1,1,7,1,NULL,'Sirius Black','Narcissa Black, Andromeda Black (sa cousine préférée), Bellatrix Black, Nymphadora Tonks, Drago Malefoy, Scorpius Malefoy.Arthur Weasley est son second cousin au deuxième degré, via son père Septimus Weasley (AGB).','Lucretia Black, Ignatius Prewett (Molly Prewettest parente avec les Black via ce côté), Alphard Black (qui lui légua une grosse somme d argent), Cygnus Black et Druella Rosier. La tante Elladora est en fait l arrière-arrière-arrière-grand-tante de Sirius.','Aucun','Aucun','Aucun','Aucun','Seulement son Elfe de maison Kreattur','12, square Grimmaurd Londres (enfance).','regulus-black','même s’il joignit les rangs des Mangemorts, il était quelqu’un de bien car il avait par exemple beaucoup de respect pour les elfes de maison, comme le raconte Kreattur','aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Regulus = le petit roi , l étoile du Lion. Regulus était également le nom de famille de Marcus Atilius Regulus, un célèbre martyr romain qui fut torturé à mort (CE). Arcturus = l étoile la plus brillante de la constellation du Bouvier, et la quatrième étoile la plus brillante du ciel. Seules Sirius, Canopus et Alpha du Centaure brillent plus fort. Arcturus se trouve à une distance d environ 36 années-lumière du Soleil. En raison de sa proximité, son diamètre a pu être mesuré : il est d environ 22 fois celui du Soleil. ','mort noyés dans le lac de la caverne du Horcruxe(Médaillon)','inconnu'),
('Cygnus II','Black','1929-01-01 00:00:00','1979-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,7,1,NULL,'Wallburga et Alphard Black','Aucun','inconnu','Druella Rosier','Bellatrix Lestrange, Andromeda Tonks, Narcissa Malefoy','Sirius et Regulus Black','inconnu','inconnu','inconnu','cygnus-ii-black','néant','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Cygnus  signifie cygne  / cygne mâle  en latin. Dans la mythologie grecque, Cycnus  était le roi-musicien des Ligures qui fut transformé en cygne (EM). C’est aussi le nom de la constellation du Cygne, nommée aussi La Croix du Nord . ','inconnue','Parents : Pollux Black et Irma Crabbe'),
('Orion','Black','1929-01-01 00:00:00','1979-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,7,1,NULL,'Lucretia Black','Aucun','inconnu','Walburga Black(sa seconde cousine)','Sirius et Regulus Black','Bellatrix Lestrange, Andromeda Tonks, Narcissa Malefoy','inconnu','inconnu','inconnu','orion-black',' il fortifia la maison familiale du 12, square Grimmaurd, Londres (probablement héritée de sa femme, aussi une Black).','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Orion, le Chasseur, est une des constellations les plus connues du ciel. Elle comprend les étoiles Bételgueuse et Bellatrix. Dans la mythologie grecque, elle représente Orion, un chasseur légendaire qui se vantait de pouvoir tuer n importe quel animal. Dans certaines versions de la légende, il fut tué par le Scorpion, qui a été placé à l opposé de la voûte céleste par les dieux qui les ont ainsi séparés afin qu ils ne soient jamais au-dessus de l horizon en même temps.','inconnue','Parents : Pollux Black et Irma Crabbe.'),
('Walburga','Black','1925-01-01 00:00:00','1985-01-01 00:00:00','Aucun','inconnu','Serpentard',1,1,7,1,NULL,'Alphard et Cygnus II Black','Aucun','inconnu','Orion Black','Sirius et Regulus Black','Bellatrix Lestrange, Andromeda Tonks, Narcissa Malefoy','inconnu','inconnu','inconnu','walburga-black',' il fortifia la maison familiale du 12, square Grimmaurd, Londres ','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','le 1er mai est la Sainte Walburga ( Walburge en français), qui protège contre la magie et la sorcellerie','inconnue','inconnu'),
('William Arthur','Weasley','1970-01-01 00:00:00', '2030-01-01 00:00:00','Bill','inconnu','Gryffondor',1,1,4,16,17,'Fred, Georges, Percy, Ronald, Charlie et Ginie Weasley','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','Fleur Delacour','Victoire, Dominique et Louis Weasley','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Hugo et Rose Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1).','Audrey Weasley, Hermione Granger, Harry Potter, Angelina Johnson. ','inconnu','La maison aux coquillages','Bill-weasley','est capable et compétent. En partie Loup-Garou','travaille pour Gringotts : d abord comme conjureur de sorts en Egypte puis a pris un emploi de bureau pour être plus utile à l Ordre du Phénix.','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Charlie','Weasley','1972-12-12 00:00:00', '2030-01-01 00:00:00','Aucun','inconnu','Gryffondor',1,1,4,16,17,'Fred, Georges, Percy, Ronald, Bill et Ginie Weasley','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','aucune','Aucun','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Hugo et Rose Weasley, Fred Weasley II, Roxanne Weasley II, Victoire, Dominique et Louis Weasley (RM/e, BB, ITV1).','Audrey Weasley, Hermione Granger, Harry Potter, Angelina Johnson, Fleur Delacour.','inconnu','Le Terrier(enfance), Roumanie (adulte)','charlie-weasley','s’occuper des dragons, aimer les animaux, d après Hagrid (ES8), d après Fred, il a raté son permis de transplanage en 1991 et a dû le repasser ( Il a transplané huit kilomètres plus au sud que l endroit prévu, sur la tête d une pauvre femme qui faisait ses courses [CF6]). Aime s occuper des dragons, travailler à l extérieur.',' travaille avec des dragons dans une réserve en Roumanie (ES15, CF5).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Charlie  est le diminutif de Charles , mais Charlie peut très bien s’appeler simplement Charlie , tout comme Harry ne s’appelle pas Harold  ','aucune','Aucun'),
('Percy Ignatius','Weasley','1976-08-22 00:00:00', '2030-01-01 00:00:00','Percy','inconnu','Gryffondor',1,1,4,16,17,'Fred, Georges, Charlie, Ronald, Bill et Ginie Weasley','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','Audrey Weasley','Molly II et Lucy Weasley','James Sirius Potter, Albus Potter, Lily Luna Potter, Hugo et Rose Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1).','Hermione Granger, Harry Potter, Angelina Johnson, Fleur Delacour.','inconnu','inconnu','percy-weasley','suivre les règlements à la lettre, ne pas aimer l humour et les plaisanteries. Percy a quatre ans de plus que Ron, il était en cinquième année quand Ron est entré en première. Percy est né le 22 août 1976 et avait dix-sept ans (l’âge légal chez les sorciers) durant sa dernière année à Poudlard. Il a obtenu son permis de transplaner durant l été 1994 et aimait transplaner çà et là pour se vanter d en être capable.','travailla pour Barty Croupton Sr. au Département de la coopération magique internationale à partir de 1994 (il remplaça Croupton à son poste de juge pour la deuxième tâche du Tournoi des Trois Sorciers). Il a peut-être changé de département par après – le Département des transports magiques, par exemple (à King’s Cross, il discutait des règlements consacrés aux balais [RM/e]).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Percy est le diminutif de Perceval/Percival. Dans les légendes arthuriennes, Perceval était un chevalier courtois à qui il fut donné d apercevoir le Saint Graal. L’étymologie du nom est inconnue – peut-être provient-il du vieux français percer val ( percer la vallée ). Ignatius (OP8) est dérivé du mot latin désignant le feu. Nom de plusieurs saints, notamment Saint Ignace de Loyola, fondateur de l ordre des Jésuites.','aucune','Aucun'),
('Fred','Weasley','1978-04-01 00:00:00','1998-05-02 00:00:00','Les Jumeaux Weasley','Loup','Gryffondor',1,1,4,16,17,'Georges, Charlie, Ronald, Bill et Ginie Weasley, Percy','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','aucune','Aucun','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Hugo et Rose Weasley, Fred Weasley II, Roxanne Weasley II, Victoire, Dominique et Louis Weasley (RM/e, BB, ITV1).','Audrey Weasley, Hermione Granger, Harry Potter, Angelina Johnson, Fleur Delacour.','des Niffleurs (OP31) ','Le Terrier (enfance)','fred-weasley','le rire, l humour, le second degré, les farces, les jumeaux sont exceptionnellement doués pour les sortilèges comme le montrent leurs nombreuses inventions, ils ont également le sens des affaires et un don pour trouver des passages secret de Poudlard. ','patrons de Weasley, Farces pour sorciers facétieux, Fred participa à Potterwatch sous le pseudonyme de Rapier. Il est fort probable que George y ait aussi participé (RM22, TNO).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Tué lors d une explosion pendant la bataille de Poudlard','Aucun'),
('Georges','Weasley','1978-04-01 00:00:00', '2030-01-01 00:00:00','Les Jumeaux Weasley','Renard','Gryffondor',1,1,4,16,17,'Fred, Charlie, Ronald, Bill, Percy et Ginie Weasley','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','Angelina Johnson','Fred II et Roxanne Weasley','Molly Weasley II, Lucy Weasley, James Sirius Potter, Albus Potter, Lily Luna Potter, Hugo et Rose Weasley, Victoire, Dominique et Louis Weasley (RM/e, BB, ITV1).','Audrey Weasley, Hermione Granger, Fleur Delacour, Harry Potter.','des Niffleurs (OP31) ','93, Chemin de Traverse, Londres (adulte).','georges-weasley','le rire, l humour, le second degré, les farces, les jumeaux sont exceptionnellement doués pour les sortilèges comme le montrent leurs nombreuses inventions, ils ont également le sens des affaires et un don pour trouver des passages secret de Poudlard. ','patrons de Weasley, Farces pour sorciers facétieux, Fred participa à Potterwatch sous le pseudonyme de Rapier. Il est fort probable que George y ait aussi participé (RM22, TNO).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Ginevra Molly','Weasley','1981-08-11 00:00:00', '2030-01-01 00:00:00','Ginny','Cheval','Gryffondor',1,1,4,16,17,'Fred, Charlie, Ronald, Bill et Georges, Percy','Mafalda','Bilius Weasley, Fabian Prewett, Gideon Prewett.','Harry Potter','James Sirius, Albus Severus, Lily Luna (RM/e)','Molly Weasley II, Lucy Weasley, Rose, Hugo, Victoire Weasley, Dominique Weasley, Louis Weasley, Fred Weasley II, Roxanne Weasley II (RM/e, BB, ITV1) ','Audrey Weasley, Hermione Granger, Angelina Johnson, Fleur Delacour.','Arnold le Boursouflet','un cottage à Godric s Hollow (1980 – 31 octobre 1981), 4, Privet Drive, Little Whinging, Surrey (1er novembre 1981 – 27 juillet 1997). ','ginny-weasley','même Fred et George sont impressionnés par ses capacités, en particulier ses sortilèges de Chauve-Furie (OP6), mais sa poésie (révélée dans sa carte de St Valentin destinée à Harry) est très mauvaise. Ginny est la seule personne que Harry connaisse (à part lui, maintenant) qui ait survécu à une possession par Voldemort (CS, OP). Ginny a également de forts talents d actrice (OP4, 16, 32 : est parvenue à convaincre Mrs Weasley que c’était Pattenrond qui avait fait traîner des Bombabouses devant la cuisine du 12, square Grimmaurd, une imitation d Ombrage assez réussie, l épisode du Gaz Étrangleur).','après avoir connu un franc succès comme joueuse de Quidditch avec les Harpies de Holyhead, Ginny prit sa retraite pour s’occuper de sa famille et devenir correspondante spéciale pour le Quidditch à La Gazette du Sorcier (BB).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Aberforth','Dumbledore','1883-01-01 00:00:00', '2030-01-01 00:00:00','Abe','Chèvre','Gryffondor',1,2,6,1,NULL,'Albus et Ariana Dumbledore','inconnu','inconnu','Aucun','Aucun','Aucun','Aucun','inconnu',' La Tête de Sanglier, Pré-au-Lard (adulte).','aberforth-dumbledore','En tant que barman de La Tête de Sanglier à Pré-au-Lard (EBF, RM28), Abelforth est un personnage à la moralité ambiguë. Il fraye avec une clientèle un peu louche et il se peut qu il trempe lui-même dans des activités illégales. Abelforth était avec Mondingus juste avant que Harry n attrape Ding avec des objets volés appartenant à l héritage de la famille Black (en particulier une coupe en argent) à l extérieur des Trois Balais à Pré-au-Lard (PSM12). Abelforth s’éloigna d un pas traînant lorsque Harry et ses amis arrivèrent.

Albus Dumbledore s’est déjà servi une fois d Abelforth comme l exemple de quelqu’un qui se moque d être humilié publiquement. Apparemment, Abelforth avait fait l objet de poursuites pour avoir pratiqué des sortilèges interdits sur une chèvre (CF24) mais il n avait pas tenu compte des commentaires désobligeants de La Gazette du Sorcier. Cependant, son frère a précisé qu il n était pas sûr qu Abelforth sache lire, et que donc sa bravoure n avait peut-être rien à voir dans cette affaire.','Barman à La Tête de Sanglier','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Aber pourrait être un nom de lieu d origine écossaise, signifiant confluent ou embouchure . Cela pourrait donc indiquer la position de la ville d Edimbourg, à l embouchure de la rivière Forth ','aucune','Père : Perceval Dumbledore (dont il tient son deuxième prénom).
Mère : Kendra Dumbledore.'),
('Ariana','Dumbledore','1885-01-01 00:00:00','1899-08-01 00:00:00','inconnu','inconnu','Aucune',4,2,6,1,NULL,'Aberforth et Albus Dumbledore','inconnu','inconnu','Aucun','Aucun','Aucun','Aucun','inconnu','aucun','Ariana-dumbledore','Très peu de personnes connaissaient vraiment la jeune Ariana Dumbledore. La plupart des sorciers ne savait même pas qu elle existait. Les sorciers en apprennent plus sur son existence après la publication d un livre de Rita Skeeter intitulé : Vie et mensonges d Albus Dumbledore. Dans une interview, elle est dépeinte comme une personne fragile et délicate par l historienne Bathilda Tourdesac. Mais les raisons ne sont pas vraiment évoquées. En fait, la jeune fille vivait recluse dans la maison de la famille Dumbledore depuis l attaque qu elle avait subie. C est son frère, Abelforth, qui décrit plus précisément la personnalité d Ariana. Même si la majeure partie du temps, elle était douce, craintive et inoffensive, il lui arrivait certains jours de ne pas contrôler ses pouvoirs magiques, ce qui la rendait étrange et parfois même dangereuse. D après lui, cette agression l a rendue totalement folle.On suspecte qu elle était porteuse d un Obscurial(Obscurus => vu dans les animaux Fantastiques avec le personnage de Clarence).','aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Elle est morte accidentellement lors d une bataille entre Gellert Grindelwald, Abelforth et Albus Dumbledore, personne ne sut jamais qui avait lancé le sortilège qui avait tué Ariana même si Abelforth a toujours attribué ce meurtre à Albus.','Père : Perceval Dumbledore (dont il tient son deuxième prénom).
Mère : Kendra Dumbledore.'),
('Nymphadora','Thonks','1973-01-01 00:00:00','1998-05-02 00:00:00','Dora (ses parents [RM]). Elle préférait qu on l appelle Tonks plutôt que Nymphadora, qu elle détestait.','Loup','Poufsouffle',1,1,7,1,21,'Aucun','Drago Malefoy, Sirius et Regulus Black','Lucius Malefoy, Bellatrix Lestrange, Narcissa Malefoy, Rodolphus Lestrange','Remus Lupin','Ted Lupin','Aucun','Aucun','aucun','inconnu','nymphadora','en tant que Métamorphomage, Tonks peut prendre différentes apparences. Dans OP, c’est une jolie jeune femme, avec un visage pâle en forme de coeur. Dans PSM, ses cheveux sont châtain clair, couleur souris, et elle semble fatiguée, malade mâme  (PSM5). ','Auror','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' une nymphe  est une divinité mineure de la nature dans les mythologies grecque et romaine, représentée comme une belle jeune fille habitant les montagnes, les forêts, les arbres ou les cours d eau. Dora vient du grec ?????, doron, et signifie présent, cadeau . ','tuée par Bellatrix Lestrange pendant la bataille de Poudlard','Alastor Maugrey quelle considère comme son mentor'),
('Remus John','Lupin','1960-03-10 00:00:00','1998-05-02 00:00:00',' Lunard (Moony). Moony se rapporte à l effet de la pleine lune sur lui (Ndt : moon signifie lune, d où Lunard, le y final faisant fonction, comme le ard français, de diminutif un brin péjoratif.','Loup','Gryffondor',1,2,8,1,NULL,'Aucun','Aucun','Aucun','Nymphadora Thonks','Ted Lupin','Aucun','Aucun','aucun','inconnu','remus-lupin','A créer avec Peter Pettigrow, Sirius Black et James Potter la carte du Maraudeur. Il est Loup-Garou depuis qu il a été mordu petit garçon.','Fut professeur de défense contre les forces du mal dans la troisième année d Harry à Poudlard','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Remus est l un des fondateurs de Rome qui fut élevé par une louve lorsqu’il était bébé. (voir La Louve du Capitole), Lupus signifie loup en latin.','Tué par Antonin Dolohov durant la bataille de Poudlard','Fait partie de la bande des Maraudeurs'),
('Alastor','Maugrey','1960-01-01 00:00:00','1997-07-27 00:00:00','Fol Oeil, Maugrey Fol Oeil','inconnu','Aucune',1,1,8,1,NULL,'Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','aucun','inconnu','maugrey','Maugrey rentre au Ministère en tant qu Auror et la légende veut qu il ait rempli la moitié des geôles d Azkaban à lui seul.[5] Il intègre l Ordre du Phénix en espérant ainsi faire tomber Voldemort une fois pour toutes, et en devient un membre important.[8] Sera professeur de défense contre les forces du mal durant la quatrième année d Harry à Poudlard(enfin ce sera Barty Croupton Jr qui sera en fait sous polynectar, et qui se fera passer pour lui)','Auror','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Alastor  est un mot mot anglais tiré du grec. C’est un vengeur ou un nemesis, ce qui implique un châtiment terrifiant mais mérité. Moody  (du mot mood ) décrit quelqu’un dont le point de vue, les envies ou la personnalité changent vraiment souvent, dans un sens plutôt péjoratif. Alastor Moody (Maugrey) correspond certainement à cette description. Ce mot signifie aussi contrefaçon  ou faux  (NSOED). En français, Maugrey  doit très probablement provenir du verbe maugréer , qui correspond aussi un peu au personnage. ','tué par Voldemort pendant la bataille des 7 potters','Nymphadora Thonks qu il considérait comme sa protégée.'),
('Neville','Londubat','1980-07-30 00:00:00', '2030-01-01 00:00:00','Aucun','inconnu','Gryffondor',1,1,1,40,41,'Aucun','Aucun','Grand-oncle Algie, Grand-tante Enid.','Hannah Abbot','inconnu','Aucun','Aucun','Trevor le crapaud','Chaudron Baveur','neville-londubat','Passionné de botanique, a fait preuve de beaucoup de courage en tenant tête au trio lorsqu’il en avait assez que Gryffondor perde des points à cause d eux (ES), a fait de gros progrès en sortilèges défensifs (OP21), peut voir les Sombrals (OP21), il est possible que l étourderie de Neville soit la conséquence d un sortilège d Amnésie qui lui fut infligé durant son enfance pour lui faire oublier la torture de ses parents (il se pourrait qu il en fut témoin). Les sortilèges de mémoire affectent les capacités mentales de l individu, comme on a pu le constater chez Bertha Jorkins. Ses parents Franck et Alice son d ancien Aurors interné à Ste Mangouste, suite à leur torture avec le sortilège Doloris, exercé par Bellatrix Lestrange et son mari Rodolphus, ce qui fini par les rendre fou.','professeur de botanique à Poudlard (RM/e). Rowling aime imaginer Neville montrant son faux Gallion de l A.D. a ses élèves admiratifs ','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Neville (prononcer nai-veul) = emprunté au français : nouvelle ville, pays, ou ferme (de nombreux villages de France, Belgique, Québec, Etats-Unis, etc. s’appellent Neuville, Neuviller, Neuvilly, Neuvillet, Newville, etc.), c’est aussi associé à l imbécillité, existe aussi comme nom de famille.','aucune','Ses Grands-parents paternels Mr Londubat et Augusta Londubat qui l élèveront durant l internement de ses parents'),
('Franck','Londubat','1960-01-01 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Gryffondor',1,1,1,1,NULL,'Aucun','Aucun','Grand-oncle Algie, Grand-tante Enid.','Alice Londubat','Neville Londubat','Aucun','Aucun','Aucun','Ste Mangouste','franck-londubat','ancien Aurors interné à Ste Mangouste, suite à leur torture avec le sortilège Doloris, exercé par Bellatrix Lestrange et son mari Rodolphus, ce qui fini par les rendre fou.','Auror','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Alice','Londubat','1960-01-01 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Gryffondor',1,1,1,1,NULL,'Aucun','Aucun','Aucun','Franck Londubat','Neville Londubat','Aucun','Aucun','Aucun','Ste Mangouste','alice-londubat','ancien Aurors interné à Ste Mangouste, suite à leur torture avec le sortilège Doloris, exercé par Bellatrix Lestrange et son mari Rodolphus, ce qui fini par les rendre fou.','Auror','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Hannah','Abbot(Londubat)','1980-01-01 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','Poufsouffle',1,1,1,1,NULL,'Aucun','Aucun','Aucun','Neville Londubat','inconnu','Aucun','Aucun','Aucun','Chaudron Baveur','hannah-abbot','Aime collectionner les Cartes de Chocogrenouille (CF19), passion qu elle partageait avec Ernie Macmillan (CF19).','patronne du Chaudron Baveur à partir des années 2000 (OBT). ','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Rubeus','Hagrid','1928-12-06 00:00:00', '2030-01-01 00:00:00','Hagrid','inconnu','Gryffondor',1,8,8,1,NULL,'Graup(demi-frère géant)','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun',' Crockdur (Grand Danois), Aragog (Acromantula), Buck (hippogriffe), Norbert (dragon), Touffu (Cerbère).','Une cabane dans le parc de Poudlard, à l entrée de la forêt interdite','hagrid',' n a pas été complètement formé  (PA5), respect et amour pour les créatures magiques, surtout les plus dangereuses, respect des êtres vivants d une manière générale, grande force physique, est fort sensible (pleure souvent tout au long de la série). ','garde-chasse (il a sûrement succédé à Ogg [CF33]) et Gardien des Clés et des Lieux de Poudlard (ES4). En tant que Gardien des Clés, il est du devoir de Hagrid d accueillir les première année de Poudlard à la gare de Pré-au-Lard et de leur faire traverser le lac pour atteindre le château. Depuis 1993, Hagrid est également professeur de soins aux créatures magiques.','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu',' Rubeus : homonyme du mot anglais rubious, venant du latin ruber, signifiant rouge . On peut l associer au mot ruddy ( rougeaud ) : quelqu’un qui boit beaucoup a souvent le teint rougeaud.
 Hagrid est lié à plusieurs mots de vieux français, anglais et allemand :
 hag : hægtesse, vieil anglais signifiant chevaucheuse de haie ou celle qui enfourche la haie parce la haie marquait la frontière entre le monde civilisé du village et le monde sauvage au-delà. La hægtesse avait un pied dans chaque réalité. Même plus tard, alors que le mot désignait la guérisseuse locale, celle qui ramassait des racines, vivait au jour le jour et se déplaçait de village en village, il a pu avoir le sens relativement péjoratif de haie – au Moyen Orient ( hedge-priest [ haie + prêtre ], etc.), qui fait penser à une personne itinérante dormant à l abri des buissons, par exemple.
 hag-ridden : de hag (harpie) + ride (chevaucher). Chevauché par une harpie ou une sorcière, par extension, souffrir de cauchemars. Vieux terme pour désigner la paralysie du sommeil, c’est-à-dire la sensation d être maintenu immobile dans son lit par un poids très lourd, accompagnée du sentiment d une présence étrangère. On disait qu accrocher une pierre bénie au-dessus de son lit repoussait ce mal.
 hag signifie donc sorcière, harpie en vieil anglais. Rid pourrait aussi venir de to rid, renvoyer (un serviteur par ex.) . Je vous laisse faire la connexion, qu elle soit voulue par son auteur ou non.
 haggard/hagard = donne une impression d épuisement, français médiéval signifiant sauvage, indomptable .
 hager = bas-allemand pour lugubre, hagard, dans le sens d une expression égarée ou soucieuse . (sources : compilation de Dictionary.com et du Online Etymology Dictionary)','aucune','Aucun'),
('Peter','Pettigrow','1960-01-01 00:00:00','1998-01-01 00:00:00','Queudver Croutard sous sa forme animingus','inconnu','Gryffondor',1,1,8,1,NULL,'Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','vivait chez Severus Rogue puis au manoir Malefoy après la résurection de Voldemort','pettigrow',' faiblesse, couardise, lâcheté, trahison. Animagus non déclaré (rat – Croûtard) depuis sa cinquième année à Poudlard (PA18). Fait partie de la bande des Maraudeurs.','Mangemort à plein temps','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','tué par lui-même en trahissant Voldemort, lorsque Dobby vient libérer Harry, Ron et Hermione du manoir des Malefoy (RM1).','Aucun'),
('Palma et Parvati','Patil','1980-01-01 00:00:00', '2030-01-01 00:00:00','Les jumelles Patil','inconnu','Serdaigle',1,1,8,1,NULL,'Jumelles','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','Aucun','inconnu','patil','Elles ont fait partie de l armée de Dumbledore','inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','inconnu','aucune','Aucun'),
('Gellert','Grindelwald','1883-01-01 00:00:00','1998-01-01 00:00:00','Aucun','inconnu','Durmstrang',3,1,8,1,NULL,'Aucun','Aucun','Bathilda Tourdesac','Aucun, malgré un amour pour Albus Dumbledore','Aucun','Aucun','Aucun','arnold le Boursouflet','Chez sa tante à Goldric s Hollow pendant un temps, puis Nurmengard sa forteresse en Autriche','grindelwald',' brillant mais expulsé vers 1858 (RM18). Obsédés par le pouvoir et les reliques de la mort, il fut détenteur de la baguette de Surreau, avant que Dumbledore le vainc. Sera incarcéré dans sa forteresse jsuqu à sa mort. Est le méchant de l histoire des animaux Fantastiques.','aucun','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Le sorcier Noir pendant ses heures de gloire','tué par Voldemort, dans sa prison de Nurmengard, alors que le seigneur des ténèbres cherchait la baguette de Surreau','Aucun'),
('Minerva','McGonagall','1925-10-04 00:00:00', '2030-01-01 00:00:00','Aucun','chat','Gryffondor',1,2,8,1,NULL,'Robert Jr et Malcolm McGonagall','inconnu','inconnu','Elphinstone Urquart','Aucun','Aucun','andromeda Black, Bellatrix Black(Lestrange)','inconnu','Ecosse','mcgonagall','métamorphose, adore le Quidditch, porte souvent des tartans écossais – même sa robe de chambre et sa robe de bal ont des motifs écossais (CF23).','professeur de métamorphose à Poudlard, décembre 1956 – ?, directrice de Gryffondor, directrice adjointe de Poudlard, directrice de Poudlard depuis 1997 (PSM29).','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Minerva était la déesse romaine de la sagesse. McGonagall vient du poète Sir William Topaz McGonagall (1825-1902), de Dundee, Ecosse. Il est cependant considéré comme un piètre poète','aucune','Son Père : Robert McGonagall et sa Mère : Isobel Ross'),
('Inconnu','Inconnu','1925-10-04 00:00:00', '2030-01-01 00:00:00','Aucun','Inconnu','Gryffondor',1,2,8,1,NULL,'Inconnu','inconnu','inconnu','Inconnu','Aucun','Aucun','Inconnu','inconnu','Inconnu','inconnu','Inconnu','Inconnu','2020-08-27 00:00:00', '2030-01-01 00:00:00','inconnu','Inconnu','aucune','Inconnu');


-- ------------------------------
-- table character_has_organisation
-- ------------------------------

INSERT INTO "character_has_organisation"("character_id", "organisation_id") VALUES
('1', '1'),
('1', '2'),
('1', '4'),
('1', '6'),
('1', '7'),
('1', '8'),
('2', '2'),
('2', '4'),
('2', '11'),
('3', '2'),
('3', '6'),
('8', '1'),
('8', '2'),
('8', '4'),
('8', '6'),
('8', '7'),
('8', '8'),
('9', '2'),
('9', '6'),
('9', '7'),
('9', '8'),
('10', '3'),
('10', '4'),
('10', '5'),
('10', '6'),
('11', '3'),
('12', '2'),
('12', '3'),
('12', '9'),
('13', '2'),
('13', '7'),
('13', '9'),
('13', '12'),
('14', '4'),
('15', '8'),
('16', '2'),
('16', '7'),
('17', '2'),
('18', '4'),
('18', '3'),
('18', '7'),
('19', '3'),
('20', '3'),
('22', '2'),
('22', '11'),
('22', '12'),
('23', '3'),
('28', '2'),
('30', '2'),
('30', '7'),
('31', '2'),
('31', '4'),
('31', '8'),
('32', '2'),
('32', '4'),
('32', '8'),
('33', '2'),
('33', '4'),
('33', '8'),
('33', '6'),
('33', '13'),
('34','2'),
('36', '1'),
('36', '2'),
('36', '7'),
('37', '2'),
('37', '9'),
('37', '11'),
('38','1'),
('38', '2'),
('38', '7'),
('38', '9'),
('39', '2'),
('39','8'),
('39', '9'),
('40','1'),
('40', '2'),
('40', '7'),
('41', '1'),
('41', '2'), 
('41', '7'),
('43', '2'),
('43', '9'),
('44', '2'),
('44', '3'),
('44', '11'),
('44', '12');
-- ('45', '8'),
-- ('47', '2'),
-- ('47', '9'),
-- ('47', '12');


COMMIT;
