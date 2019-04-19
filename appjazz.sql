/*
 Navicat Premium Data Transfer

 Source Server         : laravel
 Source Server Type    : PostgreSQL
 Source Server Version : 90415
 Source Host           : 192.168.133.13:5432
 Source Catalog        : apps
 Source Schema         : appjazz

 Target Server Type    : PostgreSQL
 Target Server Version : 90415
 File Encoding         : 65001

 Date: 17/04/2019 14:48:01
*/


-- ----------------------------
-- Sequence structure for  foodPlaces_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "appjazz"." foodPlaces_id_seq";
CREATE SEQUENCE "appjazz"." foodPlaces_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for lodgingPlaces_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "appjazz"."lodgingPlaces_id_seq";
CREATE SEQUENCE "appjazz"."lodgingPlaces_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for schedule_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "appjazz"."schedule_id_seq";
CREATE SEQUENCE "appjazz"."schedule_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "appjazz"."users_id_seq";
CREATE SEQUENCE "appjazz"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for alreadyPlayedHere
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."alreadyPlayedHere";
CREATE TABLE "appjazz"."alreadyPlayedHere" (
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "date" timestamp(6),
  "description" text COLLATE "pg_catalog"."default"
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of alreadyPlayedHere
-- ----------------------------
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '1º Rio das Ostras Jazz & Blues Festival:  Nuno Mindelis, Blues Etílicos, Baseado em Blues, Yamandú Costa e Kenny Brown, entre outros. ');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '2º Rio das Ostras Jazz & Blues: Stanley Jordan, Jane Monheit e Big Time Sarah; Yamandú Costa, Romero Lubambo, Naná Vasconcellos, Sérgio Dias, e Márcio Montarroyos, entre outros.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '3º Rio das Ostras Jazz & Blues: Magic Slim, John Scofield, Mike Stern, Richard Bona, Eddie C. Campbell, Nnenna Freelon e Kenny Garrett; Egberto Gismonti, Wagner Tiso, Ithamara Koorax e Vitor Biglione; Celso Blues Boy, Big Joe Manfra, Jefferson Gonçalves e Sérgio Duarte.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '4º Rio das Ostras Jazz & Blues: Richard Bona, James Carter, Wallace Roney, Charlie Musselwhite – com a participação de Flávio Guimarães –, T.S. Monk, Eddy Clearwater, Banda Mantiqueira, Léo Gandelman e Marcos Suzano, Prado Blues Band e Fernando Noronha & Black Soul.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '5ª Rio das Ostras Jazz & Blues: Roben Ford, Stefon Harris, Ravi Coltrane, Soulive, Michael Hill e Roy Rogers. Hamilton de Holanda, Dom Salvador, Luciana Souza e Romero Lubambo, Naná Vasconcelos e Big Gilson.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '6º Rio das Ostras Jazz & Blues: John Mayall & The Bluesbreakers, John Scofield, James “Blood” Ulmer, Vernon Reid - líder do Living Color, Will Calhoun’s, Regina Carter, Russell Malone, Bonerama e The Godfathers of Groove - formado por Reuben Wilson, Bernard "Pretty" Purdie e Grant Green Jr - com participação especial de Léo Gandelman, Blues Etílicos, Mauro Senise Quarteto, Taryn, Dudu Lima, Marcos Suzano, Jean-Pierre Zanella, Robson Fernandes Blues Band e Delicatessen.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '7º Rio das Ostras Jazz & Blues: Spyro Gyra, John Hammond, Coco Montoya e Jason Miles e Rudder – considerado pela crítica o mais progressivo e inovador grupo a atingir a cena musical nos últimos anos desde Medeski, Martin & Wood. Ari Borger, o duo de violões Duofel – com a participação especial do percussionista Fábio Pascoal, o gaitista Jefferson Gonçalves, o grupo Pau Brasil e a Big Time Orchestra. A Orquestra Kuarup, regida pelo maestro Nando Carneiro, abriu a sétima edição do Rio das Ostras Jazz & Blues.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '8º Rio das Ostras Jazz & Blues: Ron Carter, acompanhado por Russel Malone e Mulgrew Miller, Rod Piazza e The Mighty Flyers, The Michael Landau Group, Raul de Souza e sua banda, Stanley Jordan e Armandinho Macedo e T.M. Stevens, acompanhado por Cindy Blackman, Delmar Brown e Blackbyrd Mc Knight. ');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '9º Rio das Ostras Jazz & Blues: Medeski, Martin & Wood, acompanhado pelo saxofonista Bill Evans; Roberto Fonseca, Nicholas Payton, Yellowjackets, Jose James, Jane Monheit, Bryan Lee, Saskia Laroo e Tommy Castro Band; Igor Prado, Nuno Mindelis, Ricardo Silveira, Azimuth e Leo Gandelman.');
INSERT INTO "appjazz"."alreadyPlayedHere" VALUES (NULL, NULL, '10º Rio das Ostras Jazz & Blues: Mike Stern, Romero Lubambo, Michael Hill, Celso Blues Boy, Roy Rogers, Kenny Barron, David Sanborn, Duke Rubillard, Billy Cobham, Armand Sabal-Lecco, Maurício Einhorn, Hélio Delmiro e Cama de Gato');

