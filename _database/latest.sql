-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 08, 2023 at 05:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsmkn`
--

-- --------------------------------------------------------

--
-- Table structure for table `1m1s_daftar`
--

CREATE TABLE `1m1s_daftar` (
  `id` int(11) NOT NULL,
  `tahun` varchar(255) NOT NULL,
  `kategori` int(11) DEFAULT NULL,
  `tajuk` varchar(255) DEFAULT NULL,
  `subTajuk` varchar(255) DEFAULT NULL,
  `tarikh` date DEFAULT NULL,
  `kaedah` int(11) DEFAULT NULL,
  `peringkat` int(11) DEFAULT NULL,
  `jumlahm` varchar(255) DEFAULT NULL,
  `anjuran` varchar(255) DEFAULT NULL,
  `id_pencapaian` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1m1s_daftar`
--

INSERT INTO `1m1s_daftar` (`id`, `tahun`, `kategori`, `tajuk`, `subTajuk`, `tarikh`, `kaedah`, `peringkat`, `jumlahm`, `anjuran`, `id_pencapaian`, `fullname`, `uploaded_by`) VALUES
(1, '2023', 1, 'tajuk', 'sub', '2023-03-06', 1, 1, '30', 'ppd', 8, 'MOHD AZIM BIN ABD WAHAB', 1),
(2, '2023', 3, 'PERKHEMAHAN PERDANA KEM 2023', 'PENGAKAP', '2023-03-26', 1, 2, '120', 'PPD PADANG TERAP', 7, 'MOHD AZIM BIN ABD WAHAB', 1),
(3, '2023', 5, 'DEBAT PERDANA MINI PARLIMEN', 'BAHASA MELAYU', '2023-03-16', 1, 3, '5', 'JABATAN PENDIDIKAN NEGERI KEDAH', 8, 'MOHD AZIM BIN ABD WAHAB', 1),
(4, '2023', 1, 'PERTANDINGAN KAPAL TERBANG KERTAS', 'KATEGORI MENENGAH RENDAH', '2023-03-24', 1, 2, '15', 'PPD PADANG TERAP', 8, 'MOHD AZIM BIN ABD WAHAB', 1),
(5, '2023', 2, 'KEJOHANAN OLAHRAGA', 'TERBUKA', '2023-03-25', 1, 3, '2', 'JPN KEDAH', 8, 'MOHD AZIM BIN ABD WAHAB', 1),
(6, '2023', 5, 'PERTANDINGAN SYARAHAN PIALA MENTERI PENDIDIKAN', 'KATEGORI WANITA', '2023-03-26', 1, 4, '4', 'KEMENTERIAN PENDIDIKAN MALAYSIA', 2, 'MOHD AZIM BIN ABD WAHAB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1m1s_kaedah`
--

CREATE TABLE `1m1s_kaedah` (
  `id` int(11) NOT NULL,
  `kaedah` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1m1s_kaedah`
--

INSERT INTO `1m1s_kaedah` (`id`, `kaedah`) VALUES
(1, 'BERSEMUKA'),
(2, 'ONLINE');

-- --------------------------------------------------------

--
-- Table structure for table `1m1s_pencapaian`
--

CREATE TABLE `1m1s_pencapaian` (
  `id` int(11) NOT NULL,
  `pencapaian` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1m1s_pencapaian`
--

INSERT INTO `1m1s_pencapaian` (`id`, `pencapaian`) VALUES
(1, 'JOHAN'),
(2, 'NAIB JOHAN'),
(3, 'KE TIGA'),
(4, 'KE EMPAT'),
(5, 'KE LIMA'),
(6, 'SAGUHATI'),
(7, 'PENYERTAAN'),
(8, 'BELUM DIUMUKAN');

-- --------------------------------------------------------

--
-- Table structure for table `1m1s_peringkat`
--

CREATE TABLE `1m1s_peringkat` (
  `id` int(11) NOT NULL,
  `peringkat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1m1s_peringkat`
--

INSERT INTO `1m1s_peringkat` (`id`, `peringkat`) VALUES
(1, 'SEKOLAH'),
(2, 'DAERAH'),
(3, 'NEGERI'),
(4, 'KEBANGSAAN'),
(5, 'ASIA'),
(6, 'ANTARABANGSA');

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id` int(11) NOT NULL,
  `keterangan_agama` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id`, `keterangan_agama`) VALUES
(1, 'ISLAM'),
(2, 'BUDDHA'),
(3, 'HINDU');

-- --------------------------------------------------------

--
-- Table structure for table `gred`
--

CREATE TABLE `gred` (
  `id` int(11) NOT NULL,
  `jenis_gred` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gred`
--

INSERT INTO `gred` (`id`, `jenis_gred`) VALUES
(1, 'DG 32'),
(2, 'DG41'),
(3, 'DG42'),
(4, 'DG44'),
(5, 'DG48'),
(6, 'DG52'),
(7, 'DG54'),
(8, 'DG56'),
(9, 'C19'),
(10, 'N19'),
(11, 'N22'),
(12, 'N11'),
(13, 'H11'),
(14, 'R11');

-- --------------------------------------------------------

--
-- Table structure for table `guru_kelas`
--

CREATE TABLE `guru_kelas` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL DEFAULT 0,
  `id_kelasLengkap` int(11) NOT NULL DEFAULT 0,
  `id_sesi` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru_kelas`
--

INSERT INTO `guru_kelas` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_sesi`) VALUES
(1, 76, 1, 2),
(2, 57, 2, 2),
(3, 110, 3, 2),
(4, 38, 4, 2),
(5, 48, 5, 2),
(6, 46, 6, 2),
(7, 12, 7, 2),
(8, 70, 8, 2),
(9, 75, 9, 2),
(10, 64, 10, 2),
(11, 71, 11, 2),
(12, 85, 12, 2),
(13, 21, 13, 2),
(14, 93, 14, 2),
(15, 95, 15, 2),
(16, 25, 16, 2),
(17, 105, 17, 2),
(18, 54, 18, 2),
(19, 91, 23, 2),
(20, 99, 19, 2),
(21, 14, 20, 2),
(22, 13, 22, 2),
(23, 79, 21, 2),
(24, 61, 24, 2),
(25, 52, 29, 2),
(26, 73, 25, 2),
(27, 41, 26, 2),
(28, 6, 28, 2),
(29, 18, 27, 2),
(30, 89, 30, 2),
(31, 24, 34, 2),
(32, 43, 33, 2),
(33, 112, 32, 2),
(34, 92, 31, 2),
(35, 22, 35, 2),
(36, 53, 36, 2),
(37, 76, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jantina`
--

CREATE TABLE `jantina` (
  `id` int(11) NOT NULL,
  `jenis_jantina` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jantina`
--

INSERT INTO `jantina` (`id`, `jenis_jantina`) VALUES
(1, 'LELAKI'),
(2, 'PEREMPUAN');

-- --------------------------------------------------------

--
-- Table structure for table `jawatan`
--

CREATE TABLE `jawatan` (
  `id` int(11) NOT NULL,
  `jenis_jawatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawatan`
--

INSERT INTO `jawatan` (`id`, `jenis_jawatan`) VALUES
(1, 'Guru Akademik Biasa'),
(2, 'Guru Pendidikan Islam'),
(3, 'Guru Penolong Kanan'),
(4, 'Pengetua'),
(5, 'Guru Kanan Bidang'),
(6, 'Kaunselor'),
(7, 'Pemandu'),
(8, 'Guru Penolong Agama');

-- --------------------------------------------------------

--
-- Table structure for table `jawatan_kokurikulum`
--

CREATE TABLE `jawatan_kokurikulum` (
  `id` int(11) NOT NULL,
  `keterangan_jawatan` varchar(255) DEFAULT NULL,
  `id_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawatan_kokurikulum`
--

INSERT INTO `jawatan_kokurikulum` (`id`, `keterangan_jawatan`, `id_status`) VALUES
(1, 'PENGERUSI', 1),
(2, 'NAIB PENGERUSI', 1),
(3, 'NAIB PENGERUSI 1', 1),
(4, 'NAIB PENGERUSI II', 1),
(5, 'SETIAUSAHA', 1),
(6, 'SETIAUSAHA I', 1),
(7, 'SETIAUSAHA II', 1),
(8, 'NAIB SETIAUSAHA', 1),
(9, 'NAIB SETIAUSAHA I', 1),
(10, 'NAIB SETIAUSAHA II', 1),
(11, 'BENDAHARI', 1),
(12, 'PENOLONG BENDAHARI', 1),
(13, 'AHLI JAWATANKUASA', 1),
(14, 'AHLI BIASA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_kokurikulum`
--

CREATE TABLE `kategori_kokurikulum` (
  `id` int(11) NOT NULL,
  `id_kokurikulum` int(11) NOT NULL,
  `jenis_kokurikulum` varchar(50) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_kokurikulum`
--

INSERT INTO `kategori_kokurikulum` (`id`, `id_kokurikulum`, `jenis_kokurikulum`, `id_status`) VALUES
(1, 1, 'KELAB ALAM SEKITAR', 1),
(2, 1, 'KELAB BAHASA CINA', 1),
(3, 1, 'KELAB DOKTOR MUDA', 1),
(4, 1, 'KELAB KEBUDAYAAN DAN WARISAN', 1),
(5, 1, 'KELAB KECERIAAN', 1),
(6, 1, 'KELAB KESELAMATAN JALANRAYA', 1),
(7, 1, 'KELAB KOMPUTER ICT', 1),
(8, 1, 'KELAB KOPERASI SEKOLAH', 1),
(9, 1, 'KELAB MALAYSIAKU', 1),
(10, 1, 'KELAB PENCEGAHAN JENAYAH', 1),
(11, 1, 'KELAB REKABENTUK DAN TEKNOLOGI', 1),
(12, 1, 'KELAB SENI VISUAL', 1),
(13, 1, 'KELAB STEM', 1),
(14, 1, 'PERSATUAN BAHASA ARAB', 1),
(15, 1, 'PERSATUAN BAHASA INGGERIS', 1),
(16, 1, 'PERSATUAN BAHASA MELAYU', 1),
(17, 1, 'PERSATUAN PENDIDIKAN ISLAM', 1),
(18, 1, 'PERSATUAN PENDIDIKAN MORAL', 1),
(19, 1, 'PERSATUAN SEJARAH', 1),
(20, 2, 'BADMINTON', 1),
(21, 2, 'BASIKAL', 1),
(22, 2, 'BOLA BALING', 1),
(23, 2, 'BOLA JARING', 1),
(24, 2, 'BOLA SEPAK', 1),
(25, 2, 'BOLA TAMPAR', 1),
(26, 2, 'BOLING TENPIN', 1),
(27, 2, 'CATUR', 1),
(28, 2, 'FUTSAL', 1),
(29, 2, 'LOMPAT TALI', 1),
(30, 2, 'OLAHRAGA', 1),
(31, 2, 'PETANGQUE', 1),
(32, 2, 'PING PONG', 1),
(33, 2, 'SEPAK TAKRAW', 1),
(34, 3, 'BULAN SABIT MERAH MALAYSIA', 1),
(35, 3, 'KADET BOMBA DAN PENYELAMAT', 1),
(36, 3, 'KADET POLIS DIRAJA MALAYSIA', 1),
(37, 3, 'KADET REMAJA SEKOLAH', 1),
(38, 3, 'PERTUBUHAN PUTERI ISLAM', 1),
(39, 3, 'PERSEKUTUAN PENGAKAP MALAYSIA', 1),
(40, 3, 'PERTUBUHAN SILAT GAYONG MALAYSIA', 1),
(41, 4, 'BENDAHARA', 1),
(42, 4, 'LAKSAMANA', 1),
(43, 4, 'SHAHBANDAR', 1),
(44, 4, 'TEMENGGUNG', 1),
(100, 0, 'SILA KEMASKINI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kaum`
--

CREATE TABLE `kaum` (
  `id` int(11) NOT NULL,
  `jenis_kaum` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kaum`
--

INSERT INTO `kaum` (`id`, `jenis_kaum`) VALUES
(1, 'MELAYU'),
(2, 'CINA'),
(3, 'INDIA'),
(4, 'SIAM'),
(5, 'MURUT'),
(6, 'THAI'),
(7, 'INDONESIA'),
(8, 'DUSUN');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran_harian`
--

CREATE TABLE `kehadiran_harian` (
  `id` int(11) NOT NULL,
  `tarikh` varchar(255) NOT NULL DEFAULT '',
  `id_kelas` int(11) NOT NULL DEFAULT 0,
  `id_pengguna` int(11) NOT NULL DEFAULT 0,
  `id_tingkatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kehadiran_harian`
--

INSERT INTO `kehadiran_harian` (`id`, `tarikh`, `id_kelas`, `id_pengguna`, `id_tingkatan`) VALUES
(1, '1679702400', 1, 116, 1),
(2, '1679702400', 1, 117, 1),
(3, '1679702400', 1, 118, 1),
(4, '1679702400', 1, 119, 1),
(5, '1679702400', 1, 120, 1),
(6, '1679702400', 12, 440, 2),
(7, '1679702400', 12, 441, 2),
(8, '1679702400', 12, 443, 2),
(9, '1679702400', 12, 444, 2),
(10, '1679702400', 12, 468, 2),
(11, '1679702400', 12, 469, 2),
(12, '1679702400', 23, 734, 4),
(13, '1679702400', 23, 735, 4),
(14, '1679702400', 23, 736, 4),
(15, '1679702400', 23, 737, 4),
(16, '1679702400', 23, 738, 4),
(17, '1679702400', 15, 522, 3),
(18, '1679702400', 15, 523, 3),
(19, '1679702400', 15, 524, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran_koko`
--

CREATE TABLE `kehadiran_koko` (
  `id` int(11) NOT NULL,
  `tarikh` varchar(255) NOT NULL DEFAULT '',
  `tarikh_baru` int(11) NOT NULL DEFAULT 0,
  `tahun` int(11) NOT NULL DEFAULT 0,
  `bulan` int(11) NOT NULL DEFAULT 0,
  `id_kategori` int(11) NOT NULL DEFAULT 0,
  `id_subKategori` int(11) NOT NULL DEFAULT 0,
  `id_kelasLengkap` int(11) NOT NULL DEFAULT 0,
  `id_pengguna` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kehadiran_koko`
--

INSERT INTO `kehadiran_koko` (`id`, `tarikh`, `tarikh_baru`, `tahun`, `bulan`, `id_kategori`, `id_subKategori`, `id_kelasLengkap`, `id_pengguna`) VALUES
(1, '2023-03-01', 1677628800, 2023, 3, 1, 1, 2, 157),
(2, '2023-03-01', 1677628800, 2023, 3, 1, 1, 2, 175),
(3, '2023-03-01', 1677628800, 2023, 3, 1, 1, 3, 192),
(4, '2023-03-01', 1677628800, 2023, 3, 1, 1, 3, 196),
(5, '2023-03-01', 1677628800, 2023, 3, 1, 1, 3, 200),
(6, '2023-03-02', 1677715200, 2023, 3, 2, 20, 1, 128),
(7, '2023-03-02', 1677715200, 2023, 3, 2, 20, 1, 133),
(8, '2023-03-02', 1677715200, 2023, 3, 2, 20, 2, 149),
(9, '2023-03-02', 1677715200, 2023, 3, 2, 20, 2, 150),
(10, '2023-03-02', 1677715200, 2023, 3, 2, 20, 3, 204),
(11, '2023-03-02', 1677715200, 2023, 3, 2, 20, 1, 128),
(12, '2023-03-02', 1677715200, 2023, 3, 2, 20, 1, 133),
(13, '2023-03-02', 1677715200, 2023, 3, 2, 20, 2, 149),
(14, '2023-03-02', 1677715200, 2023, 3, 2, 20, 2, 150),
(15, '2023-03-02', 1677715200, 2023, 3, 2, 20, 3, 204),
(16, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 119),
(17, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 132),
(18, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 137),
(19, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 159),
(20, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 165),
(21, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 119),
(22, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 132),
(23, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 137),
(24, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 159),
(25, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 165),
(26, '2023-03-04', 1677888000, 2023, 3, 4, 42, 13, 476),
(27, '2023-03-04', 1677888000, 2023, 3, 4, 42, 13, 482),
(28, '2023-03-04', 1677888000, 2023, 3, 4, 42, 14, 494),
(29, '2023-03-04', 1677888000, 2023, 3, 4, 42, 14, 500),
(30, '2023-03-04', 1677888000, 2023, 3, 4, 42, 14, 502),
(31, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 119),
(32, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 132),
(33, '2023-03-03', 1677801600, 2023, 3, 3, 34, 1, 137),
(34, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 159),
(35, '2023-03-03', 1677801600, 2023, 3, 3, 34, 2, 165),
(36, '2023-03-08', 1678233600, 2023, 3, 1, 19, 8, 341),
(37, '2023-03-08', 1678233600, 2023, 3, 1, 19, 8, 342),
(38, '2023-03-08', 1678233600, 2023, 3, 1, 19, 8, 344),
(39, '2023-03-08', 1678233600, 2023, 3, 1, 19, 8, 353),
(40, '2023-03-08', 1678233600, 2023, 3, 1, 19, 8, 354),
(41, '2023-03-08', 1678233600, 2023, 3, 1, 19, 9, 367),
(42, '2023-03-08', 1678233600, 2023, 3, 1, 19, 9, 383),
(43, '2023-03-08', 1678233600, 2023, 3, 1, 19, 9, 384),
(44, '2023-03-08', 1678233600, 2023, 3, 1, 19, 9, 391),
(45, '2023-03-08', 1678233600, 2023, 3, 1, 19, 10, 413),
(46, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 639),
(47, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 650),
(48, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 655),
(49, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 659),
(50, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 639),
(51, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 650),
(52, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 655),
(53, '2023-03-09', 1678320000, 2023, 3, 4, 42, 19, 659),
(54, '2023-03-20', 1679270400, 2023, 3, 1, 14, 13, 475),
(55, '2023-03-20', 1679270400, 2023, 3, 1, 14, 13, 480),
(56, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 494),
(57, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 501),
(58, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 505),
(59, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 507),
(60, '2023-03-20', 1679270400, 2023, 3, 1, 14, 15, 532),
(61, '2023-03-20', 1679270400, 2023, 3, 1, 14, 18, 607),
(62, '2023-03-20', 1679270400, 2023, 3, 1, 14, 13, 475),
(63, '2023-03-20', 1679270400, 2023, 3, 1, 14, 13, 480),
(64, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 494),
(65, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 501),
(66, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 505),
(67, '2023-03-20', 1679270400, 2023, 3, 1, 14, 14, 507),
(68, '2023-03-20', 1679270400, 2023, 3, 1, 14, 15, 532),
(69, '2023-03-20', 1679270400, 2023, 3, 1, 14, 18, 607),
(70, '2023-03-20', 1679270400, 2023, 3, 1, 18, 19, 643),
(71, '2023-03-20', 1679270400, 2023, 3, 1, 18, 20, 665),
(72, '2023-03-20', 1679270400, 2023, 3, 1, 18, 20, 667),
(73, '2023-03-20', 1679270400, 2023, 3, 1, 18, 20, 675),
(74, '2023-03-20', 1679270400, 2023, 3, 1, 18, 20, 678),
(75, '2023-03-20', 1679270400, 2023, 3, 1, 18, 21, 698),
(76, '2023-03-20', 1679270400, 2023, 3, 1, 18, 21, 702),
(77, '2023-03-20', 1679270400, 2023, 3, 1, 18, 21, 704),
(78, '2023-03-20', 1679270400, 2023, 3, 1, 18, 21, 705),
(79, '2023-03-20', 1679270400, 2023, 3, 1, 18, 22, 722),
(80, '2023-03-20', 1679270400, 2023, 3, 1, 18, 24, 761),
(81, '2023-03-20', 1679270400, 2023, 3, 1, 18, 24, 764),
(82, '2023-03-20', 1679270400, 2023, 3, 1, 18, 24, 766),
(83, '2023-03-20', 1679270400, 2023, 3, 1, 18, 24, 768),
(84, '2023-03-21', 1679356800, 2023, 3, 1, 18, 19, 643),
(85, '2023-03-21', 1679356800, 2023, 3, 1, 18, 20, 665),
(86, '2023-03-21', 1679356800, 2023, 3, 1, 18, 20, 667),
(87, '2023-03-21', 1679356800, 2023, 3, 1, 18, 20, 675),
(88, '2023-03-21', 1679356800, 2023, 3, 1, 18, 20, 678),
(89, '2023-03-21', 1679356800, 2023, 3, 1, 18, 21, 698),
(90, '2023-03-21', 1679356800, 2023, 3, 1, 18, 21, 702),
(91, '2023-03-21', 1679356800, 2023, 3, 1, 18, 21, 704),
(92, '2023-03-21', 1679356800, 2023, 3, 1, 18, 21, 705),
(93, '2023-03-21', 1679356800, 2023, 3, 1, 18, 22, 722),
(94, '2023-03-21', 1679356800, 2023, 3, 1, 18, 24, 761),
(95, '2023-03-21', 1679356800, 2023, 3, 1, 18, 24, 764),
(96, '2023-03-21', 1679356800, 2023, 3, 1, 18, 24, 766),
(97, '2023-03-21', 1679356800, 2023, 3, 1, 18, 24, 768),
(98, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 157),
(99, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 175),
(100, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 192),
(101, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 196),
(102, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 200),
(103, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 205),
(104, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 217),
(105, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 227),
(106, '2023-03-23', 1679529600, 2023, 3, 1, 18, 5, 261),
(107, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 157),
(108, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 175),
(109, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 192),
(110, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 196),
(111, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 200),
(112, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 205),
(113, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 217),
(114, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 227),
(115, '2023-03-23', 1679529600, 2023, 3, 1, 18, 5, 261),
(116, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 157),
(117, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 175),
(118, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 192),
(119, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 196),
(120, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 200),
(121, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 205),
(122, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 217),
(123, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 227),
(124, '2023-03-23', 1679529600, 2023, 3, 1, 18, 5, 261),
(125, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 157),
(126, '2023-03-23', 1679529600, 2023, 3, 1, 18, 2, 175),
(127, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 192),
(128, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 196),
(129, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 200),
(130, '2023-03-23', 1679529600, 2023, 3, 1, 18, 3, 205),
(131, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 217),
(132, '2023-03-23', 1679529600, 2023, 3, 1, 18, 4, 227),
(133, '2023-03-23', 1679529600, 2023, 3, 1, 18, 5, 261),
(134, '2023-03-25', 0, 0, 0, 1, 9, 2, 157),
(135, '2023-03-25', 0, 0, 0, 1, 9, 2, 175),
(136, '2023-03-25', 0, 0, 0, 1, 9, 3, 192),
(137, '2023-03-25', 0, 0, 0, 1, 9, 3, 196),
(138, '2023-03-25', 0, 0, 0, 1, 9, 3, 200),
(139, '2023-03-25', 0, 0, 0, 1, 9, 3, 205),
(140, '2023-03-25', 0, 0, 0, 1, 9, 4, 217),
(141, '2023-03-25', 0, 0, 0, 1, 9, 4, 227),
(142, '2023-03-25', 0, 0, 0, 1, 9, 5, 261);

-- --------------------------------------------------------

--
-- Table structure for table `kelab_persatuan`
--

CREATE TABLE `kelab_persatuan` (
  `id` int(11) NOT NULL,
  `id_kokurikulum` int(11) NOT NULL DEFAULT 1,
  `nama_kelabP` varchar(255) NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelab_persatuan`
--

INSERT INTO `kelab_persatuan` (`id`, `id_kokurikulum`, `nama_kelabP`, `id_status`) VALUES
(1, 1, 'KELAB ALAM SEKITAR', 1),
(2, 1, 'KELAB BAHASA CINA', 1),
(3, 1, 'KELAB DOKTOR MUDA', 1),
(4, 1, 'KELAB KEBUDAYAAN DAN WARISAN', 1),
(5, 1, 'KELAB KECERIAAN', 1),
(6, 1, 'KELAB KESELAMATAN JALANRAYA', 1),
(7, 1, 'KELAB KOMPUTER ICT', 1),
(8, 1, 'KELAB KOPERASI SEKOLAH', 1),
(9, 1, 'KELAB MALAYSIAKU', 1),
(10, 1, 'KELAB PENCEGAHAN JENAYAH', 1),
(11, 1, 'KELAB REKABENTUK DAN TEKNOLOGI', 1),
(12, 1, 'KELAB SENI VISUAL', 1),
(13, 1, 'KELAB STEM', 1),
(14, 1, 'PERSATUAN BAHASA ARAB', 1),
(15, 1, 'PERSATUAN BAHASA INGGERIS', 1),
(16, 1, 'PERSATUAN BAHASA MELAYU', 1),
(17, 1, 'PERSATUAN PENDIDIKAN ISLAM', 1),
(18, 1, 'PERSATUAN PENDIDIKAN MORAL', 1),
(19, 1, 'PERSATUAN SEJARAH', 1),
(100, 0, 'SILA KEMASKINI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(255) NOT NULL DEFAULT '0',
  `singkatan_kelas` varchar(255) NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `singkatan_kelas`, `id_status`) VALUES
(1, 'AGAMA', 'A', 1),
(2, 'BESTARI', 'B', 1),
(3, 'CEMERLANG', 'C', 1),
(4, 'DEDIKASI', 'D', 1),
(5, 'EFEKTIF', 'E', 1),
(6, 'GEMILANG', 'G', 1),
(7, 'PRINSIP AKAUN', 'PA', 1),
(8, 'PERNIAGAAN', 'PN', 1),
(9, 'MPV', 'MPV', 1),
(10, 'SAINS RUMAH TANGGA', 'SRT', 1),
(11, 'STEM', 'STEM', 1),
(12, 'SASTERA', 'SAS', 1),
(13, 'BSV', 'BSV', 1),
(14, 'BPP', 'BPP', 1),
(15, 'ASV', 'ASV', 1),
(16, 'APP', 'APP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_lengkap`
--

CREATE TABLE `kelas_lengkap` (
  `id` int(11) NOT NULL,
  `id_tingkatan` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `sesi` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_lengkap`
--

INSERT INTO `kelas_lengkap` (`id`, `id_tingkatan`, `id_kelas`, `keterangan`, `sesi`) VALUES
(1, 1, 1, '1 AGAMA', 2),
(2, 1, 2, '1 BESTARI', 2),
(3, 1, 3, '1 CEMERLANG', 2),
(4, 1, 4, '1 DEDIKASI', 2),
(5, 1, 5, '1 EFEKTIF', 2),
(6, 1, 6, '1 GEMILANG', 2),
(7, 2, 1, '2 AGAMA', 2),
(8, 2, 2, '2 BESTARI', 2),
(9, 2, 3, '2 CEMERLANG', 2),
(10, 2, 4, '2 DEDIKASI', 2),
(11, 2, 5, '2 EFEKTIF', 2),
(12, 2, 6, '2 GEMILANG', 2),
(13, 3, 1, '3 AGAMA', 2),
(14, 3, 2, '3 BESTARI', 2),
(15, 3, 3, '3 CEMERLANG', 2),
(16, 3, 4, '3 DEDIKASI', 2),
(17, 3, 5, '3 EFEKTIF', 2),
(18, 3, 6, '3 GEMILANG', 2),
(19, 4, 7, '4 AKAUN', 2),
(20, 4, 8, '4 PERNIAGAAN', 2),
(21, 4, 9, '4 MPV', 2),
(22, 4, 10, '4 SRT', 2),
(23, 4, 11, '4 STEM', 2),
(24, 4, 12, '4 SASTERA', 2),
(25, 5, 7, '5 AKAUN', 2),
(26, 5, 8, '5 PERNIAGAAN', 2),
(27, 5, 9, '5 MPV', 2),
(28, 5, 10, '5 SRT', 2),
(29, 5, 11, '5 STEM', 2),
(30, 5, 12, '5 SASTERA', 2),
(31, 6, 13, '6 BSV', 2),
(32, 6, 14, '6 BPP', 2),
(33, 6, 15, '6 ASV', 2),
(34, 6, 16, '6 APP', 2),
(35, 2, 17, '2 MAJU', 2),
(36, 4, 18, '4 NUSA', 2),
(37, 5, 19, '5 KREATIF', 2),
(38, 1, 20, '1 SEMARAK', 2),
(39, 3, 21, '3 KARISMA', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kokurikulum`
--

CREATE TABLE `kokurikulum` (
  `id` int(11) NOT NULL,
  `kategori_koko` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kokurikulum`
--

INSERT INTO `kokurikulum` (`id`, `kategori_koko`) VALUES
(1, 'KELAB DAN PERSATUAN'),
(2, 'SUKAN DAN PERMAINAN'),
(3, 'UNIT BERUNIFORM'),
(4, 'RUMAH SUKAN'),
(5, 'KO-AKADEMIK');

-- --------------------------------------------------------

--
-- Table structure for table `kokurikulum_guru`
--

CREATE TABLE `kokurikulum_guru` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_kelab_persatuan` int(11) NOT NULL,
  `id_sukan_permainan` int(11) NOT NULL,
  `id_unit_uniform` int(11) NOT NULL,
  `id_rumah_sukan` int(11) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kokurikulum_guru`
--

INSERT INTO `kokurikulum_guru` (`id`, `id_pengguna`, `id_kelab_persatuan`, `id_sukan_permainan`, `id_unit_uniform`, `id_rumah_sukan`, `id_status`) VALUES
(1, 1, 10, 5, 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `makluman`
--

CREATE TABLE `makluman` (
  `id` int(11) NOT NULL,
  `maklumat` text DEFAULT NULL,
  `id_status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makluman`
--

INSERT INTO `makluman` (`id`, `maklumat`, `id_status`, `created_at`) VALUES
(1, 'testing', 1, NULL),
(2, 'test no 2', 1, NULL),
(3, 'test no 3', 1, NULL),
(4, 'test no 4', 1, NULL),
(5, 'test no 5', 1, '2023-03-13 23:09:50'),
(6, 'test no 6', 1, '2023-03-13 23:11:57'),
(7, 'aaaaasag rjrjryjaryka ktyjtykrk  rkarykarykatrkathmsfgnsfgj syjsfjar6j rjartjarj6ua sriar6iartjafjar6ja46 ', 1, '2023-03-13 23:13:34'),
(8, 'testing', 1, '2023-03-18 20:13:41'),
(9, 'testing', 1, '2023-03-18 20:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_guru`
--

CREATE TABLE `maklumat_guru` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_gred` int(11) NOT NULL,
  `id_jawatan` varchar(255) NOT NULL,
  `contactno` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maklumat_guru`
--

INSERT INTO `maklumat_guru` (`id`, `id_pengguna`, `id_gred`, `id_jawatan`, `contactno`, `image`, `id_status`) VALUES
(115, 1, 4, '1', '0103941244', '62b8e6d8130a2.jpg', 1),
(220, 0, 4, '1', '0103941243', 'noimage.png', 1),
(117, 5, 5, '3', '0134839718', '62b868cc2ae96.jpg', 1),
(118, 6, 6, '1', '6010', '62b86915045e5.jpg', 1),
(119, 8, 5, '3', '6010', '62b869628f1a6.jpg', 1),
(120, 9, 5, '1', '6010', '62b869baae082.jpg', 1),
(121, 10, 11, '', '6010', '', 2),
(122, 11, 5, '3', '6010', '62b86a9fc7250.jpg', 1),
(123, 12, 5, '1', '6010', '62b86ae34f57a.jpg', 1),
(124, 13, 5, '1', '6010', '62b86b1143f3e.jpg', 1),
(125, 14, 5, '1', '6010', '62b86b3ad5e0c.jpg', 1),
(126, 15, 4, '6', '6010', '62b86b95e6f06.jpg', 1),
(127, 16, 9, '', '6010', '62bb139045ba9.jpg', 1),
(128, 17, 6, '1', '6010', '', 2),
(129, 18, 5, '1', '6010', '62d8c40d71498.jpg', 1),
(130, 19, 6, '', '6010', '62b86bd2d6310.jpg', 1),
(131, 20, 10, '', '6010', '62bb13f626f66.jpg', 1),
(132, 21, 4, '1', '6010', '62b86c1b12517.jpg', 1),
(133, 22, 5, '', '6010', '62b86c4bae1e8.jpg', 1),
(134, 23, 6, '', '6010', '', 2),
(135, 24, 7, '', '6010', '62b86c8849f18.jpg', 1),
(136, 25, 5, '', '6010', '62b86cd55687f.jpg', 1),
(137, 26, 6, '5', '6010', '', 1),
(138, 27, 13, '', '6010', '', 1),
(139, 28, 4, '', '6010', '62b86d635123f.jpg', 1),
(140, 29, 12, '', '6010', '62bb123c4d921.jpg', 1),
(141, 30, 7, '', '6010', '62b86d9bb654b.jpg', 1),
(142, 31, 11, '', '6010', '62bb1459cc83c.jpg', 1),
(143, 32, 5, '1', '6010', '62b86dd732be3.jpg', 1),
(144, 33, 4, '1', '6010', '62b86dfe6153f.jpg', 1),
(145, 34, 2, '1', '6010', '62b86e2c57645.jpg', 1),
(146, 35, 6, '5', '6010', '62b86e54491ba.jpg', 1),
(147, 36, 12, '', '6010', '', 1),
(148, 37, 2, '', '6010', '62b86ee067529.jpg', 1),
(149, 38, 5, '1', '6010', '', 1),
(150, 39, 14, '7', '6010', '', 1),
(151, 40, 7, '1', '6010 ', '62d8ca7db709a.jpg', 1),
(152, 41, 2, '1', '6010 ', '62d8cc869f27d.jpg', 1),
(153, 42, 5, '1', '6010 ', '62b86f64eb61c.jpg', 1),
(154, 43, 4, '', '6010 ', '62b86fb35938b.jpg', 1),
(155, 44, 4, '1', '6010', '62b86fdd63f80.jpg', 1),
(156, 45, 0, '1', '60104047300', '62b87000a9c36.jpg', 1),
(157, 46, 0, '1', '6010', '62b87053b39e5.jpg', 1),
(158, 47, 0, '', '6010', '62b870801ef94.jpg', 1),
(159, 48, 1, '1', '6010', '62b870beef4cc.jpg', 1),
(160, 49, 0, '', '6010', '', 1),
(161, 50, 0, '3', '6010', '', 1),
(162, 51, 0, '5', '6010', '62b87135a579c.jpg', 1),
(163, 52, 5, '1', '6010', '62b8716aa8241.jpg', 1),
(164, 53, 0, '', '6010', '62b8723c6b684.jpg', 1),
(165, 54, 0, '1', '6010', '62b8728452ec9.jpg', 1),
(166, 55, 0, '3', '0195551656', '62b872a969296.jpg', 1),
(167, 56, 0, '', '6010', '62b872ed61eb3.jpg', 1),
(168, 57, 0, '1', '6010', '62b8731be51a7.jpg', 1),
(169, 58, 0, '', '6010', '62b8735122f2e.jpg', 1),
(170, 59, 0, '1', '6010', '62b8737a759ed.jpg', 1),
(171, 60, 0, '1', '6010', '62b873cc34d75.jpg', 1),
(172, 61, 0, '', '6010', '62b873ede1500.jpg', 1),
(173, 62, 0, '', '6010', '62b8740c1e308.jpg', 1),
(174, 63, 0, '5', '6010', '62b8743251106.jpg', 1),
(175, 64, 1, '1', '6010', '62d8ce124a000.jpg', 1),
(176, 65, 1, '1', '6010', '62b874666ec69.jpg', 1),
(177, 66, 0, '', '6010', '62b87496afa4d.jpg', 1),
(178, 67, 0, '', '6010', '', 2),
(179, 68, 0, '1', '6010', '62b874bc47416.jpg', 1),
(180, 69, 0, '1', '6010', '62b874e8d76de.jpg', 1),
(181, 70, 0, '1', '6010', '62b87533a8ddf.jpg', 1),
(182, 71, 0, '1', '6010', '62b87561ca304.jpg', 1),
(183, 72, 8, '4', '0103664', '63083c7777b58.jpg', 2),
(184, 73, 0, '', '6010', '62b8759d4b4a8.jpg', 1),
(185, 74, 0, '', '6010', '62b875cdb005e.jpg', 1),
(186, 75, 0, '', '6010', '62b8760d9c61a.jpg', 1),
(187, 76, 0, '', '60109692399', '6320295592d7b.jpg', 1),
(188, 77, 0, '3', '6010', '62b8765cd5aa0.jpg', 1),
(189, 78, 0, '1', '6010', '62b876916820c.jpg', 1),
(190, 79, 0, '', '6010', '', 1),
(191, 80, 0, '', '6010', '', 1),
(192, 81, 0, '', '6010', '62b876bee95bb.jpg', 1),
(193, 82, 0, '1', '6010', '62b876e1e3fd2.jpg', 1),
(194, 83, 0, '', '6010', '62bb12a619f0c.jpg', 1),
(195, 84, 0, '', '6010', '', 1),
(196, 85, 0, '', '6010', '62b87739b0234.jpg', 1),
(197, 86, 0, '', '6010', '62b8776064af9.jpg', 1),
(198, 87, 0, '', '6010', '', 1),
(199, 88, 0, '', '6010', '62b877928ba93.jpg', 1),
(200, 89, 0, '1', '6010', '62b877bba5a86.jpg', 1),
(201, 90, 0, '', '6010', '62b877e7b486c.jpg', 1),
(202, 91, 0, '', '6010', '62b87813bdf79.jpg', 1),
(203, 92, 0, '', '6010', '62b87832e4431.jpg', 1),
(204, 93, 0, '', '6010', '62b878580ffd4.jpg', 1),
(205, 94, 0, '', '6010', '62b87878f3511.jpg', 1),
(206, 95, 0, '1', '6010', '62b8789c391ec.jpg', 1),
(207, 96, 0, '', '6010', '62b878bf9ba7d.jpg', 1),
(208, 97, 0, '', '6010', '62bb13248306a.jpg', 0),
(209, 98, 0, '', '6010', '', 1),
(210, 99, 0, '1', '6010', '62b8792ad9af3.jpg', 1),
(211, 104, 0, '', '12345', '', 2),
(212, 105, 2, '1', '01132720371', '62d8cc2abd18d.jpg', 1),
(213, 106, 2, '1', '12345', '', 1),
(214, 109, 0, '', '12', '', 2),
(215, 110, 2, '', '', '', 1),
(216, 111, 0, '', '', '', 1),
(217, 112, 5, '1', '6010', '62d916d707081.jpg', 1),
(218, 113, 2, '1', '6010', '62d91783a1761.jpg', 1),
(219, 114, 7, '4', '0139833894', '631449adca25d.png', 1),
(227, 989, 9, '1', '0103941245', 'noimage.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_murid`
--

CREATE TABLE `maklumat_murid` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_kelasLengkap` int(11) NOT NULL,
  `id_rumah_sukan` int(11) NOT NULL DEFAULT 100,
  `id_kelabP` int(11) NOT NULL DEFAULT 100,
  `id_uniform` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100',
  `id_sukanP` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100',
  `id_jantina` int(11) NOT NULL DEFAULT 100,
  `id_kaum` int(11) NOT NULL,
  `id_agama` int(11) NOT NULL,
  `id_sesi` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yatim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KEMASKINI STATUS',
  `asrama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KEMASKINI ASRAMA',
  `oku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KEMASKINI OKU',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maklumat_murid`
--

INSERT INTO `maklumat_murid` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_rumah_sukan`, `id_kelabP`, `id_uniform`, `id_sukanP`, `id_jantina`, `id_kaum`, `id_agama`, `id_sesi`, `image`, `yatim`, `asrama`, `oku`, `alamat`, `id_status`) VALUES
(1, 116, 1, 3, 17, '6', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 77, DESA KEDA BENDANG TOK TERI, NAKA   06350 ALOR SETAR', 1),
(2, 117, 1, 1, 14, '2', '13', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'SIMPANG TIGA, KG.MASJID LAMA,   06350 POKOK SENA', 1),
(3, 118, 1, 2, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(4, 119, 1, 1, 13, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'M1 PERUMAHAN LADANG SUNGAI TEKAI, batu 28 1/2, JALAN NAKA, NAMI 06350 ALOR SETAR', 1),
(5, 120, 1, 1, 17, '5', '7', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPONG LEBAI SAMAN , MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(6, 121, 1, 3, 15, '2', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'PKA 17/10 KG PADANG KERASAK JALAN NAKA   06350 ALOR SETAR', 1),
(7, 122, 1, 1, 14, '7', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 3097 KUARTERS KLINIK KESIHATAN NAKA   06350 ALOR SETAR', 1),
(8, 123, 1, 2, 3, '2', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 4 DEPAN TAMAN NAKA JAYA NAKA  06350 ALOR SETAR', 1),
(9, 124, 1, 1, 3, '2', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG KENYENG   06350 ALOR SETAR', 1),
(10, 125, 1, 4, 17, '7', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN MUKIM TEKAI KIRI NAKA 06350 Pokok Sena', 1),
(11, 126, 1, 3, 14, '2', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 92 KG. MASJID BARU NAKA 06350 POKOK SENA', 1),
(12, 127, 1, 2, 3, '7', '10', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG LEBAI SAMAN MUKIM TEKAI KIRI NAKA 06350 Pokok Sena', 1),
(13, 128, 1, 4, 13, '1', '2', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATUK MUKIM TEKAI KIRI NAKA 06350 Pokok Sena', 1),
(14, 129, 1, 2, 3, '7', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCHAN  MK PADANG KERBAU   06750 PENDANG', 1),
(15, 130, 1, 3, 17, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS, MUKIM TEKAI KIRI,  NAKA   06350 ALOR SETAR', 1),
(16, 131, 1, 2, 14, '3', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'PT. 1225 JALAN KUBANG JULUK KG KUBANG JULOK, KUALA NERANG  06350 ALOR SETAR', 1),
(17, 132, 1, 4, 3, '3', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG BUKIT MUKIM BUKIT LADA   06400 POKOK SENA', 1),
(18, 133, 1, 4, 13, '5', '2', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '1088 TAMAN NAKA JAYA NAKA   06350 ALOR SETAR', 1),
(19, 134, 1, 3, 3, '2', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LUBOK PERONG   06300 KUALA NERANG', 1),
(20, 135, 1, 1, 17, '3', '9', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', '55 KEDA BENDANG TOK TERI NAKA   06350 POKOK SENA', 1),
(21, 136, 1, 3, 14, '4', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TOK SALAM   06350 NAKA', 1),
(22, 137, 1, 4, 3, '3', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK   06350 ALOR SETAR', 1),
(23, 138, 1, 3, 13, '5', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, NAKA   06350 ALOR SETAR', 1),
(24, 139, 1, 1, 17, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.73 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(25, 140, 1, 2, 14, '5', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(26, 141, 1, 4, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(27, 142, 1, 3, 3, '6', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.35 PERUMAHAN KEDA KG. PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(28, 143, 1, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONDOK LAMA MK BUKIT LADA   06400 POKOK SENA', 1),
(29, 144, 1, 3, 13, '6', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(30, 145, 1, 3, 17, '6', '7', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG KUBANG JULUK, NAKA,  06350 POKOK SENA', 1),
(31, 146, 2, 3, 9, '6', '7', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'LORONG HJ HAMID, KG MASJID BARU, NAKA  06350 ALOR SETAR', 1),
(32, 147, 2, 4, 5, '5', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG HUJUNG KETON  MUKIM PADANG KERBAU   06750 PENDANG', 1),
(33, 148, 2, 3, 19, '4', '8', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG FELCRA KUBANG KENYENG JALAN NAKA   06300 KUALA NERANG', 1),
(34, 149, 2, 4, 4, '7', '2', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.65 PERUMAHAN KEDA PONG SELATAN   06350 ALOR SETAR', 1),
(35, 150, 2, 2, 10, '7', '2', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG PONG SELATAN MUKIM TEKAI KANAN, NAKA  06350 POKOK SENA', 1),
(36, 151, 2, 1, 12, '6', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.21 PERUMAHAN KEDA KUBANG KENYENG JALAN NAKA  06350 ALOR SETAR', 1),
(37, 152, 2, 4, 5, '7', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'Kg Bendang Tok Teri, Naka   06350 Pokok Sena', 1),
(38, 153, 2, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 66, JALAN DESA PUDINA 1 TAMAN DESA PUDINA  06350 POKOK SENA', 1),
(39, 154, 2, 3, 19, '6', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU NAKA   06350 ALOR SETAR', 1),
(40, 155, 2, 1, 4, '1', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'BATU 20 1/4, KAMPUNG BARU MK LESONG  06350 ALOR SETAR', 1),
(41, 156, 2, 1, 11, '2', '11', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG TANDOP BESAR   06350 ALOR SETAR', 1),
(42, 157, 2, 4, 1, '2', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(43, 158, 2, 1, 8, '2', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN   06300 KUALA NERANG', 1),
(44, 159, 2, 3, 8, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG SUNGAI KAP NAMI   08210 SIK', 1),
(45, 160, 2, 2, 7, '6', '3', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG SUNGAI KAP NAMI   08210 SIK', 1),
(46, 161, 2, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 52 Desa Keda Pong Selatan   06350 ALOR SETAR', 1),
(47, 162, 2, 4, 7, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 3 DESA KEDA KUBANG KENYENG NAKA   06350 ALOR SETAR', 1),
(48, 163, 2, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(49, 164, 2, 3, 19, '4', '9', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG BAKONG MK TEKAI KANAN   06350 Pokok Sena', 1),
(50, 165, 2, 2, 16, '3', '9', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. PONG SELATAN MUKIM TEKAI KANAN  06350 Alor Setar', 1),
(51, 166, 2, 2, 10, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(52, 167, 2, 3, 10, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '1083 TAMAN NAKA JAYA   06350 ALOR SETAR', 1),
(53, 168, 2, 1, 9, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '1083 TAMAN NAKA JAYA NAKA   06350 ALOR SETAR', 1),
(54, 169, 2, 2, 6, '5', '13', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(55, 170, 2, 4, 9, '2', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MK TEKAI KANAN   06350 ALOR SETAR', 1),
(56, 171, 2, 3, 6, '7', '9', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK MUKIM TEKAI KANAN NAKA   06350 ALOR SETAR', 1),
(57, 172, 2, 4, 11, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 85 PERUMAHAN KEDA KAMPUNG PONG SELATAN NAKA  06350 ALOR SETAR', 1),
(58, 173, 2, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID BARU   06350 Pokok Sena', 1),
(59, 174, 2, 2, 8, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 90 DEPAN BALAI POLIS NAKA   06350 ALOR SETAR', 1),
(60, 175, 2, 1, 1, '2', '13', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(62, 176, 2, 4, 7, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'SIMPANG EMPAT KG. PADANG KERASAK JALAN NAKA   06350 ALOR SETAR', 1),
(63, 177, 2, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'Kampung Padang Kerasak Mukim Tekai Kanan  06350 Pokok Sena', 1),
(64, 178, 2, 4, 8, '1', '11', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'BATU 17 JALAN NAKA   06400 POKOK SENA', 1),
(65, 179, 2, 2, 5, '2', '8', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.2A, KAMPUNG PONG MANIS MUKIM TEKAI KANAN NAKA   06350 ALOR SETAR', 1),
(66, 180, 3, 3, 7, '1', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'PT 4562 JALAN FELCRA PONG SELATAN   06350 ALOR SETAR', 1),
(67, 181, 3, 2, 19, '1', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 81, PERUMAHAN KEDA, KG PONG SELATAN, NAKA  06350 ALOR SETAR', 1),
(68, 182, 3, 4, 16, '1', '8', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI  06300 KUALA NERANG', 1),
(69, 183, 3, 3, 6, '6', '11', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '213, KG BARU NAKA   06350 ALOR SETAR', 1),
(70, 184, 3, 1, 4, '6', '13', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG BAKONG MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(71, 185, 3, 2, 12, '6', '13', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(72, 186, 3, 4, 11, '6', '12', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 213 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(73, 187, 3, 3, 11, '6', '8', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG.NAHAN, JALAN PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(74, 188, 3, 1, 10, '6', '9', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG SUNGAI KAP MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(75, 189, 3, 4, 9, '1', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG KENYENG MUKIM TEKAI KANAN  06350 KUALA NERANG', 1),
(76, 190, 3, 1, 6, '6', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 55, KAMPUNG PONG SELATAN   06350 ALOR SETAR', 1),
(77, 191, 3, 3, 11, '1', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(78, 192, 3, 1, 1, '3', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG  PIRING NAMI   08210 PADANG TERAP', 1),
(79, 193, 3, 2, 8, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(80, 194, 3, 1, 4, '3', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG DATOK MUKIM TEKAI KIRI NAKA   06350 ALOR SETAR', 1),
(81, 195, 3, 4, 7, '6', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(82, 196, 3, 3, 1, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG DATOK, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(83, 197, 3, 1, 5, '4', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. PADANG KERASAK JALAN NAKA   06350 ALOR SETAR', 1),
(84, 198, 3, 3, 16, '4', '3', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MK TEKAI KANAN   06350 ALOR SETAR', 1),
(85, 199, 3, 1, 10, '6', '11', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 4 PERUMAHAN KEDA PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(86, 200, 3, 1, 1, '3', '13', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU MUKIM TEKAI KIRI  06350 PADANG TERAP', 1),
(87, 201, 3, 1, 5, '5', '9', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 4, KG HUJUNG KETON MK PADANG KERBAU 06750 PENDANG KEDAH   06750 PENDANG', 1),
(88, 202, 3, 3, 19, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1A KG PONG MANIS,JLN NAKA   06350 PADANG TERAP', 1),
(89, 203, 3, 2, 16, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 26 1/2 KG TANDOP, JLN NAKA   06300 ALOR SETAR', 1),
(90, 204, 3, 2, 12, '5', '2', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 1 KUATERS KLINIK DESA BELUKAR LUAS MUKIM TEKAI KIRI, NAKA 06350 POKOK SENA', 1),
(91, 205, 3, 4, 1, '5', '12', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU BATU 20 1/4 JALAN NAKA   06350 ALOR SETAR', 1),
(92, 206, 3, 1, 4, '4', '3', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(93, 207, 3, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2 PERUMAHAN DESA KEDA KG HUJUNG KETON   06750 PENDANG', 1),
(94, 208, 3, 3, 19, '3', '6', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '8066 KG PAYA SIDANG MUKIM LESONG   06350 ALOR SETAR', 1),
(95, 209, 3, 1, 16, '3', '9', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(96, 210, 3, 3, 12, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 94 TAMAN SRI KEDA PONG SELATAN   06350 ALOR SETAR', 1),
(97, 211, 3, 1, 10, '5', '2', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 1A KAMPUNG DATOK LORONG HAJI YAAKOB MUKIM TEKAI 06350 POKOK SENA', 1),
(98, 212, 3, 2, 9, '1', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 33 JALAN NAKA ,MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(99, 213, 3, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG KENYENG, NAKA   06350 ALOR SETAR', 1),
(100, 214, 3, 1, 6, '6', '2', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'JALAN NAMI KAMPUNG CHANDENG JALAN NAKA  06350 ALOR SETAR', 1),
(101, 215, 4, 4, 6, '6', '11', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULOK NAKA   06350 ALOR SETAR', 1),
(102, 216, 4, 1, 4, '2', '11', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 65 DESA KEDA BENDANG TOK TERI NAKA   06350 ALOR SETAR', 1),
(103, 217, 4, 1, 1, '4', '9', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 15, KG. KG. LEBAI SAMAN   06300 KUALA NERANG', 1),
(104, 218, 4, 2, 8, '6', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(105, 219, 4, 1, 12, '7', '12', 1, 6, 2, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG CHANG DENG, JALAN NAKA 06350 ALOR SETAR   06350 ALOR SETAR', 1),
(106, 220, 4, 4, 8, '5', '11', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'NO 32 TAMAN DAHLIA, NAKA   06350 ALOR SETAR', 1),
(107, 221, 4, 4, 5, '1', '7', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG JALAN NAMI  06350 ALOR SETAR', 1),
(108, 222, 4, 3, 18, '3', '6', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN   06300 KUALA NERANG', 1),
(109, 223, 4, 4, 18, '1', '13', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 258 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(110, 224, 4, 3, 7, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 18 1/4 KAMPUNG BUKIT JALAN NAKA   06350 ALOR SETAR', 1),
(111, 225, 4, 3, 18, '3', '6', 2, 6, 2, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN   06350 ALOR SETAR', 1),
(112, 226, 4, 4, 10, '2', '13', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 251 KG BARU NAKA   06300 ALOR SETAR', 1),
(113, 227, 4, 4, 1, '6', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '12, LORONG 2 TAMAN MURAI JAYA   14100 SIMPANG AMPAT', 1),
(114, 228, 4, 4, 5, '2', '2', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG.BELUKAR LUAS 06350 NAKA KEDAH.   06350 NAKA', 1),
(115, 229, 4, 1, 7, '4', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(116, 230, 4, 4, 19, '3', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI, NAKA   06350 POKOK SENA', 1),
(117, 231, 4, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '44, PERUMAHAN KEDA KG PONG SELATAN NAKA NAKA 06350 ALOR SETAR', 1),
(118, 232, 4, 3, 9, '2', '11', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.82A KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(119, 233, 4, 1, 6, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(120, 234, 4, 2, 12, '4', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1 KG BENDANG TOK TERI NAKA   06350 ALOR SETAR', 1),
(121, 235, 4, 4, 11, '4', '2', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN, NAKA   06350 ALOR SETAR', 1),
(122, 236, 4, 1, 8, '4', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 53 PERUMAHAN KEDA KUBANG KENYENG   06300 KUALA NERANG', 1),
(123, 237, 4, 4, 7, '4', '11', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BLOCK C3 LADANG SUNGAI TEKAI JLN NAMI - NAKA  06350 ALOR SETAR', 1),
(124, 238, 4, 1, 9, '7', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LADANG SUNGAI TEKAI TRADEWINDS JALAN NAKA/NAMI  08300 ALOR SETAR', 1),
(125, 239, 4, 2, 6, '6', '13', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG BAGAN NAKA MUKIM TEKAI KIRI  06350 KUALA NERANG', 1),
(126, 240, 4, 3, 19, '1', '6', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '230B, KG BARU NAKA   06350 ALOR SETAR', 1),
(127, 241, 4, 1, 16, '6', '6', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(128, 242, 4, 4, 9, '7', '13', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(129, 243, 4, 4, 4, '1', '13', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG SUNGAI KAP NAMI   06300 KUALA NERANG', 1),
(130, 244, 4, 3, 11, '5', '8', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK JALAN NAKA MUKIM TEKAI KANAN  06350 ALOR SETAR', 1),
(131, 245, 4, 1, 18, '7', '11', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '1045 TAMAN SRI NAKA   06350 ALOR SETAR', 1),
(132, 246, 4, 4, 11, '7', '5', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'lot 53 kg sri ampangan   08600 kota kualamuda', 1),
(133, 247, 5, 4, 2, '3', '1', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, NAKA 06350 ALOR SETAR KEDAH   06350 NAKA', 1),
(134, 248, 5, 2, 18, '2', '1', 1, 2, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 237 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(135, 249, 5, 4, 18, '1', '5', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI  06350 NAKA', 1),
(136, 250, 5, 100, 100, '100', '100', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 222, KG BARU NAKA ALOR SETAR  06350 BESERI', 1),
(137, 251, 5, 2, 19, '3', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 29.5KG BUKITJLN NAKA   06350 ALOR SETAR', 1),
(138, 252, 5, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS MUKIM TEKAI KIRI NAKA 06350 Pokok Sena', 1),
(139, 253, 5, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU NAKA   06350 ALOR SETAR', 1),
(140, 254, 5, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG POKOK MACANG   08010 SUNGAI PETANI', 1),
(141, 255, 5, 2, 9, '2', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS MUKIM TEKAI KIRI   06350 KUALA NERANG', 1),
(142, 256, 5, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP, BATU 27, JALAN NAKA NAMI   06350 ALOR SETAR', 1),
(143, 257, 5, 4, 6, '3', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 29 KAMPUNG BUKIT JALAN NAKA   06350 ALOR SETAR', 1),
(144, 258, 5, 3, 4, '7', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 18,  JALAN NAKA   06350 ALOR SETAR', 1),
(145, 259, 5, 2, 12, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(146, 260, 5, 3, 11, '2', '5', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(147, 261, 5, 2, 1, '1', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU19 1/2 KAMPUNG BUKIT JALAN NAKA   06400 POKOK SENA', 1),
(148, 262, 5, 2, 8, '2', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG SELATAN NAKA  06350 ALOR SETAR', 1),
(149, 263, 5, 4, 5, '2', '13', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(150, 264, 5, 3, 7, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG SELATAN MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(151, 265, 5, 3, 19, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 15 PERUMAHAN KEDA KAMPUNG BAGAN NAKA   06350 ALOR SETAR', 1),
(152, 266, 5, 2, 16, '3', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(153, 267, 5, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG NAMI   08210 SIK', 1),
(154, 268, 5, 2, 10, '1', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 71 DESA KEDA BENDANG TOK TERI MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(155, 269, 5, 2, 9, '3', '9', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(156, 270, 5, 3, 19, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI   06350 NAKA', 1),
(157, 271, 5, 1, 10, '5', '12', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(158, 272, 5, 4, 9, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(159, 273, 5, 2, 6, '5', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2, KAMPUNG  BATU 27 JLN NAMI  06350 ALOR SETAR', 1),
(160, 274, 5, 4, 6, '4', '5', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG SUNGAI KAP MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(161, 275, 5, 2, 12, '5', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK MUKIM TEKAI KANAN NAKA   06350 ALOR SETAR', 1),
(162, 276, 5, 3, 4, '3', '12', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN NAKA  06350 ALOR SETAR', 1),
(163, 277, 5, 4, 18, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(164, 278, 5, 3, 11, '1', '9', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG  BARU NAKA MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(165, 279, 6, 1, 15, '6', '13', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, MUKIM TEKAI KIRI, KUALA NERANG   06300 KUALA NERANG', 1),
(166, 280, 6, 2, 13, '2', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG HUJONG KETUN , MUKIM PADANG KERBAU   06750 PENDANG', 1),
(167, 281, 6, 4, 16, '1', '3', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG   06350 ALOR SETAR', 1),
(168, 282, 6, 3, 15, '2', '2', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS, MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(169, 283, 6, 2, 13, '6', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATUK MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(170, 284, 6, 3, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(171, 285, 6, 1, 15, '3', '8', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN JALAN NAKA, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(172, 286, 6, 1, 13, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(173, 287, 6, 2, 3, '1', '10', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(174, 288, 6, 2, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATUK, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(175, 289, 6, 2, 13, '7', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN   06350 ALOR SETAR', 1),
(176, 290, 6, 3, 3, '2', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BENDANG TOK TERI NAKA  06350 ALOR SETAR', 1),
(177, 291, 6, 3, 15, '1', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.59 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(178, 292, 6, 4, 15, '4', '14', 1, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'BATU 20, JALAN KAMPUNG BUKIT, MUKIM BUKIT LADA,  06400 POKOK SENA', 1),
(179, 293, 6, 3, 13, '2', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 31 KAMPUNG BENDANG TOK TERI   06350 ALOR SETAR', 1),
(180, 294, 6, 4, 3, '4', '11', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'LOT 1395 BELAKANG TAMAN NAKA JAYA   06350 ALOR SETAR', 1),
(181, 295, 6, 2, 15, '3', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS MUKIM TEKAI KIRI NAKA 06350 Pokok Sena', 1),
(182, 296, 6, 1, 15, '2', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 10 PENEMPATAN KEDA KG BUKIT JALAN NAKA   06400 POKOK SENA', 1),
(183, 297, 6, 2, 13, '1', '2', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP BESAR MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(184, 298, 6, 1, 6, '1', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '164 KG BERDIKARI NAKA   06350 ALOR SETAR', 1),
(185, 299, 6, 4, 13, '7', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK, NAKA   06350 ALOR SETAR', 1),
(186, 300, 6, 3, 12, '1', '8', 1, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'KM 29.5, KAMPUNG BUKIT, JALAN NAKA  06350 POKOK SENA', 1),
(187, 301, 6, 1, 15, '4', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(188, 302, 6, 2, 13, '4', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP BESAR MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(189, 303, 6, 4, 15, '6', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'E7 KUATERS IKBN NAKA MUKIM TEKAI PEKAN NAKA  06350 ALOR SETAR', 1),
(190, 304, 6, 1, 13, '5', '7', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(191, 305, 6, 2, 15, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 51A KG PADANG KERASAK  06350 ALOR SETAR', 1),
(192, 306, 6, 1, 13, '5', '7', 2, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'KAMPUNG PADANG KERASAK JALAN NAKA MUKIM TEKAI KANAN 06350 ALOR SETAR', 1),
(193, 307, 6, 4, 15, '5', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 14/2, LORONG KERASAK KG. BELUKAR LUAS MUKIM TEKAI KIRI, NAKA 06350 Pokok Sena', 1),
(194, 308, 6, 1, 3, '3', '10', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, NAKA   06350 NAKA', 1),
(195, 309, 6, 4, 15, '3', '11', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU NAKA  06350 ALOR SETAR', 1),
(196, 310, 6, 1, 13, '1', '12', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP, LAMDIN, NAKA   06350 ALOR SETAR', 1),
(197, 311, 6, 2, 3, '2', '10', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(198, 312, 7, 2, 14, '6', '8', 2, 1, 1, 2, '634bdc19b69f9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA   06350 POKOK SENA', 1),
(199, 313, 7, 4, 8, '5', '13', 2, 1, 1, 2, '634bd8542b01c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 35, KG. DATOK,   06350 POKOK SENA', 1),
(200, 314, 7, 3, 14, '3', '4', 2, 1, 1, 2, '634bd9f3eedad.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA   06350 POKOK SENA', 1),
(201, 315, 7, 1, 14, '6', '4', 2, 1, 1, 2, '634bdb7dc870a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA,   06350 POKOK SENA', 1),
(202, 316, 7, 2, 14, '6', '4', 2, 1, 1, 2, '634bd903424b1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATOK   06350 POKOK SENA', 1),
(203, 317, 7, 4, 13, '5', '3', 2, 1, 1, 2, '634bd94f9ca40.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN   06350 POKOK SENA', 1),
(204, 318, 7, 4, 14, '7', '13', 1, 1, 1, 2, '634bde4f2b346.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(205, 319, 7, 2, 14, '6', '8', 1, 1, 1, 2, '634bde206a159.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG SETOL MUKIM PEDU   06300 KUALA NEARNG', 1),
(206, 320, 7, 2, 7, '6', '6', 1, 1, 1, 2, '634bddfc60375.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG MUKIM TEKAI KANAN   06350 NAKA', 1),
(207, 321, 7, 2, 3, '6', '10', 1, 1, 1, 2, '634bd73b311f0.jpg', 'Tidak', 'YA', 'Tidak', 'NO. 39B, KG. MASJID LAMA   06350 POKOK SENA', 1),
(208, 322, 7, 3, 7, '6', '6', 1, 1, 1, 2, '634bde87649f8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 1 LOT 4102 KAMPUNG MASJID BARU,   06350 ALOR SETAR', 1),
(209, 323, 7, 2, 4, '3', '1', 1, 1, 1, 2, '634bdd0298756.jpg', 'Tidak', 'YA', 'Tidak', 'NO 57 , KG TANDOP BESAR,   06350 ALOR SETAR', 1),
(210, 324, 7, 4, 7, '6', '14', 1, 1, 1, 2, '634bd7a02786a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 1060, TAMAN NAKA JAYA   06350 ALOR SETAR', 1),
(211, 325, 7, 3, 17, '4', '6', 1, 1, 1, 2, '634bd6dda5576.jpg', 'Tidak', 'YA', 'Tidak', 'NO 39B KAMPUNG MASJID LAMA,   06350 ALOR SETAR', 1),
(212, 326, 7, 2, 8, '6', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(213, 327, 7, 2, 3, '6', '10', 2, 1, 1, 2, '634bddaeb0312.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(214, 328, 7, 3, 3, '3', '10', 2, 1, 1, 2, '634bdd6beebaa.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN,MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(215, 329, 7, 2, 5, '3', '1', 2, 1, 1, 2, '634bdb26af279.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 58, PEKAN NAKA, ALOR SETAR   06350 ALOR SETAR', 1),
(216, 330, 7, 4, 3, '3', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 55, KAMPUNG PONG SELATAN, NAKA   06350 ALOR SETAR', 1),
(217, 331, 7, 4, 14, '5', '1', 2, 1, 1, 2, '634bdca3c86f8.jpg', 'Ya', 'TIDAK', 'Tidak', 'LOT 4777  JALAN NAKA KAMPUNG MASJID BARU   06350 KUALA NERANG', 1),
(218, 332, 7, 3, 15, '3', '8', 2, 1, 1, 2, '634bd8b80f1db.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LUBUK ITON   06350 POKOK SENA', 1),
(219, 333, 7, 2, 12, '5', '6', 2, 1, 1, 2, '634bda4691af9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN NAKA   06350 ALOR SETAR', 1),
(220, 334, 7, 1, 16, '4', '8', 2, 1, 1, 2, '634bda7a4a146.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN NAKA, LORONG BUKIT PAK JORA,   06350 KUALA NERANG ', 1),
(221, 335, 7, 4, 3, '3', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 94 PERUMAHAN KEDA PONG SELATAN   06350 ALOR SETAR', 1),
(222, 336, 7, 2, 14, '3', '4', 2, 1, 1, 2, '634bd7ec4383a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATOK   06350 POKOK SENA', 1),
(223, 337, 7, 1, 17, '6', '13', 2, 1, 1, 2, '634bdbf1a3761.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA   06350 POKOK SENA', 1),
(224, 338, 8, 2, 16, '4', '8', 1, 1, 1, 2, '62fc5a2d6638f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS MUKIM TEKAI KANAN   06350 POKOK SENA', 1),
(225, 339, 8, 2, 19, '7', '7', 1, 1, 1, 2, '62dcbb168156c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK JALAN NAKA  06350 POKOK SENA', 1),
(226, 340, 8, 3, 10, '4', '4', 2, 1, 1, 2, '62fc5ab4b9e52.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCHAN, JALAN SUNGAI TIANG.   06750 BUKIT MERTAJAM', 1),
(227, 341, 8, 1, 1, '3', '8', 2, 1, 1, 2, '62d9201755a27.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 6 KAMPUNG KUBANG JULUK NAKA   06350 POKOK SENA', 1),
(228, 342, 8, 1, 1, '3', '8', 2, 1, 1, 2, '62fc5b5416776.jpg', 'Tidak', 'TIDAK', 'Tidak', '1101 TAMAN DESA IMPIAN NAKA   06350 ALOR SETAR', 1),
(229, 343, 8, 2, 3, '6', '10', 2, 1, 1, 2, '62f328cf6ca5a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 55A,KG BARU,JALAN LAMPAM,  MUKIM LESUNG,   06400 ALOR SETAR', 1),
(230, 344, 8, 3, 1, '5', '7', 2, 1, 1, 2, '62d91e8614bee.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU NAKA   06350 ALOR SETAR', 1),
(231, 345, 8, 1, 6, '1', '12', 1, 1, 1, 2, '62d91d703ba3f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KUATERS C,IKBN NAKA, MUKIM TEKAI KANAN, PEKAN NAKA 06350 POKOK SENA', 1),
(232, 346, 8, 4, 7, '7', '8', 1, 1, 1, 2, '62f32877052ad.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 383 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(233, 347, 8, 3, 16, '6', '9', 1, 1, 1, 2, '62d920ad8146f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA   06350 POKOK SENA', 1),
(234, 348, 8, 3, 10, '6', '6', 1, 1, 1, 2, '62f3293cf3247.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN   06300 KUALA NERANG', 1),
(235, 349, 8, 2, 10, '7', '5', 1, 1, 1, 2, '62fc5bff171ee.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN MUKIM TEKAI KIRI NAKA   06350 ALOR SETAR', 1),
(236, 350, 8, 1, 7, '6', '1', 1, 1, 1, 2, '62f327bc5fb6c.jpg', 'Tidak', 'YA', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI, 06350, NAKA, ALOR SETAR, KEDAH  06350 POKOK SENA', 1),
(237, 351, 8, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID LAMA   06350 NAKA', 1),
(238, 352, 8, 3, 17, '5', '13', 2, 1, 1, 2, '62fc5d9a00525.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP BESAR, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(239, 353, 8, 2, 1, '6', '7', 2, 1, 1, 2, '62fc5dd12a6d2.jpg', 'Tidak', 'YA', 'Tidak', 'KG KUBANG BEMBAN   06300 KUALA NERANG', 1),
(240, 354, 8, 2, 1, '2', '7', 2, 1, 1, 2, '62fc5e0940550.jpg', 'Tidak', 'YA', 'Tidak', 'KG KUBANG BEMBAN   06300 KUALA NERANG', 1),
(241, 355, 8, 4, 11, '3', '11', 2, 5, 1, 2, '62fc6371101df.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 19, KAMPUNG PADANG KERASAK, JLN NAKA MUKIM TEKAI 06350 ALOR SETAR', 1),
(242, 356, 8, 3, 8, '6', '13', 2, 1, 1, 2, '62fc63b5bb826.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(244, 357, 8, 2, 13, '3', '8', 2, 1, 1, 2, '62fc5e5184595.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(245, 358, 8, 4, 13, '4', '3', 2, 1, 1, 2, '62f32ab9029c2.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN   06350 POKOK SENA', 1),
(246, 359, 8, 3, 8, '1', '13', 2, 1, 1, 2, '62fc60e8a79d8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK, JALAN NAKA   06350 POKOK SENA', 1),
(247, 360, 8, 4, 13, '4', '3', 2, 1, 1, 2, '62fc61390ad8d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KUATERS KLINIK DESA KG BELUKAR LUAS MKM TEKAI KIRI  06350 NAKA', 1),
(248, 361, 8, 1, 8, '6', '7', 2, 1, 1, 2, '62fc61a33c21e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULOK   06350 ALOR SETAR', 1),
(249, 362, 8, 3, 13, '3', '6', 2, 1, 1, 2, '62dcbc0a50d01.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(250, 363, 8, 4, 19, '7', '1', 2, 1, 1, 2, '62d91f6245d12.jpg', 'Tidak', 'YA', 'Tidak', 'KG KUBANG BEMBAN   06350 ALOR SETAR', 1),
(251, 364, 8, 2, 17, '5', '13', 2, 1, 1, 2, '62d91dc7e1466.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 100 PERUMAHAN KEDA PONG SELATAN, NAKA   06530 ALOR SETAR', 1),
(252, 365, 8, 1, 6, '3', '7', 2, 1, 1, 2, '62fdd3c4a27f0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN   06350 POKOK SENA', 1),
(253, 366, 8, 2, 10, '4', '1', 2, 1, 1, 2, '62fc6317130da.jpg', 'Tidak', 'YA', 'Tidak', 'NO 33 DESA KEDA HUJUNG KETON   06750 PENDANG', 1),
(254, 367, 9, 3, 1, '6', '9', 1, 1, 1, 2, '62fd9c15aafc3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(255, 368, 9, 2, 5, '7', '5', 1, 1, 1, 2, '6301ac5f48b82.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK,NAKA   06350 ALOR SETAR', 1),
(256, 369, 9, 2, 18, '1', '12', 2, 4, 2, 2, '62fd9ce9d3255.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN NAKA   06350 ALOR SETAR', 1),
(257, 370, 9, 3, 15, '3', '7', 2, 4, 2, 2, '62fd9c90c9ec9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(258, 371, 9, 4, 19, '4', '6', 2, 4, 2, 2, '62fd9d153653c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP,  MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(259, 372, 9, 3, 19, '1', '6', 2, 4, 2, 2, '62fd9e36883ba.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BARU LUBUK RAMBAI, MUKIM TEKAI KIRI,   06300 KUALA NERANG', 1),
(260, 373, 9, 1, 4, '4', '13', 1, 1, 1, 2, '62fd9dc876ac3.jpg', 'Tidak', 'YA', 'Tidak', 'NO.31 PERUMAHAN KEDA DESA BAGAN NAKA   06350 ALOR SETAR', 1),
(261, 374, 9, 2, 9, '2', '14', 1, 1, 1, 2, '6301ae787e4a2.jpg', 'Ya', 'YA', 'Tidak', 'KG LUBUK PERONG   06300 KUALA NERANG', 1),
(262, 375, 9, 4, 11, '6', '6', 1, 1, 1, 2, '62fd9efe12e7d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BENDANG TOK TERI NAKA   06350 ALOR SETAR', 1),
(263, 376, 9, 1, 7, '2', '14', 1, 1, 1, 2, '62fd9df8cf047.jpg', 'Tidak', 'YA', 'Tidak', 'KG PONG MANIS   06300 KUALA NERANG', 1),
(264, 377, 9, 2, 11, '2', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN   06350 POKOK SENA', 1),
(265, 378, 9, 3, 13, '6', '12', 1, 8, 1, 2, '6301af12c5dbf.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG TOK SALAM, MUKIM TEKAI KANAN,   06350 ALOR SETAR', 1),
(266, 379, 9, 4, 11, '6', '14', 1, 1, 1, 2, '6301aec695b9f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS   06350 POKOK SENA', 1),
(267, 380, 9, 2, 7, '7', '5', 1, 1, 1, 2, '6301ae200fe12.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU MUKIM LESONG   06350 ALOR SETAR', 1),
(268, 381, 9, 2, 7, '6', '8', 1, 4, 2, 2, '6301af498f297.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG MUKIM TEKAI KIRI   06300 ALOR SETAR', 1),
(269, 382, 9, 1, 11, '3', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 144 PEKAN NAKA   06350 ALOR SETAR', 1),
(270, 383, 9, 3, 1, '1', '6', 2, 1, 1, 2, '62fd9c64740e6.jpg', 'Tidak', 'YA', 'Tidak', 'KG BAGAN NAKA   06350 ALOR SETAR', 1),
(271, 384, 9, 4, 1, '1', '5', 1, 4, 2, 2, '6301afbc08af7.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, NAKA, 06350 ALOR SETAR, KEDAH   06350 ALOR SETAR', 1),
(272, 385, 9, 1, 15, '1', '4', 2, 4, 2, 2, '62fd9e707075d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 29KG PADANG,JLN NAMI NAKA, ,   06350 ALOR SETAR', 1),
(273, 386, 9, 2, 19, '3', '1', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(274, 387, 9, 3, 16, '3', '3', 2, 1, 1, 2, '6301b0d305916.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN   06350 POKOK SENA', 1),
(275, 388, 9, 3, 18, '4', '1', 2, 4, 2, 2, '62fd9d4d25b42.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG SUNGAI KAP MUKIM TEKAI KIRI   06300 SIK', 1),
(276, 389, 9, 4, 19, '1', '5', 1, 4, 2, 2, '6301b05816d94.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG.CHANGDENG, NAKA,   06350 ALOR SETAR', 1),
(277, 390, 9, 2, 18, '1', '1', 2, 4, 2, 2, '62fd9e9a049c6.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG CHAND DENG NAKA   06350 ALOR SETAR', 1),
(278, 391, 9, 4, 1, '4', '9', 1, 4, 2, 2, '6301b00c6bebe.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LUBUK RAMBAI,   06300 KUALA NERANG', 1),
(279, 392, 10, 1, 16, '2', '9', 1, 1, 1, 2, '62d4de8a6a8ee.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 55, JALAN KEDA PONG SELATAN, PEKAN NAKA  06350 Pokok Sena', 1),
(280, 393, 10, 4, 5, '7', '3', 2, 1, 1, 2, '62f118845101b.jpg', 'Tidak', 'YA', 'Tidak', 'NO 24 A,BATU 17, JALAN NAKA,KUBUR PANJANG   06350 POKOK SENA', 1),
(281, 394, 10, 3, 18, '3', '9', 1, 4, 2, 2, '62d4da5c7f51f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG SUNGAI KAP   06350 ALOR SETAR', 1),
(282, 395, 10, 4, 18, '3', '14', 1, 4, 2, 2, '62d4dacea77a4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(283, 396, 10, 1, 12, '4', '9', 1, 1, 1, 2, '62f118437a881.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO E6 , KUARTERS IKBN NAKA, MUKIM TEKAI ,PEKAN NAKA,  06350 ALOR SETAR', 1),
(284, 397, 10, 3, 5, '3', '14', 1, 1, 1, 2, '62d4db1201fdc.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 19  1/4, KAMPONG BUKIT, JALAN NAKA   06350 POKOK SENA', 1),
(285, 398, 10, 4, 12, '2', '9', 1, 1, 1, 2, '62d4deb90b876.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(286, 399, 10, 3, 10, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 29, KAMPONG BUKIT, JALAN NAKA   06350 POKOK SENA', 1),
(287, 400, 10, 1, 11, '7', '14', 1, 1, 1, 2, '62d4dee743400.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(288, 401, 10, 4, 4, '4', '13', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG BAGAN NAKA MUKIM TEKAI KIRI 06350 POKOK SENA', 1),
(289, 402, 10, 4, 6, '4', '1', 1, 1, 1, 2, '62d4db4cb512f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG SUNGAI KOROK MUKIM PADANG KERBAU   06750 PENDANG', 1),
(290, 403, 10, 4, 15, '7', '12', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 49 PERUMAHAN KEDA KAMPUNG BAGAN NAKA PERUMAHAN KEDA KAMPUNG BAGAN NAKA 06350 POKOK SENA', 1),
(291, 404, 10, 1, 15, '4', '5', 1, 1, 1, 2, '62d4db808fd7c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG LINCHAN JLN SUNGAI TIANG   06750 PENDANG', 1),
(292, 405, 10, 3, 12, '2', '9', 1, 1, 1, 2, '62f11804c4960.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 1079 TAMAN NAKA JAYA   06350 ALOR SETAR', 1),
(293, 406, 10, 100, 100, '100', '100', 1, 1, 1, 2, '62f1177a88ca9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG   06300 KUALA NERANG', 1),
(294, 407, 10, 1, 15, '2', '12', 2, 1, 1, 2, '62d4dbb631abc.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG TOK SALAM MUKIM TEKAI KANAN,NAKA   06350 POKOK SENA', 1),
(295, 408, 10, 3, 4, '2', '6', 2, 1, 1, 2, '62f117bdeb172.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 96 PERUMAHAN KEDA PONG SELATAN NAKA   06350 POKOK SENA', 1),
(296, 409, 10, 3, 15, '2', '12', 2, 1, 1, 2, '62d4dbf9f2d8f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK   06350 ALOR SETAR', 1),
(297, 410, 10, 1, 6, '2', '13', 2, 1, 1, 2, '62d4dc4cd8619.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 61PERUMAHAN KEDA KAMPUNG BAGAN NAKA   06350 ALOR SETAR', 1),
(298, 411, 10, 2, 17, '2', '12', 2, 1, 1, 2, '62d4dc82bae78.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 29.5, KG BUKIT, JLN NAKA,   06350 POKOK SENA', 1),
(299, 412, 10, 2, 19, '5', '3', 2, 1, 1, 2, '62d4dcb02e7b1.jpg', 'Tidak', 'YA', 'Tidak', 'BATU 17,JALAN NAKA   06350 POKOK SENA', 1),
(300, 413, 10, 1, 1, '3', '13', 1, 6, 2, 2, '62d4de02c3337.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG, MUKIM LESONG, KEDAH.   06350 POKOK SENA', 1),
(301, 414, 10, 2, 16, '3', '4', 2, 4, 2, 2, '62d4de290d84d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, NAKA, 06350 ALOR SETAR, KEDAH.   06350 ALOR SETAR', 1),
(302, 415, 10, 1, 12, '3', '1', 1, 4, 2, 2, '62d4de4c672c0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(303, 416, 11, 1, 4, '2', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK MUKIM TEKAI KANAN,   06350 ALOR SETAR', 1),
(304, 417, 11, 3, 6, '2', '7', 1, 4, 2, 2, '62fd991729879.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 264 KG BARU NAKA   06350 ALOR SETAR', 1),
(305, 418, 11, 2, 15, '1', '12', 2, 6, 2, 2, '62d924408ef96.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 257 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(306, 419, 11, 1, 18, '3', '13', 1, 4, 2, 2, '62fd993a79825.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.43, KG. CHANGDENG, MUKIM TEKAI KIRI, NAKA  06350 ALOR SETAR', 1),
(307, 420, 11, 1, 16, '4', '9', 1, 4, 2, 2, '62d92250abbe2.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI, NAKA  06350 ALOR SETAR', 1),
(308, 421, 11, 1, 18, '3', '13', 2, 6, 2, 2, '62d92533e4490.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP, MUKIM TEKAI KIRI, NAKA  06350 ALOR SETAR', 1),
(309, 422, 11, 2, 5, '6', '9', 1, 6, 2, 2, '62d922f05a4e4.jpg', 'Tidak', 'TIDAK', 'Tidak', '27, KAMPUNG CHANG DENG, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(310, 423, 11, 3, 18, '1', '12', 2, 4, 2, 2, '62fd9979e5f17.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LUBOK RAMBAI, MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(311, 424, 11, 3, 15, '2', '12', 1, 1, 1, 2, '62fd99adea9c5.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG. KUBANG JULOK, MUKIM TEKAI KANAN, NAKA  06350 ALOR SETAR', 1),
(312, 425, 11, 1, 11, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(313, 426, 11, 2, 6, '7', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS NAKA  06350 ALOR SETAR', 1),
(314, 427, 11, 4, 1, '4', '8', 1, 1, 1, 2, '62fd9b3e4c54a.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG TOK  SALAM MUKIM TEKAI KANAN  06350 ALOR SETAR', 1),
(315, 428, 11, 2, 11, '4', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG FELCRA KUBANG KENYENG, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(316, 429, 11, 1, 11, '7', '12', 1, 1, 1, 2, '62fd9a1291579.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG KENYENG MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(317, 430, 11, 3, 11, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP BESAR MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(318, 431, 11, 1, 5, '4', '12', 1, 1, 1, 2, '62d924064df0d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULOK MUKIM TEKAI KANAN NAKA   06350 ALOR SETAR', 1),
(319, 432, 11, 4, 4, '2', '13', 2, 1, 1, 2, '62fd9a5ec4fc8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 50, PERUMAHAN KEDA KG BAGAN, NAKA,   06350 ALOR SETAR', 1),
(320, 433, 11, 1, 18, '1', '9', 2, 6, 2, 2, '62d9238231728.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 27, KAMPUNG LUBOK RAMBAI, JALAN NAMI NAKA,   06350 ALOR SETAR', 1),
(321, 434, 11, 2, 18, '1', '4', 2, 6, 2, 2, '62d923c0a32c4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(322, 435, 11, 4, 4, '2', '6', 2, 1, 1, 2, '62d922a4b873e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN , MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(323, 436, 11, 1, 18, '1', '4', 2, 6, 2, 2, '62fd9a9bddbd7.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(324, 437, 11, 3, 18, '1', '14', 1, 6, 2, 2, '62fd9ad98d71a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 33 JALAN NAKA,   06400 POKOK SENA', 1),
(325, 438, 11, 1, 16, '2', '6', 2, 1, 1, 2, '62d9233846a85.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LOT 2 KG BERDIKARI   06350 POKOK SENA', 1),
(326, 439, 11, 3, 18, '1', '12', 2, 6, 2, 2, '62fd9b0c8b583.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, NAKA, MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(327, 440, 12, 1, 10, '7', '13', 1, 1, 1, 2, '62fdc7d29bb84.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 29, KAMPONG BUKIT, JALAN NAKA KEDAH.   06400 POKOK SENA', 1),
(328, 441, 12, 4, 1, '5', '6', 2, 1, 1, 2, '62fdbf9d2d35c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.3,TAMAN RAMUNIA, JALAN YAN, 08800 GUAR CHEMPEDAK KEDAH.   08800 GUAR CHEMPEDAK', 1),
(329, 442, 12, 4, 8, '5', '3', 2, 1, 1, 2, '62fdbfc4ba646.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.13, JALAN INDAH 1 TAMAN PERAK INDAH   31900 KAMPAR', 1),
(330, 443, 12, 3, 10, '7', '7', 1, 1, 1, 2, '62fdd237770d4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 1, PERUMAHAN KEDA PONG SELATAN   06350 POKOK SENA', 1),
(331, 444, 12, 4, 8, '4', '3', 1, 1, 1, 2, '62fdc8adda07f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG NAKA   06350 ALOR SETAR', 1),
(332, 445, 12, 2, 8, '4', '3', 1, 1, 1, 2, '62fdd204b5ad6.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.99, PEKAN NAKA,   06350 POKOK SENA', 1),
(333, 446, 12, 3, 10, '7', '13', 1, 1, 1, 2, '62fdc7fea0ccb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS, MUKIM TEKAI KIRI,  06350 POKOK SENA', 1),
(334, 447, 12, 4, 3, '4', '10', 1, 1, 1, 2, '62fdd271918f8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK,NAKA   06350 ALOR SETAR', 1),
(335, 448, 12, 4, 3, '3', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU KAMPUNG BUKIT JALAN NAKA   06350 POKOK SENA', 1),
(336, 449, 12, 3, 8, '4', '3', 1, 1, 1, 2, '62fdd30eaf6c8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 10 LORONG 6, KG PADANG KERASAK , JALAN NAKA, 06350 POKOK SENA', 1),
(337, 450, 12, 3, 3, '4', '10', 1, 1, 1, 2, '62fdc778374b2.jpg', 'Tidak', 'YA', 'Tidak', 'NO. 70,KG HUJUNG KETUN, MUKIM PADANG KERBAU  06750 PENDANG', 1),
(338, 451, 12, 2, 8, '4', '3', 1, 1, 1, 2, '62fdc8da7459c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LOT 3 KAMPUNG BERDIKARI, NAKA,  06350 POKOK SENA', 1),
(339, 452, 12, 1, 7, '3', '1', 1, 1, 1, 2, '62fdc7b1e2893.jpg', 'Ya', 'TIDAK', 'Tidak', 'NO13, PERUMAHAN KEDA PONG SELATAN, NAKA 06350 POKOK SENA', 1),
(340, 453, 12, 1, 13, '1', '7', 2, 1, 1, 2, '62fdc0d444544.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG SELATAN, NAKA,   06350 POKOK SENA', 1),
(341, 454, 12, 2, 10, '6', '7', 2, 1, 1, 2, '62fdc826a2cec.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.43 PERUMAHAN KEDA PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(342, 455, 12, 4, 19, '7', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MUKIM TEKAI KANAN  06350 ALOR SETAR', 1),
(343, 456, 12, 1, 12, '5', '1', 2, 1, 1, 2, '62fdbf34e9f71.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU, NAKA   06350 ALOR SETAR', 1),
(344, 457, 12, 2, 7, '5', '13', 2, 1, 1, 2, '62fdc07116f02.jpg', 'Tidak', 'TIDAK', 'Tidak', '58, KAMPUNG LINCHAN,   06750 PENDANG', 1),
(345, 458, 12, 3, 10, '4', '8', 2, 1, 1, 2, '62fdc098869dc.jpg', 'Tidak', 'TIDAK', 'Tidak', '58, KAMPUNG LINCHAN,   06750 PENDANG', 1),
(346, 459, 12, 4, 1, '5', '13', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU, MUKIM TEKAI KIRI, NAKA  06350 ALOR SETAR', 1),
(347, 460, 12, 1, 4, '2', '8', 2, 1, 1, 2, '62fdc720c47e4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS MUKIM TEKAI KANAN  06350 NAKA', 1),
(348, 461, 12, 1, 9, '7', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(349, 462, 12, 4, 9, '7', '3', 2, 1, 1, 2, '62fdd2a77039c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'FELCRA KG KUBANG KENYENG   06350 ALOR SETAR', 1),
(350, 463, 12, 2, 8, '7', '8', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG.TANDOP BESAR, MUKIM TEKAI KANAN, NAKA   06350 ALOR SETAR', 1),
(351, 464, 12, 4, 16, '6', '1', 2, 4, 2, 2, '62fdc84b64906.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG, JALAN NAMI NAKA   06350 ALOR SETAR', 1),
(352, 465, 12, 3, 12, '3', '6', 1, 4, 2, 2, '62fdc87c0625a.jpg', 'Tidak', 'TIDAK', 'Tidak', '265 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(353, 466, 12, 3, 1, '5', '13', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '105 PEKAN NAKA, 06350 ALOR SETAR KEDAH DARUL AMAN   06350 ALOR SETAR', 1),
(354, 467, 12, 2, 17, '4', '1', 2, 1, 1, 2, '62fdbff24fad3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG BAKONG, MUKIM TEKAI KANAN,   06350 ALOR SETAR', 1),
(355, 468, 12, 4, 16, '1', '8', 2, 4, 2, 2, '62fdc017cb639.jpg', 'Tidak', 'TIDAK', 'Tidak', 'Kg Chang Deng, Mukim Tekai Kiri   06350 ALOR SETAR', 1),
(356, 469, 12, 3, 13, '6', '1', 2, 1, 1, 2, '62fdc039be94b.jpg', 'Tidak', 'TIDAK', 'Tidak', '92, LORONG 6, TAMAN DESA IMPIAN, NAKA,  06350 POKOK SENA', 1),
(357, 470, 13, 1, 5, '3', '6', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'Kg Tandop Besar   06300 KUALA NERANG', 1),
(358, 471, 13, 3, 5, '3', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'Kg Kubang Kenyeng   06300 KUALA NERANG', 1),
(359, 472, 13, 3, 11, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG.BUKIT NAMBUA   06350 ALOR SETAR', 1),
(360, 473, 13, 3, 5, '6', '13', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 34 PERUMAHAN KEDA KAMPUNG BAGAN NAKA   06350 ALOR SETAR', 1),
(361, 474, 13, 2, 5, '5', '13', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'Kampong Datuk,Mukim Tekai Kiri, 06350 Alor Setar.   06350 Pokok Sena', 1),
(362, 475, 13, 1, 1, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK,JLN NAKA   06350 ALOR SETAR', 1),
(363, 476, 13, 4, 11, '1', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 32,KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(364, 477, 13, 2, 9, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 20 PERUMAHAN KEDA KG BAGAN NAKA   06350 ALOR SETAR', 1),
(365, 478, 13, 3, 11, '2', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG, NAKA,   06350 ALOR SETAR', 1),
(366, 479, 13, 2, 11, '1', '9', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'NO 30 PERUMAHAN KEDA, PONG SELATAN   06350 ALOR SETAR', 1),
(367, 480, 13, 1, 1, '6', '3', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. PONG MANIS, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(368, 481, 13, 2, 5, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG PONG MANIS   06300 KUALA NERANG', 1);
INSERT INTO `maklumat_murid` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_rumah_sukan`, `id_kelabP`, `id_uniform`, `id_sukanP`, `id_jantina`, `id_kaum`, `id_agama`, `id_sesi`, `image`, `yatim`, `asrama`, `oku`, `alamat`, `id_status`) VALUES
(369, 482, 13, 4, 5, '7', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 79 DESA KEDA KG BENDANG TOK TERI   06350 ALOR SETAR', 1),
(370, 483, 13, 1, 5, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG LEBAI SAMAN, NAKA   06350 POKOK SENA', 1),
(371, 484, 13, 3, 5, '7', '6', 2, 1, 1, 2, '62f064c024ce1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS.MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(372, 485, 13, 2, 14, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'Kampung datuk,mukim tekai kiri,06350,naka,kedah   06350 Pokok Sena', 1),
(373, 486, 13, 1, 5, '5', '6', 2, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'KG PONG MANIS,MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(374, 487, 13, 1, 4, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID LAMA, NAKA   06350 POKOK SENA', 1),
(375, 488, 13, 2, 6, '6', '8', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 54 A KAMPUNG PADANG MUKIM GAJAH MATI   06400 POKOK SENA', 1),
(376, 489, 13, 2, 4, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS, NAKA   06350 POKOK SENA', 1),
(377, 490, 13, 2, 4, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '47, TAMAN DESA SAPURA, 06300 KUALA NERANG.   06300 KUALA NERANG', 1),
(378, 491, 13, 3, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG LEBAI SAMAN, NAKA   06350 POKOK SENA', 1),
(379, 492, 13, 2, 5, '5', '6', 2, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'KAMPUNG BARU MUKIM LESONG   06350 ALOR SETAR', 1),
(380, 493, 13, 2, 5, '5', '13', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG MASJID LAMA, NAKA   06350 POKOK SENA', 1),
(381, 494, 14, 4, 1, '5', '6', 2, 1, 1, 2, '62f07973b5429.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 18 PERUMAHAN KEDA KAMPUNG PONG SELATAN  06350 POKOK SENA', 1),
(383, 495, 14, 1, 5, '2', '3', 1, 1, 1, 2, '62f080bf5ada9.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG BARU NAMI   08210 SIK', 1),
(384, 496, 14, 2, 12, '2', '3', 1, 1, 1, 2, '634374a9a82bb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.76, PERUMAHAN KEDA, KAMPUNG PONG SELATAN  06350 KUALA NERANG', 1),
(385, 497, 14, 1, 5, '3', '3', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG SELATAN   06350 ALOR SETAR', 1),
(386, 498, 14, 2, 19, '4', '14', 1, 1, 1, 2, '62f0817e61904.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BAGAN NAKA MK, TEKAI KIRI, NAKA  06350 POKOK SENA', 1),
(387, 499, 14, 2, 16, '4', '3', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 4 DEPAN TAMAN NAKA JAYA   06350 KUALA NERANG', 1),
(388, 500, 14, 4, 19, '1', '14', 1, 1, 1, 2, '62d4c97f01c42.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LOT 106 KG BERDIKARI   06350 ALOR SETAR', 1),
(389, 501, 14, 2, 1, '7', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1 JALAN LAMPAM KG PAYA SIDANG   06350 ALOR SETAR', 1),
(390, 502, 14, 4, 9, '2', '2', 1, 1, 1, 2, '62f07e3c3d039.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BT 20 1/4 JLN NAKA,KG BARU MUKIM LESONG 06350 ALOR SETAR,KEDAH   06350 ALOR SETAR', 1),
(391, 503, 14, 2, 8, '7', '3', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG NAMI BARU   08210 SIK', 1),
(392, 504, 14, 2, 16, '6', '5', 1, 1, 1, 2, '62f0820aec41e.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG DATUK,MUKIM TEKAI KIRI, 06350 NAKA, ALOR SETAR, KEDAH   06350 POKOK SENA', 1),
(393, 505, 14, 4, 1, '6', '8', 1, 1, 1, 2, '62f08245c3960.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG SIMPANG TIGA NAMI   08210 SIK', 1),
(394, 506, 14, 4, 19, '4', '14', 1, 1, 1, 2, '62f081c88d047.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG BARU NAMI   08210 SIK', 1),
(395, 507, 14, 3, 1, '4', '6', 1, 1, 1, 2, '62f08279245a0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(396, 508, 14, 3, 5, '3', '4', 2, 1, 1, 2, '62f07ebe2e979.jpg', 'Tidak', 'YA', 'Tidak', 'KG PONG MANIS   06300 KUALA NERANG', 1),
(397, 509, 14, 3, 17, '7', '6', 2, 1, 1, 2, '62f082e0e38a1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BUKIT PAYUNG,MUKIM GAJAH MATI, KG BUKIT PAYUNG,MUKIM GAJAH MATI, KG BUKIT PAYUNG,MUKIM GAJAH MATI, 06400 POKOK SENA', 1),
(398, 510, 14, 3, 7, '4', '6', 2, 1, 1, 2, '62f07a8e2f371.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BUKIT PAYUNG,MUKIM GAJAH MATI, KG BUKIT PAYUNG,MUKIM GAJAH MATI, KG BUKIT PAYUNG,MUKIM GAJAH MATI, 06400 POKOK SENA', 1),
(399, 511, 14, 3, 5, '5', '6', 2, 1, 1, 2, '62f083112dc50.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG PIRING MUKIM TEKAI KIRI   08210 SIK', 1),
(400, 512, 14, 3, 10, '7', '12', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'Kg Tok Salam   06300 Kuala Nerang', 1),
(401, 513, 14, 1, 4, '2', '4', 2, 1, 1, 2, '62f082ab7594c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANJUNG PIRING   08210 SIK', 1),
(402, 514, 14, 1, 5, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 13 TAMAN DAHLIA   06350 POKOK SENA', 1),
(403, 515, 14, 4, 10, '3', '4', 2, 1, 1, 2, '62f079c891906.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG DATOK, MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(404, 516, 14, 1, 19, '3', '4', 2, 1, 1, 2, '62d9293108652.jpg', 'Tidak', 'YA', 'Tidak', 'KG KUBANG BEMBAN,MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(405, 517, 14, 2, 5, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO. 50 PERUMAHAN KEDA HUJUNG KETON   06750 PENDANG', 1),
(406, 518, 14, 1, 11, '3', '1', 2, 1, 1, 2, '62d4c8eb056fe.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.11 PERUMAHAN KEDA PONG SELATAN   06350 ALOR SETAR', 1),
(407, 519, 14, 1, 5, '4', '4', 2, 1, 1, 2, '62f07ae38997c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCHAN JALAN SUNGAI TIANG   06750 PENDANG', 1),
(408, 520, 14, 4, 5, '7', '6', 2, 1, 1, 2, '62f07d2fbe293.jpg', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG TOK SALAM MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(409, 521, 14, 1, 16, '1', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 25 PEKAN NAKA   06350 POKOK SENA ', 1),
(410, 522, 15, 3, 16, '4', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(411, 523, 15, 4, 18, '3', '3', 1, 4, 2, 2, '6304738779a7a.jpg', 'Tidak', 'TIDAK', 'Tidak', '219 KG BARU NAKA   06350 Pokok Sena', 1),
(412, 524, 15, 3, 11, '3', '5', 1, 6, 2, 2, '630473bb9f416.jpg', 'Tidak', 'TIDAK', 'Tidak', '17 KG PADANG, JALAN NAKA NAMI   06350 Pokok Sena', 1),
(413, 525, 15, 1, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LEBAI SAMAN, MUKIM TEKAI KIRI, NAKA   06350 POKOK SENA', 1),
(414, 526, 15, 3, 11, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN, NAKA   06350 POKOK SENA', 1),
(415, 527, 15, 3, 11, '6', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(416, 528, 15, 2, 11, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA ,MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(417, 529, 15, 1, 15, '3', '5', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG PIRING NAMI   08210 SIK', 1),
(418, 530, 15, 1, 18, '1', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCAN MUKIM PADANG KERBAU   06750 PENDANG', 1),
(419, 531, 15, 3, 3, '1', '10', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG,NAKA   06350 POKOK SENA', 1),
(420, 532, 15, 2, 1, '3', '3', 2, 1, 1, 2, '630474529e981.jpg', 'Tidak', 'YA', 'Tidak', 'KG. MASJID BARU, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(421, 533, 15, 1, 15, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN, MUKIM TEKAI KIRI,NAKA   06350 POKOK SENA', 1),
(422, 534, 15, 2, 16, '4', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TENGAH KUBANG KENYENG, MUKIM TEKAI KANAN,NAKA   06350 POKOK SENA', 1),
(423, 535, 15, 4, 16, '3', '3', 2, 1, 1, 2, '6304758572d07.jpg', 'Ya', 'TIDAK', 'Tidak', 'NO 54 DESA KEDA BENDANG TOK TERI   06350 POKOK SENA', 1),
(424, 536, 15, 2, 17, '4', '3', 2, 1, 1, 2, '63047551ce581.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCHAN MUKIM PADANG KERBAU   06750 PENDANG', 1),
(425, 537, 15, 3, 6, '3', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK   06350 POKOK SENA', 1),
(426, 538, 15, 1, 9, '1', '4', 2, 6, 2, 2, '630474ac66613.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, NAKA, 06350 ALOR SETAR,  KEDAH.   06350 POKOK SENA', 1),
(427, 539, 15, 1, 18, '1', '6', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BARU NAKA   06350 POKOK SENA', 1),
(428, 540, 15, 4, 18, '1', '4', 2, 6, 2, 2, '630475d95ee9a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LUBUK RAMBAI, MUKIM TEKAI KIRI, 06350 ALOR SETAR , KEDAH.   06350 POKOK SENA', 1),
(429, 541, 15, 1, 11, '1', '1', 2, 6, 2, 2, '630475b3a9642.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, MUKIM TEKAI KIRI,NAKA, 06350 KUALA NERANG, KEDAH.   06350 POKOK SENA', 1),
(430, 542, 15, 2, 17, '4', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG BAKONG MUKIM TEKAI KANAN   06300 POKOK SENA', 1),
(431, 543, 15, 3, 3, '3', '10', 2, 1, 1, 2, '6304752598200.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN   06300 POKOK SENA', 1),
(432, 544, 15, 3, 11, '1', '12', 2, 6, 2, 2, '630474781d6bf.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 50 KAMPUNG BARU NAKA   06350 POKOK SENA', 1),
(433, 545, 15, 100, 100, '100', '100', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG MKM LESONG JLN NAKA  06350 POKOK SENA', 1),
(434, 546, 15, 2, 4, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG ,NAKA   06350 POKOK SENA', 1),
(435, 547, 15, 4, 18, '1', '1', 2, 6, 2, 2, '630474febe0b4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.32, KG.CHANGDENG,  MUKIM TEKAI KIRI, 06350 ALOR SETAR, KEDAH.   06350 POKOK SENA', 1),
(436, 548, 15, 3, 16, '1', '4', 2, 6, 2, 2, '630474cfc99ca.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN,MUKIM TEKAI KIRI,  NAKA, 06350 ALOR SETAR,  KEDAH.   06350 POKOK SENA', 1),
(437, 549, 16, 3, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 8 DESA KEDA BENDANG TOK TERI MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(438, 550, 16, 4, 11, '1', '5', 1, 6, 2, 2, '62fdaf70973ac.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI KUALA NERANG   06300 ALOR SETAR', 1),
(439, 551, 16, 4, 11, '1', '14', 1, 4, 2, 2, '62fdaeea03aa5.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, MUKIM TEKAI KIRI, NAKA 06350 ALOR SETAR', 1),
(440, 552, 16, 3, 18, '1', '14', 1, 6, 2, 2, '62fdaf0ac6618.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN, MUKIM TEKAI KIRI, NAKA 06350 ALOR SETAR', 1),
(441, 553, 16, 1, 16, '4', '3', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI, NAKA 06350 POKOK SENA', 1),
(442, 554, 16, 1, 16, '6', '5', 1, 1, 1, 2, '62fdacc200d94.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS, MUKIM TEKAI KIRI, NAKA 06350 pokok sena', 1),
(443, 555, 16, 1, 16, '4', '5', 1, 1, 1, 2, '62fdadbbb88ec.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP BESAR, MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(444, 556, 16, 2, 16, '4', '5', 1, 1, 1, 2, '62fdac4d1310b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BENDANG TOK TERI MUKIM TEKAI KIRI, NAKA 06350 ALOR SETAR', 1),
(445, 557, 16, 4, 16, '4', '5', 1, 1, 1, 2, '62fdae5ba3a34.jpg', 'Tidak', 'YA', 'Tidak', 'KG TANJUNG PIRING, NAMI, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(446, 558, 16, 3, 16, '4', '5', 1, 1, 1, 2, '62fdad2eb379d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG FELCRA KUBANG KENYENG   06350 pokok sena', 1),
(447, 559, 16, 2, 13, '4', '5', 1, 1, 1, 2, '62fdade382fbc.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LEBAI SAMAN   06350 Pokok Sena', 1),
(448, 560, 16, 2, 16, '2', '5', 1, 1, 1, 2, '62fdacfaf3b0e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(449, 561, 16, 3, 14, '6', '5', 1, 1, 1, 2, '62fdae2eda691.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS, MUKIM TEKAI KIRI,  06350 POKOK SENA', 1),
(450, 562, 16, 4, 16, '2', '5', 1, 1, 1, 2, '62fdac903f176.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU, MUKIM TEKAI KIRI, NAKA  06350 POKOK SENA', 1),
(451, 563, 16, 2, 2, '4', '1', 2, 6, 2, 2, '62fdb64647cad.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG ,MUKIM TEKAI KIRI   08210 SIK', 1),
(452, 564, 16, 4, 6, '3', '4', 2, 4, 2, 2, '62fdb0c61aa6d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BENDANG PHEIK NAKA MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(453, 565, 16, 3, 18, '1', '4', 2, 6, 2, 2, '62fdafc66990a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG.TANDOP, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(454, 566, 16, 3, 19, '1', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 8 Perumahan Pekerja Ladang Sg. Tekai   06350 ALOR SETAR', 1),
(455, 567, 16, 3, 11, '6', '4', 2, 1, 1, 2, '62fdae8a38321.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BERDIKARI NAKA   06350 ALOR SETAR', 1),
(456, 568, 16, 2, 18, '3', '5', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG BAKONG BATU 20, JALAN NAKA,  06350 ALOR SETAR', 1),
(457, 569, 16, 100, 100, '100', '100', 2, 4, 2, 2, '62fdaec05ea1d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 233 KAMPUNG BARU NAKA   06350 POKOK SENA', 1),
(458, 570, 16, 2, 18, '3', '4', 2, 3, 2, 2, '62fdafee7a7d1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(459, 571, 16, 2, 18, '1', '4', 2, 4, 2, 2, '62fdb0146e766.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. CHANGDENG, NAKA, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(460, 572, 16, 4, 16, '1', '14', 1, 6, 2, 2, '62fdaf4d30d23.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. CHANGDENG, NAKA, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(461, 573, 16, 3, 13, '3', '5', 1, 1, 1, 2, '62fdad5cbc9a0.jpg', 'Tidak', 'TIDAK', 'Tidak', '132A KG BERDIKARI MUKIM TEKAI KANAN  06350 ALOR SETAR', 1),
(462, 574, 16, 4, 18, '1', '5', 1, 6, 2, 2, '62fdaf995ab1f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG CHANG DENG, MUKIM TEKAI KIRI,  06350 ALOR SETAR', 1),
(463, 575, 16, 4, 5, '3', '4', 2, 1, 1, 2, '62fdb0ed0c37b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN MUKIM TEKAI KANAN  06350 ALOR SETAR', 1),
(464, 576, 17, 3, 11, '4', '1', 1, 1, 1, 2, '630cd477c541c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA, MUKIM TEKAI KIRI, NAKA   06350 POKOK SENA', 1),
(465, 577, 17, 3, 12, '3', '1', 2, 6, 2, 2, '6301be5652e1b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 219 KAMPUNG BARU NAKA   06350 POKOK SENA', 1),
(466, 578, 17, 1, 2, '3', '14', 1, 6, 2, 2, '632a847d48718.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG NAKA   06350 POKOK SENA', 1),
(467, 579, 17, 2, 18, '1', '14', 1, 4, 2, 2, '630cd501f042a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG CHANG DENG  MUKIM TEKAI, NAKA, KUALA NERANG.   06350 ALOR SETAR', 1),
(468, 580, 17, 4, 4, '1', '5', 1, 4, 2, 2, '630cd4a0bc3ab.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(469, 581, 17, 2, 100, '100', '100', 1, 1, 1, 2, '630cb6bead4d8.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS MUKIM TEKAI KIRI,06350 NAKA,ALOR SETAR,KEDAH   06350 POKOK SENA', 1),
(470, 582, 17, 3, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'JALAN HADAPAN MASJID KAMPUNG DATUK MUKIM TEKAI KIRI, 06350 NAKA,ALOR SETAR,KEDAH   06300 KUALA NERANG', 1),
(471, 583, 17, 2, 100, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP BESAR MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(472, 584, 17, 4, 100, '100', '100', 1, 1, 1, 2, '63325b608b733.jpg', 'Tidak', 'TIDAK', 'Tidak', '1044, TAMAN DAHLIA, NAKA   06350 POKOK SENA', 1),
(473, 585, 17, 4, 16, '4', '3', 1, 1, 1, 2, '630cb778125c3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 74,DESA KEDA BENDANG TOK TERI,  NAKA, ALOR SETAR, KEDAH   06350 POKOK SENA', 1),
(474, 586, 17, 1, 11, '3', '5', 1, 1, 1, 2, '630cb808650ba.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG SELATAN MUKIM TEKAI KANAN   06350 POKOK SENA', 1),
(475, 587, 17, 3, 16, '4', '5', 1, 1, 1, 2, '630cb6f8dd6f0.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG PIRING NAMI   06300 KUALA NERANG', 1),
(476, 588, 17, 100, 100, '100', '100', 1, 1, 1, 2, '62f11afa506d4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 16, DESA KEDA KUBANG KENYENG, JLN NAKA   06350 ALOR SETAR', 1),
(477, 589, 17, 3, 16, '4', '3', 1, 1, 1, 2, '63325af30c250.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KEDA KUBANG KENYENG, NAKA,   06300 KUALA NERANG', 1),
(478, 590, 17, 1, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU LEBAI SAMAN, MUKIM TEKAI KIRI, 06350 NAKA, ALOR SETAR, KEDAH   06350 POKOK SENA', 1),
(479, 591, 17, 3, 16, '2', '14', 1, 1, 1, 2, '630cb73e32284.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG BELUKAR MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(480, 592, 17, 2, 5, '5', '6', 2, 1, 1, 2, '6301be7f09345.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS,MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(481, 593, 17, 1, 15, '1', '1', 2, 6, 1, 2, '6346c4cca4385.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP, LAMDIN,  MUKIM TEKAI KIRI, 06300 KUALA NERANG, KEDAH.   06300 KUALA NERANG', 1),
(482, 594, 17, 1, 4, '5', '4', 2, 1, 1, 2, '6301bead87335.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 14 DESA KEDA KUBANG KENYENG, NAKA   06350 POKOK SENA', 1),
(483, 595, 17, 3, 5, '5', '4', 2, 1, 1, 2, '6301be0de73e4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI  06350 POKOK SENA', 1),
(484, 596, 17, 2, 5, '5', '4', 2, 1, 1, 2, '6301be3067e4f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI NAKA 06350 POKOK SENA', 1),
(485, 597, 17, 3, 100, '100', '100', 1, 4, 2, 2, '100', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP,  MUKIM TEKAI KIRI, 06350 ALOR SETAR, KEDAH.   06350 POKOK SENA', 1),
(486, 598, 17, 2, 2, '1', '5', 1, 6, 2, 2, '630cd4d48bd7b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. LAMDIN,NAKA, 06350 ALOR SETAR, KEDAH.   06350 POKOK SENA', 1),
(487, 599, 17, 1, 13, '1', '5', 1, 6, 2, 2, '630cd53c570ca.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP,LAMDIN, 06350 ALOR SETAR, KEDAH   06350 POKOK SENA', 1),
(488, 600, 17, 4, 2, '3', '5', 1, 6, 2, 2, '632a83d6d81d1.jpg', 'Tidak', 'TIDAK', 'Tidak', '23 J KAMPONG LAMDIN NAKA   06300 POKOK SENA', 1),
(489, 601, 18, 4, 16, '6', '1', 1, 1, 1, 2, '6372fd2bf420b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK   06300 ALOR SETAR', 1),
(490, 602, 18, 3, 2, '5', '2', 2, 1, 1, 2, '6326e0ac0820c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA NAKA   06350 ALOR SETAR', 1),
(491, 603, 18, 2, 9, '7', '2', 1, 1, 1, 2, '6326e2db24c04.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 32 KAMPUNG BUKIT JALAN NAKA POKOK SENA   06350 POKOK SENA', 1),
(492, 604, 18, 2, 18, '1', '4', 2, 6, 2, 2, '6372fcf63eb37.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG.TANDOP, MUKIM TEKAI KIRI, 06350 ALOR SETAR, KEDAH.   06350 ALOR SETAR', 1),
(493, 605, 18, 2, 4, '3', '2', 1, 6, 2, 2, '6326e2fde34ed.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 194 KG BARU NAKA   06350 ALOR SETAR', 1),
(494, 606, 18, 1, 6, '3', '4', 2, 6, 2, 2, '6326e101b8962.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG MUKIM LESONG  06350 ALOR SETAR', 1),
(495, 607, 18, 1, 1, '6', '8', 1, 1, 1, 2, '6372fcbe1b31e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LOT 71968,LORONG SURAU NUR JANNAH KAMPUNG KUBANG KENYENG, ALOR SETAR  06300 KUALA NERANG', 1),
(496, 608, 18, 2, 9, '6', '2', 1, 1, 1, 2, '6326e6530babb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PDG BAKONG, MUKIM TERAI KANAN   06350 Alor Setar', 1),
(497, 609, 18, 3, 6, '6', '9', 1, 1, 1, 2, '62f118d49c7f3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 20 , JALAN NAKA, KAMPUNG BUKIT   06350 Alor Setar', 1),
(498, 610, 18, 4, 7, '3', '2', 1, 1, 1, 2, '6372fecab61bd.jpg', 'Tidak', 'YA', 'Tidak', 'KG KUBANG BEMBAN   06300 KUALA NERANG', 1),
(499, 611, 18, 4, 12, '6', '9', 1, 1, 1, 2, '6372fc76b4ef0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 20,KAMPUNG BUKIT JALAN NAKA   06400 POKOK SENA', 1),
(500, 612, 18, 3, 6, '2', '2', 1, 1, 1, 2, '6326e1d9df25a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 30, KAMPUNG BUKIT, JALAN NAKA   06350 Alor Setar', 1),
(501, 613, 18, 2, 6, '2', '4', 2, 6, 2, 2, '6326e1583454b.jpg', 'Ya', 'TIDAK', 'Tidak', '237 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(502, 614, 18, 1, 8, '6', '6', 2, 1, 1, 2, '6326e21659dca.jpg', 'Tidak', 'YA', 'Tidak', 'KG PADANG KERASAK   06350 ALOR SETAR', 1),
(503, 615, 18, 3, 5, '3', '4', 2, 1, 1, 2, '6326e4078a260.jpg', 'Tidak', 'YA', 'Tidak', 'KG MASJID BARU   06350 ALOR SETAR', 1),
(504, 616, 18, 2, 5, '3', '4', 2, 1, 1, 2, '6326e4233513f.jpg', 'Tidak', 'YA', 'Tidak', 'NO 21 PERUMAHAN KEDA KG BAGAN   06350 ALOR SETAR', 1),
(505, 617, 18, 4, 5, '1', '6', 2, 1, 1, 2, '6326e44772a7b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'FELCRA KUBANG KENYENG, NAKA,   06350 ALOR SETAR', 1),
(506, 618, 18, 1, 14, '5', '6', 2, 1, 1, 2, '6372fc4124784.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BT 21,SPG 4 JALAN NAKA   06350 ALOR SETAR', 1),
(507, 619, 18, 1, 5, '2', '4', 2, 1, 1, 2, '6372fc0a9e6f2.jpg', 'Tidak', 'TIDAK', 'Tidak', 'No, 6 Keda Kubang Kenyeng   06350 ALOR SETAR', 1),
(508, 620, 18, 2, 14, '5', '6', 2, 1, 1, 2, '6326e1778e8fb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 47 PERUMAHAN KEDA KG BAGAN   06350 ALOR SETAR', 1),
(509, 621, 18, 1, 5, '5', '6', 2, 1, 1, 2, '6326e47defd82.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BERDIKARI NAKA   06350 ALOR SETAR', 1),
(510, 622, 18, 4, 10, '7', '12', 2, 1, 1, 2, '6372fbd0ee992.jpg', 'Tidak', 'TIDAK', 'Tidak', 'Kg Tok Salam Mukim Tekai Kanan Naka 06350 Alor Setar', 1),
(511, 623, 18, 2, 5, '5', '6', 2, 1, 1, 2, '6326e6811e79c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 20 1/4 JALAN NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(512, 624, 18, 3, 14, '5', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK   06350 ALOR SETAR', 1),
(513, 625, 18, 2, 5, '3', '4', 2, 1, 1, 2, '6326e4a867125.jpg', 'Tidak', 'TIDAK', 'Tidak', '23 KAMPUNG LINCAN JALAN SUNGAI TIANG   06750 PENDANG', 1),
(514, 626, 18, 2, 10, '7', '8', 2, 1, 1, 2, '6326e368c45a2.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG CHARUK PISANG   08210 SIK', 1),
(515, 627, 18, 1, 18, '1', '4', 2, 4, 2, 2, '6326e28fb67c9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BARU NAKA   06350 ALOR SETAR', 1),
(516, 628, 18, 2, 5, '2', '4', 2, 1, 1, 2, '6372fb925666c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'No 12 Desa KEDA Kubang Kenyeng   06350 ALOR SETAR', 1),
(517, 629, 18, 4, 18, '2', '2', 1, 6, 2, 2, '6326e26c356a9.jpg', 'Tidak', 'TIDAK', 'Tidak', 'No 211, KAMPUNG BARU NAKA   06300 KUALA NERANG', 1),
(518, 630, 18, 2, 6, '3', '4', 2, 6, 2, 2, '6326e2487d4ad.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 18 KG PADANG, JLN NAKA-NAMI   06350 ALOR SETAR', 1),
(519, 631, 18, 3, 16, '3', '2', 1, 1, 1, 2, '6326e1ba62ff3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO G-02-03 KUARTERS IKBN NAKA   06350 ALOR SETAR', 1),
(520, 632, 19, 3, 18, '3', '1', 2, 6, 2, 2, '63019829856b4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 195 KG BARU NAKA   06350 POKOK SENA', 1),
(521, 633, 19, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. KUBANG BEMBAN, MUKIM TEKAI KANAN, KUALA NERANG   06300 KUALA NERANG', 1),
(522, 634, 19, 2, 8, '6', '1', 2, 6, 2, 2, '636200dd31ec3.jpeg', 'Tidak', 'TIDAK', 'Tidak', 'KG LAMDIN MUKIM TEKAI KIRI  ALOR SETAR   06350 ALOR SETAR', 1),
(523, 635, 19, 3, 7, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(524, 636, 19, 1, 16, '6', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BARU MASJID, NAKA   06350 ALOR SETAR', 1),
(525, 637, 19, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LORONG 5 KG PADANG KERASAK JLN NAKA  06350 POKOK SENA', 1),
(526, 638, 19, 3, 16, '4', '12', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS MKM TEKAI KIRI   06350 POKOK SENA', 1),
(527, 639, 19, 4, 7, '2', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG SUNGAI KAP MUKIM TEKAI KIRI,NAKA   06350 ALOR SETAR', 1),
(528, 640, 19, 1, 6, '2', '6', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'IKOBANA ISHOPS, LOT 4789 KAMPUNG MASJID BARU   06350 POKOK SENA', 1),
(529, 641, 19, 3, 5, '2', '8', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG PONG SELATAN, NAKA   06350 ALOR SETAR', 1),
(530, 642, 19, 1, 5, '2', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 28 JALAN NAKA   06350 ALOR SETAR', 1),
(531, 643, 19, 1, 1, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 20 PERUMAHAN KEDA PONG SELATAN   06350 POKOK SENA', 1),
(532, 644, 19, 2, 3, '2', '1', 1, 1, 1, 2, '636205419aa96.jpeg', 'Tidak', 'TIDAK', 'Tidak', 'NO 1 LOT 4102 KG MASJID BARU JLN NAKA   06350 ALOR SETAR', 1),
(533, 645, 19, 3, 5, '2', '13', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(534, 646, 19, 3, 8, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BARU NAKA, NAKA   06350 POKOK SENA', 1),
(535, 647, 19, 2, 7, '2', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 4 PERUMAHAN KEDA PONG SELATAN, NAKA   06350 ALOR SETAR', 1),
(536, 648, 19, 2, 8, '6', '1', 2, 6, 2, 2, '6301988773f09.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG CHANG DENG, NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(537, 649, 19, 3, 18, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG  MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(538, 650, 19, 4, 12, '5', '1', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(539, 651, 19, 1, 8, '1', '8', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(540, 652, 19, 2, 3, '2', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(541, 653, 19, 3, 14, '7', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'A 33/9 KG KEDA PONG SELATAN, NAKA   06350 ALOR SETAR', 1),
(542, 654, 19, 3, 15, '3', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 70, KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(543, 655, 19, 4, 12, '2', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG MKM TEKAI KANAN   06350 ALOR SETAR', 1),
(544, 656, 19, 1, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(545, 657, 19, 1, 5, '7', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1 JALAN LAMPAM KAMPUNG PAYA SIDANG  MUKIM LESONG NAKA   06350 ALOR SETAR', 1),
(546, 658, 19, 1, 18, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 65, JALAN NAKA, FELCRA PONG SELATAN,   06350 ALOR SETAR', 1),
(547, 659, 19, 4, 7, '7', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(548, 660, 19, 4, 5, '2', '3', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG SUNGAI KAP JALAN NAMI  SIK   08200 SIK', 1),
(549, 661, 19, 2, 15, '2', '8', 2, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', '32 B, KM 28 JALAN KUBU KUALA NERANG  06300 KUALA NERANG', 1),
(550, 662, 19, 3, 3, '5', '10', 2, 7, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(551, 663, 19, 3, 18, '3', '1', 2, 4, 2, 2, '630198bd93168.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG  MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(552, 664, 20, 100, 100, '100', '100', 1, 6, 2, 2, '62f064032b2fc.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, JLN NAKA MKM TEKAI KIRI   06300 KUALA NERANG', 1),
(553, 665, 20, 2, 1, '2', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(554, 666, 20, 2, 7, '4', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MUKIM TEKAI KANAN  06300 KUALA NERANG', 1),
(555, 667, 20, 3, 1, '2', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(556, 668, 20, 4, 11, '4', '1', 1, 1, 1, 2, '630cd60f60dda.jpg', 'Ya', 'TIDAK', 'Tidak', 'NO.22 DESA KEDA BENDANG TOK TERI, NAKA   06350 ALOR SETAR', 1),
(557, 669, 20, 2, 5, '2', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(558, 670, 20, 3, 7, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM29 KG BUKIT, JALAN NAKA   06350 POKOK SENA', 1),
(559, 671, 20, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO70, KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(560, 672, 20, 1, 7, '2', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(561, 673, 20, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '57 KG TANDOP BESAR KUALA NERANG   06300 KUALA NERANG', 1),
(562, 674, 20, 2, 7, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. PONG MANIS, MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(563, 675, 20, 1, 1, '4', '5', 1, 1, 1, 2, '630cd7cc72ddb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LOT 8726, LORONG 4, KG BARU NAKA   06350 POKOK SENA', 1),
(564, 676, 20, 2, 16, '4', '5', 1, 1, 1, 2, '630cd6d77eac3.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK,MUKIM TEKAI KANAN NAKA   06350 POKOK SENA', 1),
(565, 677, 20, 3, 7, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANJUNG PIRING MUKIM SIK  08210 SIK', 1),
(566, 678, 20, 2, 1, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '71,DESA KEDA BENDANG TOK TERI, MUKIM TEKAI KIRI, NAKA  06350 POKOK SENA', 1),
(567, 679, 20, 2, 11, '2', '8', 1, 1, 1, 2, '62f11a96b78b2.jpg', 'Tidak', 'TIDAK', 'Tidak', '101 BT 20 1/4 JALAN NAKA   06350 POKOK SENA', 1),
(568, 680, 20, 4, 13, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LINCHAN JALAN SUNGAI TIANG   06750 PENDANG', 1),
(569, 681, 20, 1, 11, '4', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(570, 682, 20, 4, 11, '4', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN KUALA NERANG   06300 KUALA NERANG', 1),
(571, 683, 20, 2, 8, '6', '6', 2, 6, 2, 2, '630cd6405602f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(572, 684, 20, 1, 10, '1', '1', 2, 1, 1, 2, '630cd74877f69.jpg', 'Tidak', 'YA', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(573, 685, 20, 3, 8, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'FELCRA KUBANG KENYENG   06350 POKOK SENA', 1),
(574, 686, 20, 4, 8, '2', '4', 2, 1, 1, 2, '630cd717b30ce.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 12 KAMPUNG BARU NAKA   06350 Pokok Sena', 1),
(575, 687, 20, 4, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'FELCRA KUBANG KENYENG   06300 KUALA NERANG', 1),
(576, 688, 20, 1, 15, '6', '13', 2, 1, 1, 2, '630cb4e2d9d58.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID BARU,   06350 NAKA', 1),
(577, 689, 20, 4, 19, '6', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK NAKA  06350 POKOK SENA', 1),
(578, 690, 20, 4, 100, '100', '100', 2, 6, 2, 2, '630cd6852d145.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BATU 27 KG RAMBAI MK TEKAI KANAN   06300 KUALA NERANG', 1),
(579, 691, 20, 4, 12, '3', '1', 2, 6, 2, 2, '630cd6a964296.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 219 KAMPUNG BARU NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(580, 692, 20, 4, 8, '1', '4', 2, 1, 1, 2, '630cd79ed94da.jpg', 'Ya', 'TIDAK', 'Tidak', 'NO.26 DESA KEDA BENDANG TOK TERI, NAKA   06350 POKOK SENA', 1),
(581, 693, 20, 3, 3, '2', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG KENYENG MUKIM TEKAI KANAN ALOR SETAR   06350 POKOK SENA', 1),
(582, 694, 20, 2, 8, '6', '6', 2, 6, 2, 2, '630cd8384ca33.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG BAKONG  JALAN NAKA  POKOK SENA   06350 POKOK SENA', 1),
(583, 695, 21, 4, 18, '1', '9', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 29 KAMPUNG PADANG JLN NAMI MUKIM TEKAI KIRI 06350 Pokok Sena', 1),
(584, 696, 21, 2, 16, '6', '1', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. MASJID BARU, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(585, 697, 21, 1, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 42 DESA KEDA  KAMPUNG BENDANG TOK TERI NAKA   06350 ALOR SETAR', 1),
(586, 698, 21, 2, 1, '4', '5', 1, 1, 1, 2, '62f11928ad453.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU  NAKA   06350 ALOR SETAR', 1),
(587, 699, 21, 1, 18, '1', '1', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '39, KAMPUNG CHANG DENG NAKA.   06350 NAKA', 1),
(588, 700, 21, 4, 19, '2', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK,   06350 ALOR SETAR', 1),
(589, 701, 21, 3, 16, '4', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID BARU, MUKIM TEKAI KIRI,   06350 KUALA NERANG', 1),
(590, 702, 21, 4, 1, '4', '5', 1, 1, 1, 2, '62f0847f4f9de.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 74 PERUMAHAN DESA KEDA PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(591, 703, 21, 2, 13, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 51 PERUMAHAN KEDA KAMPUNG BAGAN NAKA   06350 ALOR SETAR', 1),
(592, 704, 21, 4, 1, '4', '1', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'NO. 99, KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(593, 705, 21, 2, 1, '4', '5', 1, 1, 1, 2, '62f06517cbe1d.jpg', 'Tidak', 'YA', 'Tidak', 'NO. 15 1/2, JALAN KUALA NERANG,   06400 POKOK SENA', 1),
(594, 706, 21, 2, 17, '2', '1', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'TERATAK SERI MUDA KG BARU TAPUNG FELDA LUBUK MERBAU   06710 PENDANG', 1),
(595, 707, 21, 1, 11, '6', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU NAKA   06350 ALOR SETAR', 1),
(596, 708, 21, 2, 8, '2', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU, MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(597, 709, 21, 4, 12, '3', '1', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BENDANG PHEIK,NAKA   06350 ALOR SETAR', 1),
(598, 710, 21, 2, 12, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP BESAR   06300 POKOK SENA', 1),
(599, 711, 21, 4, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANJUNG PIRING   08210 SIK', 1),
(600, 712, 21, 4, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK, JLN NAKA   06350 ALOR SETAR', 1),
(601, 713, 21, 3, 19, '2', '8', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BLOCK C3 LADANG SUNGAI TEKAI  BATU 28 JALAN NAMI   06350 ALOR SETAR', 1),
(602, 714, 21, 3, 19, '6', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BERDIKARI   06350 ALOR SETAR', 1),
(603, 715, 21, 2, 8, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.46, DESA KEDA KUBANG KENYENG, NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(604, 716, 22, 2, 8, '6', '4', 2, 1, 1, 2, '62fdb39d55917.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BT 27 JALAN NAMI   06350 POKOK SENA', 1),
(605, 717, 22, 4, 8, '6', '4', 2, 1, 1, 2, '62fdb36c183e2.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(606, 718, 22, 3, 12, '3', '4', 2, 1, 1, 2, '62fdb33ae467c.jpg', 'Ya', 'TIDAK', 'Tidak', 'NO 32, DESA KEDA BENDANG TOK TERI NAKA   06350 POKOK SENA', 1),
(607, 719, 22, 2, 5, '2', '13', 1, 1, 1, 2, '62fdb2bcebd06.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.2 RUMAH KEDAI KEDA PEKAN NAKA,06350 ALOR SETAR,KEDAH   06350 Alor setar', 1),
(608, 720, 22, 1, 7, '2', '13', 1, 1, 1, 2, '62fdb24e29ce6.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BT 19 3/4 KG BUKIT   06350 POKOK SENA', 1),
(609, 721, 22, 1, 5, '2', '13', 1, 1, 1, 2, '62fdb2901060d.jpg', 'Tidak', 'YA', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(610, 722, 22, 1, 1, '2', '5', 1, 1, 1, 2, '62fdb2e99b3f0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(611, 723, 22, 3, 10, '7', '6', 2, 1, 1, 2, '62fdb6d37f042.jpg', 'Ya', 'YA', 'Tidak', 'KAMPUNG MASJID LAMA   06350 POKOK SENA', 1),
(612, 724, 22, 3, 12, '7', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 71 TAMAN DESA PUDINA PPK KUBANG KENYENG   06350 POKOK SENA', 1),
(613, 725, 22, 4, 12, '2', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 67 TAMAN DESA PUDINA PPK KUBANG KENYENG   06350 ALOR SETAR', 1),
(614, 726, 22, 1, 5, '7', '8', 2, 1, 1, 2, '62fdb67d77dbb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. PADANG KERASAK, JLN. NAKA, 06350 ALOR SETAR, KEDAH.   06350 ALOR SETAR', 1),
(615, 727, 22, 2, 8, '6', '4', 2, 1, 1, 2, '62fdb3dcd3e53.jpg', 'Tidak', 'TIDAK', 'Tidak', '1073, TMN NAKA JAYA   06350 ALOR SETAR', 1),
(616, 728, 22, 1, 3, '1', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG PADANG BAKONG KG BUKIT   06400 POKOK SENA', 1),
(617, 729, 22, 1, 5, '1', '3', 2, 1, 1, 2, '62fdb41d29153.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(618, 730, 22, 2, 5, '6', '4', 2, 1, 1, 2, '62fdb3104066f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG BAKONG KG BUKIT   06350 POKOK SENA', 1),
(619, 731, 22, 3, 5, '2', '3', 2, 1, 1, 2, '62fdb45189535.jpg', 'Tidak', 'YA', 'Tidak', 'NO. 17, DESA KEDA HUJUNG KETUN MK PADANG KERBAU   06750 PENDANG', 1),
(620, 732, 22, 2, 8, '2', '4', 2, 1, 1, 2, '62fdb21f10707.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BT 28 LADANG SUNGAI TEKAI JALAN NAKA   06350 POKOK SENA', 1),
(621, 733, 22, 2, 12, '6', '1', 2, 1, 1, 2, '630cb514183ab.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. DATOK MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(622, 734, 23, 3, 5, '1', '3', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK  MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(623, 735, 23, 4, 8, '1', '4', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(624, 736, 23, 4, 14, '1', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK, MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(625, 737, 23, 1, 12, '2', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MKM TEKAI KANAN KUALA NERANG   06300 KUALA NERANG', 1),
(626, 738, 23, 2, 5, '2', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 76, KAMPUNG BARU NAKA   06350 POKOK SENA', 1),
(627, 739, 23, 3, 8, '6', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LUBUK RAMBAI JALAN NAMI, NAKA   06350 NAKA', 1),
(628, 740, 23, 2, 8, '6', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. CHANGDENG, NAKA, 06350 ALOR SETAR,  KEDAH.   06350 ALOR SETAR', 1),
(629, 741, 23, 3, 8, '6', '6', 2, 6, 2, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG LAMIDN MKM TEKAI KIRI   06350 ALOR SETAR', 1),
(630, 742, 23, 4, 7, '4', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 29.5 KG BUKIT JLN NAKA   06350 POKOK SENA', 1),
(631, 743, 23, 1, 16, '6', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(632, 744, 23, 2, 5, '1', '4', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG PADANG KERASAK, NAKA   06350 ALOR SETAR', 1),
(633, 745, 23, 4, 8, '1', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BAGAN, NAKA   06350 ALOR SETAR', 1),
(634, 746, 23, 1, 3, '5', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(635, 747, 23, 1, 3, '6', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(636, 748, 23, 3, 5, '2', '3', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG HUJUNG KETON JALAN SUNGAI TIANG   06750 PENDANG', 1),
(637, 749, 23, 3, 10, '1', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 8432, KG BERDIKARI, NAKA   06350 ALOR SETAR', 1),
(638, 750, 23, 4, 3, '6', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(639, 751, 23, 2, 19, '1', '1', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG CHANG DENG MKM TEKAI KIRI   06350 ALOR SETAR', 1),
(640, 752, 23, 3, 8, '6', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG CHANG DENG MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(641, 753, 23, 4, 3, '6', '10', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI,   06350 POKOK SENA', 1),
(642, 754, 23, 2, 8, '6', '1', 2, 2, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 602/12 A, KAMPUNG LAMDIN, JALAN NAKA, PADANG TERAP.   06350 ALOR SETAR', 1),
(643, 755, 24, 100, 100, '100', '100', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '255 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(644, 756, 24, 4, 7, '4', '5', 1, 1, 1, 2, '62f11a5940c64.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 39, PPRT DESA KEDA HUJUNG KETON MUKIM PADANG KERBAU   05750 PENDANG', 1),
(645, 757, 24, 1, 16, '2', '14', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG KUBANG KENYENG   06300 KUALA NERANG', 1),
(646, 758, 24, 3, 18, '3', '1', 1, 6, 2, 2, '62dd4f1ee7945.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI  KUALA NERANG   06300 KUALA NERANG', 1),
(647, 759, 24, 4, 18, '1', '9', 1, 6, 2, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG PADANG BAKONG  JALAN NAKA POKOK SENA   06350 POKOK SENA', 1),
(648, 760, 24, 3, 100, '100', '100', 1, 1, 1, 2, '62dd4ff46339b.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG KENYENG,  MUKIM TEKAI KANAN,   06350 POKOK SENA', 1),
(649, 761, 24, 4, 1, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK, MUKUM TEKAI KANAN   06350 ALOR SETAR', 1),
(650, 762, 24, 2, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG KENYENG, ALOR SETAR   06350 ALOR SETAR', 1),
(651, 763, 24, 4, 7, '2', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP BESAR   06300 KUALA NERANG', 1),
(652, 764, 24, 3, 1, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 77 PERUMAHAN KEDA PONG SELATAN NAKA   06350 POKOK SENA', 1),
(653, 765, 24, 4, 12, '4', '14', 1, 1, 1, 2, '62f11a18ebd40.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.12, RUMAH KEDA,  KG KUBANG KENYENG,  MUKIM TEKAI KANAN, NAKA ALOR SETAR   06350 KUALA NERANG', 1),
(654, 766, 24, 1, 1, '6', '9', 1, 1, 1, 2, '62f119e232642.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG KENYENG, MUKIM TEKAI KANAN, KUALA NERANG   06300 KUALA NERANG', 1),
(655, 767, 24, 2, 11, '100', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '49, PERUMAHAN KEDA KUBANG KENYENG, NAKA KUALA NERANG   06350 POKOK SENA', 1),
(656, 768, 24, 1, 1, '2', '9', 1, 1, 1, 2, '62dd4fbdd1f5e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'BT 18 JALAN NAKA   06350 POKOK SENA', 1),
(657, 769, 24, 100, 100, '100', '100', 1, 1, 1, 2, '100', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP BESAR,  MUKIM TEKAI KANAN,  KUALA NERANG   06300 KUALA NERANG', 1),
(658, 770, 24, 1, 0, '', '', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK, JLN NAKA   06350 POKOK SENA', 1),
(659, 771, 24, 2, 7, '2', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG SELATAN NAKA   06350 POKOK SENA', 1),
(660, 772, 24, 2, 7, '4', '13', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 59 C KAMPUNG MASJID LAMA NAKA  06350 POKOK SENA', 1),
(661, 773, 24, 4, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG HUJUNG KETON MUKIM PADANG KERBAU   06750 PENDANG', 1),
(662, 774, 24, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK,JALAN NAKA   06350 ALOR SETAR', 1),
(663, 775, 24, 1, 7, '1', '7', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. TANDOP BESAR, MUKIM TEKAI KANAN, ALOR SETAR   06350 ALOR SETAR', 1),
(664, 776, 24, 1, 7, '6', '8', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG KENYENG, MUKIM TEKAI KANAN,   06300 KUALA NERANG', 1),
(665, 777, 24, 1, 18, '1', '1', 1, 6, 2, 2, '62dd4eca4bb7c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG LAMDIN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(666, 778, 24, 100, 100, '100', '100', 1, 6, 2, 2, '62f061b95b73a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO36, KAMPUNG CHANG DENG, MUKIM TEKAI KIRI.   06350 POKOK SENA', 1),
(667, 779, 24, 4, 18, '1', '9', 1, 4, 2, 2, '62f0615d9c5fa.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMIDN MKM TEKAI KIRI   06350 ALOR SETAR', 1),
(668, 780, 24, 1, 18, '1', '1', 1, 6, 2, 2, '62f05ffea3b49.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(669, 781, 24, 3, 18, '2', '1', 1, 4, 2, 2, '62dd4f67958af.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG JLN NAMI NAKA   06350 ALOR SETAR', 1),
(670, 782, 25, 3, 13, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 65 DESA KEDA BENDANG TOK TERI, NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(671, 783, 25, 4, 14, '3', '4', 2, 1, 1, 2, '6306ee6b0ceea.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG LUAR,MUKIM PEDU, KUALA NERANG   06300 KUALA NERANG', 1),
(672, 784, 25, 4, 16, '3', '1', 2, 6, 2, 2, '6306eb6149284.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 259, PEKAN NAKA,KG TITI AKAR,MUKIM PADANG KERBAU ALOR SETAR   06350 ALOR SETAR', 1),
(673, 785, 25, 2, 7, '6', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 12 , TAMAN DAHLIA , NAKA  06350 NAKA', 1),
(674, 786, 25, 4, 7, '6', '1', 1, 1, 1, 2, '6306eb0216add.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO E6,KUATERS IKBN NAKA, MK TEKAI KIRI,PEKAN NAKA   06350 PKOKSENA', 1),
(675, 787, 25, 3, 13, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA MUKIM TEKAI KIRI   06350 POKOKSENA', 1),
(676, 788, 25, 1, 7, '4', '14', 1, 1, 1, 2, '6306ea4ea39f6.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(677, 789, 25, 3, 14, '4', '14', 1, 1, 1, 2, '6306e9c5b900d.jpg', 'Tidak', 'YA', 'Tidak', 'BATU 19 1/4 KAMPUNG BUKIT JALAN NAKA ALOR SETAR   06350 POKOK SENA', 1),
(678, 790, 25, 3, 14, '4', '3', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 74, PERUMAHAN DESA KEDA PONG SELATAN, NAKA, ALOR SETAR   06350 ALOR SETAR', 1),
(679, 791, 25, 1, 19, '6', '14', 1, 1, 1, 2, '62f05cdb2d829.jpg', 'Tidak', 'TIDAK', 'Tidak', '53 PERUMAHAN KEDA KUBANG KENYENG  KUALA NERANG   06300 KUALA NERANG', 1),
(680, 792, 25, 1, 10, '4', '6', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 13, KG BARU NAKA,   06350 ALOR SETAR', 1),
(681, 793, 25, 1, 7, '4', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT. 8762, LRG 4, KG BARU, NAKA   06350 ALOR SETAR', 1),
(682, 794, 25, 2, 7, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.35 PERUMAHAN KEDA KG. PONG SELATAN NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(683, 795, 25, 4, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(684, 796, 25, 2, 16, '4', '1', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 230 KG BARU NAKA   06350 ALOR SETAR', 1),
(685, 797, 25, 2, 7, '4', '12', 2, 1, 1, 2, '6306ef4111940.jpg', 'Ya', 'YA', 'Tidak', 'KM 29.5 KAMPUNG BUKIT JALAN NAKA ALOR SETAR   06350 POKOK SENA', 1),
(686, 798, 25, 1, 7, '3', '8', 2, 1, 1, 2, '6306f181541fc.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU,  NAKA   06350 ALOR SETAR', 1),
(687, 799, 25, 4, 7, '3', '4', 2, 1, 1, 2, '6306efcdabe5c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BARU LEBAI SAMAN   06350 ALOR SETAR', 1),
(688, 800, 25, 2, 1, '4', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN MK TEKAI KIRI   06350 ALOR SETAR', 1),
(689, 801, 25, 3, 9, '1', '13', 2, 1, 1, 2, '63071aca8b99c.jpeg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PADANG KERASAK TEKAI KANAN   06350 ALOR SETAR', 1),
(690, 802, 25, 100, 100, '100', '100', 2, 1, 1, 2, '6306f0ca564d4.jpg', 'Tidak', 'TIDAK', 'Tidak', 'LORONG DEPAN DEWAN, KG PONG MANIS MKN TEKAI KANAN  06300 KUALA NERANG', 1),
(691, 803, 25, 4, 3, '4', '10', 2, 1, 1, 2, '6306ee0bcfb94.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LEBAI SAMAN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(692, 804, 25, 2, 8, '3', '12', 2, 1, 1, 2, '6306f077522b6.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO.59 KAMPUNG BARU NAKA  ALOR SETAR   06350 ALOR SETAR', 1),
(693, 805, 25, 1, 9, '3', '1', 2, 1, 1, 2, '630903465f519.jpg', 'Tidak', 'TIDAK', 'Tidak', 'RUMAH BERSEBELAHAN PERTUBUHAN PELADANG KAWASAN PEKAN NAKA  06350 ALOR SETAR', 1),
(694, 806, 25, 3, 3, '3', '10', 2, 1, 1, 2, '6306f38fcbfba.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(695, 807, 25, 2, 1, '4', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(696, 808, 25, 2, 7, '3', '12', 2, 1, 1, 2, '6306eea8a59fc.jpg', 'Tidak', 'TIDAK', 'Tidak', '23, KG.LINCHAN JLN SG TIANG  06750 PENDANG', 1),
(697, 809, 25, 1, 4, '3', '7', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN, MUKIM TEKAI KIRI  06300 KUALA NERANG', 1),
(698, 810, 25, 4, 1, '4', '4', 2, 1, 1, 2, '6306ef7990d28.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG LEBAI SAMAN MK TEKAI KIRI   06350 ALOR SETAR', 1),
(699, 811, 25, 1, 7, '3', '4', 2, 1, 1, 2, '6306ebe30bc67.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. DESA KEDA KUBANG KENYENG,   06300 KUALA NERANG', 1),
(700, 812, 25, 3, 7, '3', '4', 2, 1, 1, 2, '6306f22bc4c08.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KM 30 KAMPUNG BUKIT JALAN NAKA ALOR SETAR   06350 POKOK SENA', 1),
(701, 813, 25, 4, 7, '4', '1', 2, 1, 1, 2, '6306f03b54112.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG BELUKAR LUAS MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(702, 814, 26, 1, 18, '1', '7', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '213 KG BARU NAKA   06350 POKOK SENA', 1),
(703, 815, 26, 2, 8, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI  KUALA NERANG   06300 KUALA NERANG', 1),
(704, 816, 26, 4, 16, '3', '1', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG KUBANG JULUK, NAKA   06350 POKOK SENA', 1),
(705, 817, 26, 2, 12, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2, DEPAN PERUMAHAN KEDA KG BAGAN, NAKA   06350 POKOK SENA', 1),
(706, 818, 26, 4, 18, '1', '7', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 29 KAMPUNG BARU NAKA   06350 POKOK SENA', 1),
(707, 819, 26, 4, 13, '4', '1', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'PERUMAHAN KEDA BENDANG TOK TERI NAKA   06350 POKOK SENA', 1),
(708, 820, 26, 1, 16, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA   06350 POKOK SENA', 1),
(709, 821, 26, 4, 16, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 40 PERUMAHAN KEDA KUBANG KENYENG ALOR SETAR   06350 POKOK SENA', 1),
(710, 822, 26, 3, 6, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2, DESA KEDA BENDANG TOK TERI NAKA   06350 ALOR SETAR', 1),
(711, 823, 26, 4, 3, '4', '10', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG LEBAI SAMAN   06350 POKOK SENA', 1),
(712, 824, 26, 4, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 58  PERUMAHAN KEDA BENDANG TOK TERI MUKIM TEKAI KIRI KUALA NERANG   06350 POKOK SENA', 1),
(713, 825, 26, 1, 6, '3', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 16, DESA KEDA KG BUKIT JALAN NAKA  06400 POKOK SENA', 1),
(714, 826, 26, 1, 16, '4', '5', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG MASJID MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(715, 827, 26, 4, 3, '4', '10', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG HUJUNG KETUN MUKIM PADANG KERBAU JALAN SUNGAI TIANG PENDANG   06750 PENDANG', 1),
(716, 828, 26, 3, 16, '3', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN  06350 POKOK SENA', 1),
(717, 829, 26, 1, 7, '4', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'DESA KEDA BENDANG TOK TERI   06350 ALOR SETAR', 1),
(718, 830, 26, 2, 3, '3', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS NAKA KEDAH   06350 ALOR SETAR', 1),
(719, 831, 26, 1, 9, '3', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 42, DESA KEDA BENDANG TOK TERI, NAKA   06350 POKOK SENA', 1);
INSERT INTO `maklumat_murid` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_rumah_sukan`, `id_kelabP`, `id_uniform`, `id_sukanP`, `id_jantina`, `id_kaum`, `id_agama`, `id_sesi`, `image`, `yatim`, `asrama`, `oku`, `alamat`, `id_status`) VALUES
(720, 832, 26, 3, 7, '4', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(721, 833, 26, 2, 3, '3', '1', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG BUKITBATU 20 JALAN NAKA   06350 ALOR SETAR', 1),
(722, 834, 26, 4, 16, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG PIRING NAMI, KUALA NERANG KEDAH   06300 KUALA NERANG', 1),
(723, 835, 26, 3, 8, '4', '4', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 27 JALAN NAMI KAMPUNG LUBUK RAMBAI   06350 ALOR SETAR', 1),
(724, 836, 26, 1, 18, '1', '7', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN NAKA  ALOR SETAR   06350 ALOR SETAR', 1),
(725, 837, 27, 2, 18, '1', '1', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(726, 838, 27, 2, 10, '7', '9', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU MUKIM TEKAI KIRI NAKA 06350 ALOR SETAR', 1),
(727, 839, 27, 2, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 9, DESA KEDA, KG BENDANG TOK TERI, NAKA   06350 ALOR SETAR', 1),
(728, 840, 27, 1, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.47, DESA KEDA BENDANG TOK TERI, NAKA,   06350 ALOR SETAR', 1),
(729, 841, 27, 4, 16, '3', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BERDIKARI, NAKA   06350 ALOR SETAR', 1),
(730, 842, 27, 3, 16, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID LAMA, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(731, 843, 27, 3, 13, '6', '1', 1, 2, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.87 DESA KEDA BENDANG TOK TERI NAKA 06350 ALOR SETAR', 1),
(732, 844, 27, 4, 16, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU, NAKA KG MASJID BARU, MUKIM TEKAI KIRI. 06350 POKOK SENA', 1),
(733, 845, 27, 1, 17, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(734, 846, 27, 1, 16, '3', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 74, DESA KEDA BENDANG TOK TERI,   06350 ALOR SETAR', 1),
(735, 847, 27, 1, 8, '3', '1', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 206 KAMPUNG BARU NAKA MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(736, 848, 27, 1, 8, '3', '1', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KM 33 JALAN NAKA  POKOK SENA   06400 Pokok Sena ', 1),
(737, 849, 27, 4, 12, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG BEMBAN, MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(738, 850, 27, 3, 16, '3', '4', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', '25 KAMPUNG CHANG DENG JALAN NAKA KUALA NERANG   06350 KUALA NERANG', 1),
(739, 851, 28, 4, 8, '1', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK NAKA   06350 POKOK SENA', 2),
(740, 852, 28, 4, 7, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BENDANG TOK TERI NAKA   06350 POKOK SENA', 2),
(741, 853, 28, 1, 14, '6', '1', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG BENDANG TOK TERI,KAMPUNG BENDANG,NAKA   06350 POKOK SENA', 2),
(742, 854, 28, 2, 17, '6', '1', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 5A, KAMPUNG LINCAN, JALAN SUNGAI TIANG MUKIM PADANG KERBAU PENDANG  06750 PENDANG', 2),
(743, 855, 28, 1, 19, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG PONG MANIS, MUKIM TEKAI KANAN   06350 POKOK SENA', 2),
(744, 856, 28, 4, 7, '6', '14', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG TANJUNG PIRING MUKIM TEKAI KIRI  SIK   08210 SIK', 2),
(745, 857, 28, 3, 9, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG TANJUNG PIRING NAMI  SIK   08210 SIK', 2),
(746, 858, 28, 4, 12, '5', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU, NAKA, ALOR SETAR   06350 POKOK SENA', 2),
(747, 859, 28, 4, 16, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG KERASAK JALAN NAKA  06350 POKOK SENA', 2),
(748, 860, 28, 4, 14, '4', '12', 2, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO.39 KAMPUNG BARU NAMI   08210 SIK', 2),
(749, 861, 28, 3, 7, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BAGAN MUKIM TEKAI KIRI NAKA ALOR SETAR   06350 POKOK SENA', 2),
(750, 862, 28, 1, 7, '4', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID BARU, MUKIM TEKAI KIRI   06350 POKOK SENA', 2),
(751, 863, 28, 2, 1, '1', '6', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1050 , TAMAN NAKA JAYA, MUKIM TEKAI KANAN, 06350 POKOK SENA', 2),
(752, 864, 28, 1, 8, '3', '1', 2, 1, 1, 2, '', 'Ya', 'YA', 'Tidak', 'KM 29. 5 KAMPUNG BUKIT JALAN NAKA ALOR SETAR   06350 POKOK SENA', 2),
(753, 865, 28, 1, 9, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 73 KAMPUNG BARU NAKA   06350 POKOK SENA', 2),
(754, 866, 28, 1, 1, '3', '4', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'BATU 20 1/4 JALAN NAKA  ALOR SETAR   06350 POKOK SENA', 2),
(755, 867, 28, 4, 9, '3', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 62 PERUMAHAN KEDA KAMPUNG BAGAN, NAKA   06350 POKOK SENA', 2),
(756, 868, 28, 3, 9, '3', '7', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS  MUKIM TEKAI KANAN   06350 POKOK SENA', 2),
(757, 869, 28, 1, 8, '5', '1', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 3 KG BERDIKARI NAKA  06350 POKOK SENA', 2),
(758, 870, 28, 2, 7, '4', '1', 2, 1, 1, 2, '6306f3cf2ae50.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP BESAR MUKIM TEKAI KANAN  KUALA NERANG   06300 KUALA NERANG', 2),
(759, 871, 28, 1, 16, '3', '4', 2, 3, 3, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANDOP, MUKIM TEKAI KIRI   06350 POKOK SENA', 2),
(760, 872, 28, 4, 9, '3', '1', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KAMPUNG TOK SALAM KUALA NERANG   06350 POKOK SENA', 2),
(761, 873, 28, 4, 13, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'DEPAN PUSAT LATIHAN NAKA, KG BARU NAKA, NAKA ALOR SETAR   06350 POKOK SENA', 2),
(762, 874, 29, 4, 15, '6', '12', 1, 1, 1, 2, '6305a96fc5a9e.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KLINIK KESIHATAN NAKA   06310 Alor Setar', 2),
(763, 875, 29, 2, 4, '6', '6', 2, 6, 2, 2, '6305a989956ad.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG MK LESONG,POKOK SENA   06350 ALOR SETAR', 2),
(764, 876, 29, 2, 18, '1', '8', 1, 6, 2, 2, '6305a9a17724c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 46-B KAMPUNG TITI AKAR MUKIM PADANG KERBAU PENDANG   06750 ALOR SETAR', 2),
(765, 877, 29, 1, 19, '3', '4', 2, 1, 1, 2, '6305a9b96a8f8.jpg', 'Ya', 'TIDAK', 'Tidak', 'KG KUBANG JULUK, NAKA   06350 ALOR SETAR', 2),
(766, 878, 29, 3, 12, '4', '7', 1, 1, 1, 2, '6305a9e7bf78d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN   06300 KUALA NERANG', 2),
(767, 879, 29, 3, 7, '6', '1', 1, 1, 1, 2, '6305aa87d423f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG UTARA, MUKIM TEKAI KANAN   06300 KUALA NERANG', 2),
(768, 880, 29, 3, 13, '6', '1', 1, 1, 1, 2, '6305a9ffcd64f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 52, PERUMAHAN KEDA PONG SELATAN, NAKA   06350 ALOR SETAR', 2),
(769, 881, 29, 3, 9, '3', '1', 2, 1, 1, 2, '6305aa241d55d.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 12 DESA KEDA BENDANG TOK TERI   06350 ALOR SETAR', 2),
(770, 882, 29, 3, 7, '3', '8', 2, 1, 1, 2, '6305aa3d2113f.jpg', 'Tidak', 'TIDAK', 'Tidak', '58, KAMPUNG BENDANG TOK TERI, NAKA   06350 ALOR SETAR', 2),
(771, 883, 29, 3, 13, '5', '7', 2, 1, 1, 2, '6305aa52332d1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG BEMBAN   06300 KUALA NERANG', 2),
(772, 884, 29, 2, 7, '3', '4', 2, 1, 1, 2, '6305aad63002a.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA, MUKIM TEKAI KIRI NAKA  06350 ALOR SETAR', 2),
(773, 885, 29, 2, 13, '5', '7', 2, 1, 1, 2, '6305aaf981c0f.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KG. KUBANG BEMBAN, MUKIM TEKAI KANAN   06350 POKOK SENA', 2),
(774, 886, 29, 2, 4, '4', '4', 2, 6, 2, 2, '6305ab1d4d1c1.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG CHANG DENG MUKIM TEKAI KIRI NAKA ALOR SETAR   06350 ALOR SETAR', 2),
(775, 887, 29, 3, 4, '4', '4', 2, 4, 2, 2, '6305ab3281caa.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP NAKA  ALOR SETAR   06350 ALOR SETAR', 2),
(776, 888, 30, 4, 19, '4', '14', 1, 1, 1, 2, '6388964310c1e.jpg', 'Tidak', 'YA', 'Tidak', 'NO. 22 KEDA KAMPUNG BAGAN NAKA ALOR SETAR   06350 POKOK SENA', 1),
(777, 889, 30, 3, 3, '1', '10', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2,PERUMAHAN KEDA KUBANG KENYENG,   06350 POKOK SENA', 1),
(778, 890, 30, 3, 4, '1', '6', 2, 6, 2, 2, '63889512d7ee8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BARU NAKA MUKIM TEKAI KIRI  ALOR SETAR   06350 ALOR SETAR', 1),
(779, 891, 30, 2, 16, '3', '4', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG TANDOP MUKIM TEKAI KIRI NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(780, 892, 30, 1, 3, '4', '10', 1, 1, 1, 2, '6388958e20243.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 31 KAMPUNG BARU NAKA PEKAN NAKA  06350 POKOK SENA', 1),
(781, 893, 30, 3, 16, '4', '5', 1, 1, 1, 2, '638895b710ca0.jpg', 'Tidak', 'YA', 'Tidak', 'KAMPUNG MASJID BARU NAKA   06350 ALOR SETAR', 1),
(782, 894, 30, 3, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BARU LEBAI SAMAN, MUKIM TEKAI KIRI,   06350 ALOR SETAR', 1),
(783, 895, 30, 3, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 55,KG BENDANG TOK TERI,MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(784, 896, 30, 4, 16, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 47 KEDA PONG SELATAN NAKA ALOR SETAR   06350 ALOR SETAR', 1),
(785, 897, 30, 1, 13, '4', '1', 1, 1, 1, 2, '634bd658a2688.jpg', 'Tidak', 'TIDAK', 'Tidak', 'N0 1060 TAMAN NAKA JAYA NAKA  06350 POKOK SENA', 1),
(786, 898, 30, 1, 16, '4', '1', 1, 1, 1, 2, '6388960326656.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 18, KG PONG SELATAN, NAKA,   06350 ALOR SETAR', 1),
(787, 899, 30, 2, 16, '4', '14', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PONG MANIS MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(788, 900, 30, 1, 7, '4', '6', 2, 1, 1, 2, '638895df32ee0.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO 18 PERUMAHAN KEDA PONG SELATAN NAKA  06350 POKOK SENA', 1),
(789, 901, 30, 2, 18, '1', '7', 1, 6, 2, 2, '634bd60490a9c.jpg', 'Tidak', 'TIDAK', 'Tidak', 'NO. 244 PEKAN NAKA  ALOR SETAR   06350 ALOR SETAR', 1),
(790, 902, 30, 4, 18, '1', '7', 1, 6, 2, 2, '634bd623e67b8.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG, MUKIM LESONG   06350 ALOR SETAR', 1),
(791, 903, 30, 4, 16, '4', '5', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG KUBANG JULUK MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(792, 904, 30, 2, 18, '1', '7', 1, 6, 2, 2, '6388954ecd0eb.jpg', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG PAYA SIDANG MUKIM LESONG  POKOK SENA   06400 ALOR SETAR', 1),
(793, 905, 30, 2, 18, '1', '7', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO. 238 KAMPUNG BARU NAKA  ALOR SETAR   06350 ALOR SETAR', 1),
(794, 906, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TANJUNG LUAR, MUKIM PEDU   06300 KUALA NERANG', 1),
(795, 907, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '1068 TMN NAKA JAYA   06350 POKOK SENA', 1),
(796, 908, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU   06350 POKOK SENA', 1),
(797, 909, 31, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK, NAKA   06350 POKOK SENA', 1),
(798, 910, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG DATUK MK TEKAI KIRI   06350 POKOK SENA', 1),
(799, 911, 31, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KG NAMI LAMA   08210 SIK', 1),
(800, 912, 31, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2257A, KUARTERS KLINIK KESIHATAN GULAU   08210 SIK', 1),
(801, 913, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG BAGAN   06350 ALOR SETAR', 1),
(802, 914, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG FELCRA KUBANG KENYENG   06350 ALOR SETAR', 1),
(803, 915, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KUATERS KLINIK DESA   06350 POKOK SENA', 1),
(804, 916, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 13 KAMPUNG BARU NAKA   06350 ALOR SETAR', 1),
(805, 917, 31, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(806, 918, 31, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU, NAKA   06350 ALOR SETAR', 1),
(807, 919, 32, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'NO 263 KAMPUNG PONDOK LABU KELADI   09000 KULIM', 1),
(808, 920, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 44 DESA KEDA BENDANG TOK TERI   06350 ALOR SETAR', 1),
(809, 921, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'G1-3 KUATERS IKBN NAKA, MUKIM TEKAI KIRI, PEKAN NAKA   06350 KUALA NERANG', 1),
(810, 922, 32, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'YA', 'Tidak', 'KAMPUNG PADANG KERASAK, JALAN NAKA   06350 POKOK SENA', 1),
(811, 923, 32, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG BELUKAR LUAS MUKIM TEKAI KIRI NAKA   06350 POKOK SENA', 1),
(812, 924, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID LAMA MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(813, 925, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG TOK SALAM   06350 POKOK SENA', 1),
(814, 926, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LEBAI SAMAN MUKIM TEKAI KANAN   06350 KUALA NERANG', 1),
(815, 927, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG BEMBAN MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(816, 928, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 1130 TAMAN DESA IMPIAN   06350 ALOR SETAR', 1),
(817, 929, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2-419 JALAN MATAHARI U5/117BLOK 2 SEKSYEN U5PANASURIA   40170 SHAH ALAM', 1),
(818, 930, 32, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO.48 PERUMAHAN KEDA PONG SELATAN NAKA   06350 ALOR SETAR', 1),
(819, 931, 33, 100, 100, '100', '100', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LAMDIN MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(820, 932, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'NO.32, KG. BELUKAR LUAS, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(821, 933, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. MASJID LAMA, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(822, 934, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'Kampung Padang Kerasak, Jalan Naka, Alor Setar, Kedah.   06350 ALOR SETAR', 1),
(823, 935, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG MASJID BARU, NAKA   06350 ALOR SETAR', 1),
(824, 936, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 2 , KAMPUNG TANDOP ,BT 27 JLN NAMI   06350 ALOR SETAR', 1),
(825, 937, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 5255A, LORONG BERDIKARI 6,KG BERDIKARI NAKA   06350 ALOR SETAR', 1),
(826, 938, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', '194, JALAN KOLAM AIR, FELDA LUBOK MERBAU, PENDANG, KEDAH DARUL AMAN.   06710 PENDANG', 1),
(827, 939, 33, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(828, 940, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG. BELUKAR LUAS, MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(829, 941, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'no 58 Pekan Naka   06350 ALOR SETAR', 1),
(830, 942, 34, 100, 100, '100', '100', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG LAMDIN   06350 ALOR SETAR', 1),
(831, 943, 34, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG MASJID BARU, MUKIM TEKAI KIRI, NAKA   06350 ALOR SETAR', 1),
(832, 944, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 51, DESA KEDA BENDANG TOK TERI   06350 ALOR SETAR', 1),
(833, 945, 34, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KUBANG JULUK   06350 ALOR SETAR', 1),
(834, 946, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PADANG BAKONG MUKIM TEKAI KANAN   06350 KUALA NERANG', 1),
(835, 947, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG KERKAU MK GUAR KEPAYANG   06700 PENDANG', 1),
(836, 948, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KG PONG MANIS, MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(837, 949, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'LOT 5236 KAMPUNG BERDIKARI, NAKA   06350 ALOR SETAR', 1),
(838, 950, 34, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 62, PERUMAHAN KEDA, KG BAGAN, NAKA   06350 ALOR SETAR', 1),
(839, 951, 34, 100, 100, '100', '100', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'KAMPUNG LUBOK RAMBAI MUKIM TEKAI KIRI  06350 ALOR SETAR', 1),
(840, 952, 34, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG TANDOP BESAR KUALA NERANG   06300 KUALA NERANG', 1),
(841, 953, 34, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Tidak', 'NO 84, LORONG IMPIAN 5, TAMAN DESA IMPIAN  06350 ALOR SETAR', 1),
(842, 954, 34, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Tidak', 'KG. LEBAI SAMAN, MUKIM TEKAI KIRI   06350 ALOR SETAR', 1),
(843, 955, 35, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG BUKIT JALAN PONDOK LAMA JALAN NAKA   06350 POKOK SENA', 1),
(844, 956, 35, 100, 100, '100', '100', 1, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG JORONG MUKIM SOK   08210 SIK', 1),
(845, 957, 35, 100, 100, '100', '100', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG. LAMDIN,NAKA, 06350 ALOR SETAR, KEDAH.   06350 ALOR SETAR', 1),
(846, 958, 35, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Ya', 'KG KUBANG KENYENG   06300 KUALA NERANG', 1),
(847, 959, 35, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'NO 17 PERUMAHAN KEDA PONG SELATAN   06350 POKOK SENA', 1),
(848, 960, 35, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG. MASJID BARU, MUKIM TEKAI KIRI   06350 POKOK SENA', 1),
(849, 961, 35, 100, 100, '100', '100', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG. LAMDIN,NAKA, 06350 ALOR SETAR, KEDAH.   06350 ALOR SETAR', 1),
(850, 962, 35, 100, 100, '100', '100', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG LAMDIN, JALAN NAKA, ALOR SETAR   06350 ALOR SETAR', 1),
(851, 963, 36, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG KUBANG BEMBAN, KUALA NERANG   06300 KUALA NERANG', 1),
(852, 964, 36, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'BATU 19 ,KAMPUNG BUKIT, MUKIM BUKIT LADA,   06350 POKOK SENA', 1),
(853, 965, 36, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Ya', 'TIDAK', 'Ya', 'KG DATOK,MUKIM TEKAI KIRI , NAKA   06350 POKOK SENA', 1),
(854, 966, 36, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'NO 1109,TAMAN DESA IMPIAN,NAKA   06350 POKOK SENA', 1),
(855, 967, 36, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Ya', 'KAMPUNG PADANG BAKONG MUKIM TEKAI KANAN   06300 KUALA NERANG', 1),
(856, 968, 36, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'No 17 Perumahan KEDA Pong Selatan, Naka,   06350 POKOK SENA', 1),
(857, 969, 37, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG PADANG KERASAK MUKIM TEKAI KANAN  06350 POKOK SENA', 1),
(858, 970, 37, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG BENDANG BARU   06350 POKOK SENA', 1),
(859, 971, 37, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG BARU, JALAN KUBANG JULUK, NAKA   06350 ALOR SETAR', 1),
(860, 972, 38, 100, 100, '100', '100', 2, 4, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG. TANDOP   06350 ALOR SETAR', 1),
(861, 973, 38, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG KUBANG JULUK, MUKIM TEKAI KANAN,   06350 POKOK SENA', 1),
(862, 974, 38, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG KUBANG JULUK, MUKIM TEKAI KANAN, NAKA,  06350 POKOK SENA', 1),
(863, 975, 38, 100, 100, '100', '100', 1, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG KUBANG JULUK MUKIM TEKAI KANAN   06350 ALOR SETAR', 1),
(864, 976, 38, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', '104A KUALA SUNGAI BARU   06300 KUALA NERANG', 1),
(865, 977, 38, 100, 100, '100', '100', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG LAMDIN, MUKIM TEKAI KIRI   06300 KUALA NERANG', 1),
(866, 978, 39, 100, 100, '100', '100', 1, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG LAMDIN JALAN NAKA  ALOR SETAR   06350 ALOR SETAR', 1),
(867, 979, 39, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'NO 15 PERUMAHAN KEDA KG BAGAN NAKA   06350 ALOR SETAR', 1),
(868, 980, 39, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'BATU 27 3/4, JALAN AMPANGAN PEDU 06300 KUALA NERANG KEDAH   06300 KUALA NERANG', 1),
(869, 981, 39, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Ya', 'TIDAK', 'Ya', '24, DESA KEDA BENDANG TOK TERI, NAKA,   06350 POKOK SENA', 1),
(870, 982, 39, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', '17, PERUMAHAN KEDA PONG SELATAN, NAKA,   06350 POKOK SENA', 1),
(871, 983, 39, 100, 100, '100', '100', 2, 1, 1, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KAMPUNG LEBAI SAMAN   06350 ALOR SETAR', 1),
(872, 984, 39, 100, 100, '100', '100', 2, 6, 2, 2, '', 'Tidak', 'TIDAK', 'Ya', 'KG. LUBUK RAMBAI, MK TEKAI KIRI   06300 KUALA NERANG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `minggu`
--

CREATE TABLE `minggu` (
  `id` int(11) NOT NULL,
  `minggu` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minggu`
--

INSERT INTO `minggu` (`id`, `minggu`, `id_status`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'noemail@mail.com',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT 3,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `fullname`, `email`, `username`, `password`, `role`, `status`) VALUES
(1, 'MOHD AZIM BIN ABD WAHAB', 'cg.azim78@gmail.com', '780424025149', '5149', 2, 1),
(5, 'ABDULLAH BIN SULONG', 'lahsulong94@gmail.com', '690102025729', '5729', 2, 1),
(6, 'AHMAD BIN SAAD', 'myshahar@gmail.com  ', '681108025549', '5549', 2, 1),
(8, 'AHMAD SUKERI BIN DIN', 'ahmadsukeridin987@yahoo.com', '640419025297', '5297', 2, 1),
(9, 'ASMA BINTI MD NOH', 'asmamdnoh123@gmail.com', '750308025240', '5240', 2, 1),
(11, 'AZIZAN BIN ABD HAMID', 'azmid69@gmail.com  ', '691001025601', '5601', 5, 1),
(12, 'AZIZAN BIN MD. SAMAN', 'mrazzn@gmail.com  ', '640309025579', '5579', 2, 1),
(13, 'AZURA BT IBRAHIM', 'azuraibrahim67@gmail.coml  ', '670224025104', '5104', 2, 1),
(14, 'CHE FAZAILAH BT ISHAK', 'ifazailah@yahoo.com  ', '680714025392', '5392', 2, 1),
(15, 'CHE ZAINAB BINTI YAHYA', 'alyahusna71gmail.com  ', '710507025466', '5466', 2, 1),
(16, 'FAIZAH BT JUSOH', '', '661026025416', '5416', 4, 1),
(18, 'HASLIZA BINTI HASSAN', '  ', '761028025784', '5784', 2, 1),
(19, 'HAZITA BINTI KAMIS', 'zitaskamis71@yahoo.com ', '710906045202', '5202', 2, 1),
(20, 'HAZWANI SYAFAWATI BINTI YAHYA', ' ', '911231085724', '5724', 4, 1),
(21, 'HILMIYAH BINTI ZAKARIA', 'asmie93@yahoo.com  ', '700920025276', '5276', 2, 1),
(22, 'HUNAINI BINTI JAAFAR', 'abhangahnani@gmail.com ', '721201025360', '5360', 2, 1),
(25, 'ISMAIL BIN HJ. SAID', ' ', '640313025301', '5301', 2, 1),
(26, 'JAMALUDIN BIN AWANG', 'jamaludinawang2@gmail.com', '650925025491', '5491', 2, 1),
(27, 'JAMIL BIN HARON', ' ', '650904025601', '5601', 4, 1),
(28, 'JAMILAH BT MANSOR', 'tautan_mawaddah@yahoo.com ', '850213025414', '5414', 2, 1),
(29, 'KHAIRUL ANUAR BIN SALLEH', 'mospida78@yahoo.com.my ', '780417025749', '5749', 4, 1),
(30, 'MAAZAH BT. SAAD', 'Maazah.Saad@yahoo.com ', '711130025048', '5048', 2, 1),
(31, 'MARDIANA BT MAHMUD', ' ', '780913095076', '5076', 4, 1),
(32, 'MASLIZA BINTI MUSTAFA', 'masliza1977@gmail.com  ', '770524086556', '6556', 2, 1),
(33, 'MASTURA BINTI MAT ISA', 'qaseh_insyirah@yahoo.com  ', '850606025538', '5538', 2, 1),
(34, 'MAZIAH BINTI AZMI', 'maziahazmi@yahoo.com  ', '860505025394', '5394', 2, 1),
(35, 'MD JELANI BIN NOH', 'gktv.smknaka@gmail.com  ', '640602025009', '5009', 2, 1),
(36, 'MEGAT MOHD SHUKRI BIN ALI', ' ', '950125025375', '5375', 4, 1),
(37, 'MHD HABIBULLAH BIN SALLEH', 'habibsalleh80@gmail.com ', '801222025087', '5087', 2, 1),
(38, 'MHD REJAB BIN JUSOH', 'zainudinharisun@yahoo.com  ', '651119025379', '5379', 2, 1),
(40, 'MOHAMAD IDRIS BIN ABDUL HAMID', 'idrismpss@yahoo.com  ', '690630025597', '5597', 2, 1),
(41, 'MOHAMAD SALIHIN BIN OMAR', 'salihinomar@yahoo.com  ', '910129065589', '5589', 2, 1),
(42, 'MOHD NOOR BIN DAHAMAN', 'emnoordaha@yahoo.com  ', '650408025995', '5995', 2, 1),
(43, 'MOHD NORIZAN BIN ALADIN', 'jan_kdh86@yahoo.com ', '860314266099', '6099', 2, 1),
(44, 'MOHD RUZUWA BIN ISMAIL', 'zwash_05@yahoo.com.my ', '800603035209', '5209', 2, 1),
(45, 'MOHD SAIFUDDIN BIN MD AZIZ @ YAACOB', 'deanzbandung@gmail.com', '811204125155', '5155', 2, 1),
(46, 'MOHD SHAIFUL AZLAN BIN ABD KHAFAR', 'scorpio_nov10@yahoo.com ', '841110025935', '5935', 2, 1),
(47, 'MOHD TARMIZI BIN CHE MAT', 'mizinaka@yahoo.com.my', '780919025917', '5917', 2, 1),
(48, 'MOHD YUSOFF BIN ABDULLAH', ' ', '670901025073', '5073', 2, 1),
(49, 'MOHD ZUBIR BIN ISMAIL', '', '770408026599', '6599', 4, 1),
(50, 'MOHD. NAZERI BIN MAHMOOD', 'nazerimahmood67@gmail.com ', '670610025663', '5663', 2, 1),
(51, 'MOHD. SHUKRI BIN MOHD. SHUIB', 'mshuk65@gmail.com ', '651001025533', '5533', 2, 1),
(52, 'MOHD.TAUFIQ @ MOHD.TAUPEK BIN ABD.RAHIM', 'taufiqabdrahim@yahoo.com.my ', '710512015385', '5385', 2, 1),
(53, 'MUHAMAD AFIF WAHDI BIN ABDUL WAHAB', 'awaw.muhamad@yes.my', '890823025979', '5979', 2, 1),
(54, 'MUHAMMAD FIRDAUS BIN KHAIRUDDIN', 'mfkkbm5575@gmail.com ', '880930265549', '5549', 2, 1),
(55, 'MUHD NASIR BIN AHMAD', 'muhd.nasir.bin.ahmad@gmail.com', '820416025361', '5361', 2, 1),
(56, 'MUSTAPHA BIN SAID', 'mussaid2017@gmail.com', '730603025325', '5325', 2, 1),
(57, 'NADIAH BINTI MOHD MANSOR', 'nadiahsaufiuddin@yahoo.com ', '880621025680', '5680', 2, 1),
(58, 'NAIMAH BINTI YAHAYA', 'naeem.neem@yahoo.com', '760611026368', '6368', 2, 1),
(59, 'NATTEROH BINTI HASAN', 'mohd asri.mohammad@yahoo.com ', '731105025538', '5538', 2, 1),
(60, 'NIK AMRUL FAAIZOL BIN NIK YUSUF', 'nikamrul@gmail.com ', '730613035447', '5447', 2, 1),
(61, 'NOOR ADIBA @ ADIBAH BINTI KUSHAIRI', 'nooradibakushairi@gmail.com', '640316085158', '5158', 2, 1),
(62, 'NOOR AZAZIAH BINTI ZAKARIA', 'syazirimuaz@gmail.com', '830828085044', '5044', 2, 1),
(63, 'NOORDIN BIN AHMAD', 'dintamanjati@gmail.com ', '660927025507', '5507', 2, 1),
(64, 'NOR ANISAH BINTI ABDULLAH', 'noranisaqilah_82@yahoo.com ', '820413025550', '5550', 2, 1),
(65, 'NOR HABIBAH BINTI MOHAMMAD', 'ibnhayyi@yahoo.com', '790414025734', '5734', 2, 1),
(66, 'NOR HASHIMAH BINTI ARSHAD', 'norhashimaharshad@yahoo.com', '750804025530', '5530', 2, 1),
(68, 'NORANIZA BINTI AZIZAN', 'neez_2904@yahoo.com ', '770908026122', '6122', 2, 1),
(69, 'NORFAEZAH BINTI SHUKRI', 'naf_8887@yahoo.com ', '870808025956', '5956', 2, 1),
(70, 'NORHAYATI BT AROFF', 'norhayatiaroff@gmail.com ', '680424025730', '5730', 2, 1),
(71, 'NORLELA BINTI HASHIM', 'n_ell129@hotmail.com ', '830912145222', '5222', 2, 1),
(72, 'NORLELA BINTI MOHD SAHAT', 'nanasrudin@gmail.com', '12345', '12345', 2, 2),
(73, 'NUR AINA BT ABD RAHMAN', 'tehsongketvanilla@yahoo.com', '781024025988', '5988', 2, 1),
(74, 'NUR FAEZAH BINTI IBRAHIM', 'nurfaezah1978@gmail.com', '780626035062', '5062', 2, 1),
(75, 'NURUL HIDAYAH BINTI YUSOFF', 'hidayah_pooh90@yahoo.com', '900414025472', '5472', 2, 1),
(76, 'NURULHUDA BINTI AWANG YAACOB', 'hudazikra86@gmail.com', '860602025572', '5572', 2, 1),
(77, 'RAMLI BIN TALIB', 'ramlie2333@yahoo.com ', '700625025695', '5695', 2, 1),
(78, 'RIZAL ANWAR BIN ABIDIN @ AHMAD', 'rizal_anwar47@yahoo.com ', '740215026085', '6085', 2, 1),
(80, 'ROSNIZA BINTI AWANGSA', '', '800603025326', '5326', 4, 1),
(81, 'ROSNIZAN BT MURAD', 'rosnizanmurad@gmail.com', '801011025626', '5626', 2, 1),
(82, 'SALMAH BT ALI', 'salsmknaka@gmail.com ', '720927075450', '5450', 2, 1),
(83, 'SHAHIBULLAH BIN HASHIM', 'shahibullah1@gmail.com', '661112025631', '5631', 4, 1),
(84, 'SITI HAJAR BT GHAZALI', 'sitihajarbintighazali2002@gmail.com', '761120025138', '5138', 2, 1),
(85, 'SITI KHADIJAH BINTI ISMAIL', 'ctkhadijah24@gmail.com', '850524025008', '5008', 2, 1),
(86, 'SITI KHATIJAH BINTI HJ RADIN @ KUDIN', 'khatijahradin@gmail.com', '740324015692', '5692', 2, 1),
(87, 'SITI MARIAM BINTI ISA', '', '771111025872', '5872', 4, 1),
(88, 'SITI MARYAM BINTI HASBULLAH', 'maryamhasbullah@gmail.com', '900916016402', '6402', 2, 1),
(89, 'SITI SARA BINTI HARUN', ' ', '780424025798', '5798', 2, 1),
(90, 'SOPIAH BT. ABDUL RAZAB', 'sopiahrazab68@gmail.com', '680222025716', '5716', 2, 2),
(91, 'SU CHIN A/P PIAN', 'suchin_pian@yahoo.com', '791123025560', '5560', 2, 1),
(92, 'SUHAINI BINTI MOHD NOH', 'suhaini473@gmail.com', '830203025148', '5148', 2, 1),
(93, 'SUHANA BINTI JOHARI', 'aisyah_dzakiyyah@yahoo.com', '790305065008', '5008', 2, 1),
(94, 'SUZANA BINTI HARUN', 'anamirzana@gmail.com', '820420025532', '5532', 2, 1),
(95, 'YUSNIZAH BINTI ABIDIN', 'ms.yusnizah@gmail.com ', '700101026662', '6662', 2, 1),
(96, 'ZAHARAH BINTI AWANG AHMAD', 'zaharah60378@yahoo.com', '650401026338', '6338', 2, 1),
(98, 'ZURAIHAN BINTI TAJUL ARUS', 'ztajularus77@gmail.com', '770619026476', '6476', 4, 1),
(99, 'ZURINA BT DERAMAN', 'zackliey@yahoo.com.my ', '820316115060', '5060', 2, 1),
(104, 'NASRIAH BT ABU BAKAR', 'nasriah@123.com ', '00123', '123', 2, 2),
(105, 'NOOR HILALLIYA BINTI MOHAMAD KHALID', 'email@email.com', '920530025232', '5232', 2, 1),
(106, 'MOHAMMAD AL GHAZALI BIN AB HAMID', 'email1@email.com  ', '920725035289', '5289', 2, 1),
(110, 'MUHAMMAD SYAFIQ BIN MHD SHARIFF', '', '960301026043', '6043', 2, 1),
(111, 'NUR FAHANA BINTI MANAS', '', '900504025476', '5476', 2, 1),
(112, 'MAZNI BINTI HAMID', 'mazni_hamid77@yahoo.com', '770829025906', '5906', 2, 1),
(113, 'NUR FARAH NADIAH BINTI SAMSUDIN', 'email@email.com', '941119025470', '5470', 2, 1),
(114, 'FAUZI BIN ZAKARIA', 'fauzizakaria39@gmail.com', '740424035367', '5367', 2, 1),
(115, 'ADMIN SISTEM', 'admin@smknaka.net', 'admin', 'abc123', 1, 1),
(116, 'ANIS NURSYIFA BINTI MOHD JASNI', 'email@email.com', '090127020802', '090127020802', 3, 1),
(117, 'ANIS SOFEA BINTI MOHD ROSLI', 'email@email.com', '090322021026', '090322021026', 3, 1),
(118, 'ANIS SOFFIA BINTI MOHAMAD FAUZIYUDDIN', 'email@email.com', '090925021236', '090925021236', 3, 1),
(119, 'ASFA ZAFIRAH BINTI MOHD FADZLI', 'email@email.com', '091105020742', '091105020742', 3, 1),
(120, 'KU SHAZFA IRDINA BINTI KU SHAKIRIZAN', 'email@email.com', '090930020764', '090930020764', 3, 1),
(121, 'MUHAMMAD AHLAMI BIN MUHAMMAD FADZLI', 'email@email.com', '090927020851', '090927020851', 3, 1),
(122, 'MUHAMMAD AJMAL AISAR BIN ABDUL HADI', 'email@email.com', '091223020583', '091223020583', 3, 1),
(123, 'MUHAMMAD AMIR IZZAT BIN ABIDIN', 'email@email.com', '090521021045', '090521021045', 3, 1),
(124, 'MUHAMMAD AQIL MIFZAL BIN AZLAN', 'email@email.com', '091222020397', '091222020397', 3, 1),
(125, 'MUHAMMAD FARIS IKHWAN BIN MOHD BASRI', 'email@email.com', '091214020805', '091214020805', 3, 1),
(126, 'MUHAMMAD FARIS ZIKRI BIN MOHD SHAIFULLAH', 'email@email.com', '090126020405', '090126020405', 3, 1),
(127, 'MUHAMMAD ISKANDAR FARHAN BIN MOHD AKRAMAH', 'email@email.com', '090630020893', '090630020893', 3, 1),
(128, 'MUHAMMAD NABIL SYUKRI BIN MOHD NAZRI', 'email@email.com', '090121090105', '090121090105', 3, 1),
(129, 'MUHAMMAD SYAKIR BIN MOHD SOHAIMI', 'email@email.com', '090820020923', '090820020923', 3, 1),
(130, 'MUHAMMAD YAFIQ LUKMAN BIN MOHD JEFRI', 'email@email.com', '090122020555', '090122020555', 3, 1),
(131, 'NUR AIMAR HAZIQAH BINTI ABU SOFIAN', 'email@email.com', '090825090218', '090825090218', 3, 1),
(132, 'NUR AINA DANIESYA BINTI MOHAMAD KHOIRI', 'email@email.com', '090428020240', '090428020240', 3, 1),
(133, 'NUR AISYA SAFIENA BINTI RIZAL ANWAR', 'email@email.com', '090917020428', '090917020428', 3, 1),
(134, 'NUR AMIRA NADIA BINTI ABDULLAH', 'email@email.com', '090227020252', '090227020252', 3, 1),
(135, 'NUR AYUNI BALQIS BINTI MAHISAN', 'email@email.com', '090521020456', '090521020456', 3, 1),
(136, 'NUR DANIA BINTI MOHAMAAD ZABIDI', 'email@email.com', '090503020428', '090503020428', 3, 1),
(137, 'NUR FAHNIA HAINA BINTI BASRI', 'email@email.com', '090827020352', '090827020352', 3, 1),
(138, 'NUR KHAIRUNISA NURUL IMAN BINTI MOHAMAD ZUTI', 'email@email.com', '090906020318', '090906020318', 3, 1),
(139, 'NUR LAILATUL QISTINA BINTI ALIAS', 'email@email.com', '090212021076', '090212021076', 3, 1),
(140, 'NUR MIEDA AYUNI BINTI MUHAMAD SUHAIMI', 'email@email.com', '090302020296', '090302020296', 3, 1),
(141, 'NUR MIEDA QISTINA BINTI MUHAMAD SUHAIMI', 'email@email.com', '090302020288', '090302020288', 3, 1),
(142, 'NUR SHAFINAS BINTI MOHD ZAKARIA', 'email@email.com', '090517020322', '090517020322', 3, 1),
(143, 'NUR SUMAYYAH AIDA BINTI FADRULRAZY', 'email@email.com', '090405020774', '090405020774', 3, 1),
(144, 'NURAINA FAQISHA BINTI NORASRUL', 'email@email.com', '090708070672', '090708070672', 3, 1),
(145, 'NURUL QISTINA MARSHA BINTI JAMAL', 'email@email.com', '090123020434', '090123020434', 3, 1),
(146, 'AIMUNI AFIFAH BINTI MOHD NIDZAM', 'email@email.com', '090425020050', '090425020050', 3, 1),
(147, 'AMIRA SHAMIMI BINTI SHARIN', 'email@email.com', '090602020124', '090602020124', 3, 1),
(148, 'MUHAMMAD AMIRUL AIMAN BIN ABDUL HAFIZ', 'email@email.com', '090619020163', '090619020163', 3, 1),
(149, 'MUHAMMAD AMSYAR NAJIY BIN MOHD RIZAL', 'email@email.com', '090218020779', '090218020779', 3, 1),
(150, 'MUHAMMAD ARIF BIN RIDZUAN', 'email@email.com', '090526020527', '090526020527', 3, 1),
(151, 'MUHAMMAD ASYRAF AHNAF BIN MOHD NOOR', 'email@email.com', '090706020663', '090706020663', 3, 1),
(152, 'MUHAMMAD HAFIY IQBAL BIN ABDUL RAHMAN', 'email@email.com', '090313020021', '090313020021', 3, 1),
(153, 'MUHAMMAD HAFIZI BIN ABDULLAH', 'email@email.com', '090524021139', '090524021139', 3, 1),
(154, 'MUHAMMAD HAZIQ DARWISY BIN MOHD HAZLI', 'email@email.com', '091026020939', '091026020939', 3, 1),
(155, 'MUHAMMAD NABIL BIN BADOR', 'email@email.com', '090820021029', '090820021029', 3, 1),
(156, 'MUHAMMAD NAUFFAL AZRIQ AQIFF BIN MUHAMAD ALIF', 'email@email.com', '090614100869', '090614100869', 3, 1),
(157, 'MUHAMMAD SYAZMIN AIMAN BIN MOHD SAMKHINA', 'email@email.com', '090311020765', '090311020765', 3, 1),
(158, 'MUKHRIZ BIN MAHADHIR', 'email@email.com', '090826022049', '090826022049', 3, 1),
(159, 'NUR AINA SOLEHAH BINTI ZULKAFLI', 'email@email.com', '090714020938', '090714020938', 3, 1),
(160, 'NUR AININ SOLIHIN BINTI ZULKAFLI', 'email@email.com', '090714020946', '090714020946', 3, 1),
(161, 'NUR ALEEYA MAIZURAH BINTI MAIZUL', 'email@email.com', '090415020452', '090415020452', 3, 1),
(162, 'NUR ALYANA MAISARAH BINTI ROSDISHAM', 'email@email.com', '091015021370', '091015021370', 3, 1),
(163, 'NUR AUNI AQILAH BINTI NORZELAN', 'email@email.com', '090527020502', '090527020502', 3, 1),
(164, 'NUR AWATIF ZULAIKHA BINTI ZAFIZUL', 'email@email.com', '090327020452', '090327020452', 3, 1),
(165, 'NUR DAMIA AFRINA BINTI AFFENDI', 'email@email.com', '090210070552', '090210070552', 3, 1),
(166, 'NUR ELLYSHA ERYANI BINTI MOHD HUSNI', 'email@email.com', '090326020290', '090326020290', 3, 1),
(167, 'NUR FASIHAH BINTI MOHD YUSOFF', 'email@email.com', '090303020220', '090303020220', 3, 1),
(168, 'NUR FATHIAH BINTI MOHD YUSOFF', 'email@email.com', '090303020212', '090303020212', 3, 1),
(169, 'NUR FATIN SYAFIQAH BINTI MOHD NAZRI', 'email@email.com', '091223020938', '091223020938', 3, 1),
(170, 'NUR IMAN ALYA BINTI NORDI', 'email@email.com', '090528020336', '090528020336', 3, 1),
(171, 'NUR MUHAMMAD ADAM HAQIMI BIN ROSLI', 'email@email.com', '091025020785', '091025020785', 3, 1),
(172, 'NUR QURRATULAINI BINTI SYAHRUL RIZAL', 'email@email.com', '090215020458', '090215020458', 3, 1),
(173, 'NURIN FARZANA BINTI SAIDIN', 'email@email.com', '091028020764', '091028020764', 3, 1),
(174, 'NURSYAUQINA BINTI MOHD SURIZAN', 'email@email.com', '090819020272', '090819020272', 3, 1),
(175, 'NURUL BATRISYIA BINTI KHARIZAL', 'email@email.com', '090729020906', '090729020906', 3, 1),
(176, 'NURUL IMAN BINTI MOHD YUZIE', 'email@email.com', '090516020638', '090516020638', 3, 1),
(177, 'PUTERI ADILA MARIANA BINTI ABDULLAH', 'email@email.com', '091027110178', '091027110178', 3, 1),
(178, 'PUTRI AKMA NORISSHA BINTI MEGAT LONG', 'email@email.com', '090620020144', '090620020144', 3, 1),
(179, 'WAN NUR QAISARA BINTI WAN MOHD NAHAR', 'email@email.com', '091118020928', '091118020928', 3, 1),
(180, 'AHMAD DARWISH BIN MOHAMAD KHIRUL NIZAM', 'email@email.com', '091216020665', '091216020665', 3, 1),
(181, 'AHMAD TSAQIF BIN AZIZI', 'email@email.com', '091103021039', '091103021039', 3, 1),
(182, 'AINUM A/L AI BAU', 'email@email.com', '091021020155', '091021020155', 3, 1),
(183, 'ARNUSSARA A/P PRAKSIT', 'email@email.com', '090527020094', '090527020094', 3, 1),
(184, 'ISSARA A/P NOI', 'email@email.com', '090806020716', '090806020716', 3, 1),
(185, 'J. LIES MARISSA A/P SU TIN', 'email@email.com', '090319020356', '090319020356', 3, 1),
(186, 'KARAKET A/P PRAK SER', 'email@email.com', '090731090014', '090731090014', 3, 1),
(187, 'KEJSDAPHORN A/L NIWEIT', 'email@email.com', '091123020279', '091123020279', 3, 1),
(188, 'KRITTANON A/L NAM', 'email@email.com', '090425020579', '090425020579', 3, 1),
(189, 'MUHAMMAD ADIB NAUFAL BIN MOHD SOFI', 'email@email.com', '091226020693', '091226020693', 3, 1),
(190, 'MUHAMMAD AIDIL ADHA BIN RASIRWAN', 'email@email.com', '091128080983', '091128080983', 3, 1),
(191, 'MUHAMMAD AZRIEZ BIN ROSLI', 'email@email.com', '090912020517', '090912020517', 3, 1),
(192, 'MUHAMMAD DANISH BIN MUHAMMAD TAUFIQ', 'email@email.com', '090419020361', '090419020361', 3, 1),
(193, 'MUHAMMAD DANISH IMAN BIN MOHAMMAD IZHAR', 'email@email.com', '090615020609', '090615020609', 3, 1),
(194, 'MUHAMMAD HARITH ISKANDAR BIN MOHAMAD IRWAN', 'email@email.com', '091104020417', '091104020417', 3, 1),
(195, 'MUHAMMAD HAZIM BIN HISHAMUDDIN', 'email@email.com', '090223020837', '090223020837', 3, 1),
(196, 'MUHAMMAD IFFAN BIN MOHD ZAMRI', 'email@email.com', '090823020937', '090823020937', 3, 1),
(197, 'MUHAMMAD IRFAN HAKIMI BIN FAUZI', 'email@email.com', '091004021519', '091004021519', 3, 1),
(198, 'MUHAMMAD SYAKINN BIN MOHD HISHAMUDIM', 'email@email.com', '090830020791', '090830020791', 3, 1),
(199, 'MUHAMMAD SYAKIR BIN MAD YUSUP', 'email@email.com', '091011020581', '091011020581', 3, 1),
(200, 'NOR AIN FITRAH BINTI ZULKIFLI', 'email@email.com', '090821020124', '090821020124', 3, 1),
(201, 'NUR AINI FATIHAH BINTI MOHD FAZLI', 'email@email.com', '091201020152', '091201020152', 3, 1),
(202, 'NUR AIYU DANIA BINTI AZRUL', 'email@email.com', '090622070188', '090622070188', 3, 1),
(203, 'NUR ATIQAH NASUHA BINTI MOHAMAD RASIDI', 'email@email.com', '090524020152', '090524020152', 3, 1),
(204, 'NUR QASEH SYAZWANA BINTI AZHAR', 'email@email.com', '091224020198', '091224020198', 3, 1),
(205, 'NUR SYAZLIEN SYAZWANI BINTI ABDULLAH', 'email@email.com', '090509080624', '090509080624', 3, 1),
(206, 'NURUL JAZA HUSNA BINTI YUSUF', 'email@email.com', '090210020168', '090210020168', 3, 1),
(207, 'NURUL SHARMILA SHAKILA BINTI MASHOR', 'email@email.com', '090706020380', '090706020380', 3, 1),
(208, 'PAVEENA A/P CHARAN', 'email@email.com', '090318020012', '090318020012', 3, 1),
(209, 'PRAVIDA A/P CHALAD', 'email@email.com', '091126020338', '091126020338', 3, 1),
(210, 'SITI NUR HUSNA SOFEA BINTI AZMI', 'email@email.com', '090426020554', '090426020554', 3, 1),
(211, 'SOFIA NARISA BINTI SAFIEE', 'email@email.com', '090611020302', '090611020302', 3, 1),
(212, 'SUNITA A/P AI BAU', 'email@email.com', '090208020388', '090208020388', 3, 1),
(213, 'SYAMIL MUHAIMEN BIN AHMAD RABLI @ RODZI', 'email@email.com', '090524021067', '090524021067', 3, 1),
(214, 'TAT A/L SIM', 'email@email.com', '090512020745', '090512020745', 3, 1),
(215, 'ADAM SYAFIEQ BIN MUHAMAD SHUKOR', 'email@email.com', '090129020435', '090129020435', 3, 1),
(216, 'AHMAD SYAKIR BIN MAHAMUD', 'email@email.com', '091019021159', '091019021159', 3, 1),
(217, 'AL NUR ALISYA BINTI AKHAIRUDIN', 'email@email.com', '091110020368', '091110020368', 3, 1),
(218, 'ALYA DAFINA BINTI ABDUL MANAF', 'email@email.com', '090225020566', '090225020566', 3, 1),
(219, 'APHINAN A/L SOMMAI', 'email@email.com', '090121020131', '090121020131', 3, 1),
(220, 'AUNI QASRINA BINTI AHMAD FAKHRARAZI', 'email@email.com', '091023090130', '091023090130', 3, 1),
(221, 'CHRISSADA A/P AI YONG', 'email@email.com', '091209020464', '091209020464', 3, 1),
(222, 'CHUKRAIWAN A/P AI LIAP', 'email@email.com', '090609020522', '090609020522', 3, 1),
(223, 'FIANGFA A/P BOON KET', 'email@email.com', 'FIANGFA', 'FIANGFA', 3, 1),
(224, 'HANIS ALESYA BINTI ABDULLAH', 'email@email.com', '091110020456', '091110020456', 3, 1),
(225, 'KESSARA A/P VIRAT', 'email@email.com', '091018021050', '091018021050', 3, 1),
(226, 'MIERIA A/P PAN JA', 'email@email.com', '090530020562', '090530020562', 3, 1),
(227, 'MOHAMAD SHAZWAN BIN MOHAMAD SHUKRI', 'email@email.com', '090523070473', '090523070473', 3, 1),
(228, 'MUHAMMAD ALI IDHAM BIN FIRDAUS', 'email@email.com', '090223020351', '090223020351', 3, 1),
(229, 'MUHAMMAD ALIF SHAZIMIE BIN MOHD KASWADI', 'email@email.com', '090527020553', '090527020553', 3, 1),
(230, 'MUHAMMAD AZIB ZAKWAN BIN MUHAMAD SYAHIDAN', 'email@email.com', '090329020093', '090329020093', 3, 1),
(231, 'MUHAMMAD FARISADAM BIN MUHAMAD FARIZAL', 'email@email.com', '091019020201', '091019020201', 3, 1),
(232, 'MUHAMMAD HAFIZ AEMAN BIN MOHD HAFIZAM', 'email@email.com', '091126020119', '091126020119', 3, 1),
(233, 'MUHAMMAD HAIRIS HAIKAL BIN MOHD ARIFF', 'email@email.com', '091227020783', '091227020783', 3, 1),
(234, 'MUHAMMAD IDLAN HAKIMI BIN MOHD ZAMBRI', 'email@email.com', '091230020565', '091230020565', 3, 1),
(235, 'MUHAMMAD IESHAD HAFIZD BIN MOHD ZAIDI', 'email@email.com', '090430060217', '090430060217', 3, 1),
(236, 'MUHAMMAD IKHBAL MUZAIMIN BIN AHMAD FAUZI', 'email@email.com', '090203020573', '090203020573', 3, 1),
(237, 'MUHAMMAD QHAIRIE BIN MOHD SALLEH', 'email@email.com', '090724020595', '090724020595', 3, 1),
(238, 'NUR SYAHIRA BINTI ZURAIDI', 'email@email.com', '090929030914', '090929030914', 3, 1),
(239, 'NURHUSNA SYAFIQA BINTI MUHAMAD ZULAINI', 'email@email.com', '090817021108', '090817021108', 3, 1),
(240, 'RAWIT A/L WIRAT', 'email@email.com', '090822020433', '090822020433', 3, 1),
(241, 'SATTHAKORN SAIUBON A/L WINAI THORN', 'email@email.com', '090727020961', '090727020961', 3, 1),
(242, 'SUKCHANUN A/L AIBON', 'email@email.com', '090429020349', '090429020349', 3, 1),
(243, 'THANAKORN A/L AI LAI', 'email@email.com', '090426020749', '090426020749', 3, 1),
(244, 'UMMI AUNI UMAIRAH BINTI ZAMZALIDI', 'email@email.com', '091030020560', '091030020560', 3, 1),
(245, 'VINAS EKMONGKHON A/L AI OON', 'email@email.com', '090517020525', '090517020525', 3, 1),
(246, 'ZAHA NURDAFI HAQIEM BIN ZAHA AZMAN', 'email@email.com', '090831080913', '090831080913', 3, 1),
(247, 'ANYTTHA A/P IVONG', 'email@email.com', '090824020402', '090824020402', 3, 1),
(248, 'BEN TEOH MING LUN', 'email@email.com', '091004020831', '091004020831', 3, 1),
(249, 'CHINNAWUT A/L CHA LI', 'email@email.com', '090310020341', '090310020341', 3, 1),
(250, 'MAYLINDA A/P THAMA RONG', 'email@email.com', '090417090104', '090417090104', 3, 1),
(251, 'MUHAMMAD ADAM RIDZUAN BIN SHAFIE', 'email@email.com', '091024020353', '091024020353', 3, 1),
(252, 'MUHAMMAD AIMAN BIN HASSAN', 'email@email.com', '090511020241', '090511020241', 3, 1),
(253, 'MUHAMMAD AKIF ZAMANI BIN BASIR', 'email@email.com', '090312021233', '090312021233', 3, 1),
(254, 'MUHAMMAD AMMAR DANISH BIN JAMAL MOHAMAD', 'email@email.com', '090818020211', '090818020211', 3, 1),
(255, 'MUHAMMAD AMMAR ZULFAQAR BIN ABDULLAH', 'email@email.com', '091226020423', '091226020423', 3, 1),
(256, 'MUHAMMAD DANISH IQBAL BIN ZULKAFLI', 'email@email.com', '090123020231', '090123020231', 3, 1),
(257, 'MUHAMMAD FAHMI BIN MOHD SAMURI', 'email@email.com', '090429020891', '090429020891', 3, 1),
(258, 'MUHAMMAD FAKHRI HADI BIN HABALI', 'email@email.com', '090907021101', '090907021101', 3, 1),
(259, 'MUHAMMAD HAIZAL BIN MAT PUZI', 'email@email.com', '091204020633', '091204020633', 3, 1),
(260, 'MUHAMMAD HAMIZAN BIN MUHAMAD NASIR', 'email@email.com', '090403020869', '090403020869', 3, 1),
(261, 'MUHAMMAD HASRUL HAIKAL BIN ABDUL GHANI', 'email@email.com', '090704020483', '090704020483', 3, 1),
(262, 'MUHAMMAD IKHWAN SHAHRIZAD BIN MOHD KHIRULANUAR', 'email@email.com', '090122021267', '090122021267', 3, 1),
(263, 'MUHAMMAD IKRAM DANIAL BIN MOHD DESA', 'email@email.com', '090415020751', '090415020751', 3, 1),
(264, 'MUHAMMAD IRFAN BIN MOHAMAD SOPI', 'email@email.com', '091225020931', '091225020931', 3, 1),
(265, 'MUHAMMAD KHAIRIL AZLAN BIN YUSOF', 'email@email.com', '090124020591', '090124020591', 3, 1),
(266, 'MUHAMMAD NABIL BIN MOHD ZAMRI', 'email@email.com', '090128020185', '090128020185', 3, 1),
(267, 'MUHAMMAD NAUFAL HAKIMI SHAH BIN MUHAMAD SHAHIDFUDIN', 'email@email.com', '090314020605', '090314020605', 3, 1),
(268, 'MUHAMMAD NAZIM MUHAIMIN BIN MOHAMAD NIZAM', 'email@email.com', '090625020565', '090625020565', 3, 1),
(269, 'NANTHAKNIRH SISAYAAM A/L RAWEK', 'email@email.com', '090909021287', '090909021287', 3, 1),
(270, 'NATALI A/P IBAU', 'email@email.com', '090428020726', '090428020726', 3, 1),
(271, 'NUR AQILAH BINTI MUHAMAD FATZELI', 'email@email.com', '090125020788', '090125020788', 3, 1),
(272, 'NURIN BADRISYA BINTI ZULKIFLI', 'email@email.com', '090915020950', '090915020950', 3, 1),
(273, 'NURUL SUHADA NUR AIN BINTI ABDUL RAHMAN', 'email@email.com', '090719020734', '090719020734', 3, 1),
(274, 'PHONGSAKORN A/L A LIN', 'email@email.com', '091102021395', '091102021395', 3, 1),
(275, 'SITI FADLIANA BINTI MOHD FADLIN', 'email@email.com', '090204020612', '090204020612', 3, 1),
(276, 'SUKWAN A/L EP', 'email@email.com', '091003020231', '091003020231', 3, 1),
(277, 'SUWAN MANI A/P SOMCHOK', 'email@email.com', '091202020402', '091202020402', 3, 1),
(278, 'THAVIWAT A/L CHARAS', 'email@email.com', '090523020281', '090523020281', 3, 1),
(279, 'ACHALIT A/L I LUT', 'email@email.com', '090628020245', '090628020245', 3, 1),
(280, 'ADAM HEZRITH BIN JUSAIRI', 'email@email.com', '091025021307', '091025021307', 3, 1),
(281, 'AELYSSA KANGSAKUN A/P SOOMCAI', 'email@email.com', '090207020546', '090207020546', 3, 1),
(282, 'AKMAL HAFIZ BIN MOHD AZIZAN', 'email@email.com', '090607020561', '090607020561', 3, 1),
(283, 'AUNI ARISSA BINTI MOHD SHUHAILI', 'email@email.com', '091002020280', '091002020280', 3, 1),
(284, 'AYUNI SYUHADA BINTI SHAHRIZAN', 'email@email.com', '091212020350', '091212020350', 3, 1),
(285, 'CARENA A/P SOM CHIT', 'email@email.com', '090430020784', '090430020784', 3, 1),
(286, 'FARAH ALIESHA BINTI ABDULLAH', 'email@email.com', '091210020306', '091210020306', 3, 1),
(287, 'FARDEETHA A/P CHAI', 'email@email.com', '090517020840', '090517020840', 3, 1),
(288, 'MARSYANISA BINTI MUHAMAD', 'email@email.com', '090919020114', '090919020114', 3, 1),
(289, 'MUHAMMAD AIDIL BIN MUHAMAD BUKHARI', 'email@email.com', '091231020743', '091231020743', 3, 1),
(290, 'MUHAMMAD AIMAN BIN MOHADZIR', 'email@email.com', '090207020757', '090207020757', 3, 1),
(291, 'MUHAMMAD ALIF HAKIMI BIN AHMAD MUSA', 'email@email.com', '090217020697', '090217020697', 3, 1),
(292, 'MUHAMMAD AMIR SYAHMI BIN MOHAMMAD ZAMRI', 'email@email.com', '090929020767', '090929020767', 3, 1),
(293, 'MUHAMMAD AQIF NAIM BIN AZHAR', 'email@email.com', '090221020809', '090221020809', 3, 1),
(294, 'MUHAMMAD ARIF BIN ZAINI', 'email@email.com', '090219020893', '090219020893', 3, 1),
(295, 'MUHAMMAD AZDMIN BIN ROSIDI', 'email@email.com', '090809020113', '090809020113', 3, 1),
(296, 'MUHAMMAD FARIS BIN FAKRULRUZI', 'email@email.com', '090302021061', '090302021061', 3, 1),
(297, 'MUHAMMAD FARIS HAZIM BIN MOHAMAD HASROL', 'email@email.com', '090329020659', '090329020659', 3, 1),
(298, 'MUHAMMAD HAZIZI BIN JULAIHI', 'email@email.com', '090531021209', '090531021209', 3, 1),
(299, 'MUHAMMAD IZWAN HANIF BIN MOHD MOKHTAR', 'email@email.com', '091022021029', '091022021029', 3, 1),
(300, 'MUHAMMAD NAUFAL BIN MAD RADZI', 'email@email.com', '090308020625', '090308020625', 3, 1),
(301, 'NUR ALIANAZUHA BINTI MOHD RAZALI', 'email@email.com', '090629020570', '090629020570', 3, 1),
(302, 'NUR ALIYA SAFIRA BINTI ZAZALI', 'email@email.com', '091220020078', '091220020078', 3, 1),
(303, 'NUR DAMIA QISTINA BINTI RUS OZAIR', 'email@email.com', '090420020780', '090420020780', 3, 1),
(304, 'NUR DAVISHA BINTI SUKRI', 'email@email.com', '091112021022', '091112021022', 3, 1),
(305, 'NUR SYAZANA SYAMIMI BINTI ABDULLAH', 'email@email.com', '090322021018', '090322021018', 3, 1),
(306, 'NURANIS SYUHADA BINTI MAT DALI', 'email@email.com', '090808070020', '090808070020', 3, 1),
(307, 'NURUL SYUHADA IZZATI BINTI MANSOR', 'email@email.com', '090410020680', '090410020680', 3, 1),
(308, 'SAWITTRAWATT A/P AILING', 'email@email.com', '090731020788', '090731020788', 3, 1),
(309, 'SITI NASUHA BINTI SALAHUDDIN', 'email@email.com', '090909020348', '090909020348', 3, 1),
(310, 'VARRY A/P AIRAN', 'email@email.com', '091024090052', '091024090052', 3, 1),
(311, 'YOUNG SEEN', 'email@email.com', '090703020553', '090703020553', 3, 1),
(312, 'AISYAH UMAIRAH BINTI MUHAMMAD MOKTARRUDIN', 'email@email.com', '080508020276', '080508020276', 3, 1),
(313, 'ALEYA ARYANA BINTI MOHAMAD SALAHUDIN', 'email@email.com', '080310070462', '080310070462', 3, 1),
(314, 'ANIS NABILA BINTI MUHAMAD', 'email@email.com', '080414020654', '080414020654', 3, 1),
(315, 'AUNI ALISYA BINTI MOHD BADRUDIN', 'email@email.com', '080624020660', '080624020660', 3, 1),
(316, 'AYUNI FADILAH BINTI ABDUL RAHMAN', 'email@email.com', '080721020320', '080721020320', 3, 1),
(317, 'DARWISYAH NAJLA BINTI MUHAMAD ILE ZANDRA', 'email@email.com', '080619020308', '080619020308', 3, 1),
(318, 'MUHAMAD AKMAL DANIAL BIN AHMAD SUKRI', 'email@email.com', '081226070237', '081226070237', 3, 1),
(319, 'MUHAMMAD ADLY ALIFF BIN MUHAMMAD ZAIDI', 'email@email.com', '080906020087', '080906020087', 3, 1),
(320, 'MUHAMMAD AKIFF ZIKRI BIN MUHAMAD SAHARDI', 'email@email.com', '080210020513', '080210020513', 3, 1),
(321, 'MUHAMMAD ANIQ AFIFI BIN YAACUB', 'email@email.com', '080413020601', '080413020601', 3, 1),
(322, 'MUHAMMAD DANISH IQRAM BIN FADZIL', 'email@email.com', '080714020971', '080714020971', 3, 1),
(323, 'MUHAMMAD FATHEH BIN AYOB', 'email@email.com', '080829020883', '080829020883', 3, 1),
(324, 'MUHAMMAD IKHWAN HAZIQ BIN ROSLAN', 'email@email.com', '080324020749', '080324020749', 3, 1),
(325, 'MUHAMMAD SYAFRIEL NAZREEN BIN MUHAMAD SYARIF', 'email@email.com', '080108100621', '080108100621', 3, 1),
(326, 'NUR AINA BINTI LATIF', 'email@email.com', '081202020200', '081202020200', 3, 1),
(327, 'NUR AINA MASYIRA BINTI MOHD FAIZAL', 'email@email.com', '080324020298', '080324020298', 3, 1),
(328, 'NUR ANISYA BINTI MUHAMAD SUKRI', 'email@email.com', '080501070166', '080501070166', 3, 1),
(329, 'NUR BATRISYIA ZULAIKHA BINTI HUSSIN', 'email@email.com', '080521040220', '080521040220', 3, 1),
(330, 'NUR FATIN HUMAIRA BINTI RASIRWAN', 'email@email.com', '080206080062', '080206080062', 3, 1),
(331, 'NUR QISTINA ANISSA BINTI MUZZAMMIL IKRAM', 'email@email.com', '081006021302', '081006021302', 3, 1),
(332, 'NUR ZAHIRAH BINTI YAHUD', 'email@email.com', '081125020476', '081125020476', 3, 1),
(333, 'NURFATIN NAFISA BINTI MOHAMMAD SHAHRIL', 'email@email.com', '081026020788', '081026020788', 3, 1),
(334, 'PUTRI NUR AMIRA BINTI ROSDI', 'email@email.com', '080618020576', '080618020576', 3, 1),
(335, 'SITI NUR HANEYSHA SOFEA BINTI AZMI', 'email@email.com', '080330020630', '080330020630', 3, 1),
(336, 'SYAM ANISA BINTI ISMAIL', 'email@email.com', '080525021182', '080525021182', 3, 1),
(337, 'UMAIRAH BINTI RAMLI', 'email@email.com', '080710020106', '080710020106', 3, 1),
(338, 'ADIB SYAHMI BIN DALUDIN', 'email@email.com', '080723020711', '080723020711', 3, 1),
(339, 'AIRIL ISKANDAR BIN MOHD ROZI', 'email@email.com', '080212110299', '080212110299', 3, 1),
(340, 'ALEEYA MAISARA BINTI MOHD ANUAR', 'email@email.com', '080923070406', '080923070406', 3, 1),
(341, 'ALYAA NATASYA BINTI MOHD FARID FIRDAUS', 'email@email.com', '081126020304', '081126020304', 3, 1),
(342, 'FATIN NUR ZULAIKHA BINTI ZULKIFLI', 'email@email.com', '081011020320', '081011020320', 3, 1),
(343, 'HIDAYAH DAMIA BINTI NORIZAM', 'email@email.com', '080611020856', '080611020856', 3, 1),
(344, 'JULIANA BINTI OSMAN', 'email@email.com', '080106020310', '080106020310', 3, 1),
(345, 'MUHAMMAD \'ARIEF DZAKWAN BIN MOHD RIDZUAN', 'email@email.com', '080103060309', '080103060309', 3, 1),
(346, 'MUHAMMAD AIMAN HAKIM BIN ABDULLAH', 'email@email.com', '080708020537', '080708020537', 3, 1),
(347, 'MUHAMMAD ALIM HARIZ BIN AZMI', 'email@email.com', '080418020571', '080418020571', 3, 1),
(348, 'MUHAMMAD AQIL BIN MOHD ZAIDI', 'email@email.com', '080805020299', '080805020299', 3, 1),
(349, 'MUHAMMAD FAIZ BIN SAAD', 'email@email.com', '081005021087', '081005021087', 3, 1),
(350, 'MUHAMMAD FARIS BIN MOHAMAD', 'email@email.com', '080625020275', '080625020275', 3, 1),
(351, 'MUHAMMAD NAIM BIN MOHD SABRI', 'email@email.com', '081125100011', '081125100011', 3, 1),
(352, 'NUR AINA NADIRA BINTI ABDULLAH', 'email@email.com', '080304020784', '080304020784', 3, 1),
(353, 'NUR ALYA DAMIA BINTI YUSRI', 'email@email.com', '081029030076', '081029030076', 3, 1),
(354, 'NUR ALYAA NATASYA BINTI AZMAN', 'email@email.com', '080716020318', '080716020318', 3, 1),
(355, 'NUR ALYSHA BINTI SALEHUDDIN AMIR', 'email@email.com', '080928100520', '080928100520', 3, 1),
(356, 'NUR HANIAH HAWRA BINTI MOHAMMAD ZAHID', 'email@email.com', '080327020840', '080327020840', 3, 1),
(357, 'NUR HASLIZAWATI BINTI ISMAIL', 'email@email.com', '080531020864', '080531020864', 3, 1),
(358, 'NUR IZZATI ANTASHA BINTI ROZAN', 'email@email.com', '081028070244', '081028070244', 3, 1),
(359, 'NURFATINI BINTI IDRIS', 'email@email.com', '081102090156', '081102090156', 3, 1),
(360, 'NURUL AFIQAH BINTI MOHAMMAD RIZAL', 'email@email.com', '081119080130', '081119080130', 3, 1),
(361, 'NURUL AFNAN NASRIN BINTI ISHAK', 'email@email.com', '081123670010', '081123670010', 3, 1),
(362, 'NURUL BAHIYAH BINTI AWANG JAMIL', 'email@email.com', '081018020462', '081018020462', 3, 1),
(363, 'NURUL HAYATI BINTI MOHD YASIR', 'email@email.com', '080609020638', '080609020638', 3, 1),
(364, 'NURUL IMAN BINTI ISMAIL', 'email@email.com', '080410020550', '080410020550', 3, 1),
(365, 'SITI NUR SYAHFIKA BINTI MD DAUD', 'email@email.com', '080823020890', '080823020890', 3, 1),
(366, 'SITI NUR ZULAIKHA BINTI AHMAD', 'email@email.com', '081009021084', '081009021084', 3, 1),
(367, 'AFIQ DANISH HAIKAL BIN AZIZAN', 'email@email.com', '080131070029', '080131070029', 3, 1),
(368, 'AZLEY AZIZULHAKIM BIN ABDUL MUIZ', 'email@email.com', '080127021283', '080127021283', 3, 1),
(369, 'CHINDA A/P SUTIT', 'email@email.com', '080921020886', '080921020886', 3, 1),
(370, 'DARUNEE A/P SARAWAS', 'email@email.com', '080415020752', '080415020752', 3, 1),
(371, 'JULIE ARITA A/P BIAN', 'email@email.com', '080604021092', '080604021092', 3, 1),
(372, 'MARISA A/P SED', 'email@email.com', '080522020432', '080522020432', 3, 1),
(373, 'MUHAMMAD AIMAN ASYRAF BIN HASBULLAH', 'email@email.com', '080602020467', '080602020467', 3, 1),
(374, 'MUHAMMAD AIMAN BIN ABDUL MUBIN', 'email@email.com', '081204020327', '081204020327', 3, 1),
(375, 'MUHAMMAD DANISH NAFIZ BIN ROSLAN', 'email@email.com', '080918020463', '080918020463', 3, 1),
(376, 'MUHAMMAD HANIF IRFAN BIN ZOLKEFLI', 'email@email.com', '080524020145', '080524020145', 3, 1),
(377, 'MUHAMMAD HAZIQ AMSYAR BIN ABD HALIM', 'email@email.com', '080901020723', '080901020723', 3, 1),
(378, 'MUHAMMAD ISKANDAR ZULKARNAIN BIN SARIBIN', 'email@email.com', '080520020631', '080520020631', 3, 1),
(379, 'MUHAMMAD SYAZWAN BIN SAAD', 'email@email.com', '081008020709', '081008020709', 3, 1),
(380, 'NABIL HARITHZIKRI BIN MOHD BADRUL HISHAM', 'email@email.com', '081017020217', '081017020217', 3, 1),
(381, 'NAKTHEE A/L PRAK NOM', 'email@email.com', '080412020589', '080412020589', 3, 1),
(382, 'NUR AIN IZZATI BINTI ABDULLAH', 'email@email.com', '081223021130', '081223021130', 3, 1),
(383, 'NUR SOFEYA SYERENA BINTI ABDULLAH', 'email@email.com', '080422021040', '080422021040', 3, 1),
(384, 'ONG KIM VIKKON', 'email@email.com', '080901020731', '080901020731', 3, 1),
(385, 'PHAICHITTRA A/P SA WIN', 'email@email.com', '081106020366', '081106020366', 3, 1),
(386, 'PHURIKTHAS PHORNPRAKSIT A/L AI PIAN', 'email@email.com', '080426020619', '080426020619', 3, 1),
(387, 'SADIQAH BINTI ABDURAHMAN', 'email@email.com', '080725020678', '080725020678', 3, 1),
(388, 'SUCHADA A/P SU TEEP', 'email@email.com', '080426020854', '080426020854', 3, 1),
(389, 'SURASEK A/L AIWIK', 'email@email.com', '081110020297', '081110020297', 3, 1),
(390, 'THATSANI A/P AI BAU', 'email@email.com', '080510020638', '080510020638', 3, 1),
(391, 'WARAVUTH A/L WICAT', 'email@email.com', '080813020483', '080813020483', 3, 1),
(392, 'AHMAD DANISH BIN MOHAMAD KHIRUL NIZAM', 'email@email.com', '081009020209', '081009020209', 3, 1),
(393, 'ASFIFAH BINTI MOHD FAZLI', 'email@email.com', '080802020744', '080802020744', 3, 1),
(394, 'BOONYAWAT A/L WAN', 'email@email.com', '080414020953', '080414020953', 3, 1),
(395, 'DANIEL VIRAWUT A/L AI AN', 'email@email.com', '080523020135', '080523020135', 3, 1),
(396, 'MUHAMMAD AINURHAKIM BIN MOHD NAZLE', 'email@email.com', '080610020221', '080610020221', 3, 1),
(397, 'MUHAMMAD ALFI ZIKRI BIN MOHD JAFRI', 'email@email.com', '081209020385', '081209020385', 3, 1),
(398, 'MUHAMMAD ALIF AIMAN BIN ABDULLAH', 'email@email.com', '080505021003', '080505021003', 3, 1),
(399, 'MUHAMMAD AMMAR HAFIY BIN ZULKIFLI', 'email@email.com', '081102020537', '081102020537', 3, 1),
(400, 'MUHAMMAD ARIF ZAKWAN BIN SHAIFUL AZIZI', 'email@email.com', '081016020389', '081016020389', 3, 1),
(401, 'MUHAMMAD FAKIS HAIKAL BIN RAMLEE', 'email@email.com', '080812020131', '080812020131', 3, 1),
(402, 'MUHAMMAD FARIZ EZANY BIN ABDULLAH', 'email@email.com', '080224020143', '080224020143', 3, 1),
(403, 'MUHAMMAD SYAHRIZAL BIN MOHD SYAHRIL', 'email@email.com', '080206021273', '080206021273', 3, 1),
(404, 'MUHAMMAD SYAKIR BIN MOHD SHAHRIN', 'email@email.com', '081127020525', '081127020525', 3, 1),
(405, 'MUHAMMAD SYAMIR RIZKI BIN JAMIL', 'email@email.com', '080707020615', '080707020615', 3, 1),
(406, 'MUHAMMAD ZUL IRFAN BIN ZULKIFLI', 'email@email.com', '081215020437', '081215020437', 3, 1),
(407, 'NUR BAHYAH BINTI MOHD RADZAI', 'email@email.com', '080403020026', '080403020026', 3, 1),
(408, 'NUR FATIHAH BINTI MOHAMED ZAMRI', 'email@email.com', '081009020022', '081009020022', 3, 1),
(409, 'NUR HUSNA ZAHIRA BINTI AHMAD SAFIRUL', 'email@email.com', '080425020422', '080425020422', 3, 1),
(410, 'NUR JEHA BINTI ABU BAKAR', 'email@email.com', '080302020078', '080302020078', 3, 1),
(411, 'NUR SYIFAA SYAHIRAH BINTI CHE LAH', 'email@email.com', '080903021164', '080903021164', 3, 1),
(412, 'NURUL ASYIQIN BINTI HANIFAH', 'email@email.com', '081028070148', '081028070148', 3, 1),
(413, 'PHARIT A/L KEREAN', 'email@email.com', '080401020575', '080401020575', 3, 1),
(414, 'WIJADA A/P AI PON', 'email@email.com', '080325020898', '080325020898', 3, 1),
(415, 'WIRAIN A/L WERIS', 'email@email.com', '080818020677', '080818020677', 3, 1),
(416, 'AIN SANARIAH BINTI SHAFIE', 'email@email.com', '081201020540', '081201020540', 3, 1),
(417, 'ANDERSON A/L KIT NARONG', 'email@email.com', '081221020169', '081221020169', 3, 1),
(418, 'ANGEL LEEN A/P SOM CHIT', 'email@email.com', '080308020634', '080308020634', 3, 1),
(419, 'ANN WEEM A/L BENG AN', 'email@email.com', '081003020507', '081003020507', 3, 1),
(420, 'DAVID CHAKRISS A/L PRAK KHONG', 'email@email.com', '081206020291', '081206020291', 3, 1),
(421, 'JUWARY A/P AI BOW', 'email@email.com', '080512020922', '080512020922', 3, 1),
(422, 'KERN DARREEV A/L KODOM', 'email@email.com', '081002020361', '081002020361', 3, 1),
(423, 'LOW JIA YONG', 'email@email.com', '081108020626', '081108020626', 3, 1),
(424, 'MOHAMAD SYARIQUL HUZNI PUTRA BIN SHMSUL', 'email@email.com', '080907080735', '080907080735', 3, 1),
(425, 'MUHAMMAD ALIF AZIZI BIN ABDUL WAHAB', 'email@email.com', '080121020423', '080121020423', 3, 1),
(426, 'MUHAMMAD ALIF HAIKAL BIN MOHAMAD BADROL', 'email@email.com', '081231020779', '081231020779', 3, 1),
(427, 'MUHAMMAD AMAR FITRI BIN ABDUL RAZAK', 'email@email.com', '081007020985', '081007020985', 3, 1),
(428, 'MUHAMMAD FARIS IQBAL BIN MOHD YUSOF', 'email@email.com', '081230020347', '081230020347', 3, 1),
(429, 'MUHAMMAD FARIZ MUHAIMIN BIN ABDULLAH', 'email@email.com', '081121020735', '081121020735', 3, 1),
(430, 'MUHAMMAD FIRDAUS BIN WAHID', 'email@email.com', '080724020457', '080724020457', 3, 1),
(431, 'MUHAMMAD IZZAT BIN ABDUL WAHAB', 'email@email.com', '080305020647', '080305020647', 3, 1),
(432, 'NATRAH ATIKAH BINTI ABDULLAH', 'email@email.com', '081105020890', '081105020890', 3, 1),
(433, 'SHAIFONE A/P PAI RUT', 'email@email.com', '080920020622', '080920020622', 3, 1),
(434, 'SHAK KHAU DEAN A/P PIN', 'email@email.com', '080201020298', '080201020298', 3, 1),
(435, 'SITI NURUL AIN BINTI MOHD SUBRI', 'email@email.com', '080831020460', '080831020460', 3, 1),
(436, 'SUNISSA A/P ANO', 'email@email.com', '080210020732', '080210020732', 3, 1),
(437, 'SUWARAT A/L BUN MI', 'email@email.com', '080320020565', '080320020565', 3, 1),
(438, 'SYAZWANI LIYANA BINTI SHAIFUL ANUAR', 'email@email.com', '081219020338', '081219020338', 3, 1),
(439, 'THISTHAYA A/P MEEN CHEN', 'email@email.com', '080120020624', '080120020624', 3, 1),
(440, 'ADAM FARYSH ILHAM BIN MOHAMAD ZAMRI', 'email@email.com', '080611020645', '080611020645', 3, 1),
(441, 'ALIFAH ILYANA BINTI SHAMSUDDIN', 'email@email.com', '080110131128', '080110131128', 3, 1),
(442, 'ANIS NUR ZAHIRA BINTI MOHAMAD ZAINI', 'email@email.com', '080401080500', '080401080500', 3, 1),
(443, 'MUHAMMAD AIDIL DANISH BIN MOHD REDZUAN', 'email@email.com', '081006020297', '081006020297', 3, 1),
(444, 'MUHAMMAD AIDIL ZAFUAN BIN MUHAMMAD NAZIR', 'email@email.com', '080919030057', '080919030057', 3, 1),
(445, 'MUHAMMAD AZRAAQI BIN MOHAMAD AZRAAIE', 'email@email.com', '090101020791', '090101020791', 3, 1),
(446, 'MUHAMMAD FARIZ BIN KHAIRUL ANUAR', 'email@email.com', '080217020073', '080217020073', 3, 1),
(447, 'MUHAMMAD FIRDAUS SHAHIDAN BIN ABDULLAH', 'email@email.com', '081201011097', '081201011097', 3, 1),
(448, 'MUHAMMAD FITRI BIN ZARUDIN', 'email@email.com', '081001020829', '081001020829', 3, 1),
(449, 'MUHAMMAD HAZIQ BIN AMRAN', 'email@email.com', '080303020619', '080303020619', 3, 1),
(450, 'MUHAMMAD ISMAIL BIN ASRI', 'email@email.com', '080712020783', '080712020783', 3, 1),
(451, 'MUHAMMAD SYAMIL BIN SHAHARUDIN', 'email@email.com', '081102020641', '081102020641', 3, 1),
(452, 'MUHAMMAD ZULHAZRIQ BIN MUHAMAD IRWAN', 'email@email.com', '081012020357', '081012020357', 3, 1),
(453, 'NUR AULIA NAFISA BINTI MOHAMAD TAJUDIN', 'email@email.com', '080713020726', '080713020726', 3, 1),
(454, 'NUR LIA  DAMIA BINTI MOHD KAMAL', 'email@email.com', '080123020566', '080123020566', 3, 1),
(455, 'NUR ZINNIRAH BINTI MAT YUSOFF', 'email@email.com', '081229020788', '081229020788', 3, 1),
(456, 'NURAIN HAWANI BINTI MOHD YUSOFF', 'email@email.com', '080918020498', '080918020498', 3, 1),
(457, 'NURUL AINA SYAFINA BINTI MUHAMAD KAMAL', 'email@email.com', '080823020030', '080823020030', 3, 1),
(458, 'NURUL AINA SYAFIQA BINTI MUHAMAD KAMAL', 'email@email.com', '080823020022', '080823020022', 3, 1),
(459, 'NURUL ALIFAH SHAIMA BINTI AHMAD SHUHARDI', 'email@email.com', '080418020758', '080418020758', 3, 1),
(460, 'NURUL ALIS SOFEA BINTI ROSLAN', 'email@email.com', '080621020112', '080621020112', 3, 1),
(461, 'NURUL HUDA NADZIRAH BINTI ZULKEFLI', 'email@email.com', '081212020984', '081212020984', 3, 1),
(462, 'NURUL QAZRINA QASEH BINTI AHMAD TARMIZI', 'email@email.com', '080102020188', '080102020188', 3, 1),
(463, 'RAJA NURHIDAYAH KAISARA  BINTI ABDULLAH', 'email@email.com', '080116021018', '080116021018', 3, 1),
(464, 'SAMANTHA A/P TIANG', 'email@email.com', '080324020300', '080324020300', 3, 1),
(465, 'SHINNAWAT A/L CHARUN', 'email@email.com', '081129020617', '081129020617', 3, 1),
(466, 'SITI NOR HAFIZA BINTI HAIROL AZMI', 'email@email.com', '080408130988', '080408130988', 3, 1),
(467, 'SITI ZULAIKHA BINTI ABDUL WAHID', 'email@email.com', '080523020856', '080523020856', 3, 1),
(468, 'TIARA WARAPHORN A/P SURINTHON', 'email@email.com', '080705020750', '080705020750', 3, 1),
(469, 'ZAIDATUL FARISA BINTI ZUBIR', 'email@email.com', '080413020468', '080413020468', 3, 1),
(470, 'AMNI SADIQAH BINTI MUHAMAD NAZRI', 'email@email.com', '070331020174', '070331020174', 3, 1),
(471, 'ANIS HAZWANI BINTI MAT JAMIL', 'email@email.com', '070809020510', '070809020510', 3, 1),
(472, 'ISKANDAR NAUFAL BIN ISMADI', 'email@email.com', '070424020819', '070424020819', 3, 1),
(473, 'IZZAH IFFAH BINTI ZULKIFLI', 'email@email.com', '070123020778', '070123020778', 3, 1),
(474, 'MARSYAMILIA BINTI MUHAMAD', 'email@email.com', '070907020098', '070907020098', 3, 1),
(475, 'MUHAMMAD AFIQ SYAHMI BIN ASHAM', 'email@email.com', '070127020177', '070127020177', 3, 1),
(476, 'MUHAMMAD DANIEL ASYRAF BIN ISHAK', 'email@email.com', '071214020575', '071214020575', 3, 1),
(477, 'MUHAMMAD IRFAN FARISH BIN MOHD KHAIRULAZHAR', 'email@email.com', '070605020543', '070605020543', 3, 1),
(478, 'MUHAMMAD NAZIF BIN MOHAMAD SAYUTI', 'email@email.com', '070623020475', '070623020475', 3, 1),
(479, 'MUHAMMAD ZULZAFFRY BIN MOHD NOOR', 'email@email.com', '070609020313', '070609020313', 3, 1),
(480, 'NUR AINA ADAWIYAH BINTI ADAM SAIFUL', 'email@email.com', '070903020584', '070903020584', 3, 1),
(481, 'NUR AINA NADIRA BINTI MOKHTAR', 'email@email.com', '070719020306', '070719020306', 3, 1),
(482, 'NUR AINZATUL SYIRA BINTI MOHD RASHID', 'email@email.com', '070316020758', '070316020758', 3, 1),
(483, 'NUR ASMIZAH BINTI MUHAMAD', 'email@email.com', '070301020982', '070301020982', 3, 1),
(484, 'NUR FARHANIZA BINTI MOHD SUFIAN', 'email@email.com', '071001070376', '071001070376', 3, 1),
(485, 'NUR LIYANA MAISARAH BINTI MUHAMAD SHUHARDI', 'email@email.com', '070204020526', '070204020526', 3, 1),
(486, 'NUR SYAFARINA BINTI ISMAIL', 'email@email.com', '070601020386', '070601020386', 3, 1),
(487, 'NUR SYAMIMI BINTI MOHD RODZI', 'email@email.com', '070130020290', '070130020290', 3, 1),
(488, 'NURIN ZAHIRAH BINTI MUHAMMAD SHARIFUDDIN', 'email@email.com', '070805020302', '070805020302', 3, 1),
(489, 'NURUL HAFIZAH BINTI ZULKIFLI', 'email@email.com', '070607020870', '070607020870', 3, 1),
(490, 'NURUL IMAN BINTI RUSHDI', 'email@email.com', '070118020626', '070118020626', 3, 1),
(491, 'SITI AISYAH BINTI AHMAD', 'email@email.com', '070426020644', '070426020644', 3, 1),
(492, 'SITI NURKHAIRUN NISA BINTI MOHAMAD SOBRI', 'email@email.com', '070807020728', '070807020728', 3, 1),
(493, 'YUMNA BINTI MD SUKERI', 'email@email.com', '070731020288', '070731020288', 3, 1),
(494, 'DHIYA NURIN MAISARA BINTI MOHAMMAD FIRDAUS', 'email@email.com', '070807020680', '070807020680', 3, 1),
(495, 'MUHAMMAD ADAM HARIS BIN MOHD ROZI', 'email@email.com', '070805020767', '070805020767', 3, 1),
(496, 'MUHAMMAD AFIF IRFAN BIN SYAMSURI', 'email@email.com', '071106020383', '071106020383', 3, 1),
(497, 'MUHAMMAD AFIF NAUFAL BIN MOHD ARIFF', 'email@email.com', '070108020673', '070108020673', 3, 1),
(498, 'MUHAMMAD ALIF HAIKAL BIN ABD WAHID', 'email@email.com', '070306020623', '070306020623', 3, 1),
(499, 'MUHAMMAD AMIR IRFAN BIN ABIDIN', 'email@email.com', '070712020477', '070712020477', 3, 1),
(500, 'MUHAMMAD AZIM BIN MOHD ASRI', 'email@email.com', '070610020281', '070610020281', 3, 1),
(501, 'MUHAMMAD DANIAL HAIKAL BIN MOHD SHAHARUDDIN', 'email@email.com', '071117020901', '071117020901', 3, 1),
(502, 'MUHAMMAD HAFIZ BIN MOHAD SAMAN', 'email@email.com', '070828020401', '070828020401', 3, 1),
(503, 'MUHAMMAD HARIS HAIKAL BIN ABDULLAH', 'email@email.com', '071025020699', '071025020699', 3, 1),
(504, 'MUHAMMAD IDLAN HAKIMI BIN MOHAMAD IRWAN', 'email@email.com', '071126020911', '071126020911', 3, 1),
(505, 'MUHAMMAD SHAZRUL ZAQWAN BIN MOHAMAD DESA', 'email@email.com', '080101021197', '080101021197', 3, 1),
(506, 'MUHAMMAD SYAHRUL RIZWAN BIN MUHAMAD SHAHARUDIN', 'email@email.com', '070821021057', '070821021057', 3, 1),
(507, 'MUHAMMAD SYAMIL BIN RAZALI', 'email@email.com', '070601020319', '070601020319', 3, 1),
(508, 'NUR ALYA ADRIANA BINTI MOHAMMAD IZHAR', 'email@email.com', '071224020712', '071224020712', 3, 1),
(509, 'NUR FARAH NATASYA BINTI MOHD YUSOFF', 'email@email.com', '070618020796', '070618020796', 3, 1),
(510, 'NUR ILLIYANA AMANI BINTI ROSDISHAM', 'email@email.com', '070929020320', '070929020320', 3, 1),
(511, 'NUR INTAN SYAFINA BINTI ABDUL RAHMAN', 'email@email.com', '070310020570', '070310020570', 3, 1),
(512, 'NURAINZATUL AISHAH BINTI MOHD SALIM', 'email@email.com', '070707020472', '070707020472', 3, 1),
(513, 'NURUL AINA BINTI ABDULLAH', 'email@email.com', '070730020534', '070730020534', 3, 1),
(514, 'NURUL FAIRIZ QISTINA BINTI MOHD FAIRUZ RADZI', 'email@email.com', '071010020282', '071010020282', 3, 1),
(515, 'NURUL FARISYA ALEEYA BINTI AZIZAN', 'email@email.com', '071021020544', '071021020544', 3, 1),
(516, 'NURUL FATINI BINTI MAT RAMLI', 'email@email.com', '071229020500', '071229020500', 3, 1),
(517, 'NURUL IMAN NASUHA BINTI ISMADI', 'email@email.com', '070220020200', '070220020200', 3, 1),
(518, 'PUTRI EMILIA BINTI BADRUL HISSHAM', 'email@email.com', '070531020670', '070531020670', 3, 1),
(519, 'SAIDATUL NISSA BINTI MOHD DASUKI', 'email@email.com', '070810020200', '070810020200', 3, 1),
(520, 'SYAZIRAH BALQIS BINTI MOHD SHAHRIZAL', 'email@email.com', '071202020084', '071202020084', 3, 1),
(521, 'SYED AMIR BIN SYEDAL ASWAR', 'email@email.com', '070504020579', '070504020579', 3, 1),
(522, 'ANIS SYAHIRAH BINTI SHAHRIZAN', 'email@email.com', '070824020340', '070824020340', 3, 1),
(523, 'DANDNY A/L LEONG LENG', 'email@email.com', '070702020019', '070702020019', 3, 1),
(524, 'KASEEM A/L WERAT', 'email@email.com', '070430020671', '070430020671', 3, 1),
(525, 'LUQMAN HAKIM BIN ZULKIFLI', 'email@email.com', '070731020317', '070731020317', 3, 1),
(526, 'MUHAMMAD ALIF SYAKIR BIN ABDULLAH', 'email@email.com', '070703020643', '070703020643', 3, 1),
(527, 'MUHAMMAD HAIKAL FAIZ BIN ABD GHANI', 'email@email.com', '070104020457', '070104020457', 3, 1),
(528, 'MUHAMMAD HAZIQ ZAKWAN BIN MUHAMAD', 'email@email.com', '070912020615', '070912020615', 3, 1),
(529, 'MUHAMMAD SUBKI BIN GHANI', 'email@email.com', '070410020543', '070410020543', 3, 1),
(530, 'MUHAMMAD SYAHIR NAUFAL BIN MOHD SHAHRIN', 'email@email.com', '070724020861', '070724020861', 3, 1),
(531, 'NUR ARINI UMAIRAH BINTI MUHAMAD SANI', 'email@email.com', '070222020124', '070222020124', 3, 1),
(532, 'NUR FATIN LIYANA BINTI MOHD HUSNI', 'email@email.com', '070323020430', '070323020430', 3, 1),
(533, 'NUR QISTINA BALQIS BINTI NOR AZANI', 'email@email.com', '070320020080', '070320020080', 3, 1),
(534, 'NUR WAHIEDA SYAFIA BINTI MOHD RASYID', 'email@email.com', '070115020372', '070115020372', 3, 1),
(535, 'NURHIDAYAH BINTI MUSA', 'email@email.com', '070110020840', '070110020840', 3, 1),
(536, 'NURLISA NAJIHAH BINTI MOHAMAD NASIR', 'email@email.com', '070429020500', '070429020500', 3, 1),
(537, 'NURUL FITRIAH BINTI MOHAMAD ASRI', 'email@email.com', '071012020964', '071012020964', 3, 1),
(538, 'PHAVEDA A/P VIRAT', 'email@email.com', '070419020806', '070419020806', 3, 1),
(539, 'PHAWINI A/P REET', 'email@email.com', '070615020504', '070615020504', 3, 1),
(540, 'PHLOI PHAI LIN A/P SUTHEN', 'email@email.com', '071202020420', '071202020420', 3, 1),
(541, 'RATRISAWATT A/P AILING', 'email@email.com', '070531020734', '070531020734', 3, 1),
(542, 'SITI AISYAH BINTI ABDUL WAHID', 'email@email.com', '070605020658', '070605020658', 3, 1),
(543, 'SITI NUR FATIHAH BINTI MAT SAAD', 'email@email.com', '070330020092', '070330020092', 3, 1),
(544, 'SORIYA A/P SURI', 'email@email.com', '070127020978', '070127020978', 3, 1),
(545, 'THANUKPHONG KANGSAKUN A/L SOOMCAI', 'email@email.com', '070224020283', '070224020283', 3, 1),
(546, 'UMIE NADIRA BINTI MOHD TARMIZI', 'email@email.com', '071124070456', '071124070456', 3, 1),
(547, 'VEEYADA A/P KHOSIN', 'email@email.com', '070918020544', '070918020544', 3, 1),
(548, 'VINIETRA A/P SOM CHOK', 'email@email.com', '070930020766', '070930020766', 3, 1),
(549, 'AIDIL HAIKAL ZAFUAN BIN ABDULLAH', 'email@email.com', '070720020805', '070720020805', 3, 1),
(550, 'ANAWIN A/L PROM', 'email@email.com', '071229020893', '071229020893', 3, 1),
(551, 'ANU6 A/L AI SEE', 'email@email.com', '070206020669', '070206020669', 3, 1),
(552, 'KHUNYAKORN A/L CHAI', 'email@email.com', '070422020671', '070422020671', 3, 1);
INSERT INTO `pengguna` (`id`, `fullname`, `email`, `username`, `password`, `role`, `status`) VALUES
(553, 'MOHAMAD SHAFUL IZFAN BIN SHAFUL ISWANDI', 'email@email.com', '070804070789', '070804070789', 3, 1),
(554, 'MOHAMMAD FARIZ HAIKHAL BIN MOHD FAZLEY', 'email@email.com', '070619070859', '070619070859', 3, 1),
(555, 'MUHAMMAD AIDIL FARHAN BIN HANIZAN', 'email@email.com', '071105020963', '071105020963', 3, 1),
(556, 'MUHAMMAD ANIQ BIN ABD WAHAB', 'email@email.com', '070829020323', '070829020323', 3, 1),
(557, 'MUHAMMAD HAFIZ SYAZWAN BIN MOHD FAUZI', 'email@email.com', '070327020315', '070327020315', 3, 1),
(558, 'MUHAMMAD HAIKAL AKMAL BIN HASSAN', 'email@email.com', '070412020301', '070412020301', 3, 1),
(559, 'MUHAMMAD HAIKAL BIN ZULKIFLI', 'email@email.com', '070105070069', '070105070069', 3, 1),
(560, 'MUHAMMAD HAIKAL IQBAL BIN BAKAR', 'email@email.com', '070323020473', '070323020473', 3, 1),
(561, 'MUHAMMAD SAIFUL BIN ABDUL RAZAT', 'email@email.com', '070913020799', '070913020799', 3, 1),
(562, 'MUHAMMAD UMAIR FAYYADH BIN AZMI', 'email@email.com', '071130020615', '071130020615', 3, 1),
(563, 'MUKDHA A/P BUAN CHOON', 'email@email.com', '071025020840', '071025020840', 3, 1),
(564, 'NALITTA A/P SOMPOP', 'email@email.com', '070423020446', '070423020446', 3, 1),
(565, 'NATALIE A/P BOON RUI', 'email@email.com', '071105020058', '071105020058', 3, 1),
(566, 'NUR ALIA AWATIEF BINTI MOHD AFZANFAIZAL', 'email@email.com', '071114040472', '071114040472', 3, 1),
(567, 'NUR ATIKAH ALYAA BINTI MUHAMMAD REDZUAN', 'email@email.com', '071019020078', '071019020078', 3, 1),
(568, 'PHISSANUK A/L V THUN', 'email@email.com', '071108020803', '071108020803', 3, 1),
(569, 'RATRAVEE A/P NARONG', 'email@email.com', 'RATRAVEE', 'RATRAVEE', 3, 1),
(570, 'RATTANAWADE A/P PREMANANTH', 'email@email.com', '071212021160', '071212021160', 3, 1),
(571, 'SALIKA A/P PAI ROK', 'email@email.com', '070106020282', '070106020282', 3, 1),
(572, 'SAMRAN A/L PAI RAS', 'email@email.com', '071129020845', '071129020845', 3, 1),
(573, 'TUAN ZULKIFLE BIN ABDULLAH', 'email@email.com', '070619100827', '070619100827', 3, 1),
(574, 'UKDOMSAG A/L AI IN', 'email@email.com', '070626020251', '070626020251', 3, 1),
(575, 'UMIE NUR QAZRINA BINTI MOHAMMAD ZAIDI', 'email@email.com', '071205020936', '071205020936', 3, 1),
(576, 'ADAM MUKHRIZ BIN MOHD SOBRI', 'email@email.com', '070920021087', '070920021087', 3, 1),
(577, 'ANISTA A/P SURASIT', 'email@email.com', '071208020202', '071208020202', 3, 1),
(578, 'ANUKCHIT A/L BOON CHIAI', 'email@email.com', '070826020053', '070826020053', 3, 1),
(579, 'AVIRUT A/L CHARENCIT', 'email@email.com', '070429020105', '070429020105', 3, 1),
(580, 'DIVID A/L NAARONG', 'email@email.com', '071022020503', '071022020503', 3, 1),
(581, 'MUHAMMAD ADAM AFIF BIN IBRAHIM', 'email@email.com', '070719020971', '070719020971', 3, 1),
(582, 'MUHAMMAD AIDIL FAHMI BIN MOHD TARMIZI', 'email@email.com', '070106020741', '070106020741', 3, 1),
(583, 'MUHAMMAD ALIF ILHAM BIN MOHD FAIZAL', 'email@email.com', '071116020539', '071116020539', 3, 1),
(584, 'MUHAMMAD AZRIL DANNY BIN AIRAT', 'email@email.com', '070214110111', '070214110111', 3, 1),
(585, 'MUHAMMAD FAIZUL BIN MOHD RIZAN', 'email@email.com', '070501020135', '070501020135', 3, 1),
(586, 'MUHAMMAD FIKRI BIN MOHAMAD SOPI', 'email@email.com', '070526020545', '070526020545', 3, 1),
(587, 'MUHAMMAD HAIKAL HAKIMI BIN MOHD REDZUAN', 'email@email.com', '070905020895', '070905020895', 3, 1),
(588, 'MUHAMMAD IMAN SHAUQI BIN SHAFIE', 'email@email.com', '071008020769', '071008020769', 3, 1),
(589, 'MUHAMMAD RAZI BIN MD RAZALI', 'email@email.com', '070321021157', '070321021157', 3, 1),
(590, 'MUHAMMAD SYAFIQ BIN ZAKARIA', 'email@email.com', '070315021257', '070315021257', 3, 1),
(591, 'MUHAMMAD SYAKIR ZUFAYRI BIN MOHD ROMDZON', 'email@email.com', '070202020741', '070202020741', 3, 1),
(592, 'NUR AZMEERA BINTI MOHD YUSOF', 'email@email.com', '070114020506', '070114020506', 3, 1),
(593, 'NUR LAILA BINTI ABDULLAH', 'email@email.com', '070416020130', '070416020130', 3, 1),
(594, 'NURHASMAHANIM BINTI CHE PA', 'email@email.com', '070623020432', '070623020432', 3, 1),
(595, 'NURMASTURA BINTI AHMAD ZAMRI', 'email@email.com', '071027020502', '071027020502', 3, 1),
(596, 'NURUL NATASYA BINTI ABDULLAH', 'email@email.com', '070628020132', '070628020132', 3, 1),
(597, 'PRAK PHAI A/L SUU KUN', 'email@email.com', '070112020529', '070112020529', 3, 1),
(598, 'SITTHIKORN A/L BOON TEEP', 'email@email.com', '071222020831', '071222020831', 3, 1),
(599, 'THANAD A/L AI SEE RAK', 'email@email.com', '070509020279', '070509020279', 3, 1),
(600, 'THIRAK PHONG A/L THAMMANUN', 'email@email.com', '070612020293', '070612020293', 3, 1),
(601, 'ADI NUKMAN BIN MOHD REDUAN', 'email@email.com', '070919021469', '070919021469', 3, 1),
(602, 'AIDA RUHAYA BINTI ROSLAN', 'email@email.com', '071211020246', '071211020246', 3, 1),
(603, 'AIMAN HUZAIRIE BIN AMRAN', 'email@email.com', '071112020507', '071112020507', 3, 1),
(604, 'JATFON A/P I LONG', 'email@email.com', '070707020536', '070707020536', 3, 1),
(605, 'JOHNSON', 'email@email.com', '070621021183', '070621021183', 3, 1),
(606, 'MARRYTA A/P SURAT', 'email@email.com', '070511020382', '070511020382', 3, 1),
(607, 'MUHAMMAD AAIZAAM BIN MAT SAHIDAN', 'email@email.com', '070118020175', '070118020175', 3, 1),
(608, 'MUHAMMAD FA\'LIJ MUSTAQIM BIN MOHAMMAD ZAMRI', 'email@email.com', '070523020419', '070523020419', 3, 1),
(609, 'MUHAMMAD HAIKAL BIN CHE SHAFAR', 'email@email.com', '070109020333', '070109020333', 3, 1),
(610, 'MUHAMMAD HAIKAL HAKIM BIN MOHD FADHIL', 'email@email.com', '071024020187', '071024020187', 3, 1),
(611, 'MUHAMMAD HAZIQ FARHAN BIN MEHAMAD SHUKRI', 'email@email.com', '070221020931', '070221020931', 3, 1),
(612, 'MUHAMMAD ZAQUAN BIN MOHAMAD ZAMBRI', 'email@email.com', '070312021147', '070312021147', 3, 1),
(613, 'NONG YAU A/P VEERAT', 'email@email.com', '070428020576', '070428020576', 3, 1),
(614, 'NUR ALEYA ZULAIKHA BINTI MOHD RUZUWA', 'email@email.com', '071115020270', '071115020270', 3, 1),
(615, 'NUR AMIRAH HAYANI BINTI MOHD ZAKI', 'email@email.com', '070119020150', '070119020150', 3, 1),
(616, 'NUR ANISSA BINTI KHARUDIN', 'email@email.com', '070628021004', '070628021004', 3, 1),
(617, 'NUR AZZWA HANIS BINTI MAT AZHAR', 'email@email.com', '071212021048', '071212021048', 3, 1),
(618, 'NUR DINI ZALIKHA BINTI MOHD ZAMRI', 'email@email.com', '070904020244', '070904020244', 3, 1),
(619, 'NUR IFFAH SYARAH BINTI CHE AD', 'email@email.com', '070612020736', '070612020736', 3, 1),
(620, 'NUR NAI\'MAH ZAKIRAH BINTI AHMAD SHUKERI', 'email@email.com', '071119020630', '071119020630', 3, 1),
(621, 'NUR SYAZRIMA IZZATI BINTI SHAH RIZAL', 'email@email.com', '070227020510', '070227020510', 3, 1),
(622, 'NURSYAMIMI ATIRAH BINTI SYAHARONIZAN', 'email@email.com', '070428020082', '070428020082', 3, 1),
(623, 'NURUL AFIQAH BINTI ABD KADIR', 'email@email.com', '071115020334', '071115020334', 3, 1),
(624, 'NURUL ASMA NADIA BINTI ABDULLAH', 'email@email.com', '071015020636', '071015020636', 3, 1),
(625, 'NURUL SYAFIQAH BINTI ZAIFUL AZMI', 'email@email.com', '070723020958', '070723020958', 3, 1),
(626, 'NURZARA ARISYA BINTI RIDHUAN', 'email@email.com', '070705021068', '070705021068', 3, 1),
(627, 'RATCANA A/P AI AN', 'email@email.com', '070408020114', '070408020114', 3, 1),
(628, 'SITI MASTURA BINTI ZAKARIA', 'email@email.com', '070918020704', '070918020704', 3, 1),
(629, 'SUKVINAI A/L CHALAD', 'email@email.com', '070104020481', '070104020481', 3, 1),
(630, 'UKRAIWAN A/P SOM CHAI', 'email@email.com', '070930020600', '070930020600', 3, 1),
(631, 'WAN FAHIM RASYIDI BIN WAN SYAHRIN', 'email@email.com', '070513140599', '070513140599', 3, 1),
(632, 'CHARIYA A/P IKEAN', 'email@email.com', '060110020462', '060110020462', 3, 1),
(633, 'HAFIZUDDIN BIN HASBULLAH', 'email@email.com', '060511020949', '060511020949', 3, 1),
(634, 'LINDA A/P BOON CHAN', 'email@email.com', '061006020686', '061006020686', 3, 1),
(635, 'MUHAMAD DANIAL ISKANDAR BIN NADZRULNIZAM', 'email@email.com', '060626070225', '060626070225', 3, 1),
(636, 'MUHAMMAD AHZAR HAKIM BIN MOHD AZIZAN', 'email@email.com', '060713020955', '060713020955', 3, 1),
(637, 'MUHAMMAD AIMAN BIN MOHD FAKHARUDDIN', 'email@email.com', '060723020203', '060723020203', 3, 1),
(638, 'MUHAMMAD AMAL NUZMI BIN AHMAD', 'email@email.com', '060707070489', '060707070489', 3, 1),
(639, 'MUHAMMAD AQASHAH BIN RAMIL', 'email@email.com', '061106010047', '061106010047', 3, 1),
(640, 'MUHAMMAD AQIL FAIZI BIN MOHD AZWAN', 'email@email.com', '060325101315', '060325101315', 3, 1),
(641, 'MUHAMMAD FARHAN BIN AHMAD NAZARI', 'email@email.com', '060523020137', '060523020137', 3, 1),
(642, 'MUHAMMAD FIRDAUS BIN ISHAK', 'email@email.com', '060214020491', '060214020491', 3, 1),
(643, 'MUHAMMAD IRFAN BIN BADRUL HISHAM', 'email@email.com', '060325020347', '060325020347', 3, 1),
(644, 'MUHAMMAD IRFAN YUSRI BIN FADZIL', 'email@email.com', '060217020497', '060217020497', 3, 1),
(645, 'MUHAMMAD IZZUL ARIF BIN ABDUL RAHMAN', 'email@email.com', '061002020689', '061002020689', 3, 1),
(646, 'MUHAMMAD MARHAIMIE BIN ABDULLAH', 'email@email.com', '060426020733', '060426020733', 3, 1),
(647, 'MUHAMMAD YUSRI BIN MAD YUSUP', 'email@email.com', '060618020375', '060618020375', 3, 1),
(648, 'NASCHARIYA A/P AI WIK', 'email@email.com', '061116020310', '061116020310', 3, 1),
(649, 'NATTAYA A/P SOMMIT', 'email@email.com', '060206020248', '060206020248', 3, 1),
(650, 'NUR AIEN BINTI KAMALRUZAMAN', 'email@email.com', '060208070054', '060208070054', 3, 1),
(651, 'NUR AINA HAZIQAH BINTI NYAN', 'email@email.com', '061013020342', '061013020342', 3, 1),
(652, 'NUR HUDA NABIGHAH BINTI MOHAMAD ZAINUDIN', 'email@email.com', '060502020154', '060502020154', 3, 1),
(653, 'NUR INSYIRAH IZZATI BINTI MOHD ASRI', 'email@email.com', '060601020352', '060601020352', 3, 1),
(654, 'NUR NATASYA SYAHIRA BINTI MOHAMAD LUTFI', 'email@email.com', '060905140038', '060905140038', 3, 1),
(655, 'NURSYUHADA BINTI KAMARUDIN', 'email@email.com', '060214020512', '060214020512', 3, 1),
(656, 'NURUL AIN FARISHA BINTI MOHD SOFIYUDDIN', 'email@email.com', '060906080890', '060906080890', 3, 1),
(657, 'NURUL SYAZWANI BINTI  MOHD SHAHARUDDIN', 'email@email.com', '060220080378', '060220080378', 3, 1),
(658, 'PALLISSA A/P SATHIAN', 'email@email.com', '060221020772', '060221020772', 3, 1),
(659, 'PUTRA AMIR HAKIMI BIN MOHD ROSLAN', 'email@email.com', '060131070637', '060131070637', 3, 1),
(660, 'SITI BALQIS BINTI ABD GHAFFAR', 'email@email.com', '060411020730', '060411020730', 3, 1),
(661, 'SITI FATIHAH NASHWA BINTI MUHAMMAD NASRUDDIN', 'email@email.com', '060512100502', '060512100502', 3, 1),
(662, 'SITI NURJANNAH BINTI HERMANSAH', 'email@email.com', '061004020906', '061004020906', 3, 1),
(663, 'UKSAWADY A/P SIS TIT', 'email@email.com', '061015020944', '061015020944', 3, 1),
(664, 'CHARAN A/L VIAN', 'email@email.com', '060227020925', '060227020925', 3, 1),
(665, 'MOHAMAD ADAM IRFAN BIN MOHD SOBRI', 'email@email.com', '060807070021', '060807070021', 3, 1),
(666, 'MUHAMAD IRFAN BIN MAT NASRI', 'email@email.com', '060219100247', '060219100247', 3, 1),
(667, 'MUHAMMAD ADAM BIN MOHAMAD SHUKOR', 'email@email.com', '060730020287', '060730020287', 3, 1),
(668, 'MUHAMMAD AFNAN IRFAN BIN MOHD ZAMRI', 'email@email.com', '060526020335', '060526020335', 3, 1),
(669, 'MUHAMMAD AIMAN BIN MOHAMAD MAZERI', 'email@email.com', '061225020715', '061225020715', 3, 1),
(670, 'MUHAMMAD ALIFF SANIY BIN ZULKIFLI', 'email@email.com', '060602020813', '060602020813', 3, 1),
(671, 'MUHAMMAD AMMAR FITRI BIN MOHAMAD YUSOF', 'email@email.com', '061023140639', '061023140639', 3, 1),
(672, 'MUHAMMAD AQIL ADHAM BIN KHARIZAL', 'email@email.com', '061013020297', '061013020297', 3, 1),
(673, 'MUHAMMAD FAKHRUL BIN AYOB', 'email@email.com', '061014020491', '061014020491', 3, 1),
(674, 'MUHAMMAD FARIS BIN AHMAD SHAHABUDIN', 'email@email.com', '060413020937', '060413020937', 3, 1),
(675, 'MUHAMMAD FAUZANI BIN MOHD ZAMBRI', 'email@email.com', '061103020135', '061103020135', 3, 1),
(676, 'MUHAMMAD FIRDAUS BIN MOHAMAD FAUZI', 'email@email.com', '060516020577', '060516020577', 3, 1),
(677, 'MUHAMMAD IBNU SINA BIN MOHAMAD YUSOFF', 'email@email.com', '060126020643', '060126020643', 3, 1),
(678, 'MUHAMMAD NAZIM HAFIZI BIN MOHAMAD NIZAM', 'email@email.com', '061219020997', '061219020997', 3, 1),
(679, 'MUHAMMAD RUSYAIDI AKMAL BIN MOHD RODZI', 'email@email.com', '060808020173', '060808020173', 3, 1),
(680, 'MUHAMMAD SHAHRUL RIDZUAN BIN MOHAMAD ROZAIMI', 'email@email.com', '060122020275', '060122020275', 3, 1),
(681, 'MUHAMMAD SYAMIL BIN SAPIAN', 'email@email.com', '061017020681', '061017020681', 3, 1),
(682, 'MUHAMMAD ZULFARIS HAIKAL BIN ABDULLAH', 'email@email.com', '060902020639', '060902020639', 3, 1),
(683, 'NAM FON A/P CHAWALIT', 'email@email.com', '060421020662', '060421020662', 3, 1),
(684, 'NUR AINA BINTI KAMALRUZAMAN', 'email@email.com', '060208070062', '060208070062', 3, 1),
(685, 'NUR AISYA BINTI ABDULLAH', 'email@email.com', '060917020252', '060917020252', 3, 1),
(686, 'NUR ALIA FARISYA BINTI SAIDI', 'email@email.com', '060713020568', '060713020568', 3, 1),
(687, 'NUR IFFAWANI BINTI OMAR', 'email@email.com', '060521021064', '060521021064', 3, 1),
(688, 'NURUL BAHIYYAH BINTI SAIDIN', 'email@email.com', '060406020410', '060406020410', 3, 1),
(689, 'NURUL HULYAH HURIN BINTI JAMAL', 'email@email.com', '060923020494', '060923020494', 3, 1),
(690, 'PHAVINI A/P SOM CHIT', 'email@email.com', '061212020150', '061212020150', 3, 1),
(691, 'PRA NI TA A/P THIN', 'email@email.com', '060226020886', '060226020886', 3, 1),
(692, 'RAIHANAH ALIA BINTI AZIZAN', 'email@email.com', '060320020196', '060320020196', 3, 1),
(693, 'ROZIANA ATIRAH BINTI MOHD ROSLEE', 'email@email.com', '060116020746', '060116020746', 3, 1),
(694, 'SUNITTRAA A/P SAVALIT', 'email@email.com', '061206020752', '061206020752', 3, 1),
(695, 'ANUWAD A/L CHARAN', 'email@email.com', '060318020349', '060318020349', 3, 1),
(696, 'HAMIDAH BINTI SALEH', 'email@email.com', '060721020568', '060721020568', 3, 1),
(697, 'HANI MAISARA BINTI MAT BALIYA', 'email@email.com', '060613020640', '060613020640', 3, 1),
(698, 'LUQMAN HAKIM BIN MOHD ZUKI', 'email@email.com', '061108020097', '061108020097', 3, 1),
(699, 'MANAKPHONG A/L NAI NIT', 'email@email.com', '061005020553', '061005020553', 3, 1),
(700, 'MUHAMMAD AFIQ FARIDUDDIN BIN SHAIFUL AZIZI', 'email@email.com', '060910020137', '060910020137', 3, 1),
(701, 'MUHAMMAD DHILAAL BIN MOHAMAD JAMIL', 'email@email.com', '061019020757', '061019020757', 3, 1),
(702, 'MUHAMMAD DZULHELMIE BIN ABDUL RAHMAN', 'email@email.com', '060713020883', '060713020883', 3, 1),
(703, 'MUHAMMAD FARIS DANISH BIN ABU BAKAR', 'email@email.com', '060102020761', '060102020761', 3, 1),
(704, 'MUHAMMAD HAFI NUDIN BIN MUHAMAD NASIR', 'email@email.com', '060418020979', '060418020979', 3, 1),
(705, 'MUHAMMAD HAQIM AIMAN BIN MUHAMAD ZULAINI', 'email@email.com', '061205020275', '061205020275', 3, 1),
(706, 'MUHAMMAD QAYYEEM ANIEQ BIN SHAHRIL', 'email@email.com', '060604070435', '060604070435', 3, 1),
(707, 'MUHAMMAD SUMAIDI BIN MOHD IZAHAR', 'email@email.com', '060907020929', '060907020929', 3, 1),
(708, 'MYA ZARA BINTI MOHD YAZID', 'email@email.com', '060207021058', '060207021058', 3, 1),
(709, 'NAREERATH A/P AI KHUM', 'email@email.com', '061205020574', '061205020574', 3, 1),
(710, 'NAS NUR DEEN BIN ABD RAHMAN', 'email@email.com', '060829021159', '060829021159', 3, 1),
(711, 'NUR AIZAALEEYA BINTI ANUAR', 'email@email.com', '060829020914', '060829020914', 3, 1),
(712, 'NUR FATIN FATIHAH BINTI MOHD FADZIL', 'email@email.com', '060417020280', '060417020280', 3, 1),
(713, 'NUR QHAIRUNNISA BINTI MOHD SALLEH', 'email@email.com', '060902020612', '060902020612', 3, 1),
(714, 'NURASHIMAH BINTI ABDULLAH', 'email@email.com', '061205020996', '061205020996', 3, 1),
(715, 'NURFATIN HANISAH BINTI MOHAMAD SUKERI', 'email@email.com', '060509020392', '060509020392', 3, 1),
(716, 'ALIEYA QISTINA BINTI MOHAMAD ZAHIR', 'email@email.com', '060618020818', '060618020818', 3, 1),
(717, 'AMIRAH NAZIFA BINTI LUTPI', 'email@email.com', '060915020064', '060915020064', 3, 1),
(718, 'ERNI NURHASFINA BINTI SAZALI', 'email@email.com', '061104020794', '061104020794', 3, 1),
(719, 'MUHAMMAD AIDIL HAZRIEL BIN MUHAMAD MASRI', 'email@email.com', '061014020985', '061014020985', 3, 1),
(720, 'MUHAMMAD IRFAN DANISH BIN ROSLAN', 'email@email.com', '061109020195', '061109020195', 3, 1),
(721, 'MUHAMMAD ROZZAINIZAM MUHAIMIN BIN ROZLAN', 'email@email.com', '060909070313', '060909070313', 3, 1),
(722, 'MUHAMMAD SYAHID BIN MUSNIZAM', 'email@email.com', '060502020795', '060502020795', 3, 1),
(723, 'NAJWA BINTI ANUAR', 'email@email.com', '060812020352', '060812020352', 3, 1),
(724, 'NUR AIN AYUNI BINTI NAZARUDIN', 'email@email.com', '061201020366', '061201020366', 3, 1),
(725, 'NUR AMIRA BINTI MADAN', 'email@email.com', '060614020132', '060614020132', 3, 1),
(726, 'NUR MAIZATUL AKMA BINTI ISMAIL', 'email@email.com', '060326020576', '060326020576', 3, 1),
(727, 'NUR MELISA FARISA BINTI ABDUL MOAFTHI', 'email@email.com', '061104020364', '061104020364', 3, 1),
(728, 'NUR QISTINA BINTI MOHD ZAMRI', 'email@email.com', '061001020994', '061001020994', 3, 1),
(729, 'NUR SYAFIQAH BALQIS BINTI MOHAMAD SAHHIDAN', 'email@email.com', '060322020982', '060322020982', 3, 1),
(730, 'NURUL AUNI BINTI ALI YASARBANI', 'email@email.com', '060407020076', '060407020076', 3, 1),
(731, 'RATNA ZULAIKA BINTI RUSLAN', 'email@email.com', '060329020336', '060329020336', 3, 1),
(732, 'UMAIRAH NAJIHAH BINTI MOHD RADZI', 'email@email.com', '060904020632', '060904020632', 3, 1),
(733, 'ZUHAIRAH BINTI MD ZAIDI', 'email@email.com', '061128020692', '061128020692', 3, 1),
(734, 'ADIBA SOFIA BINTI ABDUL MUTTALIB', 'email@email.com', '060919020344', '060919020344', 3, 1),
(735, 'ANISA A/P AI PIAN', 'email@email.com', '060709020776', '060709020776', 3, 1),
(736, 'FARAH ZAIDAD BINTI MOHD SANUSI', 'email@email.com', '061109020654', '061109020654', 3, 1),
(737, 'FARISYA AZWA BINTI MOHAMAD JARID', 'email@email.com', '060731070104', '060731070104', 3, 1),
(738, 'IRSHAD HAMDI BIN MAHAMAD PAKROL RAZI', 'email@email.com', '061214140623', '061214140623', 3, 1),
(739, 'KANITTHA A/P SEE GAN', 'email@email.com', '060525020624', '060525020624', 3, 1),
(740, 'LADDAWAN A/P WIAN', 'email@email.com', '060718020022', '060718020022', 3, 1),
(741, 'MALIKWAN A/P AI PET', 'email@email.com', '060720021286', '060720021286', 3, 1),
(742, 'MUHAMMAD HARIS IKHWAN BIN MOHAMAD KAMIL', 'email@email.com', '060607020345', '060607020345', 3, 1),
(743, 'MUHAMMAD IQBAL BIN ABDUL', 'email@email.com', '060617020605', '060617020605', 3, 1),
(744, 'NISDATUL IZWANI BINTI AHMAD ZALANI', 'email@email.com', '060611020372', '060611020372', 3, 1),
(745, 'NORFAIZAH BINTI ABDUL MUTALIB', 'email@email.com', '060119070394', '060119070394', 3, 1),
(746, 'NUR AINA NURUL AIN BINTI ROSLAN', 'email@email.com', '060506020506', '060506020506', 3, 1),
(747, 'NUR AINA SYAZANA BINTI MOHD ADIL', 'email@email.com', '060308020644', '060308020644', 3, 1),
(748, 'NUR SHAHIDA BINTI ASRI', 'email@email.com', '060416020852', '060416020852', 3, 1),
(749, 'NUR SOFIA ADLINA BINTI MOHD ROHAIZAT', 'email@email.com', '060907020750', '060907020750', 3, 1),
(750, 'NURUL NAJIHA BINTI ISMAIL', 'email@email.com', '060712020494', '060712020494', 3, 1),
(751, 'SURINN A/L AI CHAM NONG', 'email@email.com', '061208020043', '061208020043', 3, 1),
(752, 'SUVIMOON A/P AI IN', 'email@email.com', '060217020438', '060217020438', 3, 1),
(753, 'SYAZANA BINTI MD SHAHRULNIZAL', 'email@email.com', '060401020374', '060401020374', 3, 1),
(754, 'TEH LIN LING', 'email@email.com', '060504020932', '060504020932', 3, 1),
(755, 'AH NASS A/L AH AIK', 'email@email.com', '060409020571', '060409020571', 3, 1),
(756, 'AIRIL HAZIQ BIN MOHAMAD RASIDI', 'email@email.com', '060325020507', '060325020507', 3, 1),
(757, 'FAREEZUAN BIN MUHAMAD ARIF', 'email@email.com', '060105020599', '060105020599', 3, 1),
(758, 'KELVIN A/L WINIT', 'email@email.com', '061231070305', '061231070305', 3, 1),
(759, 'KITTIK SAK A/L SUTTEN', 'email@email.com', '060118020491', '060118020491', 3, 1),
(760, 'MUHAMAD SHAH RAMADAN BIN MOHAMAD', 'email@email.com', '061019030605', '061019030605', 3, 1),
(761, 'MUHAMMAD A\'ZAM ASHRAF BIN ISHAK', 'email@email.com', '060102020905', '060102020905', 3, 1),
(762, 'MUHAMMAD ADAM HAIKAL BIN MOHD HASRUL AZLAN', 'email@email.com', '061229020421', '061229020421', 3, 1),
(763, 'MUHAMMAD AIMAN FAKHARUDDIN BIN BAHARUDDIN', 'email@email.com', '061001030201', '061001030201', 3, 1),
(764, 'MUHAMMAD AIMAN HAZIQ BIN CHE YOON', 'email@email.com', '060920020333', '060920020333', 3, 1),
(765, 'MUHAMMAD AZIM AZIMIE BIN ZAKARIA', 'email@email.com', '060103020261', '060103020261', 3, 1),
(766, 'MUHAMMAD AZIM IQMAL BIN CHE NAN', 'email@email.com', '061021020537', '061021020537', 3, 1),
(767, 'MUHAMMAD FAQRUL NIZAM BIN MAHHIZAN', 'email@email.com', '060818020425', '060818020425', 3, 1),
(768, 'MUHAMMAD FARIS MUHAIMIN BIN HABALI', 'email@email.com', '060213020801', '060213020801', 3, 1),
(769, 'MUHAMMAD HAFIZH NAJMI BIN MOHD AZHAR', 'email@email.com', '061108020441', '061108020441', 3, 1),
(770, 'MUHAMMAD HAIKAL BIN ABDULLAH', 'email@email.com', '060126020897', '060126020897', 3, 1),
(771, 'MUHAMMAD HAZIM AZFAR BIN ISMAIL', 'email@email.com', '060113021057', '060113021057', 3, 1),
(772, 'MUHAMMAD IRFAN HARITH BIN MOHD RIDHWAN', 'email@email.com', '060319020463', '060319020463', 3, 1),
(773, 'MUHAMMAD KHAIROL AMIN BIN ROSLAN', 'email@email.com', '060807021107', '060807021107', 3, 1),
(774, 'MUHAMMAD NAFIS BIN MOHAMAD NOOR', 'email@email.com', '060903020761', '060903020761', 3, 1),
(775, 'MUHAMMAD SYAFIQ AMMAR BIN AHMAD SAWAL', 'email@email.com', '060606020773', '060606020773', 3, 1),
(776, 'MUHAMMAD SYAZWAN BIN ZAINUN ABIDIN', 'email@email.com', '060818020193', '060818020193', 3, 1),
(777, 'PARIWAT A/L CHA LI', 'email@email.com', '060621020325', '060621020325', 3, 1),
(778, 'SITSANAPHAN SAMATCHARCAI', 'email@email.com', '060803021361', '060803021361', 3, 1),
(779, 'THANIN A/L DIT', 'email@email.com', '061025020913', '061025020913', 3, 1),
(780, 'U VIN A/L EP', 'email@email.com', '061124020767', '061124020767', 3, 1),
(781, 'VINCENT A/L TIANG', 'email@email.com', '060717100469', '060717100469', 3, 1),
(782, 'AHMAD SYARIFUDDIN BIN MAHAMUD', 'email@email.com', '050602020945', '050602020945', 3, 1),
(783, 'AMIERA NAJWA BINTI ABDUL NASER', 'email@email.com', '051207021088', '051207021088', 3, 1),
(784, 'JESSLYN ISSARA A/P SURASAK', 'email@email.com', '050830020584', '050830020584', 3, 1),
(785, 'KU MUHAMMAD ZHARIF BIN KU ZAILAN', 'email@email.com', '050405020225', '050405020225', 3, 1),
(786, 'MUHAMMAD AMIRUN AMIN BIN MOHD NAZLE', 'email@email.com', '050225020025', '050225020025', 3, 1),
(787, 'MUHAMMAD AMMAR AMZAR BIN AHMAD RAJMIN', 'email@email.com', '050914020389', '050914020389', 3, 1),
(788, 'MUHAMMAD ATIF DANIAL BIN AHMAD ZAMRI', 'email@email.com', '051105020527', '051105020527', 3, 1),
(789, 'MUHAMMAD AZIM BIN MOHD JAFRI', 'email@email.com', '050311020849', '050311020849', 3, 1),
(790, 'MUHAMMAD DZULAMMAR BIN ABDULLAH', 'email@email.com', '050429020801', '050429020801', 3, 1),
(791, 'MUHAMMAD FAKRUL AZIMIN BIN AHMAD FAUZI', 'email@email.com', '050114020559', '050114020559', 3, 1),
(792, 'MUHAMMAD HAMSANIE BIN ABDUL KARIM', 'email@email.com', '050821020769', '050821020769', 3, 1),
(793, 'MUHAMMAD KHAIRUL FAIZI BIN MOHD ZAMBRI', 'email@email.com', '050405020217', '050405020217', 3, 1),
(794, 'MUHAMMAD NUR EHSAN BIN MOHD ZAKARIA', 'email@email.com', '050104020109', '050104020109', 3, 1),
(795, 'MUHAMMAD SYAKIR BIN MOHD NASRI', 'email@email.com', '050609020315', '050609020315', 3, 1),
(796, 'NARTTALI A/P WIRAT', 'email@email.com', '051027020598', '051027020598', 3, 1),
(797, 'NOR ALIA SYATIRA BINTI MAD RADZI', 'email@email.com', '050915020794', '050915020794', 3, 1),
(798, 'NUR AINA BATRISYIA BINTI BASIR', 'email@email.com', '050719020586', '050719020586', 3, 1),
(799, 'NUR ALIYYA FARISHA BINTI MOHD ADNAN', 'email@email.com', '050308020100', '050308020100', 3, 1),
(800, 'NUR ALYA NAJIHAH BINTI MOHAMAD', 'email@email.com', '051105090066', '051105090066', 3, 1),
(801, 'NUR IZZATI FATINI BINTI MOHD FAIZAL', 'email@email.com', '051211020088', '051211020088', 3, 1),
(802, 'NUR SYAFIQAH BINTI MOHAMAD SHUKRI', 'email@email.com', '050413070214', '050413070214', 3, 1),
(803, 'NUR SYAHIRA SYAFIKA BINTI HAMIDON', 'email@email.com', '050103020510', '050103020510', 3, 1),
(804, 'NURLIN IZZATY BINTI AHMAD MUSA', 'email@email.com', '050623020688', '050623020688', 3, 1),
(805, 'NURUL AYUNI BINTI RAMLI', 'email@email.com', '050524020092', '050524020092', 3, 1),
(806, 'NURUL FARAHHIDA BINTI MAT SABUDIN', 'email@email.com', '051213020778', '051213020778', 3, 1),
(807, 'NURUL IZZAH BINTI SAMSOL', 'email@email.com', '050627020888', '050627020888', 3, 1),
(808, 'NURUL SOFEA BINTI ZAIFUL AZMI', 'email@email.com', '050706070066', '050706070066', 3, 1),
(809, 'RANICSHA A/P CHAI', 'email@email.com', '051215020376', '051215020376', 3, 1),
(810, 'SALWATIF BINTI BASRI', 'email@email.com', '050112020328', '050112020328', 3, 1),
(811, 'SITI NAJIBAH BINTI MD KHIR', 'email@email.com', '050921070456', '050921070456', 3, 1),
(812, 'SYAMIM BINTI MOHAMAD ZAMBRI', 'email@email.com', '050125020642', '050125020642', 3, 1),
(813, 'SYAMIMI AINA BINTI MOHD FAUZI', 'email@email.com', '051101020394', '051101020394', 3, 1),
(814, 'ARNUKSORN A/L PRAKSIT', 'email@email.com', '050731020239', '050731020239', 3, 1),
(815, 'CATIE VARAVEE A/P WINIT', 'email@email.com', '050817070202', '050817070202', 3, 1),
(816, 'FATIN NUR SOPIA BINTI SAIFULANUAR', 'email@email.com', '050313020420', '050313020420', 3, 1),
(817, 'HUMAIRA BINTI HISSHAM', 'email@email.com', '050601090036', '050601090036', 3, 1),
(818, 'MEAKHIN A/L AHIN', 'email@email.com', '051230020147', '051230020147', 3, 1),
(819, 'MOHAMAD AIMAN HAKIMI BIN MOHD ALI', 'email@email.com', '050313080773', '050313080773', 3, 1),
(820, 'MUHAMMAD ADAM HAFIZ BIN MUHAMAD YUSUP', 'email@email.com', '050219020723', '050219020723', 3, 1),
(821, 'MUHAMMAD FAKRUL FITRI BIN MOHD DAUD', 'email@email.com', '051022020185', '051022020185', 3, 1),
(822, 'MUHAMMAD HAIKAL BIN MOHD ROSMAINI', 'email@email.com', '051107020491', '051107020491', 3, 1),
(823, 'MUHAMMAD NABIL SYAKIR BIN ANUAR', 'email@email.com', '050412020629', '050412020629', 3, 1),
(824, 'MUHAMMAD NAJMI BIN ARIS', 'email@email.com', '050226020289', '050226020289', 3, 1),
(825, 'MUHAMMAD SUHAIL BIN RUSLAN', 'email@email.com', '050601020783', '050601020783', 3, 1),
(826, 'MUHAMMAD SYAMIL BIN HUSIN', 'email@email.com', '050115020091', '050115020091', 3, 1),
(827, 'MUHAMMAD TAUFIK BIN ZULKIFLI', 'email@email.com', '050901020603', '050901020603', 3, 1),
(828, 'NUR ALIEYA SAFFIA BINTI MOHD KASWADI', 'email@email.com', '050705020374', '050705020374', 3, 1),
(829, 'NUR ANIS IZZATI BINTI YUSOFF', 'email@email.com', '050425020644', '050425020644', 3, 1),
(830, 'NUR ERISSA NATASHA BINTI MOHD FAZLEY', 'email@email.com', '050708070588', '050708070588', 3, 1),
(831, 'NUR FATIHAH BINTI MAT BALIYA', 'email@email.com', '050127020806', '050127020806', 3, 1),
(832, 'NUR INSYIRAH NAJWA BINTI ADNAN', 'email@email.com', '051025020332', '051025020332', 3, 1),
(833, 'NUR JANNAH SAFIAH BINTI SHAMSUDDIN', 'email@email.com', '040305070322', '040305070322', 3, 1),
(834, 'NURUL ALEEYA NATASYA BINTI ABDULLAH', 'email@email.com', '050630070878', '050630070878', 3, 1),
(835, 'SUCAWADI A/P SAMREN', 'email@email.com', '050729020344', '050729020344', 3, 1),
(836, 'SUKON A/L TAIP', 'email@email.com', '051104020277', '051104020277', 3, 1),
(837, 'AI SERK A/L AI BAU', 'email@email.com', '050911020439', '050911020439', 3, 1),
(838, 'MUHAMMAD ANIQ SYAZWAN BIN RIZAL ANWAR', 'email@email.com', '051203070587', '051203070587', 3, 1),
(839, 'MUHAMMAD ARIF FAHMI BIN BIAMIN', 'email@email.com', '050918020781', '050918020781', 3, 1),
(840, 'MUHAMMAD BASRI BIN ZULKIFLI', 'email@email.com', '050314020633', '050314020633', 3, 1),
(841, 'NOR HANNI FARISHA ZACMIZ BINTI ZAKARIA', 'email@email.com', '051120070020', '051120070020', 3, 1),
(842, 'NUR ADDINA ARISYA BINTI ABD GHANI', 'email@email.com', '050925020528', '050925020528', 3, 1),
(843, 'NUR DIMAS HENDRIANTO BIN NUR HASAN', 'email@email.com', '050824020385', '050824020385', 3, 1),
(844, 'NURINA BINTI AHMAD FAISUL', 'email@email.com', '050104020600', '050104020600', 3, 1),
(845, 'NURSYUHADA BINTI AHMAD SUKRI', 'email@email.com', '050921070448', '050921070448', 3, 1),
(846, 'NURUL NATASHA BINTI MOHD RIZAN', 'email@email.com', '050806020234', '050806020234', 3, 1),
(847, 'SHALEY JOKLOKKRABATT A/P CHEM', 'email@email.com', '050813020312', '050813020312', 3, 1),
(848, 'SIRINA A/P BUN MI', 'email@email.com', '050825020432', '050825020432', 3, 1),
(849, 'SITI NURFATEHAH BINTI MOHAMAD YUSOP', 'email@email.com', '050817020870', '050817020870', 3, 1),
(850, 'VALIYA A/P AIBAU', 'email@email.com', '050111020318', '050111020318', 3, 1),
(851, 'AMELIA SUFINA BINTI MOHAMAD FISOL', 'email@email.com', '050204020480', '050204020480', 3, 2),
(852, 'MUHAMMAD ARSYAD HAKIMI BIN ABDUL AZIZ', 'email@email.com', '051012020819', '051012020819', 3, 2),
(853, 'MUHAMMAD DARWISY ZARIF BIN ROSLAN', 'email@email.com', '050606020651', '050606020651', 3, 2),
(854, 'MUHAMMAD HAIKAL HARIS BIN MUHAMAD ZAHIR', 'email@email.com', '050606020731', '050606020731', 3, 2),
(855, 'MUHAMMAD HASRIZAL BIN ISMAIL', 'email@email.com', '050922020565', '050922020565', 3, 2),
(856, 'MUHAMMAD SYAFIQ SYUKRI BIN ABDUL RAHMAN', 'email@email.com', '050707020925', '050707020925', 3, 2),
(857, 'NUR AINA FADHILAH BINTI ROSLI', 'email@email.com', '050404021218', '050404021218', 3, 2),
(858, 'NUR ALIA NATASYA BINTI ABU BAKAR', 'email@email.com', '051205021244', '051205021244', 3, 2),
(859, 'NUR ALIA NATASYA BINTI ZAIRUL', 'email@email.com', '051110020492', '051110020492', 3, 2),
(860, 'NUR ASMIYDAR BINTI BAKHARI', 'email@email.com', '051031070942', '051031070942', 3, 2),
(861, 'NUR ATIKAH BINTI ZULKIFLI', 'email@email.com', '050915020516', '050915020516', 3, 2),
(862, 'NUR ATIRAH BINTI ZULKIFLE', 'email@email.com', '051025021036', '051025021036', 3, 2),
(863, 'NUR FAIZAH BINTI WAN AHMAD', 'email@email.com', '050216020234', '050216020234', 3, 2),
(864, 'NUR HAZIQAH BINTI HARUN', 'email@email.com', '050828020446', '050828020446', 3, 2),
(865, 'NUR INSYIRAH BALQIS BINTI ALIAS', 'email@email.com', '050215020478', '050215020478', 3, 2),
(866, 'NUR KAMAIZZATI BINTI KAMARUDIN', 'email@email.com', '050704020540', '050704020540', 3, 2),
(867, 'NUR SYAHIRAH BINTI MUHAMAD ZAINOL', 'email@email.com', '051129020230', '051129020230', 3, 2),
(868, 'NURALIA NATASSYA BINTI SHARIMAN', 'email@email.com', '051112020226', '051112020226', 3, 2),
(869, 'NURSYAHIELA BINTI SHAHARUDIN', 'email@email.com', '050531020904', '050531020904', 3, 2),
(870, 'NURUL AMNI IZZATI BINTI HANIZAN', 'email@email.com', '051014020070', '051014020070', 3, 2),
(871, 'PRAVENEISHWARY A/P THARMA BALAN', 'email@email.com', '050325020778', '050325020778', 3, 2),
(872, 'SITI AISYAH BINTI CHE AAD @ CHE SAAD', 'email@email.com', '051012021168', '051012021168', 3, 2),
(873, 'UMAR HAKIM BIN MOHD ZUKI', 'email@email.com', '050526020379', '050526020379', 3, 2),
(874, 'ASLAM SHAHIRAN BIN SAHARUDDIN', 'email@email.com', '051106110479', '051106110479', 3, 2),
(875, 'CHARAPOVA A/P CHARAN', 'email@email.com', '050120070034', '050120070034', 3, 2),
(876, 'CHIRAWAD A/L IBAU', 'email@email.com', '051012020827', '051012020827', 3, 2),
(877, 'MAIZATULL ROSLINA BINTI ROSLI', 'email@email.com', '050213020562', '050213020562', 3, 2),
(878, 'MUHAMMAD AFANDI BIN MAT RAMLI', 'email@email.com', '051215020587', '051215020587', 3, 2),
(879, 'MUHAMMAD AIMAN BIN CHE ALIAS', 'email@email.com', '050902020613', '050902020613', 3, 2),
(880, 'MUHAMMAD ZAKHWAN  BIN ZULKEFLI', 'email@email.com', '050725020419', '050725020419', 3, 2),
(881, 'NUR ADRIANA BINTI MOHAMAD AZLIN', 'email@email.com', '050218020246', '050218020246', 3, 2),
(882, 'NUR AFRINA ILHAM BINTI SUHARDI', 'email@email.com', '050806020496', '050806020496', 3, 2),
(883, 'NURSAFIA ILLYANA BINTI MAHADHIR', 'email@email.com', '051012020982', '051012020982', 3, 2),
(884, 'SITI KHADIJA BINTI ZULHISSAN', 'email@email.com', '050330070278', '050330070278', 3, 2),
(885, 'SITI NORSYAZLEEN BINTI OMAR', 'email@email.com', '050323140338', '050323140338', 3, 2),
(886, 'WANWISA A/P HIAN', 'email@email.com', '050522020486', '050522020486', 3, 2),
(887, 'WILIAN A/P WAN', 'email@email.com', '050929020744', '050929020744', 3, 2),
(888, 'AMAR MUKHRIZ BIN ZULKIFLI', 'email@email.com', '050614021005', '050614021005', 3, 1),
(889, 'HAJEERA BALQIS BINTI MOHD FADLI', 'email@email.com', '050708060232', '050708060232', 3, 1),
(890, 'KALLAJANI A/P IS THA ROM', 'email@email.com', '051017020412', '051017020412', 3, 1),
(891, 'KANSUMAA A/P PHON', 'email@email.com', '050415020624', '050415020624', 3, 1),
(892, 'MUHAMMAD ALIF ISKANDAR BIN OSMAN', 'email@email.com', '051023140963', '051023140963', 3, 1),
(893, 'MUHAMMAD AMIR ASRAAF BIN ABDUL MUTALIB', 'email@email.com', '050511020413', '050511020413', 3, 1),
(894, 'MUHAMMAD AMIRUL HAQIM BIN HASAN', 'email@email.com', '050525020617', '050525020617', 3, 1),
(895, 'MUHAMMAD EMIL SHAFWAN BIN ABDUL RAHMAN', 'email@email.com', '051027020045', '051027020045', 3, 1),
(896, 'MUHAMMAD HAFFIZ BIN MOHD RIZAL', 'email@email.com', '050823020543', '050823020543', 3, 1),
(897, 'MUHAMMAD IRFAN HAMIZAN BIN ROSLAN', 'email@email.com', '051009020199', '051009020199', 3, 1),
(898, 'MUHAMMAD IZUWAN BIN MOHD ZERE', 'email@email.com', '050905020547', '050905020547', 3, 1),
(899, 'MUHAMMAD NASRUL AZIM BIN ABDUL RAHIM', 'email@email.com', '050816020879', '050816020879', 3, 1),
(900, 'NURALIAH DALILAH BINTI MOHD ZAIDIE', 'email@email.com', '051117020620', '051117020620', 3, 1),
(901, 'PATRICK A/L SOMCHAT', 'email@email.com', '051113020391', '051113020391', 3, 1),
(902, 'PRI CHA A/L CHOK DE', 'email@email.com', '051123020379', '051123020379', 3, 1),
(903, 'SAKHAWI IZDIHAR BIN MD RAMLI', 'email@email.com', '050313020201', '050313020201', 3, 1),
(904, 'SAVUT A/L IBUT', 'email@email.com', '050505020169', '050505020169', 3, 1),
(905, 'SUMET RATNAKSUK A/L PHAI', 'email@email.com', '051028020231', '051028020231', 3, 1),
(906, 'AMIERA NAJIHAH BINTI ABDUL NASER', 'email@email.com', '040622020628', '040622020628', 3, 1),
(907, 'DAYINI SYAFIQAH BINTI MOHAMAD SHUKRI', 'email@email.com', '041223020158', '041223020158', 3, 1),
(908, 'DINIE ANDINA BINTI MOHAMAD JAMIL', 'email@email.com', '040808020714', '040808020714', 3, 1),
(909, 'IZZAT HAMZANI BIN MOHD MOKHTAR', 'email@email.com', '050101020349', '050101020349', 3, 1),
(910, 'MARSYAYANI BINTI MUHAMAD', 'email@email.com', '041027020062', '041027020062', 3, 1),
(911, 'MUHAMAD HAKIM FARIZI BIN HUSSAIN', 'email@email.com', '041230020631', '041230020631', 3, 1),
(912, 'MUHAMMAD EZZAMMER BIN RIDZUAN', 'email@email.com', '040401020165', '040401020165', 3, 1),
(913, 'NUR IZZATI BINTI MOHD YUSNI', 'email@email.com', '040510021052', '040510021052', 3, 1),
(914, 'NUR NAZIFA ZULAIKA BINTI MOHD YUSOF', 'email@email.com', '040222020370', '040222020370', 3, 1),
(915, 'NURUL ASYIQIN BINTI MOHAMMAD RIZAL', 'email@email.com', '040708020274', '040708020274', 3, 1),
(916, 'NURUL IZZATIE BINTI BASIRI', 'email@email.com', '040205020328', '040205020328', 3, 1),
(917, 'SITI BATRISYIA BINTI ZULKIFLI', 'email@email.com', '040506020524', '040506020524', 3, 1),
(918, 'UMAR LUTFI BIN ISMAIL', 'email@email.com', '040125020299', '040125020299', 3, 1),
(919, 'ADAM BIN SHAMSUDIN', 'email@email.com', '040728020749', '040728020749', 3, 1),
(920, 'ANIS AQILAH BINTI MUHAMAD FAUZI', 'email@email.com', '040810020916', '040810020916', 3, 1),
(921, 'ATIQAH BINTI MOHAMAD HASNI', 'email@email.com', '041128070114', '041128070114', 3, 1),
(922, 'MOHD NAQQUIB BIN  NURUL HAFIZ', 'email@email.com', '041106050059', '041106050059', 3, 1),
(923, 'MUHAMMAD NAIM BIN ABDUL RAZAT', 'email@email.com', '040710020599', '040710020599', 3, 1),
(924, 'NUR AIN RAMIZAH BINTI AZMI', 'email@email.com', '040904021100', '040904021100', 3, 1),
(925, 'NUR ALIA HUSNA BINTI MOHAMAD NASIR', 'email@email.com', '040428070314', '040428070314', 3, 1),
(926, 'NUR ALIA SUHAILA BINTI AHMAD', 'email@email.com', '040314020394', '040314020394', 3, 1),
(927, 'NUR FATIN MAISARAH BINTI MUSA', 'email@email.com', '041115020222', '041115020222', 3, 1),
(928, 'NUR FATIN NADIAH BINTI ABD RAHMAN', 'email@email.com', '040511020772', '040511020772', 3, 1),
(929, 'NUR SAKINAH BINTI MOHD SABRI', 'email@email.com', '040905100820', '040905100820', 3, 1),
(930, 'NUR SYUHANA BINTI ABDUL TALIB', 'email@email.com', '040407020684', '040407020684', 3, 1),
(931, 'MEI THANI A/P AI CHUAN', 'email@email.com', '030104020856', '030104020856', 3, 1),
(932, 'NUR EZZATY BINTI MOHD KHORI', 'email@email.com', '031215020204', '031215020204', 3, 1),
(933, 'NUR FARRAH WAHEEDA BINTI MOHD AYOB', 'email@email.com', '031017020836', '031017020836', 3, 1),
(934, 'NUR RASMIYATI ALYA BINTI RAZALI', 'email@email.com', '030122020622', '030122020622', 3, 1),
(935, 'NUR SYAZWANI BINTI MOHD ZAKI', 'email@email.com', '031118020384', '031118020384', 3, 1),
(936, 'NURUL ADILLAH BINTI ABDUL RAHMAN', 'email@email.com', '030625020288', '030625020288', 3, 1),
(937, 'NURUL AIN BATRISYIA BINTI MOHD ZAINI', 'email@email.com', '031128021102', '031128021102', 3, 1),
(938, 'SHARIFAH HUSNUL AMIRA BINTI SYED RODZI', 'email@email.com', '031016101060', '031016101060', 3, 1),
(939, 'SITI HAJAR NAJWA BINTI SUKRI', 'email@email.com', '030914021076', '030914021076', 3, 1),
(940, 'ABDUL AZIM BIN MD ZAIDI', 'email@email.com', '030427021079', '030427021079', 3, 1),
(941, 'ALIF HAKIMI BIN HUSSIN', 'email@email.com', '030510080707', '030510080707', 3, 1),
(942, 'CHELL NA RI A/P BON CHUAN', 'email@email.com', '030801020720', '030801020720', 3, 1),
(943, 'FARIDATUL HANIM BINTI MD AZAHAR', 'email@email.com', '031026020766', '031026020766', 3, 1),
(944, 'HASYIR ANIS BIN MOHD ZAHIR', 'email@email.com', '030727020123', '030727020123', 3, 1),
(945, 'IZYAN SYAHIRAH BINTI MOHD MOKHTAR', 'email@email.com', '030625020966', '030625020966', 3, 1),
(946, 'MUHAMMAD ADAM BIN MOHD YUNUS', 'email@email.com', '031118020755', '031118020755', 3, 1),
(947, 'MUHAMMAD ILHAM BIN MD JELANI', 'email@email.com', '030920020555', '030920020555', 3, 1),
(948, 'MUHAMMAD NAIMULLAH BIN ABEDUL RAHIM', 'email@email.com', '030610020605', '030610020605', 3, 1),
(949, 'MUHAMMAD SYAHMI ZUFAYRI BIN MOHAMAD ZAIDI', 'email@email.com', '031019021111', '031019021111', 3, 1),
(950, 'MUHAMMAD ZAFRI BIN MUHAMAD ZAINOL', 'email@email.com', '030323020805', '030323020805', 3, 1),
(951, 'NIK DA A/P SED', 'email@email.com', '030901020736', '030901020736', 3, 1),
(952, 'SOFEA NATASYA MARZUKHI', 'email@email.com', '030430140976', '030430140976', 3, 1),
(953, 'SYAH NUR AMYLIA BINTI SHAH JAHAN', 'email@email.com', '031224020310', '031224020310', 3, 1),
(954, 'ZURAIDAH BINTI MUHAMAD HUSNI', 'email@email.com', '030630020688', '030630020688', 3, 1),
(955, 'AMIRUL ZIKRY BIN MOHAMAD', 'email@email.com', '070428020429', '070428020429', 3, 1),
(956, 'ANUKPHAP', 'email@email.com', '070726090265', '070726090265', 3, 1),
(957, 'CHOK CHAI A/L AIPUT', 'email@email.com', '071012020585', '071012020585', 3, 1),
(958, 'MUHAMMAD FITRI BIN RAMLI', 'email@email.com', '071019020625', '071019020625', 3, 1),
(959, 'MUHAMMAD HAZIMAN ADIB BIN JEFFRYSYAKINI', 'email@email.com', '071017021173', '071017021173', 3, 1),
(960, 'MUHAMMAD IKHWAN BIN MUHD ZAMRI', 'email@email.com', '060616020267', '060616020267', 3, 1),
(961, 'WARAWIT A/L SIEW AIK', 'email@email.com', '071228020891', '071228020891', 3, 1),
(962, 'WITTHAYA A/L LAM', 'email@email.com', '071230020655', '071230020655', 3, 1),
(963, 'MUHAMMAD AIDIEL FITRI BIN MOHAMAD ZAMRI', 'email@email.com', '041113020843', '041113020843', 3, 1),
(964, 'MUHAMMAD HAFIFI BIN ROSLI', 'email@email.com', '040706020609', '040706020609', 3, 1),
(965, 'MUHAMMAD HAFIZ BIN ABDULLAH', 'email@email.com', '040521020493', '040521020493', 3, 1),
(966, 'MUHAMMAD NAUFAL BIN MANSOR', 'email@email.com', '040109020299', '040109020299', 3, 1),
(967, 'NURUL BALQIS BINTI YUSOFF', 'email@email.com', '041209020274', '041209020274', 3, 1),
(968, 'NURUL SYAZANA ALYAA BINTI JEFFRYSYAKINI', 'email@email.com', '041016020542', '041016020542', 3, 1),
(969, 'MUHAMMAD IKHMAL BIN ABDULLAH', 'email@email.com', '030313020713', '030313020713', 3, 1),
(970, 'MUHAMMAD RIZAL BIN MAT ISA', 'email@email.com', '040831020931', '040831020931', 3, 1),
(971, 'NURUL NABILAH BINTI MOHD YUSUF', 'email@email.com', '030214020400', '030214020400', 3, 1),
(972, 'ANISSA A/P AIHIN', 'email@email.com', '081211020114', '081211020114', 3, 1),
(973, 'MUHAMMAD AMIR SAIFUDDIN BIN MOHAMAD FISUL', 'email@email.com', '080124020445', '080124020445', 3, 1),
(974, 'MUHAMMAD AMIR SAIFULLAH BIN MOHAMAD FISUL', 'email@email.com', '080124020437', '080124020437', 3, 1),
(975, 'MUHAMMAD ZAKWAN BIN MOHD NIZAM', 'email@email.com', '090522020773', '090522020773', 3, 1),
(976, 'PUTRI DAMIA QASIH BINTI ABDUL \'ALIY', 'email@email.com', '090806090108', '090806090108', 3, 1),
(977, 'VIRAKWAT A/L AI SEE WAN', 'email@email.com', '090828020813', '090828020813', 3, 1),
(978, 'CAREY A/L SOMCHIT', 'email@email.com', '051031021227', '051031021227', 3, 1),
(979, 'NUR MASLEEZA BINTI YUSOF', 'email@email.com', '060330020894', '060330020894', 3, 1),
(980, 'NUR SYAFIQAH BINTI MOHD SHAHIDI', 'email@email.com', '061209020838', '061209020838', 3, 1),
(981, 'NURUL NADILA BINTI MANSOR', 'email@email.com', '060808020640', '060808020640', 3, 1),
(982, 'NURUL SYAHIRAH NAJWA BINTI JEFFRYSYAKINI', 'email@email.com', '060429020798', '060429020798', 3, 1),
(983, 'SITI NUR SYAHMIMI BINTI MD DAUD', 'email@email.com', '050812020388', '050812020388', 3, 1),
(984, 'SUWANNE A/P AISOK', 'email@email.com', '050201020776', '050201020776', 3, 1),
(989, 'ZAMANI RAHMAN', 'maria@noemail.com', '7804240251491', 'abc123', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rph_copyvalue` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `json` TEXT NOT NULL , PRIMARY KEY (`id`)
) ENGINE = InnoDB;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `id_status`) VALUES
(1, 'Admin', 1),
(2, 'Guru', 1),
(3, 'Murid', 1),
(4, 'AKP', 1),
(9, 'New User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rph_guru_subjek`
--

CREATE TABLE `rph_guru_subjek` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL DEFAULT 0,
  `id_kelas` int(11) NOT NULL DEFAULT 0,
  `id_subjek` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_guru_subjek`
--

INSERT INTO `rph_guru_subjek` (`id`, `id_pengguna`, `id_kelas`, `id_subjek`) VALUES
(7, 1, 8, 7),
(8, 1, 10, 7),
(9, 1, 14, 7);

-- --------------------------------------------------------

--
-- Table structure for table `rph_hari`
--

CREATE TABLE `rph_hari` (
  `id` int(11) NOT NULL,
  `hari` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_hari`
--

INSERT INTO `rph_hari` (`id`, `hari`) VALUES
(1, 'AHAD'),
(2, 'ISNIN'),
(3, 'SELASA'),
(4, 'RABU'),
(5, 'KHAMIS');

-- --------------------------------------------------------

--
-- Table structure for table `rph_masa`
--

CREATE TABLE `rph_masa` (
  `id` int(11) NOT NULL,
  `masa` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_masa`
--

INSERT INTO `rph_masa` (`id`, `masa`) VALUES
(1, '7.40'),
(2, '8.20'),
(3, '9.00'),
(4, '9.40'),
(5, '10.20'),
(6, '11.00'),
(7, '11.40'),
(8, '12.20'),
(9, '1.00'),
(10, '1.40'),
(11, '2.20');

-- --------------------------------------------------------

--
-- Table structure for table `rph_minggu`
--

CREATE TABLE `rph_minggu` (
  `id_minggu` int(11) NOT NULL,
  `minggu` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_minggu`
--

INSERT INTO `rph_minggu` (`id_minggu`, `minggu`) VALUES
(1, 'M1'),
(2, 'M2'),
(3, 'M3'),
(4, 'M4');

-- --------------------------------------------------------

--
-- Table structure for table `rph_perancangan`
--

CREATE TABLE `rph_perancangan` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL DEFAULT 0,
  `id_kelasLengkap` int(11) DEFAULT NULL,
  `id_subjek` int(11) DEFAULT NULL,
  `id_minggu` int(11) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `tarikh` date DEFAULT NULL,
  `id_masa_mula` varchar(50) DEFAULT NULL,
  `id_masa_akhir` varchar(50) DEFAULT NULL,
  `tema` varchar(255) DEFAULT NULL,
  `tajuk` varchar(255) DEFAULT NULL,
  `standardK` varchar(255) DEFAULT NULL,
  `standardP` varchar(255) DEFAULT NULL,
  `aktiviti` text DEFAULT NULL,
  `refleksi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_perancangan`
--

INSERT INTO `rph_perancangan` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `id_minggu`, `hari`, `tarikh`, `id_masa_mula`, `id_masa_akhir`, `tema`, `tajuk`, `standardK`, `standardP`, `aktiviti`, `refleksi`) VALUES
(1, 1, 7, 7, 1, 'AHAD', '2023-03-23', '1', '2', 'INI ADALAH TEMA', 'INI ADALAH GAJIUK', 'INI ADALAH STANDAERD KEMAHIRAN', 'INI ADALAH STANDARD PEMBELAJARAN', 'INI ADALAH AKTIVITI PEMBELAJARAN', 'INI ADALAH REFELKSI');

-- --------------------------------------------------------

--
-- Table structure for table `rph_rancangan`
--

CREATE TABLE `rph_rancangan` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_kelasLengkap` int(11) DEFAULT NULL,
  `id_subjek` int(11) DEFAULT NULL,
  `tarikh` varchar(100) DEFAULT NULL,
  `masa_mula` varchar(100) DEFAULT NULL,
  `masa_tamat` varchar(100) DEFAULT NULL,
  `tema` varchar(255) NOT NULL,
  `tajuk` varchar(255) NOT NULL,
  `standard_kandungan` varchar(255) DEFAULT NULL,
  `standard_pembelajaran` varchar(255) DEFAULT NULL,
  `objektif` text DEFAULT NULL,
  `aktiviti` text DEFAULT NULL,
  `refleksi` varchar(255) NOT NULL,
  `bahan_bantuan` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `changes_date` datetime NOT NULL DEFAULT current_timestamp(),
  `bbm` text DEFAULT NULL,
  `penilai` int(11) NOT NULL,
  `minggu_sekolah` varchar(100) NOT NULL,
  `id_tingkatan` int(11) NOT NULL,
  `status_penilai` int(11) NOT NULL DEFAULT 0,
  `tarikh_penilai` datetime DEFAULT NULL,
  `komen_penilai` text DEFAULT NULL,
  `signature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rph_rancangan`
--

INSERT INTO `rph_rancangan` (`id`, `id_pengguna`, `id_kelasLengkap`, `id_subjek`, `tarikh`, `masa_mula`, `masa_tamat`, `tema`, `tajuk`, `standard_kandungan`, `standard_pembelajaran`, `objektif`, `aktiviti`, `refleksi`, `bahan_bantuan`, `created_date`, `changes_date`, `bbm`, `penilai`, `minggu_sekolah`, `id_tingkatan`, `status_penilai`, `tarikh_penilai`, `komen_penilai`, `signature`) VALUES
(8, 1, 1, 3, '2023-03-31', '11:25', '11:25', 'TEMA 4 : SENI BERSENDIKAN BUDAYA', 'UNIT 10 : KEKEMASAN DIRI', 'MENGENALPASTI', 'N/A', '<p>MEMUPUK PASANGAN SUAMI ISTERI</p>', '<p>TUKANG BADAK</p>', 'PELAJAR PINTAR', '', '2023-04-02 03:23:32', '2023-04-02 03:23:32', '3,4,5,6', 22, '2', 1, 1, NULL, 'Tiada cadangan dari saya, semua lengkap', '[{\"dotSize\":0,\"minWidth\":0.5,\"maxWidth\":2.5,\"penColor\":\"black\",\"points\":[{\"time\":1680922742828,\"x\":99.3203125,\"y\":58.66796875,\"pressure\":0.5},{\"time\":1680922743026,\"x\":99.51171875,\"y\":70.40625,\"pressure\":0.5},{\"time\":1680922743043,\"x\":96.7578125,\"y\":81.390625,\"pressure\":0.5},{\"time\":1680922743060,\"x\":89.06640625,\"y\":92.8828125,\"pressure\":0.5},{\"time\":1680922743079,\"x\":75.5703125,\"y\":102.96484375,\"pressure\":0.5},{\"time\":1680922743095,\"x\":58.1796875,\"y\":108.58203125,\"pressure\":0.5},{\"time\":1680922743124,\"x\":39.625,\"y\":109.80078125,\"pressure\":0.5},{\"time\":1680922743141,\"x\":22.76171875,\"y\":106.58984375,\"pressure\":0.5},{\"time\":1680922743159,\"x\":11.22265625,\"y\":97.140625,\"pressure\":0.5},{\"time\":1680922743176,\"x\":5.171875,\"y\":82.84375,\"pressure\":0.5},{\"time\":1680922743192,\"x\":3.453125,\"y\":67.1171875,\"pressure\":0.5},{\"time\":1680922743208,\"x\":5.4609375,\"y\":52.84765625,\"pressure\":0.5},{\"time\":1680922743224,\"x\":12.546875,\"y\":42.1640625,\"pressure\":0.5},{\"time\":1680922743240,\"x\":25.37109375,\"y\":36.44140625,\"pressure\":0.5},{\"time\":1680922743256,\"x\":41.41796875,\"y\":34.80078125,\"pressure\":0.5},{\"time\":1680922743273,\"x\":59.02734375,\"y\":38.296875,\"pressure\":0.5},{\"time\":1680922743290,\"x\":76.48046875,\"y\":48.12890625,\"pressure\":0.5},{\"time\":1680922743307,\"x\":89.2734375,\"y\":58.21875,\"pressure\":0.5},{\"time\":1680922743323,\"x\":98.5625,\"y\":64.734375,\"pressure\":0.5},{\"time\":1680922743339,\"x\":110.50390625,\"y\":69.41796875,\"pressure\":0.5},{\"time\":1680922743357,\"x\":123.5859375,\"y\":71.30078125,\"pressure\":0.5},{\"time\":1680922743373,\"x\":136.77734375,\"y\":68.29296875,\"pressure\":0.5},{\"time\":1680922743390,\"x\":151.92578125,\"y\":59.01953125,\"pressure\":0.5},{\"time\":1680922743406,\"x\":164.3828125,\"y\":47.9921875,\"pressure\":0.5},{\"time\":1680922743424,\"x\":173.2421875,\"y\":39.3984375,\"pressure\":0.5},{\"time\":1680922743440,\"x\":178.9765625,\"y\":33.7109375,\"pressure\":0.5},{\"time\":1680922743543,\"x\":183.90234375,\"y\":37.1953125,\"pressure\":0.5},{\"time\":1680922743560,\"x\":196.30859375,\"y\":42.6328125,\"pressure\":0.5},{\"time\":1680922743575,\"x\":213.23046875,\"y\":49.16015625,\"pressure\":0.5},{\"time\":1680922743593,\"x\":227.84765625,\"y\":54.3203125,\"pressure\":0.5},{\"time\":1680922743609,\"x\":237.78515625,\"y\":57.51953125,\"pressure\":0.5},{\"time\":1680922743645,\"x\":243.515625,\"y\":62.5625,\"pressure\":0.5},{\"time\":1680922743675,\"x\":239.9375,\"y\":69.18359375,\"pressure\":0.5},{\"time\":1680922743690,\"x\":226.9140625,\"y\":80.03515625,\"pressure\":0.5},{\"time\":1680922743708,\"x\":210.71484375,\"y\":90.71875,\"pressure\":0.5},{\"time\":1680922743724,\"x\":197.89453125,\"y\":98.2109375,\"pressure\":0.5},{\"time\":1680922743741,\"x\":189.625,\"y\":102.28515625,\"pressure\":0.5},{\"time\":1680922743791,\"x\":213.8828125,\"y\":87.0546875,\"pressure\":0.5},{\"time\":1680922743807,\"x\":242.9453125,\"y\":74.02734375,\"pressure\":0.5},{\"time\":1680922743824,\"x\":270.703125,\"y\":63.8046875,\"pressure\":0.5},{\"time\":1680922743841,\"x\":291.296875,\"y\":57.41015625,\"pressure\":0.5},{\"time\":1680922743857,\"x\":302.5546875,\"y\":54.75,\"pressure\":0.5},{\"time\":1680922743874,\"x\":307.625,\"y\":53.7890625,\"pressure\":0.5},{\"time\":1680922743908,\"x\":288.67578125,\"y\":55.44140625,\"pressure\":0.5},{\"time\":1680922743924,\"x\":240.078125,\"y\":59.8828125,\"pressure\":0.5},{\"time\":1680922743940,\"x\":167.171875,\"y\":64.56640625,\"pressure\":0.5},{\"time\":1680922743957,\"x\":114.37890625,\"y\":66.6328125,\"pressure\":0.5},{\"time\":1680922743974,\"x\":86.3046875,\"y\":66.70703125,\"pressure\":0.5},{\"time\":1680922743992,\"x\":65.45703125,\"y\":66.70703125,\"pressure\":0.5},{\"time\":1680922744009,\"x\":58.328125,\"y\":66.6875,\"pressure\":0.5},{\"time\":1680922744041,\"x\":66.21484375,\"y\":63.4609375,\"pressure\":0.5},{\"time\":1680922744058,\"x\":92.0625,\"y\":59.0234375,\"pressure\":0.5},{\"time\":1680922744074,\"x\":125.54296875,\"y\":56.14453125,\"pressure\":0.5},{\"time\":1680922744091,\"x\":152.84765625,\"y\":55.7734375,\"pressure\":0.5},{\"time\":1680922744108,\"x\":174.76171875,\"y\":56.53125,\"pressure\":0.5},{\"time\":1680922744126,\"x\":199.03125,\"y\":72.578125,\"pressure\":0.5},{\"time\":1680922744142,\"x\":200.05078125,\"y\":85.703125,\"pressure\":0.5},{\"time\":1680922744159,\"x\":199.23046875,\"y\":96.3671875,\"pressure\":0.5},{\"time\":1680922744176,\"x\":197.421875,\"y\":103.15625,\"pressure\":0.5},{\"time\":1680922744242,\"x\":200.03125,\"y\":107.59375,\"pressure\":0.5},{\"time\":1680922744279,\"x\":205.453125,\"y\":107.59765625,\"pressure\":0.5},{\"time\":1680922744359,\"x\":205.1875,\"y\":97.49609375,\"pressure\":0.5},{\"time\":1680922744378,\"x\":207.04296875,\"y\":90.8203125,\"pressure\":0.5},{\"time\":1680922744395,\"x\":211.2734375,\"y\":86.12890625,\"pressure\":0.5},{\"time\":1680922744441,\"x\":216.8515625,\"y\":82.68359375,\"pressure\":0.5},{\"time\":1680922744592,\"x\":223.5625,\"y\":84.046875,\"pressure\":0.5},{\"time\":1680922744675,\"x\":221.3828125,\"y\":90.15625,\"pressure\":0.5},{\"time\":1680922744708,\"x\":218.1171875,\"y\":95.296875,\"pressure\":0.5},{\"time\":1680922744745,\"x\":226.640625,\"y\":96.46484375,\"pressure\":0}]}]'),
(19, 1, 35, 25, '2023-04-12', '13:00', '14:30', 'TEMA 1 : PENYELENGGARAAN DAN KESINAMBUNGAN HIDUP', 'BAB 1 : BIODIVERSITI', 'N/A', 'N/A', '<p>N/A</p>', '<p>N/A</p>', 'Tiada', '', '2023-04-07 08:59:30', '2023-04-08 03:29:14', '1,3,5', 11, '1', 2, 0, NULL, '', NULL),
(20, 1, 35, 25, '2023-04-12', '13:00', '14:30', 'TEMA 1 : PENYELENGGARAAN DAN KESINAMBUNGAN HIDUP', 'BAB 1 : BIODIVERSITI', 'Cecair Kimia', 'N/A', '<p>N/A</p>', '<p>N/A</p>', 'Tiada', '', '2023-04-07 09:00:48', '2023-04-07 09:12:56', '', 5, '1', 2, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rph_subjek`
--

CREATE TABLE `rph_subjek` (
  `id` int(11) NOT NULL,
  `subjek` varchar(50) NOT NULL DEFAULT '0',
  `ringkasan` varchar(50) NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rph_subjek`
--

INSERT INTO `rph_subjek` (`id`, `subjek`, `ringkasan`, `id_status`) VALUES
(1, 'BAHASA ARAB', 'BA', 1),
(2, 'BAHASA MELAYU', 'BM', 1),
(3, 'BAHASA INGGERIS', 'BI', 1),
(4, 'PENDIDIKAN AGAMA ISLAM', 'PAI', 1),
(5, 'PENDIDIKAN MORAL', 'PM', 1),
(6, 'MATEMATIK', 'MT', 1),
(7, 'SAINS', 'SN', 1),
(8, 'SEJARAH', 'GEOGRAFI', 1),
(9, 'GEOGRAFI', 'GEO', 1),
(10, 'REKABENTUK DAN TEKNOLOGI', 'RBT', 1),
(11, 'PENDIDIKAN JASMANI', 'PJ', 1),
(12, 'PENDIDIKAN KESIHATAN', 'PK', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rumah_sukan`
--

CREATE TABLE `rumah_sukan` (
  `id` int(11) NOT NULL,
  `id_kokurikulum` int(11) NOT NULL DEFAULT 1,
  `jenis_rumah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rumah_sukan`
--

INSERT INTO `rumah_sukan` (`id`, `id_kokurikulum`, `jenis_rumah`, `id_status`) VALUES
(1, 4, 'BENDAHARA', 1),
(2, 4, 'LAKSAMANA', 1),
(3, 4, 'SHAHBANDAR', 1),
(4, 4, 'TEMENGGUNG', 1),
(100, 0, 'SILA KEMASKINI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `id` int(11) NOT NULL,
  `jenis_sesi` varchar(255) NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`id`, `jenis_sesi`, `id_status`) VALUES
(1, '2021', 2),
(2, '2022', 2),
(3, '2023', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `jenis_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `jenis_status`) VALUES
(1, 'AKTIF'),
(2, 'TIDAK AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `sukan_daftar_nama_kejohanan`
--

CREATE TABLE `sukan_daftar_nama_kejohanan` (
  `id` int(11) NOT NULL,
  `tajuk` varchar(255) NOT NULL DEFAULT '0',
  `sesi` varchar(255) NOT NULL DEFAULT '0',
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sukan_daftar_nama_kejohanan`
--

INSERT INTO `sukan_daftar_nama_kejohanan` (`id`, `tajuk`, `sesi`, `id_status`) VALUES
(1, 'KEJOHANAN BALAPAN DAN PADANG SMK NAKA KALI KE 32', '3', 1),
(2, 'KEJOHANAN BALAPAN DAN PADANG SMK NAKA KALI KE 18', '2', 1),
(3, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 20211', '1', 1),
(4, 'Pertandingan Mencipta Logo1', '2', 1),
(5, 'maafkan didi,ibu', '3', 1),
(6, 'PERTANDINGAN LOMPAT TALI BERPRESTASI TINGGI PERINGKAT NEGERI KEDAH 2021', '3', 1),
(7, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(8, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(9, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(10, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(11, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(12, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '1', 1),
(13, 'MESYUARAT JAWATANKUASA KURIKULUM KALI KE DUA 2021', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sukan_permainan`
--

CREATE TABLE `sukan_permainan` (
  `id` int(11) NOT NULL,
  `id_kokurikulum` int(11) NOT NULL DEFAULT 2,
  `jenis_sukanP` varchar(255) NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sukan_permainan`
--

INSERT INTO `sukan_permainan` (`id`, `id_kokurikulum`, `jenis_sukanP`, `id_status`) VALUES
(1, 2, 'BADMINTON', 1),
(2, 2, 'BASIKAL', 1),
(3, 2, 'BOLA BALING', 1),
(4, 2, 'BOLA JARING', 1),
(5, 2, 'BOLA SEPAK', 1),
(6, 2, 'BOLA TAMPAR', 1),
(7, 2, 'BOLING TENPIN', 1),
(8, 2, 'CATUR', 1),
(9, 2, 'FUTSAL', 1),
(10, 2, 'LOMPAT TALI', 1),
(11, 2, 'OLAHRAGA', 1),
(12, 2, 'PETANGQUE', 1),
(13, 2, 'PING PONG', 1),
(14, 2, 'SEPAK TAKRAW', 1),
(100, 0, 'SILA KEMASKINI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bbm`
--

CREATE TABLE `tb_bbm` (
  `id` int(11) NOT NULL,
  `barang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_bbm`
--

INSERT INTO `tb_bbm` (`id`, `barang`) VALUES
(1, 'PENCIL'),
(2, 'PEMBARIS'),
(3, 'PEMADAM PAPAN HITAM'),
(4, 'KERATAS MEWARNA'),
(5, 'PROJECTOR SCREEN'),
(6, 'KERTAS GRID');

-- --------------------------------------------------------

--
-- Table structure for table `tb_minitcurai`
--

CREATE TABLE `tb_minitcurai` (
  `id` int(11) NOT NULL,
  `tajuk` varchar(255) NOT NULL,
  `tarikh` date NOT NULL,
  `masa` time NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `pegawai` varchar(255) NOT NULL,
  `kandungan` text NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_minitcurai`
--

INSERT INTO `tb_minitcurai` (`id`, `tajuk`, `tarikh`, `masa`, `tempat`, `pegawai`, `kandungan`, `id_pengguna`) VALUES
(1, 'TAKLIMAT PROGRAM DUTA GURU (PDG)', '2022-02-23', '10:00:00', 'TEMPAT BERTUGAS MASING-MASING', 'TENGKU NORAIDA BINTI TENGKU MAHMOOD - (YAYASAN PETRONAS) , TAKLIMAT DARI DR. LAY AH NAM - (PUSAT STEM NEGARA) ', '<p><strong>TAKLIMAT DARI TENGKU NORAIDA BINTI TENGKU MAHMOOD - (YAYASAN PETRONAS)&nbsp;</strong><br />\r\n- Tujuan PDG - Memperkasakan guru sebagai pendidik cemerlang bagi menyumbang kepada kualiti pendidikan&nbsp;<br />\r\n- Program ini sudah memasuki tahun ke-3 melibatkan kerjasama KPM dengan Petronas dan Pusat STEM Negara.&nbsp;<br />\r\n- Kohort 3 - peserta 314 orang yang merangkumi 133 PPD seluruh negara.&nbsp;<br />\r\n- Perlaksanaan pada masa cuti persekolahan dan tidak mengganggu sesi persekolahan.&nbsp;<br />\r\n- Hasil kajian tindakan akan digunakan untuk membantu sekolah dalam meningkatkan bidang STEM&nbsp;<br />\r\n- Mohon sokongan secara berterusan dari guru-guru dan pengetua sekolah untuk mencapai sasaran 4,500 guru pada tahun 2030.&nbsp;<br />\r\n- Memperkukuhkan pendidikan STEM di kalangan pelajar dalam tempoh 2 tahun.&nbsp;<br />\r\n- Duta Guru akan bertindak sebagai Duta STEM dan Duta KBAT di sekolah masing-masing.&nbsp;</p>\r\n\r\n<p><strong>TAKLIMAT DARI DR. LAY AH NAM - (PUSAT STEM NEGARA)&nbsp;</strong><br />\r\n- Menekan Pendidikan STEM Bersepadu di sekolah.&nbsp;<br />\r\n- Pendidikan STEM&nbsp;<br />\r\n- Elemen merentas kurikulum yang boleh diapplikasikan dalam semua mata pelajaran secara lansung atau tidak langsung.&nbsp;<br />\r\n- Menekan pembelajaran yang berkaitan dengan teknologi agar pelajar faham serta mampu untuk mengapplikasikan dalam kehidupan seharian.&nbsp;<br />\r\n- Mengajar teknologi secara implisit kepada pelajar di mana pada peringkat awalnya mengguna dan seterusnya membudayakan teknologi berkenaan.&nbsp;<br />\r\n- Menerapkan disiplin-disiplin dalam STEM kepada pelajar agar mereka dapat menyelesaikan masalah kehidupan seharian mereka. - Pendidikan STEM juga mampu untuk memupuk kemahiran dan karektor pelajar dalam menghadapi cabaran pekerjaan pada masa akan datang.&nbsp;<br />\r\n- Memantapkan pelajar dalam menghadapi era abad 21 serta menyumbang rakyat celik STEM.&nbsp;<br />\r\n- RBT adalah merupakan mata pelajaran yang penting dalam STEM selain mata pelajaran yang melibatkan Matematik dan Sains.&nbsp;<br />\r\n- Duta Guru akan dilatih agar mereka dapat membantu sekolah dalam menghasilkan pelajar-pelajar yang celik STEM.</p>\r\n', 63),
(2, 'Mesyuarat penataran pentaksiran alternatif sekolah menengah (pasm) mulai tahun 2021', '2022-02-13', '08:30:00', 'Pautan Webex Cisco', 'Pegawai KPM Pegawai LPM PK Pentadbiran PK PPKI Suzana binti Harun', '<p>1. Amanat Timbalan Pengarah Peperiksaan Kanan LPM</p>\r\n\r\n<p>2. Dasar PASM</p>\r\n\r\n<p>3. Konsep dan Instrumen PASM</p>\r\n\r\n<p>4. Pengoperasian PASM</p>\r\n\r\n<p>5. Aplikasi MyPASM</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mesyuarat ini berakhir pada jam 12.30</p>\r\n', 94),
(5, 'Bengkel TOT Pengurangan Kesan Plastik pada Alam Sekitar Melalui 5R', '2022-03-28', '15:39:00', 'Raia Hotel, Alor Setar', '1. Salmah binti Ali  2. Nik Amrul Faaizol bin Nik Yusuf', '<p>1. Pengenalan Sisa Pepejal / sisa baki / sisa pukal</p>\r\n\r\n<p>2. Modul 5R ( refuse, reduce, reuse, recycle, recover)</p>\r\n\r\n<p>3. LPIE5R -&nbsp; tiga aktiviti untuk dilaksanakan</p>\r\n\r\n<p>a. Pendedahan modul kepada murid</p>\r\n\r\n<p>b. Jualan balik bahan kitar semula (deal bersama E-idaman</p>\r\n\r\n<p>c. Cabaran inovasi</p>\r\n\r\n<p>4. Design Thinking - cabaran inovasi dan penyertaan semasa jelajah 5R ( julai 2022)</p>\r\n', 82),
(6, 'SEKOLAH LESTARI ANUGERAH ALAM SEKITAR (SLAAS)', '2022-03-27', '14:30:00', 'PAUTAN : https://meet.google.com/jvf-ettr-jii', 'HASNIZAM BIN ZAKARIA', '<p>Mesyuarat sekolah lestari anugerah alam sekitar sebanyak rm10000 kepada sekolah yang menang.</p>\r\n\r\n<p>tugasan :Menyiapkan laporan aktiviti -aktiviti sekolah berkaitan alam sekitar yang pernah dilakukan . Markah extra diberikan kepada aktiviti berkonsep inovasi</p>\r\n\r\nTarikh tutup : 31 Mei 2022', 78),
(7, 'TAKLIMAT KETUA PENDIDIKAN ISLAM MENENGAH DAN GURU KANAN DINI (SABK)DAERAH PADANG TERAP 2022', '2022-03-28', '14:30:00', 'PPD PADANG TERAP', 'EN NAZERI BIN MOHAMAD', '<p>1.KUNJUNG BANTU BERSEPADU (SPI-PPD)</p>\r\n\r\n<p>-Kekerapan:3 kali setahun(penetapan sasaran/AR2/AR3</p>\r\n\r\n<p>-Bahan:Penyediaan tapak dialog ketika proses kunjung bantu(diisi oleh semua sekolah)</p>\r\n\r\n<p>-Peserta:KPPK/KPP,Timbalan PPD SPb, SISC+,Penolong PPD Pend Islam,Pengetua/PKP /GK/KP/GPI TING 5,Semua GPI Kali pertama</p>\r\n\r\n<p>-Pemilihan sekolah fokus adalah daripada PPD dengan justifikasi masing-masing</p>\r\n\r\n<p>2.KPI KPPM DARI BPI</p>\r\n\r\n<p>-peratus pencapaian murid tahun 6 dan menengah menguasai amali solat -100%</p>\r\n\r\n<p>-guna intrumen PAFA&nbsp;</p>\r\n\r\n<p>-tinjaun melalui Google Form (menguasai/tidak menguasai) di kalangan murid mengengah</p>\r\n\r\n<p>-makluman kpd Ketua Panitia dalam perjumpaan/taklimat kali pertama bagi sesi 2022 peringkat daerah.</p>\r\n\r\n<p>3.HALAQAH ILMU KEDAH 2022</p>\r\n\r\n<p>-10 siri bg sepanjang tahun</p>\r\n\r\n<p>-kerjasama spi-upi bg setiap siri</p>\r\n\r\n<p>- cadangan pengisian (kssm p.i -jinayah,istilah),pbd-penjaminan kualiti,analisis item,format baharu kssm,town hall kppk gpi.</p>\r\n\r\n<p>4.JURULATIH UTAMA PENDIDIKAN ISLAM DAERAH</p>\r\n\r\n<p>-senarai JU p.i peringkat daerah-hantar kpd spi</p>\r\n\r\n<p>-aktiviti pemerkasaan JUD bg mata pelajaran p.islam-bengkel penandaan kertas 1 KKSM Pend Islam SPM</p>\r\n\r\n<p>-penggunaan JUD dlm aktiviti peningkatan prestasi di peringkat negeri</p>\r\n\r\n<p>6.UJIAN TILAWAH,HAFAZAN AL-QURAN DAN HADIS (UTQH)</p>\r\n\r\n<p>-Aktiviti pemantapan bermula seawal ting 1</p>\r\n\r\n<p>-tinjauan penguasaan al-quran terhadap murid ting 1</p>\r\n\r\n<p>-perancangan jangka panjang(ting 1-3) bg meningkatkan penguasaan Al-Quran di peringkat sekolah</p>\r\n\r\n<p>7.ANALISIS ITEM</p>\r\n\r\n<p>-diteruskan bg tahun 2022</p>\r\n\r\n<p>-borang analisis item akan ditambahbaik sesuai dengan format soalan</p>\r\n\r\n<p>-penggunaan dapatan analisis item untuk kunjung bantu ke sekolah</p>\r\n\r\n<p>8.MERANCANG UNTUK MEMBUAT ARROWS MASTER MACROS EXPEND UNTUK SUBJEK PEND ISLAM</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 28),
(8, 'BENGKEL PEMANTAPAN CEFR DAN PBD BAHASA INGGERIS SIRI 1 TAHUN 2022', '2022-03-28', '08:30:00', 'Bilik Seminar 1, PPD PADANG TERAP', 'TN. HJ. SOLAHUDDIN BIN MAHMUD', '<ol>\r\n	<li><a name=\"_Hlk99534547\"> Perbincangan dan perkongsian pendapat berkaitan Understanding of CEFR.</a></li>\r\n	<li>Pembugaran semula Kurikilum Bahasa Inggeris yang dijajarkan&nbsp; kepada CEFR.</li>\r\n	<li>Pengaplikasian KSSM Bahasa Inggeris&nbsp; yang dijajarkan kepada CEFR dan PdPc&nbsp; dan pelaksanaan PBD.</li>\r\n	<li>Perbengkelan berfokus kepada Bahasa Inggeris Tingkatan 4 menggunakan Scheme of Work (SOW), Buku Teks Full Blast! Plus 4 dan DSKP Tingkatan 4.</li>\r\n	<li>Pemakluman pemantauan guru-guru Bahasa Inggeris Tingkatan 4&nbsp; yang akan dijalankan pada bulan Mei 2022 yang melibatkan 5 buah sekolah dalam Daerah Padang Terap. SMK Naka adalah salah sebuah sekolah yang terlibat.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n', 61),
(9, 'The Technical Briefing to Padang Terap English Teachers 2022', '2022-04-06', '11:13:00', 'PPDPTerap', 'Muhamad Hasan bin Hasmali', '<p>Taklimat dan Perbincangan berkenaan pertantingan ko akademik sekolah-sekolah di Daerah Padang Terap</p>\r\n', 95),
(10, 'The Technical Briefing to Padang Terap English Teachers 2022', '2022-04-07', '11:00:00', 'Bilik Seminar, PPD Padang Terap', 'En Muhamad Hasan bin Hasmali', '<ul>\r\n	<li>Penerangan tentang aktiviti-aktiviti dan pertandingan-pertandingan dalam bidang Ko-Akademik Bahasa Inggeris.&nbsp;</li>\r\n	<li>Contoh penyertaan yang baik untuk melayakkan peserta ke peringkat yang lebih tinggi.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>1. Drama Competition</strong></em></p>\r\n\r\n<p>- Tiada tema yang ditetapkan / tema bebas.</p>\r\n\r\n<p>- Perbincangan tentang jalan cerita drama yang baik dan jenis drama yang patut dielakkan.</p>\r\n\r\n<p>- Penerangan tentang <em>do&#39;s and don&#39;ts</em> untuk pertandingan drama.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>2. Debate</strong></em></p>\r\n\r\n<p><strong>- </strong>Sedikit perubahan dan pertukaran daripada<em> contenful debate</em> ke <em>principle debate.&nbsp;</em></p>\r\n\r\n<p><em>- </em>Meletakkan keupayaan peserta untuk memahami <em>motion</em> dan mempunyai <em>premise</em> yang kukuh.&nbsp;</p>\r\n\r\n<p>- Penerangan tentang <em>do&#39;s and don&#39;ts</em> untuk pertandingan debate.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>3. English Carnival dan Scrabble.</strong></em></p>\r\n\r\n<p>- Bertanding secara individu = Storytelling &amp; Public Speaking.</p>\r\n\r\n<p>- Bertanding secara berpasangan = Poetry Recitation &amp; Scrabble.</p>\r\n\r\n<p>- Penerangan tentang <em>do&#39;s and don&#39;ts</em> untuk pertandingan yang dijalankan ketika English Carnival.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. Pertandingan-pertandingan dan aktiviti lain yang akan dianjurkan dalam bidang Ko-Akademik Bahasa Inggeris.&nbsp;</strong></p>\r\n\r\n<p>- Dare to Spell</p>\r\n\r\n<p>- English Cyberspace Challenge</p>\r\n\r\n<p>- The Young Author Awards.</p>\r\n\r\n<p>- The National English-in-Camp</p>\r\n\r\n<p>- Bengkel-bengkel pertandingan yang terpilih.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 88),
(11, 'BENGKEL UJIAN STANDARD KECERGASAN FIZIKAL KEBANGSAAN UNTUK MURID SEKOLAH MALAYSIA (SEGAK) TAHUN 2022 ', '2022-04-07', '10:30:00', 'BILIK SEMINAR 1,PPD PADANG TERAP', 'PN HASLINDA BINTI MOHAMED YUSOF', '<p>1.KETUA PANITIA PERLU DILANTIK DIKALANGAN GURU OPSYEN YANG PALING LAMA.</p>\r\n\r\n<p>2.PJ PERLU DILAKSANAKAN SEBELUM REHAT.</p>\r\n\r\n<p>3.PJPK UNTUK SETIAP KELAS PERLU GURU YANG SAMA.</p>\r\n\r\n<p>4.GURU OPSYEN PERLU MINIMA 14 WAKTU SUBJEK OPSYEN.</p>\r\n\r\n<p>5.PJ SEHARI 1 WAKTU (30 MINIT)</p>\r\n', 54),
(12, 'BENGKEL PENDAFTARAN AHLI BADAN BERUNIFORM PERGERAKAN PUTERI ISLAM MALAYSIA (PPIM) DAERAH PADANG TERAP BAGI SESI 2022-2023', '2022-04-11', '08:00:00', 'Bilik Seminar 1, PPD Padang Terap.', 'En. Khairil Hazaimi bin Md, Akhir, Penolong Pembangunan Bakat Murid Kokurikulum PPD Padang Terap', '<p>1. Ucapan alu-aluan oleh En. Hazaimi kepada semua guru pemimpin yang hadir bagi Bengkel Pendaftaran Online. En. Hazaimi meminta guru pemimpin menghantar rumusan gred bagi PAJSK Tahun 2021/2022 sebelum atau pada 18/4/2022</p>\r\n\r\n<p>2. Pn. Izzah dari SKTARP meminta guru pemimpin menaip http://www.puteri-islam.org.my/ bagi membuka Sistem Pendaftaran Online.</p>\r\n\r\n<p>3. Pn. Izzah membimbing guru pemimpin untuk mengisi maklumat pendaftaran, pendaftaran keahlian, pembayaran yuran.</p>\r\n', 32),
(13, 'BENGKEL BACK TO BASIC PENDIDIKAN ISLAM SPM TAHUN 2022', '2022-04-18', '10:00:00', 'PPD PADANG TERAP', 'EN NAZERI BIN MOHAMAD', '<p>BACK TO THE BASIC ini diadakan untuk memberi pendedahan awal kpd murid tingkatan lima tentang teknik menjawab kertas p.i spm.Selain teknik menjawab sebenar yg akn diadakan nanti(mengikut perancangan panitia sek masing2).Program bimbingan ini juga diharap dapat memberi motivasi kepada murid2 untuk belajar dengan lebih berfokus dan berkesan.</p>\r\n\r\n<p>-program ini diadakan sebagai langkah awal kpd para murid bagi</p>\r\n\r\n<p>1)Memahami content p.islam spm kssm</p>\r\n\r\n<p>2)Mengetahui bentuk soalan yang bakal ditempuh dalam spm</p>\r\n\r\n<p>3)Memudahkan para murid mengikuti sesi pdpc sebelum peperiksaan spm sebenar bermula</p>\r\n\r\n<p>OBJEKTIF</p>\r\n\r\n<p>1.Meningkat kan pemahaman dan penguasaan murid2 agar lebih cakna terhadap mata pelajaran p.islam</p>\r\n\r\n<p>2.Mengubah persepsi mereka untuk tidak menganggap p.islam sebagai matapelajaran yang sukar untuk dipelajari dan dikuasai.</p>\r\n\r\n<p>3.Meningkatkan peratus lulus murid</p>\r\n', 28),
(14, 'The Technical Briefing of Virtual Scrabble & The Online English Debate to The Kedah District Technical Officers 2022', '2022-04-24', '09:00:00', 'Dewan Permata Minda, PPD Kota Setar', 'En Muhamad Hasan bin Hasmali', '<ul>\r\n	<li>Memperkenalkan barisan Technical Officers untuk Virtual Scrabble dan English Debate 2022</li>\r\n	<li>Memberikan penerangan tentang tatacara bagaimana cara dan kaedah yang harus dilakukan oleh semua District Technical Officers dalam menjayakan kedua-dua pertandingan secara atas talian/online di daerah masing-masing.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><strong>The English Debate</strong></li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>State Technical Officers memberi penerangan secara terperinci tentang\r\n	<ul>\r\n		<li><strong>Suggested method</strong>&nbsp;</li>\r\n		<li><strong>Applications used</strong>&nbsp;</li>\r\n		<li><strong>Judges scoring documentation system</strong>&nbsp;</li>\r\n		<li><strong>Competition steps</strong>&nbsp;</li>\r\n		<li><strong>Requirements to the contestants and teachers-in-charge</strong></li>\r\n		<li><strong>Ways to improve last year&#39;s implementation</strong></li>\r\n		<li>&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li>Perubahan tarikh:\r\n	<ul>\r\n		<li><strong>District level: by 16 June 2022</strong></li>\r\n		<li><strong>State level: 28 - 30 June 2022</strong></li>\r\n		<li>&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li>Perbincangan untuk menghasilkan Motions untuk pertandingan di tahun 2022 di antara <strong>State Technical Officers</strong> dan <strong>District Technical Officers</strong></li>\r\n</ul>\r\n', 73),
(15, 'TAKLIMAT PENGURUSAN KAUNSELING DAERAH PADANG TERAP BIL 1/2022', '2022-04-24', '10:30:00', 'DEWAN SEMINAR 1 PPD PT', 'ENCIK MUHAMMAD FAZLI BIN ABU BAKAR (JPN)', '<p>1. Sistem SePKM</p>\r\n\r\n<p>Ada penambahbaikan sistem. Guru Besar/Pengetua akan semak dan sahkan rekod perkhidmatan kaunseling Guru Bimbingan dan Kaunseling (GBKSM) secara online. Username dan katalaluan diberikan oleh JPN.</p>\r\n\r\n<p>2. Program Minda Sihat dalam kebiasaan baharu tahun 2022.Â </p>\r\n\r\n<p>- Penarafan Laman Minda Sihat</p>\r\n\r\n<p>- Program Intervensi Minda Sihat (PRISMA)</p>\r\n\r\n<p>- Kit Minda Sihat</p>\r\n\r\n- Saringan Minda Sihat perlu dilaksanakan kepada semua murid sekolah menengah sama ada secara online atau offline.\r\n\r\n<p>3. Maklumat jejak SPM 2021</p>\r\n\r\n<p>Guru Bimbingan dan Kaunseling diminta mengisi maklumat murid lepasan SPM dalam SePKM selepas mereka dapat tawaran UPU.</p>\r\n', 84),
(16, 'MESYUARAT SEKRETARIAT TUNAS KADET REMAJA SEKOLAH (TKRS)/KADET REMAJA SEKOLAH (KRS) DAERAH PADANG TERAP BIL.1/2022', '2022-05-11', '14:30:00', 'BILIK MESYUARRAT , PPD PADANG TERAP', 'SU CHIN A/P PIAN DAN HAZITA BINTI KAMIS', '<p>PERANCANGAN</p>\r\n\r\n<p>1. KURSUS LETENAN MUDA</p>\r\n\r\n<p>13/6/2022 - PPD</p>\r\n\r\n<p>14/6/2022-PKDPT</p>\r\n\r\n<p>2. KURSUS LANJUTAN LEFTENAN MUDA</p>\r\n\r\n<p>15/6/2022 - PKDPT</p>\r\n\r\n<p>3. PENTAULIAHAN DI SK TANDOP BESAR</p>\r\n\r\n<p>22/6/2022</p>\r\n\r\n<p>4. KURSUS KENAIKAN PANGKAT DI PKDPT</p>\r\n\r\n<p>SARJAN - 3,4, DAN 5 /OGOS 2022</p>\r\n\r\n<p>KOPERAL - 10 DAN 11/ OGOS 2022</p>\r\n\r\n<p>&nbsp;</p>\r\n', 91),
(18, 'MESYUARAT PENTAULIAHAN KOMANDAN DAN TIMBALAN KOMANDAN KRS DAERAH PADANG TERAP ', '2022-06-30', '11:00:00', 'SK KG BELUKAR ', '1. SU CHIN A/P PIAN 2. HAZITA BINTI KAMIS ', '<p>1. Aluan&nbsp;</p>\r\n\r\n<p>2. Perbincangan tentatif program.</p>\r\n\r\n<p>3. Cadangan 3/8/2022</p>\r\n\r\n<p>4. PkKo kurikulum akan dipanggil untuk diberi taklimat awal. Iaitu cadangan pada 5/7/2022.</p>\r\n\r\n<p>5. Pegawai yang terlibat ialah semua pengurusan sekolah.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 91),
(19, 'TAKLIMAT PENYELARASAN MESYUARAT PANITIA DAERAH PADANG TERAP TAHUN 2022', '2022-07-05', '14:00:00', 'BILIK MESYUARAT PEJABAT PPD PADANG TERAP', 'PN ROPIAH BINTI JAAFAR', '<p>Makluman berkaitan&nbsp;</p>\r\n\r\n<p>1. Modul Soalan Peperiksaan Bersama Pertengahan Tahun Ting 4 dan Ting 5 - peperiksaan akan berlangsung pada Ogos 2022.Semua sekolah diminta menyediakan soalan secara bersama mengikut aras yang ditentukan hasil perbincangan dalam mesyuarat panitia.</p>\r\n\r\n<p>2.Setelah selesai peperiksaan tersebut Panitia Daerah akan mengadakan Dialog Prestasi&nbsp; bagi mendapatkan keputusan secara bandingan antara sekolah yang terlibat.&nbsp;</p>\r\n\r\n<p>3. Aktiviti Panitia yang kedua - Bengkel Memeriksa kertas bagi guru yang mengajar Menengah Atas Pemeriksa Lembaga Peperiksaan diminta untuk membimbing guru-guru yang mengajar menengah atas dan bengkel ini dilakukan secara tertutup.Teknik menda kertas bolehlah menggunakan soalan Peperiksaan bersama terutamanya bagi Tingkatan 5.</p>\r\n\r\n<p>4.Aktiviti Panitia yang ketiga - Bank Item / Modul Berfokus -soalan yang dikumpulkan itu mengikut Aras (Tinggi, Sederhana,Mudah). Soalan akan diberikan kepada pelajar mengikut kumpulan pelajar- kumpulan cemerlang, sederhana dan galus.</p>\r\n\r\n<p>5. Akhir sekali guru Sejarah diminta menggunakan buku teks dan berpandukan DSKP. Guru wajib menggunakan latihan dudalam buku teks terutama bagi pelajar yang berada di kelas belakang.</p>\r\n\r\n<p>6.Pn Ropiah(Pengerusi) taklimat tersebut menegaskan bahawa pihak pengurusan akan mengendalikan mesyuarat tersebut dan KP akan menjadi SU Panitia daerah.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 90),
(20, 'bengkel penggunaan modul latihan kelab kitar semula peringkat negeri kedah', '2022-08-01', '08:00:00', 'dewan permata minda, ppd kota setar', 'pn azhana (swcorp)', '<p>1. taklimat 3R ( reduse, reused, recycle )</p>\r\n\r\n<p>2. taklimat berkaitan modul</p>\r\n\r\n<p>&nbsp;</p>\r\n', 78),
(21, 'MESYUARAT PELARASAN KOR KADET POLIS DAERAH PADANG TERAP', '2022-08-09', '11:00:00', 'PPD PADANG TERAP', 'KHAIRIL HAZAMI BIN MD AKHIR', '<p>1. Ucapan Pengerusi<br />\r\n2. Laporan dari PT kadet Polis<br />\r\n3. Perancangan Aktiviti kadet Polis<br />\r\n- Perkhemahan<br />\r\n- Aktiviti/program anjuran setiap sekolah<br />\r\n4. Lain-lain hal<br />\r\n5. Penutup</p>\r\n', 1),
(22, 'TAKLIMAT MAXIS EKELAS HIGHLY IMMERSIVE PROGRAM (HIP) ', '2022-08-15', '09:00:00', 'SMK LUBUK MERBAU', 'MAXIS STAFF', '<p>1. Guru-guru diberikan info awal melalui tayangan video dari pihak Maxis tentang eKelas.</p>\r\n\r\n<p>2. Guru-guru dimaklumkan bahawa eKelas adalah aktiviti outreach di bawah inisiatif Kementerian Pendidikan Malaysia, HIP (No. Rujukan Pekeliling KPM.600-12/1/4 Jld.29(6)</p>\r\n\r\n<p>3. Pihak Maxis menyatakan eKelas adalah program tanggungjawab sosial utama mereka yang menyediakan pembelajaran digital luar sekolah secara percuma. Usaha ini adalah untuk membantu meningkatkan prestasi akademik terutamanya murid luar bandar.</p>\r\n\r\n<p>4. Pihak Maxis juga memaklumkan eKelas menekankan pembelajaran digital dengan kaedah yang menyeronokkan serta menyediakan akses kepada kandungann pendidikan berkualiti yang selaras dengan sukatan pelajaran kebangsaan.</p>\r\n\r\n<p>5. Seterusnya pihak Maxis menyatakan satu Pertandingan HIP eKelas diadakan pada tahun ini yang terdiri daripada 2 kategori seperti di bawah:</p>\r\n\r\n<p>a. Pertandingan Pengucapan Awam</p>\r\n\r\n<ol>\r\n	<li>Bercerita</li>\r\n	<li>Sajak</li>\r\n	<li>Public Speaking</li>\r\n</ol>\r\n\r\n<p>b. Pertandingan Menulis Esei</p>\r\n\r\n<p>-HIP&nbsp;Storyfest Competition ini bermula dari 30 May 2022 hingga 31 Ogos 2022.</p>\r\n\r\n<p>6. Guru-guru juga dikehendaki memberi maklumbalas kepada beberapa soalan berkaitan eKelas melalui link yang diberikan.</p>\r\n\r\n<p>7. Pada sesi penutup guru-guru mengisi borang online soalselidik berkaitan taklimat Maxis eKelas HIP Storyfest Competition. Guru-guru juga dianjurkan menyertai Telegram CikguHub supaya dapat mengikuti perkembangan aktiviti dan pertandingan eKelas HIP.</p>\r\n', 61),
(23, 'Taklimat pengurusan ujian utqh kpd ketua pentaksir sekolah', '2022-10-03', '08:00:00', 'Smka sik', 'Mohd tarmizi bin che mat', '<p>Tarikh muat Turun instrument : 3-5 okt 2022</p>\r\n\r\n<p>Tarikh ujian : 11 okt hingga 4 Nov 2022</p>\r\n\r\n<p>Tarikh kemasukan skor calon : 1-31 dis 2022</p>\r\n\r\n<p>Tatacara pengurusan adalah seperti dalam buku manual pengoperasian pentaksiran pusat Dan buku format pentaksiran yang dibekalkan melalui telegram.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 47);

-- --------------------------------------------------------

--
-- Table structure for table `tb_opr`
--

CREATE TABLE `tb_opr` (
  `id` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `tarikh` date NOT NULL,
  `program` varchar(255) NOT NULL,
  `personalia` varchar(255) NOT NULL,
  `kumpulan` varchar(255) NOT NULL,
  `objektif` text NOT NULL,
  `impak` text NOT NULL,
  `isu` text NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `gambar1` text NOT NULL,
  `gambar2` text NOT NULL,
  `gambar3` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_opr`
--

INSERT INTO `tb_opr` (`id`, `unit`, `tarikh`, `program`, `personalia`, `kumpulan`, `objektif`, `impak`, `isu`, `nama_guru`, `id_pengguna`, `gambar1`, `gambar2`, `gambar3`) VALUES
(1, 'aa', '2023-02-19', 'bbbb', 'cccc', 'ddd', 'eee', 'ffff', 'gggg', 'hhh', 1, '123', '123', '123'),
(2, 'bb', '2023-02-20', 'xxxxx', 'dddddd', 'nnnnnnn', 'mmmmm', 'ssssss', 'hhhhh', 'mmmmmm', 35, '222233', '55556', '222244');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subjek`
--

CREATE TABLE `tb_subjek` (
  `id` int(11) NOT NULL,
  `id_tingkatan` int(11) NOT NULL DEFAULT 0,
  `subjek` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_subjek`
--

INSERT INTO `tb_subjek` (`id`, `id_tingkatan`, `subjek`) VALUES
(1, 1, 'BAHASA ARAB'),
(2, 1, 'BAHASA INGGERIS'),
(3, 1, 'BAHASA MELAYU'),
(4, 1, 'GEOGRAFI'),
(5, 1, 'MATEMATIK'),
(6, 1, 'PENDIDIKAN ISLAM'),
(7, 1, 'PENDIDIKAN JASMANI'),
(8, 1, 'PENDIDIKAN KESIHATAN'),
(9, 1, 'PENDIDIKAN MORAL'),
(10, 1, 'PENDIDIKAN SENI VISUAL'),
(11, 1, 'REKABENTUK & TEKNOLOGI'),
(12, 1, 'SAINS'),
(13, 1, 'SEJARAH'),
(14, 2, 'BAHASA ARAB'),
(15, 2, 'BAHASA INGGERIS'),
(16, 2, 'BAHASA MELAYU'),
(17, 2, 'GEOGRAFI'),
(18, 2, 'MATEMATIK'),
(19, 2, 'PENDIDIKAN ISLAM'),
(20, 2, 'PENDIDIKAN JASMANI'),
(21, 2, 'PENDIDIKAN KESIHATAN'),
(22, 2, 'PENDIDIKAN MORAL'),
(23, 2, 'PENDIDIKAN SENI VISUAL'),
(24, 2, 'REKABENTUK & TEKNOLOGI'),
(25, 2, 'SAINS'),
(26, 2, 'SEJARAH'),
(27, 3, 'BAHASA ARAB'),
(28, 3, 'BAHASA INGGERIS'),
(29, 3, 'BAHASA MELAYU'),
(30, 3, 'GEOGRAFI'),
(31, 3, 'MATEMATIK'),
(32, 3, 'PENDIDIKAN ISLAM'),
(33, 3, 'PENDIDIKAN JASMANI'),
(34, 3, 'PENDIDIKAN KESIHATAN'),
(35, 3, 'PENDIDIKAN MORAL'),
(36, 3, 'PENDIDIKAN SENI VISUAL'),
(37, 3, 'REKABENTUK & TEKNOLOGI'),
(38, 3, 'SAINS'),
(39, 3, 'SEJARAH'),
(40, 4, 'BAHASA INGGERIS'),
(41, 4, 'BAHASA MELAYU'),
(42, 4, 'FIZIK'),
(43, 4, 'KIMIA'),
(44, 4, 'MATEMATIK'),
(45, 4, 'MATEMATIK TAMBAHAN'),
(46, 4, 'MPV'),
(47, 4, 'PENDIDIKAN ISLAM'),
(48, 4, 'PENDIDIKAN JASMANI'),
(49, 4, 'PENDIDIKAN KESIHATAN'),
(50, 4, 'PENDIDIKAN MORAL'),
(51, 4, 'PENDIDIKAN SENI VISUAL'),
(52, 4, 'PERNIAGAAN'),
(53, 4, 'PRINSIP AKAUN'),
(54, 4, 'SAINS'),
(55, 4, 'SAINS RUMAH TANGGA'),
(56, 4, 'SASTERA'),
(57, 4, 'SEJARAH'),
(58, 4, 'TASAWUR'),
(59, 5, 'BAHASA INGGERIS'),
(60, 5, 'BAHASA MELAYU'),
(61, 5, 'FIZIK'),
(62, 5, 'KIMIA'),
(63, 5, 'MATEMATIK'),
(64, 5, 'MATEMATIK TAMBAHAN'),
(65, 5, 'MPV'),
(66, 5, 'PENDIDIKAN ISLAM'),
(67, 5, 'PENDIDIKAN JASMANI'),
(68, 5, 'PENDIDIKAN KESIHATAN'),
(69, 5, 'PENDIDIKAN MORAL'),
(70, 5, 'PENDIDIKAN SENI VISUAL'),
(71, 5, 'PERNIAGAAN'),
(72, 5, 'PRINSIP AKAUN'),
(73, 5, 'SAINS'),
(74, 5, 'SAINS RUMAH TANGGA'),
(75, 5, 'SASTERA'),
(76, 5, 'SEJARAH'),
(77, 5, 'TASAWUR'),
(78, 6, 'BAHASA MELAYU'),
(79, 6, 'PENGAJIAN AM'),
(80, 6, 'PENGAJIAN PERNIAGAAN'),
(81, 6, 'SEJARAH'),
(82, 6, 'SENI VISUAL'),
(83, 7, 'BAHASA MELAYU'),
(84, 7, 'PENGAJIAN AM'),
(85, 7, 'PENGAJIAN PERNIAGAAN'),
(86, 7, 'SEJARAH'),
(87, 7, 'SENI VISUAL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tajuk`
--

CREATE TABLE `tb_tajuk` (
  `id` int(11) NOT NULL,
  `id_tingkatan` int(11) DEFAULT NULL,
  `id_subjek` int(11) DEFAULT NULL,
  `tajuk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tajuk`
--

INSERT INTO `tb_tajuk` (`id`, `id_tingkatan`, `id_subjek`, `tajuk`) VALUES
(1, 2, 25, 'BAB 1 : BIODIVERSITI'),
(2, 2, 25, 'BAB 2 : EKOSISTEM'),
(3, 2, 25, 'BAB 3 : NUTRISI'),
(4, 2, 25, 'BAB 4 : KESIHATAN MANUSIA'),
(5, 2, 25, 'BAB 5 : AIR DAN LARUTAN'),
(6, 2, 25, 'BAB 6 : ASID DAN ALKALI'),
(7, 2, 25, 'BAB 7 : KEELEKTRIKAN DAN KEMAGNETAN'),
(8, 2, 25, 'BAB 8 : DAYA DAN GERAKAN'),
(9, 2, 25, 'BAB 9 : HABA'),
(10, 2, 25, 'BAB 10 : GELOMBANG BUNYI'),
(11, 2, 25, 'BAB 11 : BINTANG DAN GALAKSI DALAM ALAM SEMESTA'),
(12, 2, 25, 'BAB 12 : SISTEM SURIA'),
(13, 2, 25, 'BAB 13 : METEROID, ASTEROID, KOMET'),
(14, 3, 38, 'BAB 1 : RANGSANGAN DAN GERAKBALAS'),
(15, 3, 38, 'BAB 2 : RESPIRASI'),
(16, 3, 38, 'BAB 3 : PENGANGKUTAN'),
(17, 3, 38, 'BAB 4 : KEREAKTIFAN LOGAM'),
(18, 3, 38, 'BAB 5 : TERMOKIMIA'),
(19, 3, 38, 'BAB 6 : ELEKTRIK DAN KEMAGNETAN'),
(20, 3, 38, 'BAB 7 : TENAGA DAN KUASA'),
(21, 3, 38, 'BAB 8 : KERADIOAKTIFAN'),
(22, 3, 38, 'BAB 9 : CUACA ANGKASA LEPAS'),
(23, 3, 38, 'BAB 10 : PENEROKAAN ANGKASA LEPAS'),
(24, 1, 3, 'UNIT 1 :'),
(25, 1, 3, 'UNIT 2 :'),
(26, 1, 3, 'UNIT 3 :'),
(27, 1, 3, 'UNIT 4 :'),
(28, 1, 3, 'UNIT 5 :'),
(29, 1, 3, 'UNIT 6 :'),
(30, 1, 3, 'UNIT 7 :'),
(31, 1, 3, 'UNIT 8 :'),
(32, 1, 3, 'UNIT 9 :'),
(33, 1, 3, 'UNIT 10 :'),
(34, 1, 3, 'UNIT 11 :'),
(35, 1, 3, 'UNIT 12 :');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tema`
--

CREATE TABLE `tb_tema` (
  `id` int(11) NOT NULL,
  `id_tingkatan` int(11) DEFAULT NULL,
  `id_subjek` int(11) DEFAULT NULL,
  `tema` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tema`
--

INSERT INTO `tb_tema` (`id`, `id_tingkatan`, `id_subjek`, `tema`) VALUES
(1, 2, 25, 'TEMA 1 : PENYELENGGARAAN DAN KESINAMBUNGAN HIDUP'),
(2, 2, 25, 'TEMA 2 : PENEROKAAN UNSUR DALAM ALAM'),
(3, 2, 25, 'TEMA 3 : TENAGA DAN KELESTARIAN HIDUP'),
(4, 2, 25, 'TEMA 4 : PENEROKAAN BUMI DAN ANGKASA LEPAS'),
(5, 3, 38, 'TEMA 1 : PENYENGGARAAN DAN KESINAMBUNGAN HIDUP'),
(6, 3, 38, 'TEMA 2 : PENEROKAAN UNSUR DALAM ALAM'),
(7, 3, 38, 'TEMA 3 : TENAGA DAN KELESTARIAN HIDUP'),
(8, 3, 38, 'TEMA 4 : PENEROKAAN BUMI DAN ANGKASA LEPAS'),
(9, 1, 3, 'TEMA 1 : AMALAN GAYA HIDUP SIHAT'),
(10, 1, 3, 'TEMA 2 : BERINGAT SUPAYA SELAMAT'),
(11, 1, 3, 'TEMA 3 : CAHAYA PERPADUAN'),
(12, 1, 3, 'TEMA 4 : SENI BERSENDIKAN BUDAYA'),
(13, 1, 3, 'TEMA 5 : JATI DIRI DAN KEWARGANEGARAAN'),
(14, 1, 3, 'TEMA 6 :'),
(15, 1, 3, 'TEMA 7 :'),
(16, 1, 3, 'TEMA 8 :'),
(17, 1, 3, 'TEMA 9 :'),
(18, 1, 3, 'TEMA 10 :'),
(19, 1, 3, 'TEMA 11 : '),
(20, 1, 3, 'TEMA 12 :'),
(21, 1, 3, 'TEMA 13 :'),
(22, 1, 3, 'TEMA 14 :'),
(23, 1, 3, 'TEMA 15 :'),
(24, 1, 3, 'TEMA 16 :'),
(25, 1, 3, 'TEMA 17 :'),
(26, 1, 3, 'TEMA 18 :');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload`
--

CREATE TABLE `tb_upload` (
  `id` int(11) NOT NULL,
  `image` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_upload`
--

INSERT INTO `tb_upload` (`id`, `image`) VALUES
(10, 'Avengers-624296b8720e0.png'),
(11, 'Davify-62429ab4e0363.png');

-- --------------------------------------------------------

--
-- Table structure for table `tingkatan`
--

CREATE TABLE `tingkatan` (
  `id` int(11) NOT NULL,
  `nama_tingkatan` varchar(255) NOT NULL DEFAULT '0',
  `singkatan_tingkatan` int(11) DEFAULT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tingkatan`
--

INSERT INTO `tingkatan` (`id`, `nama_tingkatan`, `singkatan_tingkatan`, `id_status`) VALUES
(1, 'SATU', 1, 1),
(2, 'DUA', 2, 1),
(3, 'TIGA', 3, 1),
(4, 'EMPAT', 4, 1),
(5, 'LIMA', 5, 1),
(6, 'ENAM', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit_uniform`
--

CREATE TABLE `unit_uniform` (
  `id` int(11) NOT NULL,
  `id_kokurikulum` int(11) NOT NULL DEFAULT 3,
  `jenis_uniform` varchar(255) NOT NULL,
  `singkatan_uniform` varchar(255) DEFAULT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_uniform`
--

INSERT INTO `unit_uniform` (`id`, `id_kokurikulum`, `jenis_uniform`, `singkatan_uniform`, `id_status`) VALUES
(1, 3, 'BULAN SABIT MERAH MALAYSIA', 'BSMM', 1),
(2, 3, 'KADET BOMBA DAN PENYELAMAT', 'KADET BOMBA', 1),
(3, 3, 'KADET POLIS DIRAJA MALAYSIA', 'KADET POLIS', 1),
(4, 3, 'KADET REMAJA SEKOLAH', 'KRS', 1),
(5, 3, 'PERTUBUHAN PUTERI ISLAM', 'PUTERI ISLAM', 1),
(6, 3, 'PERSEKUTUAN PENGAKAP MALAYSIA', 'PENGAKAP', 1),
(7, 3, 'PERTUBUHAN SILAT GAYONG MALAYSIA', 'SILAT GAYONG', 1),
(100, 0, 'SILA KEMASKINI', 'KEMASKINI', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1m1s_daftar`
--
ALTER TABLE `1m1s_daftar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1m1s_kaedah`
--
ALTER TABLE `1m1s_kaedah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1m1s_pencapaian`
--
ALTER TABLE `1m1s_pencapaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1m1s_peringkat`
--
ALTER TABLE `1m1s_peringkat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gred`
--
ALTER TABLE `gred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru_kelas`
--
ALTER TABLE `guru_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jantina`
--
ALTER TABLE `jantina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawatan`
--
ALTER TABLE `jawatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawatan_kokurikulum`
--
ALTER TABLE `jawatan_kokurikulum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_kokurikulum`
--
ALTER TABLE `kategori_kokurikulum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kaum`
--
ALTER TABLE `kaum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kehadiran_harian`
--
ALTER TABLE `kehadiran_harian`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kehadiran_koko`
--
ALTER TABLE `kehadiran_koko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelab_persatuan`
--
ALTER TABLE `kelab_persatuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas_lengkap`
--
ALTER TABLE `kelas_lengkap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kokurikulum`
--
ALTER TABLE `kokurikulum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kokurikulum_guru`
--
ALTER TABLE `kokurikulum_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `makluman`
--
ALTER TABLE `makluman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maklumat_guru`
--
ALTER TABLE `maklumat_guru`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `maklumat_murid`
--
ALTER TABLE `maklumat_murid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minggu`
--
ALTER TABLE `minggu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_guru_subjek`
--
ALTER TABLE `rph_guru_subjek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_hari`
--
ALTER TABLE `rph_hari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_masa`
--
ALTER TABLE `rph_masa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_minggu`
--
ALTER TABLE `rph_minggu`
  ADD PRIMARY KEY (`id_minggu`);

--
-- Indexes for table `rph_perancangan`
--
ALTER TABLE `rph_perancangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_rancangan`
--
ALTER TABLE `rph_rancangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rph_subjek`
--
ALTER TABLE `rph_subjek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rumah_sukan`
--
ALTER TABLE `rumah_sukan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sukan_daftar_nama_kejohanan`
--
ALTER TABLE `sukan_daftar_nama_kejohanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sukan_permainan`
--
ALTER TABLE `sukan_permainan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bbm`
--
ALTER TABLE `tb_bbm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_minitcurai`
--
ALTER TABLE `tb_minitcurai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_opr`
--
ALTER TABLE `tb_opr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_subjek`
--
ALTER TABLE `tb_subjek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tajuk`
--
ALTER TABLE `tb_tajuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tema`
--
ALTER TABLE `tb_tema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_upload`
--
ALTER TABLE `tb_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tingkatan`
--
ALTER TABLE `tingkatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_uniform`
--
ALTER TABLE `unit_uniform`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1m1s_daftar`
--
ALTER TABLE `1m1s_daftar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `1m1s_kaedah`
--
ALTER TABLE `1m1s_kaedah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `1m1s_pencapaian`
--
ALTER TABLE `1m1s_pencapaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `1m1s_peringkat`
--
ALTER TABLE `1m1s_peringkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gred`
--
ALTER TABLE `gred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `guru_kelas`
--
ALTER TABLE `guru_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `jantina`
--
ALTER TABLE `jantina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jawatan`
--
ALTER TABLE `jawatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jawatan_kokurikulum`
--
ALTER TABLE `jawatan_kokurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategori_kokurikulum`
--
ALTER TABLE `kategori_kokurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `kaum`
--
ALTER TABLE `kaum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kehadiran_harian`
--
ALTER TABLE `kehadiran_harian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kehadiran_koko`
--
ALTER TABLE `kehadiran_koko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `kelab_persatuan`
--
ALTER TABLE `kelab_persatuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kelas_lengkap`
--
ALTER TABLE `kelas_lengkap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `kokurikulum`
--
ALTER TABLE `kokurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kokurikulum_guru`
--
ALTER TABLE `kokurikulum_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `makluman`
--
ALTER TABLE `makluman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `maklumat_guru`
--
ALTER TABLE `maklumat_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `maklumat_murid`
--
ALTER TABLE `maklumat_murid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=873;

--
-- AUTO_INCREMENT for table `minggu`
--
ALTER TABLE `minggu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rph_guru_subjek`
--
ALTER TABLE `rph_guru_subjek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rph_hari`
--
ALTER TABLE `rph_hari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rph_masa`
--
ALTER TABLE `rph_masa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rph_minggu`
--
ALTER TABLE `rph_minggu`
  MODIFY `id_minggu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rph_perancangan`
--
ALTER TABLE `rph_perancangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rph_rancangan`
--
ALTER TABLE `rph_rancangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rph_subjek`
--
ALTER TABLE `rph_subjek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rumah_sukan`
--
ALTER TABLE `rumah_sukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sukan_daftar_nama_kejohanan`
--
ALTER TABLE `sukan_daftar_nama_kejohanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sukan_permainan`
--
ALTER TABLE `sukan_permainan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tb_bbm`
--
ALTER TABLE `tb_bbm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_minitcurai`
--
ALTER TABLE `tb_minitcurai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_opr`
--
ALTER TABLE `tb_opr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_subjek`
--
ALTER TABLE `tb_subjek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `tb_tajuk`
--
ALTER TABLE `tb_tajuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_tema`
--
ALTER TABLE `tb_tema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_upload`
--
ALTER TABLE `tb_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tingkatan`
--
ALTER TABLE `tingkatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `unit_uniform`
--
ALTER TABLE `unit_uniform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
