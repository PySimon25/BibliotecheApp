-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 172.18.0.3:3306
-- Creato il: Giu 30, 2025 alle 09:55
-- Versione del server: 11.8.2-MariaDB-ubu2404
-- Versione PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u218449937_db_3`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Bibliotecari`
--

CREATE TABLE `Bibliotecari` (
  `id_bibliotecario` int(11) UNSIGNED NOT NULL,
  `id_biblioteca` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cognome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Bibliotecari`
--

INSERT INTO `Bibliotecari` (`id_bibliotecario`, `id_biblioteca`, `nome`, `cognome`, `email`, `password`) VALUES
(1, 1, 'Rossana', 'Bosurgi', 'gabriele84@marcacci.it', NULL),
(2, 2, 'Eva', 'Disdero', 'faustomoresi@basadonna.it', NULL),
(3, 3, 'Giustino', 'Fracci', 'fbaglioni@verga.net', NULL),
(4, 4, 'Olga', 'Pisani', 'rodolfo10@rosselli.it', NULL),
(5, 5, 'Ronaldo', 'Fischetti', 'clelia25@meucci.eu', NULL),
(6, 6, 'Uberto', 'Zampa', 'meuccigioacchino@castellitto-interminei.net', NULL),
(7, 7, 'Elmo', 'Cagnin', 'maccanellioreste@prodi.it', NULL),
(8, 8, 'Licia', 'Mazzeo', 'marianacuomo@tosto-schiavone.org', NULL),
(9, 9, 'Stefano', 'Ariasso', 'persicotoni@giusti-gabrieli.com', NULL),
(10, 10, 'Armando', 'Lombardi', 'ssegre@alfonsi.org', NULL),
(11, 1, 'Laura', 'Rossi', 'laura.rossi@biblioteca.it', NULL),
(12, 2, 'Marco', 'Bianchi', 'marco.bianchi@biblioteca.it', NULL),
(13, 6, 'Chiara', 'Verdi', 'chiara.verdi@biblioteca.it', NULL),
(14, 3, 'Giovanni', 'Neri', 'giovanni.neri@biblioteca.it', NULL),
(15, 2, 'Elisa', 'Conti', 'elisa.conti@biblioteca.it', NULL),
(16, 7, 'Luca', 'Gallo', 'luca.gallo@biblioteca.it', NULL),
(17, 4, 'Marta', 'Colombo', 'marta.colombo@biblioteca.it', NULL),
(18, 8, 'Davide', 'Romano', 'davide.romano@biblioteca.it', NULL),
(19, 9, 'Silvia', 'De Luca', 'silvia.deluca@biblioteca.it', NULL),
(20, 1, 'Federico', 'Serra', 'federico.serra@biblioteca.it', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Biblioteche`
--

CREATE TABLE `Biblioteche` (
  `id_biblioteca` int(11) UNSIGNED NOT NULL,
  `nome_biblioteca` varchar(255) DEFAULT NULL,
  `città` varchar(50) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Biblioteche`
--

INSERT INTO `Biblioteche` (`id_biblioteca`, `nome_biblioteca`, `città`, `indirizzo`) VALUES
(1, 'Biblioteca Centrale', 'Milano', 'Via Roma 10'),
(2, 'Biblioteca dei Ragazzi', 'Torino', 'Piazza Libertà 2'),
(3, 'Biblioteca Storica', 'Roma', 'Corso Italia 45'),
(4, 'Biblioteca Scientifica', 'Bologna', 'Via Garibaldi 8'),
(5, 'Biblioteca Letteraria', 'Firenze', 'Viale Europa 12'),
(6, 'Biblioteca Moderna', 'Napoli', 'Via Dante 14'),
(7, 'Biblioteca Comunale', 'Genova', 'Via Verdi 22'),
(8, 'Biblioteca Linguistica', 'Verona', 'Via Manzoni 5'),
(9, 'Biblioteca d\'Arte', 'Palermo', 'Via Vittorio Emanuele 19'),
(10, 'Biblioteca Universitaria', 'Trieste', 'Via Carducci 3');

-- --------------------------------------------------------

--
-- Struttura della tabella `Categorie`
--

CREATE TABLE `Categorie` (
  `id_categoria` int(11) UNSIGNED NOT NULL,
  `nome_categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Categorie`
--

INSERT INTO `Categorie` (`id_categoria`, `nome_categoria`) VALUES
(1, 'Romanzo'),
(2, 'Giallo'),
(3, 'Fantascienza'),
(4, 'Biografia'),
(5, 'Storia'),
(6, 'Fantasy');

-- --------------------------------------------------------

--
-- Struttura della tabella `Generi`
--

CREATE TABLE `Generi` (
  `id_genere` int(11) UNSIGNED NOT NULL,
  `nome_genere` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Generi`
--

INSERT INTO `Generi` (`id_genere`, `nome_genere`) VALUES
(1, 'Narrativa'),
(2, 'Giallo'),
(3, 'Fantasy'),
(4, 'Fantascienza'),
(5, 'Biografia'),
(6, 'Storia'),
(7, 'Romanzo'),
(8, 'Saggio'),
(9, 'Thriller'),
(10, 'Poesia');

-- --------------------------------------------------------

--
-- Struttura della tabella `Libri`
--

CREATE TABLE `Libri` (
  `id_libro` int(11) UNSIGNED NOT NULL,
  `id_biblioteca` int(11) UNSIGNED NOT NULL,
  `titolo` varchar(255) DEFAULT NULL,
  `autore` varchar(100) DEFAULT NULL,
  `anno_pubblicazione` year(4) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `id_categoria` int(11) UNSIGNED NOT NULL,
  `id_genere` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Libri`
--

INSERT INTO `Libri` (`id_libro`, `id_biblioteca`, `titolo`, `autore`, `anno_pubblicazione`, `isbn`, `id_categoria`, `id_genere`) VALUES
(1, 8, 'Sequi sequi', 'Liliana Mercalli', '1964', '978-0-913431-', 2, 7),
(2, 8, 'Ipsam possimus', 'Antonino Mocenigo', '1985', '978-1-55623-8', 4, 2),
(3, 6, 'Cumque aspernatur', 'Rosina Giusti', '1978', '978-0-374-740', 4, 2),
(4, 3, 'Culpa ipsam exercitationem', 'Giulietta Rapisardi', '1963', '978-1-4367-13', 4, 3),
(5, 6, 'Nemo voluptatibus eos', 'Livia Leoncavallo-Alfonsi', '2019', '978-1-4395-33', 2, 7),
(6, 8, 'Occaecati temporibus', 'Angelina Mascheroni-Rossetti', '2004', '978-1-214-562', 4, 7),
(7, 9, 'Soluta facilis magnam', 'Ezio Guarneri-Sommaruga', '1953', '978-1-171-236', 1, 7),
(8, 9, 'Ratione accusamus', 'Cassandra Santorio', '1977', '978-1-965137-', 2, 2),
(9, 6, 'Eveniet nostrum officia', 'Marisa Marangoni-Pizzetti', '2014', '978-0-00-4711', 4, 6),
(10, 10, 'Harum fuga', 'Sig.ra Renata Costalonga', '1953', '978-0-7964-05', 1, 6),
(11, 4, 'Veritatis sequi aut', 'Liana Verdi-Offredi', '1975', '978-1-4317-13', 4, 3),
(12, 10, 'Iusto', 'Dino Zeffirelli', '2019', '978-0-8393-35', 3, 5),
(13, 6, 'Harum', 'Domenico Vecoli', '1978', '978-0-10-2053', 4, 5),
(14, 8, 'Doloribus', 'Arnaldo Celentano-Pulci', '1985', '978-0-7758-91', 3, 7),
(15, 8, 'Veniam aliquam', 'Natalia Manzoni-Satta', '1970', '978-0-7661-77', 4, 3),
(16, 3, 'Non aperiam eius', 'Ramona Vespucci-Modiano', '2004', '978-1-78961-1', 6, 4),
(17, 9, 'Iste dolorem excepturi', 'Lolita Praga', '1985', '978-1-65452-7', 6, 2),
(18, 5, 'At atque', 'Sig.ra Cecilia Viviani', '1977', '978-1-165-604', 5, 4),
(19, 6, 'Aut magni culpa', 'Fabrizia Cannizzaro', '1963', '978-1-149-368', 6, 7),
(20, 4, 'Ad ut repudiandae', 'Alphons Esposito-Leblanc', '1998', '978-1-5022-96', 6, 7),
(21, 8, 'Consectetur', 'Dott. Lidia Puccini', '1995', '978-1-254-599', 4, 4),
(22, 5, 'Culpa nulla', 'Aria Lanfranchi-Ruberto', '1983', '978-1-9764-38', 2, 7),
(23, 10, 'Beatae perspiciatis nihil', 'Stella Mascagni', '2008', '978-0-690-034', 2, 6),
(24, 8, 'Enim blanditiis', 'Luisa Duodo', '1965', '978-1-83885-1', 3, 5),
(25, 9, 'Accusantium ullam similique', 'Luigina Pirandello', '1960', '978-1-160-529', 2, 6),
(26, 3, 'Ipsa autem', 'Renata Piccio', '1987', '978-1-4535-21', 1, 3),
(27, 10, 'Magni temporibus expedita', 'Dott. Fiamma Camilleri', '1996', '978-1-329-212', 5, 6),
(28, 3, 'Quis ipsum unde', 'Simonetta Miniati', '1974', '978-0-7177-44', 6, 3),
(29, 10, 'Magni est iste', 'Nanni Ludovisi', '1958', '978-0-9986798', 5, 7),
(30, 9, 'Tenetur nemo deleniti', 'Martina Tasso', '1979', '978-0-7151-82', 1, 4),
(31, 10, 'Voluptatibus minima non', 'Sig. Ignazio Pedersoli', '1960', '978-1-905151-', 6, 2),
(32, 8, 'Dolorum sed', 'Cristina Montecchi', '1962', '978-0-546-291', 3, 5),
(33, 3, 'Officia eveniet consectetur', 'Dott. Sole Randazzo', '1985', '978-0-542-357', 1, 5),
(34, 6, 'Culpa eos', 'Tonino Vecellio', '1996', '978-1-929622-', 1, 2),
(35, 2, 'Quam aliquam', 'Dott. Renzo Lucarelli', '1997', '978-0-8347-35', 5, 4),
(36, 10, 'Quo quod magnam', 'Dina Filippelli', '1976', '978-1-07-5818', 4, 3),
(37, 9, 'Quis earum', 'Concetta Romano', '1984', '978-0-7506-06', 5, 3),
(38, 10, 'Harum aspernatur', 'Alphons Metella', '1959', '978-1-220-472', 5, 6),
(39, 6, 'A aspernatur ducimus rerum', 'Vittoria Tron', '1971', '978-0-434-103', 2, 6),
(40, 7, 'Aperiam saepe libero', 'Alessia Totino', '1981', '978-0-460-953', 1, 2),
(41, 3, 'Optio assumenda', 'Dott. Vincentio Vercelloni', '2009', '978-1-70654-0', 5, 5),
(42, 9, 'Dolores omnis aut', 'Iolanda Chiesa', '1984', '978-1-85277-2', 1, 3),
(43, 2, 'Alias dicta ratione', 'Luchino Mastroianni', '2021', '978-1-4034-50', 2, 2),
(44, 1, 'Reiciendis ipsa', 'Margherita Peano', '1991', '978-0-7758-41', 1, 7),
(45, 1, 'Nobis reprehenderit molestias', 'Dott. Bernardo Mondadori', '1979', '978-1-79627-5', 5, 7),
(46, 4, 'Nostrum ipsa odit', 'Benvenuto Pisani', '1990', '978-0-02-9702', 1, 5),
(47, 10, 'Facere veniam adipisci', 'Roberto Pagliaro', '1984', '978-1-192-856', 6, 7),
(48, 1, 'Vero ad', 'Telemaco Trapani', '1977', '978-0-447-394', 2, 6),
(49, 10, 'Consequatur asperiores', 'Renzo Brugnaro', '1990', '978-1-188-442', 4, 2),
(50, 5, 'Dolore voluptates recusandae', 'Silvio Aulenti', '2013', '978-1-78291-1', 1, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Prestiti`
--

CREATE TABLE `Prestiti` (
  `id_prestito` int(11) UNSIGNED NOT NULL,
  `id_biblioteca` int(11) UNSIGNED NOT NULL,
  `id_utente` int(11) UNSIGNED NOT NULL,
  `id_libro` int(11) UNSIGNED NOT NULL,
  `data_prestito` date DEFAULT NULL,
  `data_restituzione_prevista` date DEFAULT NULL,
  `data_restituzione_effettiva` date DEFAULT NULL,
  `id_bibliotecario` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Prestiti`
--

INSERT INTO `Prestiti` (`id_prestito`, `id_biblioteca`, `id_utente`, `id_libro`, `data_prestito`, `data_restituzione_prevista`, `data_restituzione_effettiva`, `id_bibliotecario`) VALUES
(1, 10, 42, 30, '2025-02-20', '2025-03-22', '2025-03-15', 20),
(2, 5, 9, 16, '2025-02-21', '2025-03-23', NULL, 5),
(3, 10, 48, 38, '2024-11-19', '2024-12-19', NULL, 20),
(4, 10, 38, 26, '2024-12-08', '2025-01-07', NULL, 10),
(5, 1, 15, 9, '2024-10-24', '2024-11-23', NULL, 1),
(6, 2, 6, 49, '2025-03-12', '2025-04-11', '2025-04-23', 2),
(7, 2, 8, 10, '2024-10-24', '2024-11-23', '2024-12-03', 2),
(8, 5, 44, 28, '2025-04-02', '2025-05-02', '2025-04-29', 15),
(9, 7, 25, 39, '2024-12-27', '2025-01-26', NULL, 17),
(10, 3, 34, 17, '2024-06-15', '2024-07-15', '2024-07-21', 13),
(11, 7, 47, 8, '2024-07-05', '2024-08-04', NULL, 17),
(12, 2, 50, 42, '2024-09-18', '2024-10-18', NULL, 12),
(13, 8, 8, 19, '2025-01-22', '2025-02-21', NULL, 8),
(14, 6, 11, 30, '2024-06-15', '2024-07-15', '2024-07-30', 6),
(15, 3, 47, 47, '2024-11-08', '2024-12-08', NULL, 13),
(16, 6, 33, 49, '2024-11-14', '2024-12-14', '2024-12-15', 6),
(17, 8, 7, 41, '2025-02-06', '2025-03-08', NULL, 8),
(18, 5, 41, 33, '2024-12-04', '2025-01-03', '2024-12-23', 15),
(19, 4, 24, 49, '2024-09-28', '2024-10-28', '2024-10-30', 4),
(20, 9, 50, 34, '2024-07-06', '2024-08-05', '2024-08-09', 9),
(21, 6, 21, 32, '2025-04-23', '2025-05-23', '2025-05-11', 16),
(22, 4, 24, 20, '2025-04-04', '2025-05-04', '2025-04-20', 14),
(23, 2, 16, 37, '2025-03-17', '2025-04-16', '2025-04-03', 2),
(24, 1, 47, 32, '2024-12-18', '2025-01-17', '2025-01-26', 1),
(25, 6, 35, 50, '2025-01-21', '2025-02-20', '2025-02-09', 16),
(26, 4, 43, 31, '2025-01-01', '2025-01-31', '2025-01-24', 4),
(27, 9, 34, 39, '2024-07-27', '2024-08-26', NULL, 9),
(28, 2, 14, 35, '2025-03-12', '2025-04-11', '2025-04-18', 2),
(29, 3, 20, 26, '2024-07-07', '2024-08-06', NULL, 3),
(30, 8, 29, 34, '2024-11-02', '2024-12-02', NULL, 18),
(31, 7, 8, 16, '2024-11-29', '2024-12-29', '2024-12-16', 7),
(32, 8, 22, 2, '2025-05-06', '2025-06-05', '2025-06-08', 18),
(33, 9, 15, 1, '2025-04-20', '2025-05-20', '2025-05-27', 9),
(34, 4, 41, 4, '2024-06-08', '2024-07-08', '2024-06-25', 4),
(35, 4, 3, 22, '2025-04-05', '2025-05-05', '2025-05-06', 14),
(36, 3, 16, 18, '2024-07-05', '2024-08-04', NULL, 3),
(37, 7, 14, 35, '2024-12-05', '2025-01-04', '2025-01-12', 7),
(38, 5, 37, 37, '2024-07-16', '2024-08-15', NULL, 15),
(39, 10, 16, 31, '2024-09-13', '2024-10-13', NULL, 10),
(40, 5, 13, 7, '2024-07-20', '2024-08-19', '2024-08-25', 5),
(41, 7, 28, 23, '2024-07-19', '2024-08-18', NULL, 17),
(42, 9, 27, 30, '2024-09-20', '2024-10-20', '2025-01-01', 19),
(43, 1, 42, 42, '2025-05-16', '2025-06-15', '2025-06-01', 11),
(44, 1, 26, 47, '2025-02-17', '2025-03-19', NULL, 11),
(45, 9, 7, 16, '2024-08-13', '2024-09-12', '2024-09-03', 19),
(46, 1, 35, 29, '2024-09-29', '2024-10-29', '2024-10-27', 1),
(47, 9, 12, 18, '2025-05-18', '2025-06-17', NULL, 19),
(48, 1, 16, 5, '2024-12-05', '2025-01-04', NULL, 11),
(49, 4, 36, 7, '2025-04-30', '2025-05-30', '2025-06-04', 4),
(50, 5, 35, 1, '2024-09-05', '2024-10-05', '2024-10-19', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sanzioni`
--

CREATE TABLE `Sanzioni` (
  `id_sanzione` int(11) UNSIGNED NOT NULL,
  `id_prestito` int(11) UNSIGNED NOT NULL,
  `giorni_ritardo` smallint(6) UNSIGNED DEFAULT NULL,
  `importo` decimal(5,2) UNSIGNED DEFAULT NULL,
  `pagata` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Sanzioni`
--

INSERT INTO `Sanzioni` (`id_sanzione`, `id_prestito`, `giorni_ritardo`, `importo`, `pagata`) VALUES
(1, 6, 12, 6.00, 0),
(2, 7, 10, 5.00, 1),
(3, 10, 6, 3.00, 1),
(4, 14, 15, 7.50, 1),
(5, 16, 1, 0.50, 0),
(6, 19, 2, 1.00, 0),
(7, 20, 4, 2.00, 1),
(8, 24, 9, 4.50, 0),
(9, 28, 7, 3.50, 1),
(10, 32, 3, 1.50, 0),
(11, 33, 7, 3.50, 0),
(12, 35, 1, 0.50, 0),
(13, 37, 8, 4.00, 1),
(14, 40, 6, 3.00, 1),
(15, 42, 6, 3.00, 0),
(16, 49, 5, 2.50, 0),
(17, 50, 14, 7.00, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Utenti`
--

CREATE TABLE `Utenti` (
  `id_utente` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cognome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `Utenti`
--

INSERT INTO `Utenti` (`id_utente`, `nome`, `cognome`, `email`, `password`, `telefono`) VALUES
(1, 'Eugenia', 'Caracciolo', 'gioele32@camicione.com', NULL, '+39 133 89 08 3'),
(2, 'Ricciotti', 'Lettiere', 'ilariaraimondi@lettiere-cremonesi.eu', NULL, '+39 161 55 94 0'),
(3, 'Nicolò', 'Bosurgi', 'aurora31@libero.it', NULL, '+39 3413 164752'),
(4, 'Michelangelo', 'Foscari', 'doninivittorio@tiscali.it', NULL, '+39 76 4835030'),
(5, 'Olga', 'Mennea', 'baccio39@poste.it', NULL, '+39 76 7242388'),
(6, 'Giuseppe', 'Renzi', 'giancarlo28@live.com', NULL, '+39 012 26 91 6'),
(7, 'Vincenzo', 'Gregorio', 'valierluisa@morpurgo-caracciolo.it', NULL, '+39 70 4828148'),
(8, 'Concetta', 'Filangieri', 'mariana28@abate.com', NULL, '+39 43 03911718'),
(9, 'Marisa', 'Cavanna', 'kvianello@tron-ramazzotti.it', NULL, '+39 3465 787133'),
(10, 'Alessandro', 'Visintini', 'adrianobondumier@biagiotti.eu', NULL, '+39 834 73 82 9'),
(11, 'Mercedes', 'Serraglio', 'cesarecagnin@gmail.com', NULL, '+39 66 70106513'),
(12, 'Fredo', 'Favata', 'piersantifalcone@fastwebnet.it', NULL, '+39 317 8108013'),
(13, 'Fabio', 'Pisano', 'zfuseli@libero.it', NULL, '+39 60 6474687'),
(14, 'Ermanno', 'Faugno', 'arturoveneziano@libero.it', NULL, '+39 5009 788208'),
(15, 'Serafina', 'Fantoni', 'gibiliscopatrizio@gozzi.it', NULL, '+39 699 85 43 5'),
(16, 'Donatello', 'Mantegazza', 'luisa10@outlook.com', NULL, '+39 911 8384251'),
(17, 'Napoleone', 'Lucarelli', 'tvento@trupiano-alfonsi.com', NULL, '+39 41 1824493'),
(18, 'Letizia', 'Mozart', 'toni74@cabibbo.org', NULL, '+39 052 42 78 6'),
(19, 'Benvenuto', 'Contarini', 'berenice82@ceravolo-bassi.eu', NULL, '+39 0533 158692'),
(20, 'Nicoletta', 'Eco', 'erraniloredana@poste.it', NULL, '+39 6342 160733'),
(21, 'Liberto', 'Gentilini', 'ferragnipasqual@ligorio-bonanno.eu', NULL, '+39 8685 014294'),
(22, 'Corrado', 'Rizzo', 'raffaello98@tim.it', NULL, '+39 934 0608835'),
(23, 'Puccio', 'Bonatti', 'francesca14@hotmail.com', NULL, '+39 65 64823662'),
(24, 'Dina', 'Manunta', 'marenzioivan@virgilio.it', NULL, '+39 995 7773872'),
(25, 'Flora', 'Brenna', 'carmelo34@tiscali.it', NULL, '+39 3200 379176'),
(26, 'Letizia', 'Pastine', 'jgori@libero.it', NULL, '+39 1632 870831'),
(27, 'Nina', 'Scarpa', 'btiepolo@hotmail.it', NULL, '+39 277 4348734'),
(28, 'Ranieri', 'Borzomì', 'guarinomorabito@poste.it', NULL, '+39 122 3623166'),
(29, 'Alessandra', 'Schiaparelli', 'foconiroberta@gmail.com', NULL, '+39 909 6705466'),
(30, 'Adele', 'Vergassola', 'rgalilei@spanevello-badoer.eu', NULL, '+39 6272 980699'),
(31, 'Bruno', 'Renzi', 'dfaggiani@parini-monaco.it', NULL, '+39 56 46417080'),
(32, 'Maurizio', 'Garzoni', 'bajamontigioffre@aporti.net', NULL, '+39 71 9374529'),
(33, 'Clelia', 'Carocci', 'corrado90@panicucci-petrucci.com', NULL, '+39 314 9190586'),
(34, 'Bartolomeo', 'Tognazzi', 'pugliesepriscilla@live.com', NULL, '+39 657 26 28 4'),
(35, 'Rosario', 'Roccabonella', 'serena31@fastwebnet.it', NULL, '+39 379 9650752'),
(36, 'Sergius', 'Franzese', 'massimiliano49@fastwebnet.it', NULL, '+39 083 1367837'),
(37, 'Ricciotti', 'Antonelli', 'gianfrancesco63@pacillo-sforza.it', NULL, '+39 8557 444313'),
(38, 'Dante', 'Valentino', 'giampierosorrentino@trezzini-longhena.net', NULL, '+39 35 24082400'),
(39, 'Angelica', 'Maggioli', 'acamilleri@lovato.eu', NULL, '+39 04 7116719'),
(40, 'Elisa', 'Bernetti', 'paolazanichelli@bresciani-grassi.it', NULL, '+39 6999 386774'),
(41, 'Liberto', 'Bignami', 'elenafranceschi@bova-crispi.com', NULL, '+39 120 6797403'),
(42, 'Isa', 'Longhena', 'giannottigiustino@yahoo.com', NULL, '+39 3618 324210'),
(43, 'Morena', 'Martucci', 'dcatenazzi@vodafone.it', NULL, '+39 6488 771906'),
(44, 'Claudia', 'Greggio', 'germanogianna@argan.it', NULL, '+39 742 9671756'),
(45, 'Ludovico', 'Campano', 'piergiorgio74@piccio.com', NULL, '+39 45 16808760'),
(46, 'Francesco', 'Travaglia', 'wroth@libero.it', NULL, '+39 48 2477109'),
(47, 'Nicoletta', 'Giradello', 'amanda08@caboto-gasperi.it', NULL, '+39 274 84 67 7'),
(48, 'Ennio', 'Passalacqua', 'stefanibonanno@pozzecco-morpurgo.com', NULL, '+39 49 97278755'),
(49, 'Amanda', 'Vento', 'mmilanesi@tiscali.it', NULL, '+39 636 0576627'),
(50, 'Dino', 'Tebaldi', 'rosselliniciro@hotmail.com', NULL, '+39 026 2174596');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Bibliotecari`
--
ALTER TABLE `Bibliotecari`
  ADD PRIMARY KEY (`id_bibliotecario`),
  ADD UNIQUE KEY `uni_email` (`email`),
  ADD KEY `idx_biblioteca` (`id_biblioteca`);

--
-- Indici per le tabelle `Biblioteche`
--
ALTER TABLE `Biblioteche`
  ADD PRIMARY KEY (`id_biblioteca`);

--
-- Indici per le tabelle `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indici per le tabelle `Generi`
--
ALTER TABLE `Generi`
  ADD PRIMARY KEY (`id_genere`);

--
-- Indici per le tabelle `Libri`
--
ALTER TABLE `Libri`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `idx_biblioteca` (`id_biblioteca`),
  ADD KEY `idx_categoria` (`id_categoria`),
  ADD KEY `idx_genere` (`id_genere`);

--
-- Indici per le tabelle `Prestiti`
--
ALTER TABLE `Prestiti`
  ADD PRIMARY KEY (`id_prestito`),
  ADD KEY `idx_biblioteca` (`id_biblioteca`),
  ADD KEY `idx_utente` (`id_utente`),
  ADD KEY `idx_bibliotecario` (`id_bibliotecario`),
  ADD KEY `idx_libro` (`id_libro`);

--
-- Indici per le tabelle `Sanzioni`
--
ALTER TABLE `Sanzioni`
  ADD PRIMARY KEY (`id_sanzione`),
  ADD KEY `idx_prestito` (`id_prestito`);

--
-- Indici per le tabelle `Utenti`
--
ALTER TABLE `Utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `uni_email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Bibliotecari`
--
ALTER TABLE `Bibliotecari`
  MODIFY `id_bibliotecario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `Biblioteche`
--
ALTER TABLE `Biblioteche`
  MODIFY `id_biblioteca` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id_categoria` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `Generi`
--
ALTER TABLE `Generi`
  MODIFY `id_genere` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `Libri`
--
ALTER TABLE `Libri`
  MODIFY `id_libro` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `Prestiti`
--
ALTER TABLE `Prestiti`
  MODIFY `id_prestito` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `Sanzioni`
--
ALTER TABLE `Sanzioni`
  MODIFY `id_sanzione` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `Utenti`
--
ALTER TABLE `Utenti`
  MODIFY `id_utente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Bibliotecari`
--
ALTER TABLE `Bibliotecari`
  ADD CONSTRAINT `Bibliotecari_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `Biblioteche` (`id_biblioteca`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Libri`
--
ALTER TABLE `Libri`
  ADD CONSTRAINT `Libri_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `Categorie` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Libri_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `Generi` (`id_genere`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Libri_ibfk_3` FOREIGN KEY (`id_biblioteca`) REFERENCES `Biblioteche` (`id_biblioteca`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Prestiti`
--
ALTER TABLE `Prestiti`
  ADD CONSTRAINT `Prestiti_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `Libri` (`id_libro`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prestiti_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `Utenti` (`id_utente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prestiti_ibfk_3` FOREIGN KEY (`id_biblioteca`) REFERENCES `Biblioteche` (`id_biblioteca`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prestiti_ibfk_4` FOREIGN KEY (`id_bibliotecario`) REFERENCES `Bibliotecari` (`id_bibliotecario`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Sanzioni`
--
ALTER TABLE `Sanzioni`
  ADD CONSTRAINT `Sanzioni_ibfk_1` FOREIGN KEY (`id_prestito`) REFERENCES `Prestiti` (`id_prestito`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