-- ----------------------------
-- Table structure for attractions
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."attractions";
CREATE TABLE "appjazz"."attractions" (
  "id" int8 NOT NULL DEFAULT nextval('"appjazz".schedule_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "year" int4,
  "date" timestamp(6),
  "picture" varchar(255) COLLATE "pg_catalog"."default",
  "video" varchar(255) COLLATE "pg_catalog"."default",
  "media" varchar(255) COLLATE "pg_catalog"."default"
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of attractions
-- ----------------------------
INSERT INTO "appjazz"."attractions" VALUES (1, 'STANLEY JORDAN TRIO', 'Tentar descrever Stanley Jordan, guitarrista e pianista americano de Jazz/Jazz fusion em termos simples é como tentar explicar a Teoria de Einstein de Relatividade em dez palavras ou menos. Mais conhecido como um guitarrista que fez grandes contribuições técnicas e musicais para seu instrumento, Stanley Jordan já fez seu nome como um dos guitarristas mais significantes do século 20. Um pequeno ensaio e uma noite mágica no Pelourinho em Salvador, testemunhada por mais de 5.000 pessoas, foi o suficiente para batizar um encontro mágico entre dois guitarristas únicos.

Quando Stanley Jordan trocou os primeiros acordes com Armandinho, pudemos testemunhar o que o ser humano pode proporcionar em termos máximos de arte com um instrumento na mão. Cada um com seu estilo e personalidade diferentes, unidos pela grandeza do talento, decidiram exibir o encontro de duas das principais e mais influentes escolas musicais de todos os tempos, a americana e a brasileira. Em seu trio no Brasil, Stanley ainda conta com Ivan “Mamão” Conti na bateria, integrante do lendário grupo Azymuth, e o talentoso baixista mineiro Dudu Lima no baixo acústico e elétrico, com quem alcançou um entrosamento e uma química quase mágica, agora recebendo a participação especial de Armandinho na guitarra baiana e no bandolim, ENCONTRO ÚNICO E IMPERDÍVEL!', 2018, '2018-06-15 21:30:00', 'http://www.riodasostrasjazzeblues.com/joomla/images/stanleyearmandinho.jpg', NULL, NULL);
INSERT INTO "appjazz"."attractions" VALUES (2, 'IGOR PRADO R&B SOUL BAND', 'Igor Prado com 15 anos de estrada, construiu aos poucos e à custa de muito trabalho e talento uma trajetória impressionante no cenário do blues internacional. O grupo liderado pelo cantor e guitarrista Igor Prado concretizou agora mais uma façanha: é o primeiro sul-americano indicado ao Blues Music Awards, uma espécie de Grammy desse seminal gênero musical, o troféu na categoria “best new artist álbum” com seu mais recente trabalho, “Way Down South”, lançado nos EUA, Europa e Ásia pelo selo americano Delta Groove. Desde então, ele e sua banda tocaram em mais de 30 países, participando de mais de 15 importantes festivais e no Brasil participam de todos os festivais do gênero. SOM PARA CIMA, SUPER DANÇANTE!!! ', 2018, '2018-06-14 16:48:53', 'http://www.riodasostrasjazzeblues.com/joomla/images/leonbal.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for festivalSupporters
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."festivalSupporters";
CREATE TABLE "appjazz"."festivalSupporters" (
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "logo" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of festivalSupporters
-- ----------------------------
INSERT INTO "appjazz"."festivalSupporters" VALUES ('governo do estado do rio de janeiro', 'https://logodownload.org/wp-content/uploads/2018/08/governo-rio-de-janeiro-logo-01.png', 'Patrocínio');
INSERT INTO "appjazz"."festivalSupporters" VALUES ('Enel', 'https://upload.wikimedia.org/wikipedia/commons/4/47/Enel_logo_2016.png', 'Patrocínio');
INSERT INTO "appjazz"."festivalSupporters" VALUES ('Prefeitura de Rio das Ostras', 'https://www.riodasostras.rj.gov.br/wp-content/uploads/2018/07/logodaprefeitura-interna.png', 'Realizador');

-- ----------------------------
-- Table structure for foodPlaces
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."foodPlaces";
CREATE TABLE "appjazz"."foodPlaces" (
  "id" int8 NOT NULL DEFAULT nextval('"appjazz"." foodPlaces_id_seq"'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "addressType" varchar(255) COLLATE "pg_catalog"."default",
  "number" varchar(32) COLLATE "pg_catalog"."default",
  "phone1" varchar(255) COLLATE "pg_catalog"."default",
  "phone2" varchar(255) COLLATE "pg_catalog"."default",
  "cuisineType" varchar(255) COLLATE "pg_catalog"."default",
  "placeType" varchar(255) COLLATE "pg_catalog"."default",
  "openingHours" varchar(255) COLLATE "pg_catalog"."default",
  "neighborhood" varchar(255) COLLATE "pg_catalog"."default",
  "picture" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default"
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of foodPlaces
-- ----------------------------
INSERT INTO "appjazz"."foodPlaces" VALUES (1, 'Pier Gourmet', 'Teresópolis', 'Rua', '98', '	(22) 2764-6350', NULL, 'Frutos do mar', 'Restaurante', '3ª a Sab 10h às 00h / Dom de 10h às 18h', 'Boca da Barra', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/b7/01/1a/local-maravilhoso-na.jpg', NULL);
INSERT INTO "appjazz"."foodPlaces" VALUES (2, 'Bistrô Pizzaria', 'Valdecir Barros de Farias', 'Rua', '522', '(22) 2771-3590', NULL, 'Pizzaria', 'Pizzaria', 'de 3º a domingo das 17h às 00h', 'Nova Aliança', 'https://winepedia.com.br/wp-content/uploads/2018/06/Pizzas-e-Vinhos-1180x517.jpg', NULL);

-- ----------------------------
-- Table structure for generalData
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."generalData";
CREATE TABLE "appjazz"."generalData" (
  "history" text COLLATE "pg_catalog"."default",
  "stages" text COLLATE "pg_catalog"."default",
  "editions" text COLLATE "pg_catalog"."default",
  "logo" varchar(500) COLLATE "pg_catalog"."default"
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of generalData
-- ----------------------------
INSERT INTO "appjazz"."generalData" VALUES ('festival

Apontado pelos críticos como um dos melhores festivais do gênero no mundo, o Rio das Ostras Jazz & Blues Festival chega à sua décima quinta edição. Este ano o Festival será realizado entre os dias 15 de junho e 17 de junho, com uma seleção dos melhores instrumentistas e intérpretes da atualidade, que se apresentarão em três palcos montados ao ar livre, com shows gratuitos.


Desde a sua criação em 2003, o Rio das Ostras Jazz&Blues Festival realizou mais de 550 shows, 100 palestras e workshops para cerca de 1 milhão de espectadores, estimulando o interesse pela música de alta qualidade e criando oportunidades para o público conferir de perto alguns dos maiores nomes do Jazz, Blues e da música instrumental nacional e internacional. Durante todo esse período o Festival manteve-se fiel à sua proposta inicial que é focada em formar público, alavancar o turismo, gerar renda, atrair negócios, ofertar cultura, democratizar o acesso ao bem cultural por meio de sua total GRATUIDADE e fomentar a economia através de sua continuidade, o que foi comprovado por estudos feitos pela FGV-RJ por quatro anos, bem como assumir a responsabilidade social de estender suas ações para além dos palcos, criando parcerias em projetos culturais e sociais ao longo do ano. Todos os objetivos foram e continuam sendo alcançados.


O festival, realizado pela Azul Produções com o apoio da prefeitura da cidade de Rio das Ostras, através da Secretaria de Cultura, faz parte do calendário oficial de eventos do Estado do Rio de Janeiro, devido a sua importância.', 'COSTAZUL [SHOW ÀS 20h] - Palco principal do festival, abriga uma praça de alimentação com restaurantes e bares, quiosques de produtos artesanais da cidade, venda de CDs, revistas e camisetas e telão que transmite os shows ao vivo, uma área especial de acessibilidade e área para motorhomes. Ainda em Costazul, há a Casa do Jazz e do Blues. No espaço, shows de bandas locais e exposições.



LAGOA IRIRY [SHOW ÀS 14:00h]- No palco da Lagoa de Iriry, o público está lado a lado com o artista em um anfiteatro circundado por vegetação típica de restinga. A Lagoa de Iriry fica no Jardim Bela Vista, em Costazul.



CONCHA ACÚSTICA DA PRAÇA DE SÃO PEDRO [SHOW ÀS 11h15min]- Palco criado para a apresentação de novos talentos do jazz e do blues. Fica no centro de Rio das Ostras, ao ar livre e em frente ao mar.





Teremos a Casa do Jazz (no palco de Costazul) com shows de novas bandas que estão se destacando no Estado do Rio de Janeiro, com apresentações nos intervalos dos shows principais. Teremos também a presença do CLUBE DO VINIL espaço onde os aficionados, sócios e colecionadores das fomosas "BOLACHAS" poderão trocar idéias, comprar, trocar seus discos tudo regado ao som de DJ''s.



Dia 03 (domingo) o Lá-Tá-Rolando, um projeto idealizado e realizado por alunos de Produção Cultural da UFF com apoio e parceria do Festival de Jazz de Rio das Ostras, terá sua 6º edição Jazz e Blues,cencerrando o Rio das Ostras Jazz & Blues Festival na Concha Acústica a partir das 18 horas, trazendo bandas da região e grande rio.





ECONOMIA - O Rio das Ostras Jazz & Blues é um importante ativo para a cidade. Nas últimas 4 edições (2013 a 2016), pesquisa da Fundação Getúlio Vargas- FGV/RJ, apontou que foram injetados em média 10 milhões de reais na economia do município a cada edição durante o período do festival.



O festival, realizado pela Azul Produções com o apoio da prefeitura da cidade de Rio das Ostras, através da Secretaria de Cultura, faz parte do calendário oficial de eventos do Estado do Rio de Janeiro, devido a sua importância.', '12º', 'http://www.riodasostrasjazzeblues.com/joomla/templates/rojb/img/logo.png');

-- ----------------------------
-- Table structure for lodgingPlaces
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."lodgingPlaces";
CREATE TABLE "appjazz"."lodgingPlaces" (
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "addressType" varchar(255) COLLATE "pg_catalog"."default",
  "number" varchar COLLATE "pg_catalog"."default",
  "phone1" varchar(255) COLLATE "pg_catalog"."default",
  "phone2" varchar(255) COLLATE "pg_catalog"."default",
  "placeType" varchar(255) COLLATE "pg_catalog"."default",
  "openingHours" varchar(255) COLLATE "pg_catalog"."default",
  "neighborhood" varchar(255) COLLATE "pg_catalog"."default",
  "picture" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "id" int8 NOT NULL DEFAULT nextval('"appjazz"."lodgingPlaces_id_seq"'::regclass)
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of lodgingPlaces
-- ----------------------------
INSERT INTO "appjazz"."lodgingPlaces" VALUES ('Atlântico Hotel', 'Atlântica', 'Avenida', '333', '	2764-1934', '2764-2891', 'Hotel', '24h', 'Costazul', 'https://s-ec.bstatic.com/images/hotel/max1024x768/176/176567334.jpg', NULL, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "appjazz"."users";
CREATE TABLE "appjazz"."users" (
  "id" int4 NOT NULL DEFAULT nextval('"appjazz".users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "cpf" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "birth" date,
  "sex" varchar(255) COLLATE "pg_catalog"."default",
  "pass" varchar(255) COLLATE "pg_catalog"."default",
  "registeredAt" timestamp(0) DEFAULT now()
)
WITH (OIDS=TRUE)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "appjazz"."users" VALUES (1, 'Isaque Neves', '22997015305', '13128250731', 'insinfo2008@gmail.com', '1987-09-14', 'masculino', 'Ins257257', '2019-04-15 16:28:48');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "appjazz"." foodPlaces_id_seq"
OWNED BY "appjazz"."foodPlaces"."id";
SELECT setval('"appjazz"." foodPlaces_id_seq"', 3, true);
ALTER SEQUENCE "appjazz"."lodgingPlaces_id_seq"
OWNED BY "appjazz"."lodgingPlaces"."id";
SELECT setval('"appjazz"."lodgingPlaces_id_seq"', 2, true);
ALTER SEQUENCE "appjazz"."schedule_id_seq"
OWNED BY "appjazz"."attractions"."id";
SELECT setval('"appjazz"."schedule_id_seq"', 3, true);
ALTER SEQUENCE "appjazz"."users_id_seq"
OWNED BY "appjazz"."users"."id";
SELECT setval('"appjazz"."users_id_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table attractions
-- ----------------------------
ALTER TABLE "appjazz"."attractions" ADD CONSTRAINT "schedule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table foodPlaces
-- ----------------------------
ALTER TABLE "appjazz"."foodPlaces" ADD CONSTRAINT " foodPlaces_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "appjazz"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
