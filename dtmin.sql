-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2018 at 12:47 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dtmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `password`) VALUES
(1, 'Indri Anatasya Alam', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `fact_tabel_penjualan`
--

CREATE TABLE IF NOT EXISTS `fact_tabel_penjualan` (
  `id_fact` int(11) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `kode_dimensi` varchar(5) NOT NULL,
  `kode_lokasi` varchar(5) NOT NULL,
  `total_penjualan` double NOT NULL,
  `total_penerimaan` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fact_tabel_penjualan`
--

INSERT INTO `fact_tabel_penjualan` (`id_fact`, `kode_barang`, `kode_dimensi`, `kode_lokasi`, `total_penjualan`, `total_penerimaan`) VALUES
(1, 'b1', 'd1', 'l1', 200000, 300000),
(2, 'b1', 'd1', 'l2', 600000, 400000),
(3, 'b2', 'd1', 'l1', 7000000, 6500000),
(4, 'b2', 'd1', 'l2', 670000, 700000),
(5, 'b3', 'd1', 'l1', 3000000, 3400000),
(6, 'b3', 'd1', 'l2', 2300000, 2600000),
(7, 'b1', 'd2', 'l1', 4500000, 4700000),
(8, 'b1', 'd2', 'l2', 6600000, 6800000),
(9, 'b2', 'd2', 'l1', 6900000, 7000000),
(10, 'b2', 'd2', 'l2', 5000000, 9800000),
(11, 'b3', 'd2', 'l1', 5800000, 7000000),
(12, 'b3', 'd2', 'l2', 200000, 300000),
(13, 'b1', 'd3', 'l1', 2300000, 4500000),
(14, 'b1', 'd3', 'l2', 1000000, 2300000),
(15, 'b2', 'd3', 'l1', 7700000, 7800000),
(16, 'b2', 'd3', 'l2', 3200000, 4300000),
(17, 'b3', 'd3', 'l1', 400000, 600000),
(18, 'b3', 'd3', 'l2', 860000, 890000),
(19, 'b1', 'd4', 'l1', 600000, 700000),
(20, 'b1', 'd4', 'l2', 630000, 670000),
(21, 'b2', 'd4', 'l1', 300000, 340000),
(22, 'b2', 'd4', 'l2', 600000, 610000),
(23, 'b3', 'd4', 'l1', 450000, 600000),
(24, 'b3', 'd4', 'l2', 700000, 780000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_barang`
--

CREATE TABLE IF NOT EXISTS `tabel_barang` (
  `kode_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `subkategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_barang`
--

INSERT INTO `tabel_barang` (`kode_barang`, `nama_barang`, `kategori`, `subkategori`) VALUES
('b1', 'milo', 'minuman', 'susu'),
('b2', 'rosta', 'makanan', 'snack'),
('b3', 'sinar dunia', 'ATK', 'buku');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_dimensi`
--

CREATE TABLE IF NOT EXISTS `tabel_dimensi` (
  `kode_dimensi` varchar(5) NOT NULL,
  `minggu` varchar(2) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_dimensi`
--

INSERT INTO `tabel_dimensi` (`kode_dimensi`, `minggu`, `bulan`, `tahun`) VALUES
('d1', '2', '1', '2017'),
('d2', '3', '1', '2016'),
('d3', '4', '7', '2015'),
('d4', '3', '5', '2018');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_lokasi`
--

CREATE TABLE IF NOT EXISTS `tabel_lokasi` (
  `kode_lokasi` varchar(5) NOT NULL,
  `kelurahan` varchar(30) NOT NULL,
  `kecamatan` varchar(30) NOT NULL,
  `kota` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_lokasi`
--

INSERT INTO `tabel_lokasi` (`kode_lokasi`, `kelurahan`, `kecamatan`, `kota`) VALUES
('l1', 'kandai', 'kendari ', 'kendari'),
('l2', 'kemaraya', 'kendari barat', 'kendari');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fact_tabel_penjualan`
--
ALTER TABLE `fact_tabel_penjualan`
  ADD PRIMARY KEY (`id_fact`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_lokasi` (`kode_lokasi`),
  ADD KEY `kode_dimensi` (`kode_dimensi`);

--
-- Indexes for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tabel_dimensi`
--
ALTER TABLE `tabel_dimensi`
  ADD PRIMARY KEY (`kode_dimensi`);

--
-- Indexes for table `tabel_lokasi`
--
ALTER TABLE `tabel_lokasi`
  ADD PRIMARY KEY (`kode_lokasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fact_tabel_penjualan`
--
ALTER TABLE `fact_tabel_penjualan`
  MODIFY `id_fact` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_tabel_penjualan`
--
ALTER TABLE `fact_tabel_penjualan`
  ADD CONSTRAINT `fact_tabel_penjualan_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tabel_barang` (`kode_barang`),
  ADD CONSTRAINT `fact_tabel_penjualan_ibfk_2` FOREIGN KEY (`kode_lokasi`) REFERENCES `tabel_lokasi` (`kode_lokasi`),
  ADD CONSTRAINT `fact_tabel_penjualan_ibfk_3` FOREIGN KEY (`kode_dimensi`) REFERENCES `tabel_dimensi` (`kode_dimensi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
