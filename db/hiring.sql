-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Oca 2023, 17:01:22
-- Sunucu sürümü: 10.4.24-MariaDB
-- PHP Sürümü: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hiring`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cv`
--

CREATE TABLE `cv` (
  `cv_id` int(11) NOT NULL,
  `diller_dil_id` int(11) NOT NULL,
  `cv_adresi` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cv`
--

INSERT INTO `cv` (`cv_id`, `diller_dil_id`, `cv_adresi`, `kullanicilar_kullanici_id`) VALUES
(9, 1, '20299088244_Ogrenci.pdf', 45);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diller`
--

CREATE TABLE `diller` (
  `dil_id` int(11) NOT NULL,
  `dil_adi` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `diller`
--

INSERT INTO `diller` (`dil_id`, `dil_adi`) VALUES
(1, 'Türkçe'),
(2, 'İngilizce'),
(3, 'Almanca'),
(4, 'Fransızca'),
(5, 'Rusça');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fotograflar`
--

CREATE TABLE `fotograflar` (
  `fotograf_id` int(11) NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL,
  `fotograf_adresi` varchar(250) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `fotograflar`
--

INSERT INTO `fotograflar` (`fotograf_id`, `kullanicilar_kullanici_id`, `fotograf_adresi`) VALUES
(41, 45, 'myphoto.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE `iletisim` (
  `iletisim_id` int(11) NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL,
  `iletisim_tel_no` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_mail` varchar(70) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`iletisim_id`, `kullanicilar_kullanici_id`, `iletisim_tel_no`, `iletisim_mail`) VALUES
(30, 45, '05439250620', 'umutsaydam24@gmail.com'),
(31, 46, '05466', 'dmt@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `insan_kaynagi`
--

CREATE TABLE `insan_kaynagi` (
  `sirketler_sirket_id` int(11) NOT NULL,
  `insan_kaynagi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `insan_kaynagi`
--

INSERT INTO `insan_kaynagi` (`sirketler_sirket_id`, `insan_kaynagi_id`) VALUES
(9, 46);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_ad` varchar(70) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_soyad` varchar(70) COLLATE utf8_turkish_ci NOT NULL DEFAULT '""',
  `kullanici_tanitim` text COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_teklif_acik` tinyint(1) NOT NULL DEFAULT 0,
  `kullanici_email` varchar(70) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_sifre` varchar(20) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kullanici_id`, `kullanici_ad`, `kullanici_soyad`, `kullanici_tanitim`, `kullanici_teklif_acik`, `kullanici_email`, `kullanici_sifre`) VALUES
(45, 'Umut', 'SAYDAM', 'deneme', 1, 'umutsaydam24@gmail.com', '123'),
(46, 'Demet', 'Mutlu', 'Deneme', 0, 'dmt@gmail.com', '123');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici_meslek_detay`
--

CREATE TABLE `kullanici_meslek_detay` (
  `kullanicilar_kullanici_id` int(11) NOT NULL,
  `alanlar_alan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici_meslek_detay`
--

INSERT INTO `kullanici_meslek_detay` (`kullanicilar_kullanici_id`, `alanlar_alan_id`) VALUES
(45, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `meslekler`
--

CREATE TABLE `meslekler` (
  `meslek_id` int(11) NOT NULL,
  `meslek_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `meslekler`
--

INSERT INTO `meslekler` (`meslek_id`, `meslek_adi`) VALUES
(1, 'Bilgisayar Mühendisliği'),
(2, 'Endüstri Mühendisliği'),
(3, 'Jeoloji Mühendisliği'),
(4, 'Çevre Mühendisliği'),
(5, 'Elektrik-Elektronik Mühendisliği'),
(6, 'Makine Mühendisliği'),
(7, 'Yazılım Mühendisliği'),
(8, 'Adli Bilişim Mühendisliği'),
(9, 'İnşaat Mühendisliği'),
(10, 'Biyomühendislik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `meslek_alanlar`
--

CREATE TABLE `meslek_alanlar` (
  `alan_id` int(11) NOT NULL,
  `meslekler_meslek_id` int(11) NOT NULL,
  `alan_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `meslek_alanlar`
--

INSERT INTO `meslek_alanlar` (`alan_id`, `meslekler_meslek_id`, `alan_adi`) VALUES
(1, 1, 'Donanım Mühendisliği'),
(2, 2, 'Bütçe ve Finansal Planlama'),
(3, 3, 'Maden Tetkik ve Arama'),
(4, 4, 'Çevre ve Şehircilik'),
(5, 5, 'Haberleşme ve Medya'),
(6, 6, 'İmalat sanayi'),
(7, 7, 'Test Mühendisliği'),
(8, 8, 'İnternet ve E-ticaret Güvenliği'),
(9, 9, 'Karayolu ve Demiryolu Üstyapı Tasarımı'),
(10, 10, 'Genetik Mühendisliği');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sirketler`
--

CREATE TABLE `sirketler` (
  `sirket_id` int(11) NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL,
  `sirket_adi` varchar(70) COLLATE utf8_turkish_ci NOT NULL,
  `sirket_vizyon` text COLLATE utf8_turkish_ci NOT NULL,
  `sirket_misyon` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sirketler`
--

INSERT INTO `sirketler` (`sirket_id`, `kullanicilar_kullanici_id`, `sirket_adi`, `sirket_vizyon`, `sirket_misyon`) VALUES
(9, 46, 'Trenyol', 'Deneme', 'Deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teklifler`
--

CREATE TABLE `teklifler` (
  `insan_kaynagi_id` int(11) NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `videolar`
--

CREATE TABLE `videolar` (
  `video_id` int(11) NOT NULL,
  `video_zamani` date NOT NULL DEFAULT current_timestamp(),
  `video_adresi` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanicilar_kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `videolar`
--

INSERT INTO `videolar` (`video_id`, `video_zamani`, `video_adresi`, `kullanicilar_kullanici_id`) VALUES
(9, '2023-01-16', 'WIN_20221226_09_35_47_Pro.mp4', 45);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`cv_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`),
  ADD KEY `diller_dil_id` (`diller_dil_id`);

--
-- Tablo için indeksler `diller`
--
ALTER TABLE `diller`
  ADD PRIMARY KEY (`dil_id`);

--
-- Tablo için indeksler `fotograflar`
--
ALTER TABLE `fotograflar`
  ADD PRIMARY KEY (`fotograf_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`);

--
-- Tablo için indeksler `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`iletisim_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`);

--
-- Tablo için indeksler `insan_kaynagi`
--
ALTER TABLE `insan_kaynagi`
  ADD PRIMARY KEY (`sirketler_sirket_id`,`insan_kaynagi_id`),
  ADD KEY `insan_kaynagi_id` (`insan_kaynagi_id`),
  ADD KEY `sirketler_sirket_id` (`sirketler_sirket_id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Tablo için indeksler `kullanici_meslek_detay`
--
ALTER TABLE `kullanici_meslek_detay`
  ADD PRIMARY KEY (`kullanicilar_kullanici_id`,`alanlar_alan_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`),
  ADD KEY `alanlar_alan_id` (`alanlar_alan_id`);

--
-- Tablo için indeksler `meslekler`
--
ALTER TABLE `meslekler`
  ADD PRIMARY KEY (`meslek_id`);

--
-- Tablo için indeksler `meslek_alanlar`
--
ALTER TABLE `meslek_alanlar`
  ADD PRIMARY KEY (`alan_id`),
  ADD KEY `meslekler_meslek_id` (`meslekler_meslek_id`);

--
-- Tablo için indeksler `sirketler`
--
ALTER TABLE `sirketler`
  ADD PRIMARY KEY (`sirket_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`);

--
-- Tablo için indeksler `teklifler`
--
ALTER TABLE `teklifler`
  ADD PRIMARY KEY (`insan_kaynagi_id`,`kullanicilar_kullanici_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`),
  ADD KEY `insan_kaynagi_id` (`insan_kaynagi_id`);

--
-- Tablo için indeksler `videolar`
--
ALTER TABLE `videolar`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `kullanicilar_kullanici_id` (`kullanicilar_kullanici_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cv`
--
ALTER TABLE `cv`
  MODIFY `cv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `diller`
--
ALTER TABLE `diller`
  MODIFY `dil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `fotograflar`
--
ALTER TABLE `fotograflar`
  MODIFY `fotograf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `iletisim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Tablo için AUTO_INCREMENT değeri `meslekler`
--
ALTER TABLE `meslekler`
  MODIFY `meslek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `meslek_alanlar`
--
ALTER TABLE `meslek_alanlar`
  MODIFY `alan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `sirketler`
--
ALTER TABLE `sirketler`
  MODIFY `sirket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `videolar`
--
ALTER TABLE `videolar`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  ADD CONSTRAINT `cv_ibfk_2` FOREIGN KEY (`diller_dil_id`) REFERENCES `diller` (`dil_id`);

--
-- Tablo kısıtlamaları `fotograflar`
--
ALTER TABLE `fotograflar`
  ADD CONSTRAINT `fotograflar_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

--
-- Tablo kısıtlamaları `iletisim`
--
ALTER TABLE `iletisim`
  ADD CONSTRAINT `iletisim_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

--
-- Tablo kısıtlamaları `insan_kaynagi`
--
ALTER TABLE `insan_kaynagi`
  ADD CONSTRAINT `insan_kaynagi_ibfk_1` FOREIGN KEY (`insan_kaynagi_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  ADD CONSTRAINT `insan_kaynagi_ibfk_2` FOREIGN KEY (`sirketler_sirket_id`) REFERENCES `sirketler` (`sirket_id`);

--
-- Tablo kısıtlamaları `kullanici_meslek_detay`
--
ALTER TABLE `kullanici_meslek_detay`
  ADD CONSTRAINT `kullanici_meslek_detay_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  ADD CONSTRAINT `kullanici_meslek_detay_ibfk_2` FOREIGN KEY (`alanlar_alan_id`) REFERENCES `meslek_alanlar` (`alan_id`);

--
-- Tablo kısıtlamaları `meslek_alanlar`
--
ALTER TABLE `meslek_alanlar`
  ADD CONSTRAINT `meslek_alanlar_ibfk_1` FOREIGN KEY (`meslekler_meslek_id`) REFERENCES `meslekler` (`meslek_id`);

--
-- Tablo kısıtlamaları `sirketler`
--
ALTER TABLE `sirketler`
  ADD CONSTRAINT `sirketler_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

--
-- Tablo kısıtlamaları `teklifler`
--
ALTER TABLE `teklifler`
  ADD CONSTRAINT `teklifler_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  ADD CONSTRAINT `teklifler_ibfk_2` FOREIGN KEY (`insan_kaynagi_id`) REFERENCES `insan_kaynagi` (`insan_kaynagi_id`);

--
-- Tablo kısıtlamaları `videolar`
--
ALTER TABLE `videolar`
  ADD CONSTRAINT `videolar_ibfk_1` FOREIGN KEY (`kullanicilar_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
