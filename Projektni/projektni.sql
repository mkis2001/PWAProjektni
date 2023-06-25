-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 11:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projektni`
--
CREATE DATABASE IF NOT EXISTS `projektni` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projektni`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko` varchar(32) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko`, `lozinka`, `razina`) VALUES
(1, 'Ime', 'Prezime', 'imePrezime', '$2y$10$3ROWScgqRRh3NgNZ8DWZF.aSZtkUeEgEDtRvEfc6Xlf0g.5bAmjHS', 1),
(2, 'Ivko', 'HD', 'ivkoHD', '$2y$10$ZRJjw8hqmAPV8iFuhfJBa.wev.qF/AufatfbTXaoqZ7i7FmHQ40Cq', 0),
(4, 'novi', 'korisnik', 'noviKorisnik', '$2y$10$6Wh51SoXb4sEQTEHDPFaLeB1h/0DB/ao.WqAZX4TQe0tjT9izoQ6y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `prikazuj` tinyint(1) NOT NULL,
  `kategorija` varchar(32) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `slika` varchar(32) NOT NULL,
  `uvod` text NOT NULL,
  `tekst` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `prikazuj`, `kategorija`, `naslov`, `datum`, `slika`, `uvod`, `tekst`) VALUES
(1, 0, 'sport', 'Pojačanje na rujevici', '2023-06-22', 'rujevica.jpg', 'Vrijeme neizvjesnosti na Maksimiru: Bišćan bi s jednom neočekivanom prinovom bio najzadovoljniji', 'Nastavlja se prometno ljeto na Rujevici. Novo ime u kadru Sergeja Jakirovića od iduće će sezone biti Marco Pašalić. Riječ je o 22-godišnjem mladom hrvatskom reprezentativcu rođenom u njemačkom Karlsruheu koji se najbolje snalazi na poziciji krilnog napadača.\r\n\r\nOvu je sezonu proveo u dresu 2. momčadi Borussije Dortmund za koje je u 22 nastupa upisao 4 pogotka. Za Hrvatsku U-21 nastupio je četiri puta. Prije početka prijelaznog roka u Hrvatskoj (19. lipnja) spominjalo kako bi Pašalić mogao potpisati za Osijek.\r\n\r\nTamo je početkom mjeseca i viđen u društvu Alena Petrovića, bivšeg sportskog direktora Bijelo-plavih, koji danas vodi brigu o njegovoj karijeri. Međutim, nogometni put nastavit će na Kvarneru, a Rijeka ga je publici predstavila videom koji možete pogledati OVDJE.\r\n\r\nDetalji ugovora još nisu poznati, a Marco je za Rijeku postao četvrto pojačanje u ljetnom prijelaznom roku. Prije njega u klub su stigli branič Marijan Čabraja (26) iz Hiberniana, veznjak Dejan Petrovič (25) iz Rapid Beča te napadač Franjo Ivanović iz 2. momčadi Augsburga.'),
(2, 1, 'politika', 'Sanader pozvao na smjenu..', '2023-06-22', 'anteSanader.jpg', 'Ante Sanader otvara predmet protiv Splitskog gradonačelnika.', 'Ante Sanader rekao je da su se u tom slučaju pokazala dva aspekta, prvo hvatanje u laži Marijane Puljak koja otvoreno, ne trepnuvši okom laže hrvatsku javnost govoreći da su svi računi na večeri u Peškariji (restoran Noštromo) plaćeni, dok gradonačelnik kaže da nije ništa plaćeno.\r\n\r\nSanader također tvrdi da se politička tajnica Centra Dalija Orešković iz cijele situacije pokušava izvući i opravdati svoje lice što je u ovoj situaciji nemoguće.\r\n\r\n\"Pozivam je da ako stvarno ono što govori i misli da smjeni predsjednika Centra Ivicu Puljka koji već ima probleme i koji je napustio stranku Pametno. Jedino na taj način Dalija Orešković može oprati svoj obraz, a ne izjavom\", rekao je. Za Sanadera je najinteresantnije gdje je sada Maja Đerek \"koja je bila hrabra kada je trebalo izbaciti ljude i sirotinju na ulicu iz gradskih socijalnih stanova\".\r\n\r\nOčekuje da Maja Đerek komentira što je napravljeno protivno zakonu i što misli o sukobu interesa, odnosno neplaćanju računa u restoranu Noštromo. Poručio je da nakon ovoga Split ne zaslužuje Puljka i da je grad njegov veliki talac.'),
(14, 1, 'sport', 'Vatreni je izveo super potez!', '2023-06-23', 'kovacic.jpg', 'Bivši reprezentativci komentirali su Kovačićev odlazak u moćni Guardiolin stroj.', 'Svježe okrunjeni europski prvak u utrobu će ugraditi novi \"motor\" s hrvatskim štihom, a životopis Matea Kovačića postat će bogatiji za još jedno elitno nogometno utočište. Nakon odskočne daske u Dinamu, a zatim epizoda u Interu, Real Madridu i Chelseaju, veznjak \"vatrenih\" iduće će sezone odjenuti nebeskoplavo ruho Manchester Cityja. Iako će moćni stroj Pepa Guardiole u nove pobjede krenuti bez İlkayja Gündoğana, koji je odlučio ispuniti dječački san i zaigrati za Barcelonu, bezbolnu prilagodbu u sredini veznog reda katalonskom trenerskom mastermindu pružit će upravo Kovačić. Rekao nam je to i naš prvi sugovornik i bivši reprezentativac, Jerko Leko.\r\n\r\n- Pravi potez, apsolutno. Odgovarat će mu Cityjev stil igre, a i bilo mu je idealno vrijeme za odlazak iz Chelseaja, s obzirom na to što se tamo događa. Tko ga poznaje dobro, mogao je vidjeti kako je i rasterećeno igrao na turniru Lige nacija, da je zadovoljan razvojem situacije, a Guardiola je dobio klasu koja će mu definitivno pomoći - kaže Leko.\r\n\r\nIako će do 30. lipnja službeno biti član londonskih \"bluesa\", jasno je kako će Etihad biti njegov dom na iduće četiri godine, koliko bi mu trebao trajati ugovor. Odšteta od 30-ak milijuna eura (uz bonuse), koju će \"građani\" isplatiti Chelseaju, čini se kao \"sitnica\", s obzirom na nemoralne iznose kakvi su preplavili tržišta prethodnih godina, i to za neprovjerena nogometna imena. Da najbolje od Kovačića tek slijedi, kaže nam i njegov bivši kolega iz nacionalne vrste, Ognjen Vukojević.\r\n\r\n- Kova je to zaslužio. Igrao je već u velikim klubovima, ali ovo je kruna njegove karijere. \"Šlag na tortu\". Odlazi kod velikog Guardiole, a poznavajući Matea, mogao bi trajati još dugo. Ne bih se čudio da i nakon Cityja za nekoliko godina ode u novi veliki klub, ali nadam se da će tamo dugo ostati - kaže Vukojević.\r\n\r\nSukladno broju na dresu, Gündoğan je na travnjaku obavljao dužnost \"osmice\", dok je prvi izbor na \"šestici\" bio Rodri, čiji je partner u posljednje vrijeme najčešće bio John Stones, stoper prema vokaciji. Upravo bi Kovačić mogao \"plesati\" između te dvije pozicije, no, naše procjene, ali i razmišljanje engleskih medija, upućuju kako će Hrvat uskočiti upravo na mjesto Gündoğana. Slične vizije imaju i naši sugovornici.\r\n\r\n- Dosta momčadi se povuče protiv Cityja, zatvore se u blok, a onda nema puno prostora za proboje. Kovačić bi tu mogao donijeti novu razinu. Zna napraviti višak već u primanju, radi prirodnu razliku, a i igra s puno sitnih dodavanja, kakvu gaji Guardiola, također mu ide na ruku - rekao je Leko, koji je s Kovačićem svlačionicu dijelio u Dinamu prije više od deset godina.'),
(22, 0, 'politika', 'Njemačka demantirala', '2023-06-23', 'plenkovic.jpg', 'Je li u tom slučaju Ured kancelara Olafa Scholza direktno intervenirao kod premijera Plenkovića?', 'Je li hrvatska Vlada vršila pritisak na osiguravateljski koncern Allianz kako bi njemačka kompanija, odnosno njezin fond AZ, sudjelovao u preuzimanju Sberbankovog udjela u Fortenovi i tako prekršio sankcije EU-a? To je tvrdnja koju je u nedavnom članku iznio Financial Times (FT).\r\n\r\nU tom članku vodeći svjetski poslovni list navodi kako su predstavnici hrvatske Vlade, veleposlanik RH u Berlinu Gordan Bakota, a nakon toga i ministar vanjskih poslova Gordan Grlić Radman intervenirali kod čelnika Allianza kako bi Nijemci promijenili tu odluku i ipak sudjelovali u preuzimanju udjela sankcionirane ruske banke.\r\n\r\nNo njihove intervencije očito su bile neuspješne. Allianz je ostao pri ranijoj odluci. Neposredno nakon toga hrvatski regulator (Hanfa) pokreće reviziju poslovanja AZ fonda. U Allianzu su, kako je napisao FT, taj potez shvatili kao prijetnju te o svemu obavijestili saveznu vladu u Berlinu.\r\n\r\nZa to vrijeme su predstavnici hrvatske Vlade, konfrontirani s pisanjem uglednog lista, davali kontradiktorne navode. U roku od samo nekoliko dana članovi hrvatske Vlade su, naime, u javnosti davali izjave koje su se kretale od toga da ništa ne znaju o intervencijama svojih kolega iz kabineta (Oleg Butković), da se radi o smiješnim tezama FT-a (Andrej Plenković), da bi na koncu premijer rekao da su se intervencije doista dogodile i da je to zapravo - najnormalnija stvar.\r\n\r\nNa tvrdnje FT-a o neprimjerenom pritisku, Plenković je rekao da je to \"na rubu fantastike\". A na pisanje o navodnoj instrumentalizaciji Hanfe dodao je kako je hrvatski regulator neovisno tijelo koje svoje odluke donosi i provodi samostalno. Predstavnici oporbe u Saboru pisanje FT-a iskoristili su za napad na Vladu RH i premijera. Najdalje je otišao Nino Raspudić iz Mosta. U izjavi koju je dao 14. lipnja 2023. Raspudić je rekao:\r\n\r\n\"Radi se o vrlo teškim i opasnim stvarima. I prvi put vidimo da je ugled Andreja Plenkovića na Zapadu u najmanju ruku poljuljan. Financial Times je vrlo ozbiljna novina, dakle gotovo sa sigurnošću možemo reći da su oni to provjerili iz više izvora prije nego što su s time izašli. Skandalozno je da se hrvatska vlast na takav način miješa u tržište i tržišne odnose i da se državne institucije poput Hanfe koriste za kažnjavanje poslovnih subjekata koji ne igraju onako kako ih politika pritišće i misli da trebaju igrati\".\r\n\r\nU nastavku je zastupnik Mosta ustvrdio: \"Mi smo dobili neslužbenu informaciju da je Hrvatska dobila snažnu prosvjednu notu od strane Njemačke po tom pitanju. I mislim da je ovo samo početak i da je Plenkovićeva pozicija na Zapadu ozbiljno narušena\".'),
(23, 1, 'sport', 'Francuz prvi pick drafta', '2023-06-23', 'draft.jpg', 'Wembanyama je u 44 utakmice prošle sezone koje je odigrao imao prosjek od 20,6', 'San Antonio Spursi očekivano su na ovogodišnjem NBA draftu održanom u New Yorku kao prvi izbor odabrali 19-godišnje francusko košarko čudo, 223 cm visokog Victora Wembanyamu, koji u najbolju ligu svijeta dolazi nakon što je iznenađujuće odveo momčad Boulogne-Levallois Metropolitans 92 do finala francuskog prvenstva.\r\n\r\nWembanyama je košarkaš iznimne visine, ali i odlične košarkaške tehnike, zbog koje jednako uspješno može igrati na vanjskim pozicijama i u reketu. Gotovo svi stručnjaci su jednoglasni u procjeni da će ovaj 19-godišnji Francuz biti prevaga u NBA ligi već u prvoj godini, a njegov dolazak među najbolje košarkaše svijeta je najiščekivaniji još otkako je 2003. prvi izbor na draftu bio LeBron James.\r\n\r\n\"Ovo je ostvarenje nečega o čemu sam sanjao cijeli život. Kad sam čuo onu rečenicu od Adama Silvera (NBA povjerenika), o kojoj sam toliko sanjao, nisam mogao da ne zaplačem\", rekao je Wembanyama u izravnom prijenosu ovogodišnjeg NBA drafta.\r\n\r\nWembanyama je u 44 utakmice prošle sezone koje je odigrao u dresu Metropolitansa 92 imao prosjek od 20,6 koševa, 10,1 skokova, 3,0 blokade i 2,5 asistencija.\r\n\r\nNjegov dolazak u San Antonio posebno se iščekuje među navijačima Spursa, budući da se kroz povijest pokazalo da je ova momčad nakon što je imala prvi izbor na draftu znala odabrati igrače s kojima je osvajala naslov NBA prvaka. To je bio slučaj s Davidom Robinsonom koji je bio prvi izbor 1987., kao i s Timom Duncanom koji je izabran kao \"broj 1\" 1997. Svih pet naslova u tom razdoblju Spursi su osvojili pod vodstvom legendarnog trenera Gregga Popovicha.\r\n\r\nCharlotte Hornetsi su kao drugi izbor odabrali šutera Brandona Millera sa sveučilišta Alabama. Portland Trail Blazersi su kao trećeg izabrali razigravača Scoota Hendersona iz razvojne NBA G lige. Među prvom petoricom su i dvojica igrača iz privatne profesionalne lige Overtime Elite, u kojoj se natječu igrači u dobi od 16 do 20 godina, a radi se u blizancima Amenu i Ausaru Thompsonu. Razigravač Amen je kao četvrti izbor postao novim članom Houston Rocketsa, dok su šutera Ausara petim izborom učinili Detroit Pistonsi.\r\n\r\nNa ovom draftu je ukupno odabrano 58 košarkaša, jer je Chicago Bullsima i Philadelphia 76ersima oduzeto pravo izbora u drugom krugu, zbog nedopuštenih kontakata s igračima.\r\n\r\nMeđu 58 odabranih sedmorica su Europljana, a prednjači Francuska s čak četvoricom igrača. Osim Wembanyame, u prvom krugu je izabran njegov suigrač iz Metropolitansa 92, 18-godišnje krilo Bilal Coulibaly, kojeg su kao sedmog birali Indiana Pacersi, ali su ga odmah mijenjali s Washingtonom za njihov osmi izbor američkog krilnog igrača Jaracea Walkera sa sveučilišta Houston. Od francuskih igrača u drugom krugu su odabrani šuteri Rayan Rupert, kao 43. izbor Portlanda, i Sidy Cissoko iz razvojne NBA G lige, kao 44. izbor San Antonija.\r\n\r\nPrije njih na 42. mjestu drafta je 20-godišnji centar Partizana Tristan Vukčević, na koga prava polaže Washington. Belgijski 23-godišnji krilni igrač Toumani Camara je 52. izbor Phoenixa, a kao 56. je Memphis odabrao Tarika Biberovića, 22-godišnje bosansko-hercegovačko krilo turskog Fenerbahčea.'),
(27, 1, 'politika', 'Sastali se Biden i Modri', '2023-06-23', 'sastanak.jpg', 'PAKISTAN je danas kritizirao Sjedinjene Američke Države i Indiju.', 'Odnosi između Indije i Pakistana su godinama napeti. Otkako su stekli neovisnost od Velike Britanije 1947., Indija i Pakistan su ratovali tri puta, a dva su rata vođena zbog himalajske pokrajine Kašmir, koja je većinski muslimanska, a koju obje zemlje svojataju u cijelosti, no njome upravljaju tek dijelom.\r\n\r\n\"Oni (Biden i Modi) su snažno osudili prekogranični terorizam, korištenje terorističkih posrednika i pozvali Pakistan da odmah djeluje kako bi osigurao da nijedan teritorij pod njegovom kontrolom neće biti korišten za započinjanje terorističkih napada\", stoji u zajedničkoj američko-indijskoj izjavi.\r\n\r\nPakistansko ministarstvo vanjskih poslova je reklo da Indija koristi tvrdnje o ekstremizmu protiv Islamabada kako bi skrenula pažnju sa situacije u Kašmiru i odnosa prema manjinama u Indiji.\r\n\r\nNew Delhi godinama optužuje Pakistan za napade militanata u Indiji, uključujući i onaj u Mumbaiju 2008., u kojem je smrtno stradalo više od 165 ljudi.\r\n\r\nIndija također tvrdi da je Pakistan pomogao islamističkim militantima koji se bore protiv indijskih snaga sigurnosti u njenom dijelu Kašmira od kraja 1980-ih. Pakistan poriče optužbe i kaže da samo pruža diplomatsku i moralnu podršku za Kašmirce koji traže samoodređenje.\r\n\r\nPoseban status koji je imala indijska država Jammu i Kašmir ukinut je 2019. kada ih je New Delhi podijelio u dva teritorija pod saveznom upravom. Pakistan je taj potez nazvao nezakonitim i traži da se ukine.\r\n\r\nBiden i Modi su jučer pohvalili dogovore koje su njihove zemlje postigle u područjima obrane i trgovine, radi suprotstavljanja globalnom utjecaju Kine.\r\n\r\nPakistan je također rekao da je \"duboko zabrinut\" zbog planiranog transfera naprednih vojnih tehnologija u Indiju, kazavši da takvi koraci neće pomoći postizanju mira u Južnoj Aziji.'),
(28, 1, 'sport', 'Kakav završetak Donne Vekić!', '2023-06-24', 'vekic.jpg', 'Donna je ostvarila prvu pobjedu ove subote, a u današnjem okršaju za finale čeka ju teža protivnica', 'Hrvatska tenisačica Donna Vekić plasirala se u polufinale WTA turnira u Berlinu nakon što je u četvrtfinalnom ogledu pobijedila Ruskinju Elinu Avanesjan sa 6-2, 7-6 (0).\r\n\r\nOgled između Vekić i Avanesjan, 81. tenisačice na svijetu, trebao se igrati u petak kao i ostali četvrtfinalni ogledi. Međutim, kiša je pokvarila planove organizatora i svi mečevi su prebačeni na subotu.\r\n\r\nVekić je do pobjede protiv 20-godišnje Ruskinje stigla nakon sat i 34 minute igre.\r\n\r\nPrvi break 26-godišnja hrvatska tenisačica je napravila u trećoj igri prvog seta, a potom i u petom gemu, osvojivši prvi set sa 6-2.\r\n\r\nU drugom setu Vekić je sjajno startala s dva oduzeta servisa i vodstvom 3-0. Međutim, Ruskinja je vratila oba servisa izjednačivši na 4-4. Uslijedio je novi Donnin break za 5-4 i prilika da na svoj servis izbori polufinale. Međutim, Avanesjan se još jednom vratila izjednačivši na 5-5 nakon čega je set otišao u trinaestu igru.\r\n\r\nU tiebreaku je Vekić odigrala sjajno i bez izgubljenog poena slavila je sa 7-0.\r\n\r\nU današnjem polufinalu Vekić ček Grkinja Maria Sakkari koja je sa 7-6 (7), 6-1 pobijedila Čehinju Marketu Vondrousovu.\r\n\r\nVekić i Sakkari su igrale već osam puta, a hrvatska tenisačica vodi sa 5-3 u pobjedama.\r\n\r\nPlasman u polufinale je izborila i Ruskinja Ekaterina Aleksandrova kojoj je sunarodnjakinja Veronika Kudermetova predala meč.\r\n\r\nU posljednjem susretu četvrtfinala sastaju se Francuskinja Carolina Garcia i Čehinja Petra Kvitova.'),
(31, 1, 'politika', 'Grci biraju saziv parlamenta', '2023-06-25', 'grci.jpg', 'Oko 9,8 milijuna grčkih glasača izlazi danas na birališta kako bi izabrali novi saziv parlamenta.', 'Ankete pokazuju jasnu prednost konzervativne stranke Nove demokracije (ND), koju vodi premijer Kyriakos Mitsotakis, a neki kažu da bi stranka mogla osvojiti više od 40 posto glasova.\r\n\r\nDruga najjača stranka mogla bi biti ljevičarski Savez radikalne ljevice (Syriza), predvođen Alexisom Tsiprasom, za koju ankete pokazuju da bi mogla dobiti oko 20 posto.\r\n\r\nBiračka mjesta otvaraju se u 7 ujutro po lokalnom vremenu i zatvaraju u 19 sati. Prve prognoze očekuju se ubrzo nakon toga, na temelju izlaznih anketa, a jasnija slika na temelju prebrojanih glasačkih listića trebala bi biti dostupna do 20 sati.\r\n\r\nFormiranje vlade pod Mitsotakisom smatra se gotovo izvjesnim prema grčkom izbornom sustavu, u kojem najjača stranka dobiva bonus od najmanje 20 mjesta u parlamentu od 300 mjesta.\r\n\r\nGrčka ima oko 11 milijuna stanovnika, ali broj birača s pravom glasa uključuje i njezine brojne državljane koji žive u inozemstvu.'),
(32, 1, 'politika', 'Isplivale \'mutne\' stvari', '2023-06-25', 'tomasevic.jpg', 'USKOK istražuje projekt zagrebačkog \'malog Manhattana\': Tomašević želi ostvariti san Milana Bandića', 'Uskok istražuje projekt zagrebačkog malog Manhattana, a sumnjivo je i vlasništvo nad zemljištem. Puno je neodgovorenih pitanja, no jedno je sigurno - Grad će od komunalne naknade zaraditi 8,5 milijuna eura piše u nedjelju Jutarnji list.\r\n\r\nS obrazloženjem da bi za Grad Zagreb nastao trošak između 30 i 50 milijuna eura i tvrdnjom kako nema izbora, gradonačelnik Tomislav Tomašević udahnuo je novi život megalomanskom građevinskom projektu naslijeđenom od Milana Bandića.\r\n\r\nUz glasove većine u Skupštini Grada Zagreba projekt takozvanog Malog Manhattana (odnosno Jarun Panorama) za koji se teren počeo pripremati još 2008. godine došao je u finiš i realizirat će se unatoč ozbiljnim kritikama da ga ne prati potrebna infrastruktura i da bi mogao trajno uništiti jedan dio grada, te da počiva na sumnjivom načinu stjecanja vlasništva nad zemljištem.\r\n\r\nGradonačelnik je ranije izjavio da se osobno ne slaže s projektom Jarun Panorama koji će se protezati na 35.000 kvadrata uz rotor kojim se ulazi u grad. Iz grada su govorili kako nisu presretni s tim projektom jer misle da će prostor biti preizgrađen previsokim zgradama i da su zbog ovakvih stvari ušli u izmjene Generalnog urbanističkog plana, kako bi ovakve projekte ubuduće spriječili.\r\n\r\nSada tvrde da mora u realizaciju jer je naslijeđen od bivše vlasti. Norveški investitor koji se u Hrvatskoj već proslavio propalim projektima namjerava graditi najveći neboder u Hrvatskoj, a u sklopu kompleksa s ukupno četiri nebodera izgradit će 340 stanova prosječne veličine od 100 kvadrata, potom hotel s 240 soba i poslovni kompleks.'),
(33, 1, 'sport', 'Fantastična utrka u New Yorku', '2023-06-25', 'utrka.jpg', 'Britanac na 100 metara srušio 30 godina stari rekord', 'Britanski atletičar Zharnel Hughes je u subotu, na mitingu u New Yorku, pretrčao 100 metara za 9.83 sekunde, što je najbolje vrijeme sezone, a ujedno i novi rekord Velike Britanije.\r\n\r\nUz povoljan vjetar (1.3 m/sec), Hughes je popravio svoj osobni rekord (9.91 iz 2018.) i postavio novi britanski rekord, 30 godina nakon 9.87 koje je istrčao Linford Christie na Svjetskom prvenstvu 1993. u Stuttgartu.\r\n\r\nTo je također drugo najbolje vrijeme u povijesti na 100 m koje je istrčao Europljanin, nakon Talijana Marcella Jacobsa (9.80 s OI u Tokiju 2021).\r\n\r\nDvostruki europski prvak na 100 m i na 4x100 m u Berlinu 2018. iza sebe je ostavio Jamajčanina Ackeema Blakea (9.93) i Amerikanca Christiana Colemana (10.02).\r\n\r\nSvjetsko prvenstvo u atletici održava se u Budimpešti od 19. do 27. kolovoza.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
