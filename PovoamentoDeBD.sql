-- -------ANIMAIS---------

INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (1,"Masculino","Tigre da Sibéria",'2000-12-31',1,1.8,225,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo,Animal_idAnimal) VALUES (2,"Feminino","Tigre-da-Sibéria",'2020-11-30',0.5,0.7,200,1,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (3,"Masculino","Falcão",'2012-1-11',0.5,1.5,12,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (4,"Feminino","Elefante Africano",'1970-4-16',2.7,3.8,3200,0);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (5,"Feminino","Elefante Africano",'1975-2-24',2.4,3.5,2700,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (6,"Masculino","Leão Africano",'1981-9-21',1.1,1.8,175,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (7,"Masculino","Tubarão Branco",'1992-10-18',1,3.2,405,1);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (8,"Feminino","Tartaruga",'1983-7-19',0.7,2.5,325,0);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (8,"Feminino","Pitão",'1983-7-19',0.7,2.5,325,0);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (8,"Feminino","Crocodilo Africano",'1983-7-19',0.7,2.5,325,0);
INSERT Into Animal (idAnimal,genero,nome,data_nascimento,altura,comprimento,peso,vivo) VALUES (8,"Masculino","",'1983-7-19',0.7,2.5,325,0);

SELECT * FROM Animal;

USE `BD_Zoologico` ;

INSERT INTO Padrinho VALUES (1,"Ofélia Oliveira","00255376308242550396","5974410212 5 YX1","376812472");
INSERT INTO Padrinho VALUES (2,"Hélio Reis","02352663637392172017","6358036756 9 ZY1","560736851");
INSERT INTO Padrinho VALUES (3,"Ofélia Braga","00597072879138176481","9410725283 8 XX2","686112760");
INSERT INTO Padrinho VALUES (4,"Sara Estéves","00431981398008546738","4426077640 3 YZ2","942002080");
INSERT INTO Padrinho VALUES (5,"Fabiano Oliveira","00457861707375255486","0951081908 7 YZ1","802827737");
INSERT INTO Padrinho VALUES (6,"Rafaela Barros","01934379016965461237","5142438671 3 XY2","462348273");
INSERT INTO Padrinho VALUES (7,"Isabel Araújo","00454353131501471323","4802257324 1 YY2","248748891");
INSERT INTO Padrinho VALUES (8,"Natália D'cruze","00452001945288113894","2810171364 4 YX2","004159134");
INSERT INTO Padrinho VALUES (9,"Larissa Melo","00436053640214382946","0404489361 2 ZZ2","766902811");
INSERT INTO Padrinho VALUES (10,"Silas Barros","00431703201016175200","4620504255 5 YX1","681918680");
INSERT INTO Padrinho VALUES (11,"Cecília Nogueira","00434462707299280883","7887423168 1 ZY2","210928728");
INSERT INTO Padrinho VALUES (12,"Pablo Carvalho","02693683613807975045","5220293198 3 YX2","734585987");
INSERT INTO Padrinho VALUES (13,"Marcelo Estéves","00616716121794850014","1949831541 6 YX1","809163000");
INSERT INTO Padrinho VALUES (14,"Amélia Nogueira","00462925165458824655","6580320500 1 ZX2","479224765");
INSERT INTO Padrinho VALUES (15,"Yango Melo","00220791662716224768","7975679486 6 ZY2","036448742");
INSERT INTO Padrinho VALUES (16,"Felícia Moreira","00595459379269696891","3437733872 1 ZX2","104011838");
INSERT INTO Padrinho VALUES (17,"Suélen Lemos","00651403201898632336","1196284126 4 ZZ1","834417558");
INSERT INTO Padrinho VALUES (18,"Carla Oliveira","02352766854506125872","9248523193 2 XZ2","570628860");
INSERT INTO Padrinho VALUES (19,"Suélen Araújo","01936333324637804099","0374167702 6 ZX1","089606386");
INSERT INTO Padrinho VALUES (20,"Suélen Martins","00355315293219137237","1899870304 8 YX2","726141682");
INSERT INTO Padrinho VALUES (21,"Warley Braga","00220395307394965315","1533230483 8 YZ2","743426767");
INSERT INTO Padrinho VALUES (22,"Maria Silva","00368027005970107063","8129059721 3 XY2","185058346");
INSERT INTO Padrinho VALUES (23,"Meire Silva","02356819317021703602","4313441046 1 YZ2","694758373");
INSERT INTO Padrinho VALUES (24,"Isabela Pereira","00362917465147482737","7076388804 6 XX2","383618167");

Select * From Padrinho;

INSERT INTO Zona VALUES (1,"Aviário");
INSERT INTO Zona VALUES (2,"Templo dos Primatas");
INSERT INTO Zona VALUES (3,"Encosta dos Felinos");
INSERT INTO Zona VALUES (4,"Reptilarium");
INSERT INTO Zona VALUES (5,"África Selvagem");
INSERT INTO Zona VALUES (6,"Quinta");
INSERT INTO Zona VALUES (7,"Austrália");
INSERT INTO Zona VALUES (8,"Polos");
INSERT INTO Zona VALUES (9,"Ásia");
INSERT INTO Zona VALUES (10,"Atlântida");

Select * From Zona;

INSERT INTO TIPO VALUES (1,14.2,"Dança das Aves");
INSERT INTO TIPO VALUES (2,22.2,"Caminhantes Terrestres");
INSERT INTO TIPO VALUES (3,7.2,"Zona dos Répteis");
INSERT INTO TIPO VALUES (4,16.2,"Paraíso Submerso");
INSERT INTO TIPO VALUES (5,14.2,"Acesso Total");

Select * From TIPO;

INSERT INTO Veterinario VALUES (1,"Célia Moreira");
INSERT INTO Veterinario VALUES (2,"Lorraine Saraiva");
INSERT INTO Veterinario VALUES (3,"Alessandra Oliveira");
INSERT INTO Veterinario VALUES (4,"Isabel Oliveira");
INSERT INTO Veterinario VALUES (5,"Dalila Costa");
INSERT INTO Veterinario VALUES (6,"Tertuliano Reis");
INSERT INTO Veterinario VALUES (7,"Ígor Nogueira");
INSERT INTO Veterinario VALUES (8,"Carlos Melo");
INSERT INTO Veterinario VALUES (9,"Frederico Estéves");
INSERT INTO Veterinario VALUES (10,"Hugo D'cruze");
INSERT INTO Veterinario VALUES (11,"Víctor Melo");
INSERT INTO Veterinario VALUES (12,"Pedro Lemos");
INSERT INTO Veterinario VALUES (13,"Raul Batista");
INSERT INTO Veterinario VALUES (14,"Célia Saraiva");
INSERT INTO Veterinario VALUES (15,"Marcos Reis");
INSERT INTO Veterinario VALUES (16,"Fabiano D'cruze");
INSERT INTO Veterinario VALUES (17,"Sara Santos");

Select * FROM Veterinario;

INSERT INTO Vacina VALUES (1,"Vacina de temperamento canino"); -- dog like animals and bears
INSERT INTO Vacina VALUES (2,"Vacina da Raiva"); -- all
INSERT INTO Vacina VALUES (3,"Vacina da Panleukopenia"); -- cat like animals
INSERT INTO Vacina VALUES (4,"Vacina da Parvovirus"); -- raccoon like animals
INSERT INTO Vacina VALUES (5,"Vacina da Brucellosis"); -- ursos
INSERT INTO Vacina VALUES (6,"Vacina da Diphtheria"); -- apes (primates)
INSERT INTO Vacina VALUES (7,"Vacina do Tetano"); -- all
INSERT INTO Vacina VALUES (8,"Vacina da Clostridial"); -- cow like and sheep (bovid and ovicaprin) girafes and okapis (giraffids)
INSERT INTO Vacina VALUES (9,"Vacina da Febre Maligna Catarrhal"); -- deer (cervid)
INSERT INTO Vacina VALUES (10,"Vacina de Clostridium perfringens"); -- camels like (camelids)
INSERT INTO Vacina VALUES (11,"Vacina do Virus do Nilo Oeste"); -- horses like (equids)
INSERT INTO Vacina VALUES (12,"Vacina da Leptospirosis "); -- rhinos tapirs pig like animals e animais marinhos
INSERT INTO Vacina VALUES (13,"Vacina do polyomavirus"); -- birds
INSERT INTO Vacina VALUES (14,"Vacina destinada a Micobacteriose"); -- marine mammals
INSERT INTO Vacina VALUES (15,"Vacina destinada a Infeções Respiratórias"); -- all tirando peixes e mamiferos marinhos

SELECT * FROM Vacina;

INSERT INTO Especie VALUES (1,"Lince-ibérico","Lynx pardinus",32); -- Comprimento: 68-82 cm Altura: 40-50 cm PESO: 7-14 kg Floresta
INSERT INTO Especie VALUES (2,"Leão-africano","Panthera leo bleyenberghi",32); -- Comprimento: 1,6-1,9 m Altura: 1,2 m Peso: 120-180 kg||| F :Comprimento: 1,7-2,5 m Altura: 1,2 m Peso: 150-240 kg Savana
INSERT INTO Especie VALUES (3,"Macaco-capuchinho-de-peito-amarelo","Cebus xanthosternos",32); -- Comprimento: 36-42 cm Peso: 3 kg
INSERT INTO Especie VALUES (4,"Macaco-do-japão","Macaca fuscata",32); -- Comprimento: ≤65 cm Peso: ≤18 kg
INSERT INTO Especie VALUES (5,"Pantera-nebulosa","Neofelis nebulosa",32); -- Comprimento: 68-106 cm Peso: 
INSERT INTO Especie VALUES (6,"Panda-vermelho","Ailurus fulgens",32); -- Comprimento: 51-73 cm Peso: 
INSERT INTO Especie VALUES (7,"Orangotango-de-sumatra","Pongo abelii",32); -- Peso: 
INSERT INTO Especie VALUES (8,"Okapi","Okapia johnstoni",32); -- Comprimento: ≤2 m Peso: 
INSERT INTO Especie VALUES (9,"Pitão-real","Python regius",32); -- Comprimento: 1,2 – 1,8 m Peso: 
INSERT INTO Especie VALUES (10,"Piranha-vermelha","Pygocentrus nattereri",32); -- Comprimento: 33 cm Peso: 
INSERT INTO Especie VALUES (11,"Rinoceronte-branco","Ceratotherium simum",32); -- Comprimento: ≤4 m Peso: 
INSERT INTO Especie VALUES (12,"Rinoceronte-indiano","Rhinoceros unicornis",32); -- Comprimento: ≤3,5 m Peso: 
INSERT INTO Especie VALUES (13,"Tartaruga-aligátor-comum","Macrochelys temminckii",32); -- Comprimento: 35-80 cm Peso: 
INSERT INTO Especie VALUES (14,"Tarântula-rosa","Grammostola rosea",32); -- Comprimento: 14 cm Peso: 
INSERT INTO Especie VALUES (15,"Suricata","Suricata suricatta",32); -- Peso: 
INSERT INTO Especie VALUES (16,"Tigre-branco","Panthera tigris",32); -- F: Comprimento: 2,1-2,7 m Peso:  M:Comprimento: 2,6-3,1 m Peso: 
INSERT INTO Especie VALUES (17,"Tigre-da-sibéria","Panthera tigris altaica",32); -- Comprimento: 2,4-3,3 m Peso: 
INSERT INTO Especie VALUES (18,"Tartaruga-estrela-indiana","Geochelone elegans",32); -- Comprimento: 15-38 cm Peso: 
INSERT INTO Especie VALUES (19,"Tartaruga-espinhosa","Heosemys spinosa",32); -- Comprimento: 17-22 cm Peso: 
INSERT INTO Especie VALUES (20,"Zebra-de-grevy","Equus grevyi",32); -- Comprimento: ≤3 m Peso: 
INSERT INTO Especie VALUES (21,"Urso-pardo","Ursus arctos",32); -- Comprimento: 1,5-2,8 m Peso: 
INSERT INTO Especie VALUES (22,"Aligátor-americano","Alligator mississippiensis",32); -- F: Comprimento: 3 m Peso:  | M: Comprimento: 4,5 m Peso: 
INSERT INTO Especie VALUES (23,"Anaconda-amarela","Eunectes notaeus",32); -- Comprimento: 3-4 m Peso: 
INSERT INTO Especie VALUES (24,"Araçari-verde","Pteroglossus viridis",32); -- Comprimento: 30-39 cm Peso: 
INSERT INTO Especie VALUES (25,"Adax","Addax nasomaculatus",32); -- Comprimento: <1,30 m Peso: 
INSERT INTO Especie VALUES (26,"Arara-jacinta","Anodorhynchus hyacinthinus",32); -- Comprimento: 100 cm Peso: 
INSERT INTO Especie VALUES (27,"Arara-escarlate","Ara macao",32); -- Comprimento: 84-89 cm Peso: 
INSERT INTO Especie VALUES (28,"Axolote","Ambystoma mexicanum",32); -- Comprimento: <30cm Peso: 
INSERT INTO Especie VALUES (29,"Bisonte-americano","Bison bison bison",32); -- Comprimento: <3,5 m Peso: 
INSERT INTO Especie VALUES (30,"Boa-da-jamaica","Epicrates subflavus",32); -- Comprimento: 2 - 2,5 m
INSERT INTO Especie VALUES (31,"Calau-da-papuásia","Aceros plicatus",32); -- Comprimento: 65-85 cm
INSERT INTO Especie VALUES (32,"Boa-de-madagáscar","Sanzinia madagascariensis",32); -- Comprimento: até 2,5 m
INSERT INTO Especie VALUES (33,"Búfalo-africano","Syncerus caffer caffer",32); -- Comprimento: 2,4-3,4 m
INSERT INTO Especie VALUES (34,"Camelo","Camelus ferus",32); -- Comprimento: 250-300 cm
INSERT INTO Especie VALUES (35,"Canguru-vermelho","Macropus rufus / Osphranter rufus",32); -- 
INSERT INTO Especie VALUES (36,"Dragão-de-komodo","Varanus komodoensis",32); -- Comprimento: ≤3 m
INSERT INTO Especie VALUES (37,"Elefante-africano","Loxodonta africana",32); -- Comprimento: 6-7,5 m
INSERT INTO Especie VALUES (38,"Crocodilo-do-nilo","Crocodylus niloticus",32); -- Comprimento: 5,5 m
INSERT INTO Especie VALUES (39,"Chimpanzé","Pan troglodytes",32); -- 
INSERT INTO Especie VALUES (40,"Chita","Acinonyx jubatus",32); -- Comprimento: 1,1-1,3 m
INSERT INTO Especie VALUES (41,"Ema","Dromaius novaehollandiae",32); -- 
INSERT INTO Especie VALUES (42,"Flamingo-rubro","Phoenicopterus ruber",32); -- 
INSERT INTO Especie VALUES (43,"Golfinho-roaz","Tursiops truncatus",32); -- Comprimento: ≤3,9 m
INSERT INTO Especie VALUES (44,"Gorila-ocidental-das-terras-baixas","Gorilla gorilla gorilla",32); -- F: Comprimento: 1,5 m | M: Comprimento: 1,7 m 
INSERT INTO Especie VALUES (45,"Hipopótamo","Hippopotamus amphibius",32); -- Comprimento: ≤5,5 m
INSERT INTO Especie VALUES (46,"Iguana-rinoceronte","Cyclura cornuta",32); -- Comprimento: 1,2m
INSERT INTO Especie VALUES (47,"Iguana-verde","Iguana iguana",32); -- Comprimento: 1,5-2 m
INSERT INTO Especie VALUES (48,"Jaguar","Panthera onca onca",32); -- Comprimento: 1,15-1,70 cm
INSERT INTO Especie VALUES (49,"Íbis-escarlate","Eudocimus ruber",32); -- Comprimento: 55-76 cm