-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Waktu pembuatan: 14 Jun 2025 pada 03.08
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jaya_store`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id_product` char(36) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `category`, `price`) VALUES
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0001', 'Sabun Mandi Lifebuoy', 'Kesehatan', '6000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0002', 'Susu Ultra Milk 1L', 'Minuman', '15000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0003', 'Beras Setra Ramos 5Kg', 'Sembako', '70000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0004', 'Minyak Goreng Bimoli 2L', 'Sembako', '28000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0005', 'Shampoo Pantene 180ml', 'Kesehatan', '25000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0006', 'Snack Chitato 68g', 'Makanan Ringan', '8000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0007', 'Air Mineral Aqua 600ml', 'Minuman', '4000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0008', 'Indomie Goreng', 'Makanan Instan', '3000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0009', 'Telur Ayam 1kg', 'Sembako', '28000'),
('a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0010', 'Sabun Cuci Piring Sunlight 750ml', 'Kebutuhan Rumah', '14000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchases`
--

CREATE TABLE `purchases` (
  `id_purchase` char(36) NOT NULL,
  `id_product` char(36) NOT NULL,
  `purchase_amount` int(11) NOT NULL,
  `price_total` varchar(50) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `purchases`
--

INSERT INTO `purchases` (`id_purchase`, `id_product`, `purchase_amount`, `price_total`, `purchase_date`) VALUES
('22222222-bbbb-4bbb-cccc-000000000001', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0001', 5, '30000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000002', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0002', 2, '30000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000003', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0003', 1, '70000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000004', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0004', 3, '84000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000005', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0005', 2, '50000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000006', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0006', 10, '80000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000007', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0007', 6, '24000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000008', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0008', 12, '36000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000009', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0009', 3, '84000', '2025-06-14 00:00:10'),
('22222222-bbbb-4bbb-cccc-000000000010', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0010', 4, '56000', '2025-06-14 00:00:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_products`
--

CREATE TABLE `stock_products` (
  `id_stock` char(36) NOT NULL,
  `id_product` char(36) NOT NULL,
  `stock_amount` int(11) NOT NULL,
  `date_update` date NOT NULL,
  `date_create` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stock_products`
--

INSERT INTO `stock_products` (`id_stock`, `id_product`, `stock_amount`, `date_update`, `date_create`) VALUES
('11111111-aaaa-4aaa-bbbb-000000000001', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0001', 100, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000002', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0002', 80, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000003', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0003', 50, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000004', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0004', 60, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000005', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0005', 75, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000006', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0006', 120, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000007', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0007', 200, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000008', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0008', 180, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000009', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0009', 90, '2025-06-14', '2025-06-14'),
('11111111-aaaa-4aaa-bbbb-000000000010', 'a1d5c9b0-8d89-4e0c-9d77-2f1e9b8c0010', 110, '2025-06-14', '2025-06-14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeks untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `purchases` (`id_product`);

--
-- Indeks untuk tabel `stock_products`
--
ALTER TABLE `stock_products`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `srock_products` (`id_product`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Ketidakleluasaan untuk tabel `stock_products`
--
ALTER TABLE `stock_products`
  ADD CONSTRAINT `srock_products` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
