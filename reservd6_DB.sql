-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 03, 2020 at 01:35 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservd6_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `administration`
--

CREATE TABLE `administration` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `image` varchar(300) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administration`
--

INSERT INTO `administration` (`id`, `name`, `email`, `phone`, `image`, `password`, `remember_token`, `type`, `type_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@reservationsa.com', '01225892523', 'images/user/1573541857_507798297.png', '$2y$10$iJwsfB2S8k8CKVdTUOQU.eoWczbMxvrpWHNGueU6nX83g.3qZGpdK', 'hUpUL73eG6wiVRe55dIy5X1K1cJ7DzMF3SAzlA9k288FhwcBG4pxwp9BrCun', '5', 0, 'eeDRezEovD7JMx3nbZ3TL5:APA91bGEZA09qU9-L2uf2Ma0RHXsUUhwcrpvm3IOMpG4H3-wrWH972VTyVIF3_LVbdDpFiN2O1el96ThhhEAl_ldJi6n0QAYtjJv26MK0W1ebIXpfVnliQMRdYRMkeqr7faa43vJX_An', '2019-10-21 08:28:53', '2019-11-12 13:57:37'),
(12, NULL, 'admin@alhokama.com', '114797777', 'images/clinic/avatar_clinic.jpg', '$2y$10$y11K.bXN1H8N7b2l6wRKG.v7tztBwIZHxJrtrgP1iTBnRN.ss2yTa', NULL, '2', 1, 'cmxQorEq2hHEZI8JkwA28t:APA91bGuOZoMjt-OW-AL-JBYQq-T_Z7yiakV0j1xIWjW3olYF9rcMYaYYfl5IAjGBZUqNiI1_ciIY5Oa4Bmyx60cLUEy1tr_c9upgg6fVzJPvgqL7HDJb-E_b0MMTy33xet4eZ2xs0nI', '2019-11-05 13:10:55', NULL),
(13, NULL, 'admin@albaik.com', '01066365287', 'images/restaurant/90B3zPwQP7xifHgTj4jlAvHLGJ8MAjiW9DjCuKp1.png', '$2y$10$3IW18WBVpGQUfvBUmctKyOX/GJw4C8imWYozzDKZi1OHVJtlsjAoy', NULL, '3', 1, '', '2019-11-05 13:32:13', NULL),
(15, NULL, 'admin@saudiacatering.com', '0125892527', 'images/catering/avatar_catering.jpg', '$2y$10$n9x7gjgsxdEw0.xqjOd/FuTE3Ouc.YkMJYnGzh0EcmSKMfKEqViAa', '3arVRY4hgqyh6CGlzqYDDQlKJvbEJVTDbl20jbMYVZMeSY9J4zsiBQMFEMqF', '4', 1, '', '2019-11-05 13:45:33', NULL),
(22, NULL, 'admin@kfshrc.edu.sa', '920012312', 'images/hospital/1vBKzUMuBbBufwMDZnWKD6cdvm8oNGd34ebSkiZz.png', '$2y$10$cy/ezvdRb9VvHCCyGVK3JefC9h3cLs2wG5cMDK/QuJOWOpJqnSqzy', NULL, '1', 6, 'ee_XEKmZgaoEB53ubjHMkP:APA91bGqjiZlCyQzfyJ10saYTVBlf92WFR2PMYJUvxWDsuGkCRLT3EttJCWh4S3yh94Kyqy-f2gbkGLjuGmJAbMIAaciaR78lsDGOxbX-e_w3hMes6p0jcJ1za-bU5q6o9XgJAl1NZNV', '2019-11-12 07:58:12', NULL),
(36, NULL, 'admin@almana.com', '01272252219', 'images/hospital/T325CZfGeGmN3DdIHZXKdyUuDRQA9vBtDHrOW2KN.jpeg', '$2y$10$6RdhSCTdV2aSNp.caWrd3.KYhIX38DtxQ3BulWMlZXaGMAkMgGDie', 'qH5Y9pNgBuPMQutnfWPIwsstWYZnapJERFK49aTI8ygLfthd4UJdbiEuhhr1', '1', 22, '', '2019-11-25 20:31:09', NULL),
(37, NULL, 'test@gmail.com', '111111111111', 'images/restaurant/AFnUNSWZ1F7QvrfWpNN54JLR02IZgwTlAiFUWp2A.png', '$2y$10$nea9S7zshBxSeSqvXQcb9OBMDrnlrhyN5.axh4co8ci9J/cBQaA9y', 'BsoJheZ2mhltJZzTVFeVByzOaRe28a330lsoldKZ2Z1yxOupMgT5q1oCNrrT', '3', 2, '', '2019-12-16 15:01:13', NULL),
(43, NULL, 'two@yahoo.com', '1234567891', 'images/clinic/3bqSwdSJysMT9T86IgqesEU5cFDlJuykli7cxbiA.jpeg', '$2y$10$gL9Qg9iCj7pXnkGgcSaM5uCXllymBkZE.WcRV5HfHod.4AiBTwQkC', NULL, '2', 22, NULL, '2019-12-24 09:03:11', NULL),
(47, NULL, 'lorem@reser.com', '625892527', 'images/catering/vQpTvpY4S958LT7FQE34nbwvgvtqYdESJiTXXJ9Z.jpeg', '$2y$10$QvRHQk2VMT9x18lGkq6Dl.XpvAzsSPYimh/.tpl9zQmr/8VkvXJmi', NULL, '4', 2, NULL, '2019-12-24 10:43:08', NULL),
(50, NULL, 'admfdmin@test.com', '5145454226', 'images/hospital/M7LxEPTeyrpjPSzCVmaBfyxLE3WEy0DJhZHKaQtC.png', '$2y$10$V3MHU0IeFvSUZyHaMcJ3VuTTBEcmHhUuShTLu/ukYTIy6WMbUWWd6', NULL, '1', 24, NULL, '2019-12-25 07:35:31', NULL),
(56, NULL, 'catering@reg.com', '0548822564', 'images/catering/ARMhlxbUyp058MhxegyLYalwr3qxuEMRou1IA5t2.jpeg', '$2y$10$P61iNOVJAQzZfhohPjx9.e3RwoXfmnSip/ifCYOMlCMClkV5kAQdC', NULL, '4', 7, 'eeDRezEovD7JMx3nbZ3TL5:APA91bGEZA09qU9-L2uf2Ma0RHXsUUhwcrpvm3IOMpG4H3-wrWH972VTyVIF3_LVbdDpFiN2O1el96ThhhEAl_ldJi6n0QAYtjJv26MK0W1ebIXpfVnliQMRdYRMkeqr7faa43vJX_An', '2020-01-08 08:10:23', NULL),
(62, NULL, 'admin@test.com', '55955556', 'images/hospital/fdto3ApnqXy9TjCRfRMAC1GXhGgPC3SGG3J21lAF.png', '$2y$10$HPdii0RTSe3C0ht8aMHtt.6kyudmgzK9uq.pBAt9NlIiGV2xImt5i', NULL, '1', 30, NULL, '2020-01-14 08:51:00', NULL),
(63, NULL, 'admin@testing2.com', '512554512', 'images/clinic/aHh7suZKdPoTTidfpCwhp743lhkM6MAHBm4vSPNJ.png', '$2y$10$WIsRmS23j6Baqmn2ez6LUuAZHhFzC4cmxFDiTfhQCxBaEPwn5eMvC', NULL, '2', 42, NULL, '2020-01-14 08:52:57', NULL),
(64, NULL, 'admintest@test.com', '26541544', 'images/restaurant/vCHLyAqFl648JRlbYN649hg59BVwULEsnGY31e2L.png', '$2y$10$.fQ/fW3Ha432.ucaMEVbsOOvsmPSoHbNutRrqw56UsGyssoeGswsO', NULL, '3', 19, NULL, '2020-01-14 09:05:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `advertisement_id` int(11) NOT NULL,
  `advertisement_image` varchar(300) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`advertisement_id`, `advertisement_image`, `interest_id`, `type`, `type_id`, `created_at`, `updated_at`) VALUES
(11, 'images/advertisement/Nww49WA3lXch3yz2BHYf0chtrC8vVLl4LpyN0Z2t.png', 2, 2, 1, '2019-11-24 09:03:44', NULL),
(12, 'images/advertisement/o8cbrJOsSRWCXZuFKnW6ODe0644eyFn4VW1Jro5B.jpeg', 1, 1, 21, '2019-11-22 20:57:55', NULL),
(19, 'images/advertisement/KBerikn3lklSoANsyNpK4B5a9sX8rHlQTqbC06Fd.png', 2, 1, 6, '2019-11-24 08:25:39', NULL),
(20, 'images/advertisement/Kz18l9JMc81ZYXLWqoCi1AXII2T0icgJW1OmpZmz.png', 2, 1, 6, '2019-11-24 08:27:01', NULL),
(21, 'images/advertisement/QR6hgR5dUCYUtNrffK57TVJBrmhUztGGAeRRPMHn.png', 1, 1, 6, '2019-12-17 12:03:40', NULL),
(22, 'images/advertisement/O1tBgrsUXKDiWvih6FeA7hsGmtYY2SPlI8QqNOm3.jpeg', 1, 1, 22, '2019-11-25 21:21:13', NULL),
(24, 'images/advertisement/q5EFMONFDTnQYmNPDD1VsXDVHSAsE2TafHuUvctO.jpeg', 1, 3, 1, '2019-12-30 08:31:03', NULL),
(25, 'images/advertisement/c0BkIHZfFif2lVZTJG0Vd5UJdHGOvLqudXVgtVI2.jpeg', 1, 2, 26, '2019-12-30 08:31:46', NULL),
(26, 'images/advertisement/svNcrkzhZxs3A0JjtFHetkhrrW8RSqhU9MI89p7O.jpeg', 1, 1, 6, '2019-12-30 08:32:24', NULL),
(27, 'images/advertisement/wXZeC1bcvSHrwqh4XcwjxQqijM1CUhzknRRxTzQf.jpeg', 1, 4, 1, '2019-12-30 08:34:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_description`
--

CREATE TABLE `advertisement_description` (
  `advertisement_description_id` int(11) NOT NULL,
  `advertisement_description_name` varchar(50) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisement_description`
--

INSERT INTO `advertisement_description` (`advertisement_description_id`, `advertisement_description_name`, `advertisement_id`, `language_id`, `created_at`, `updated_at`) VALUES
(21, 'what', 11, 1, '2019-11-21 11:59:30', NULL),
(22, 'ماذا', 11, 2, '2019-11-21 11:59:30', NULL),
(23, 'zyiad', 12, 1, '2019-11-22 14:46:09', NULL),
(24, 'zayia', 12, 2, '2019-11-22 14:46:09', NULL),
(37, 'Free inspection', 19, 1, '2019-11-24 08:25:39', NULL),
(38, 'فحص مجانى', 19, 2, '2019-11-24 08:25:39', NULL),
(39, 'Free inspection', 20, 1, '2019-11-24 08:27:01', NULL),
(40, 'فحص مجانى', 20, 2, '2019-11-24 08:27:01', NULL),
(41, 'Free inspection', 21, 1, '2019-11-24 08:28:03', NULL),
(42, 'فحص مجانى', 21, 2, '2019-11-24 08:28:03', NULL),
(43, 'leaser', 22, 1, '2019-11-25 21:21:13', NULL),
(44, 'ليزر', 22, 2, '2019-11-25 21:21:13', NULL),
(47, 'اعلان مطعم', 24, 1, '2019-12-30 08:31:03', NULL),
(48, 'resturant ad', 24, 2, '2019-12-30 08:31:03', NULL),
(49, 'اعلان عيادة', 25, 1, '2019-12-30 08:31:46', NULL),
(50, 'Clinic Ad', 25, 2, '2019-12-30 08:31:46', NULL),
(51, 'اعلان مستشفي', 26, 1, '2019-12-30 08:32:24', NULL),
(52, 'hospital ad', 26, 2, '2019-12-30 08:32:24', NULL),
(53, 'ad', 27, 1, '2020-01-14 08:24:09', NULL),
(54, 'catering ad', 27, 2, '2019-12-30 08:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `apps_countries`
--

CREATE TABLE `apps_countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `country_a_name` varchar(100) NOT NULL,
  `phonecode` smallint(6) NOT NULL,
  `phone_num` int(11) DEFAULT NULL,
  `Currency` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apps_countries`
--

INSERT INTO `apps_countries` (`id`, `country_code`, `country_name`, `country_a_name`, `phonecode`, `phone_num`, `Currency`, `isActive`) VALUES
(3, 'DZ', 'Algeria', 'الجزائر', 213, NULL, 'دينار جزائري', 0),
(4, 'DS', 'American Samoa', 'ساموا-الأمريكي', 1684, NULL, 'دولار أمريكي', 0),
(5, 'AD', 'Andorra', 'أندورا', 376, NULL, 'يورو', 0),
(6, 'AO', 'Angola', 'أنغولا', 244, NULL, 'كوانزا أنغولي', 0),
(7, 'AI', 'Anguilla', 'أنغويلا', 1264, NULL, 'كوانزا أنغولي', 0),
(8, 'AQ', 'Antarctica', 'أنتاركتيكا', 672, NULL, 'الدولار الأنتركتيكي', 0),
(9, 'AG', 'Antigua and Barbuda', 'أنتيغوا وبربودا', 1, NULL, 'دولار شرق الكاريبي', 0),
(10, 'AR', 'Argentina', 'الأرجنتين', 54, NULL, 'بيزو', 0),
(11, 'AM', 'Armenia', 'أرمينيا', 374, NULL, 'الدرهم الارميني', 0),
(12, 'AW', 'Aruba', 'أروبه', 297, NULL, 'فلورن أروبي', 0),
(13, 'AU', 'Australia', 'أستراليا', 61, NULL, 'دولار الأسترالي', 0),
(14, 'AT', 'Austria', 'النمسا', 43, NULL, 'يورو', 0),
(15, 'AZ', 'Azerbaijan', 'أذربيجان', 994, NULL, 'مانات أذربيجاني', 0),
(16, 'BS', 'Bahamas', 'الباهاماس', 1, NULL, 'دولار بهامي', 0),
(17, 'BH', 'Bahrain', 'البحرين', 973, 8, 'الدينار البحريني', 1),
(18, 'BD', 'Bangladesh', 'بنغلاديش', 880, NULL, 'تاكا بنغلاديشي', 0),
(19, 'BB', 'Barbados', 'بربادوس', 1, NULL, 'دولار بربادوسي', 0),
(20, 'BY', 'Belarus', 'روسيا البيضاء', 375, NULL, 'روبل بلاروسي', 0),
(21, 'BE', 'Belgium', 'بلجيكا', 32, NULL, 'يورو', 0),
(22, 'BZ', 'Belize', 'بيليز', 501, NULL, 'دولار بليزي', 0),
(23, 'BJ', 'Benin', 'بنين', 229, NULL, 'فرنك غرب أفريقي', 0),
(24, 'BM', 'Bermuda', 'جزر برمودا', 1, NULL, 'دولار برمودي', 0),
(25, 'BT', 'Bhutan', 'بوتان', 975, NULL, 'نغولترم بوتاني', 0),
(26, 'BO', 'Bolivia', 'بوليفيا', 591, NULL, 'بوليفاريو بوليفي', 0),
(27, 'BA', 'Bosnia and Herzegovina', 'البوسنة و الهرسك', 387, NULL, 'مارك بوسني', 0),
(28, 'BW', 'Botswana', 'بوتسوانا', 267, NULL, 'بوتسوانا بولا', 0),
(29, 'BV', 'Bouvet Island', 'جزيرة بوفيه', 47, NULL, 'كرون النرويجي', 0),
(30, 'BR', 'Brazil', 'البرازيل', 55, NULL, 'ريال برازيلي', 0),
(31, 'IO', 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', 246, NULL, 'دولار أمريكي', 0),
(32, 'BN', 'Brunei Darussalam', 'بروني', 673, NULL, 'دولار بروني', 0),
(33, 'BG', 'Bulgaria', 'بلغاريا', 359, NULL, 'ليف بلغاري', 0),
(34, 'BF', 'Burkina Faso', 'بوركينا فاسو', 226, NULL, 'فرنك غرب أفريقي', 0),
(35, 'BI', 'Burundi', 'بوروندي', 257, NULL, 'فرنك بوروندي', 0),
(36, 'KH', 'Cambodia', 'كمبوديا', 855, NULL, 'ريال كمبودي', 0),
(37, 'CM', 'Cameroon', 'كاميرون', 237, NULL, 'فرنك وسط أفريقي', 0),
(38, 'CA', 'Canada', 'كندا', 1, NULL, 'دولار كندي', 0),
(39, 'CV', 'Cape Verde', 'الرأس الأخضر', 238, NULL, 'إيسكودو', 0),
(40, 'KY', 'Cayman Islands', 'جزر كايمان', 1345, NULL, 'دولار جزر كايمان', 0),
(41, 'CF', 'Central African Republic', 'جمهورية أفريقيا الوسطى', 236, NULL, 'فرنك وسط أفريقي', 0),
(42, 'TD', 'Chad', 'تشاد', 235, NULL, 'فرنك وسط أفريقي', 0),
(43, 'CL', 'Chile', 'شيلي', 56, NULL, 'بيزو تشيلي', 0),
(44, 'CN', 'China', 'جمهورية الصين الشعبية', 86, NULL, 'رنمينبي', 0),
(45, 'CX', 'Christmas Island', 'جزيرة عيد الميلاد', 672, NULL, 'دولار أسترالي', 0),
(46, 'CC', 'Cocos (Keeling) Islands', 'جزر كوكوس', 672, NULL, 'دولار أسترالي', 0),
(47, 'CO', 'Colombia', 'كولومبيا', 57, NULL, 'بيزو كولومبي', 0),
(48, 'KM', 'Comoros', 'جزر القمر', 269, NULL, 'فرنك قمري', 0),
(49, 'CG', 'Congo', 'جمهورية الكونغو الديمقراطية', 242, NULL, 'فرنك كونغولي', 0),
(50, 'CK', 'Cook Islands', 'جزر كوك', 682, NULL, ' دولار جزر كوك', 0),
(51, 'CR', 'Costa Rica', 'كوستاريكا', 506, NULL, 'كولون كوستاريكي', 0),
(52, 'HR', 'Croatia (Hrvatska)', 'كرواتيا', 385, NULL, 'كونا كرواتية', 0),
(53, 'CU', 'Cuba', 'كوبا', 53, NULL, 'بيزو كوبي', 0),
(54, 'CY', 'Cyprus', 'قبرص', 357, NULL, 'يورو', 0),
(55, 'CZ', 'Czech Republic', 'الجمهورية التشيكية', 420, NULL, 'كرونة تشيكية', 0),
(56, 'DK', 'Denmark', 'الدانمارك', 45, NULL, 'كرونة دنماركية', 0),
(57, 'DJ', 'Djibouti', 'جيبوتي', 253, NULL, 'فرنك جيبوتي', 0),
(58, 'DM', 'Dominica', 'دومينيكا', 1767, NULL, 'دولار شرق الكاريبي', 0),
(59, 'DO', 'Dominican Republic', 'الجمهورية الدومينيكية', 1809, NULL, 'بيزو دومنيكاني', 0),
(60, 'TP', 'East Timor', 'تيمور الشرقية', 670, NULL, 'دولار أمريكي', 0),
(61, 'EC', 'Ecuador', 'إكوادور', 593, NULL, 'دولار أمريكي', 0),
(62, 'EG', 'Egypt', 'مصر', 20, 10, 'الجنيه', 1),
(63, 'SV', 'El Salvador', 'إلسلفادور', 503, NULL, 'دولار أمريكي', 0),
(64, 'GQ', 'Equatorial Guinea', 'غينيا الاستوائي', 240, NULL, 'فرنك وسط أفريقي', 0),
(65, 'ER', 'Eritrea', 'إريتريا', 291, NULL, 'ناكفا', 0),
(66, 'EE', 'Estonia', 'استونيا', 372, NULL, 'يورو', 0),
(67, 'ET', 'Ethiopia', 'أثيوبيا', 251, NULL, 'بير إثيوبي', 0),
(68, 'FK', 'Falkland Islands (Malvinas)', 'جزر فوكلاند', 500, NULL, 'جنيه جزر فوكلاند', 0),
(69, 'FO', 'Faroe Islands', 'جزر فارو', 298, NULL, 'كرونة فاروية', 0),
(70, 'FJ', 'Fiji', 'فيجي', 679, NULL, 'دولار فيجي', 0),
(71, 'FI', 'Finland', 'فنلندا', 358, NULL, 'يورو', 0),
(72, 'FR', 'France', 'فرنسا', 33, NULL, 'يورو', 0),
(73, 'FX', 'France, Metropolitan', 'فرنسا متروبوليتان', 33, NULL, 'يورو', 0),
(74, 'GF', 'French Guiana', 'غويانا الفرنسية', 33, NULL, 'يورو', 0),
(75, 'PF', 'French Polynesia', 'بولينزيا الفرنسية', 689, NULL, 'يورو', 0),
(76, 'TF', 'French Southern Territories', 'أراض فرنسية جنوبية وأنتارتيكية', 33, NULL, 'يورو', 0),
(77, 'GA', 'Gabon', 'الغابون', 241, NULL, 'فرنك وسط أفريقي', 0),
(78, 'GM', 'Gambia', 'غامبيا', 220, NULL, 'دالاسي غامبي', 0),
(79, 'GE', 'Georgia', 'جيورجيا', 995, NULL, 'لاري جورجي', 0),
(80, 'DE', 'Germany', 'ألمانيا', 49, NULL, 'يورو', 0),
(81, 'GH', 'Ghana', 'غانا', 233, NULL, 'سيدي غاني', 0),
(82, 'GI', 'Gibraltar', 'جبلطارق', 350, NULL, 'جنيه إسترليني', 0),
(83, 'GK', 'Guernsey', 'جيرنزي', 44, NULL, 'جنيه إسترليني', 0),
(84, 'GR', 'Greece', 'اليونان', 30, NULL, 'يورو', 0),
(85, 'GL', 'Greenland', 'جرينلاند', 299, NULL, 'كرونة دنماركية', 0),
(86, 'GD', 'Grenada', 'غرينادا', 1473, NULL, 'دولار شرق الكاريبي', 0),
(87, 'GP', 'Guadeloupe', 'جزر جوادلوب', 33, NULL, 'يورو', 0),
(88, 'GU', 'Guam', 'جوام', 671, NULL, 'دولار أمريكي', 0),
(89, 'GT', 'Guatemala', 'غواتيمال', 502, NULL, 'كتزال غواتيمالي', 0),
(90, 'GN', 'Guinea', 'غينيا', 224, NULL, 'فرنك غيني', 0),
(91, 'GW', 'Guinea-Bissau', 'غينيا-بيساو', 254, NULL, 'فرنك غرب أفريقي', 0),
(92, 'GY', 'Guyana', 'غيانا', 592, NULL, 'دولار غياني', 0),
(93, 'HT', 'Haiti', 'هايتي', 509, NULL, 'جوردة هايتية', 0),
(95, 'HN', 'Honduras', 'هندوراس', 504, NULL, 'لمبيرة هندوراسية', 0),
(96, 'HK', 'Hong Kong', 'هونج كونج', 852, NULL, 'دولار', 0),
(97, 'HU', 'Hungary', 'المجر', 36, NULL, 'فورنت مجري', 0),
(98, 'IS', 'Iceland', 'آيسلندا', 354, NULL, 'كرونة آيسلندية', 0),
(99, 'IN', 'India', 'الهند', 91, NULL, 'الروبية الهندية', 0),
(100, 'IM', 'Isle of Man', 'جزيرة مان', 44, NULL, 'جنيه إسترليني', 0),
(101, 'ID', 'Indonesia', 'أندونيسيا', 62, NULL, 'روبية إندونيسية', 0),
(102, 'IR', 'Iran (Islamic Republic of)', 'إيران', 98, NULL, 'ريال إيراني', 0),
(103, 'IQ', 'Iraq', 'العراق', 964, NULL, 'دينار عراقي', 0),
(104, 'IE', 'Ireland', 'إيرلندا', 353, NULL, 'يورو', 0),
(105, 'IL', 'Israel', 'إسرائيل', 972, NULL, 'شيكل', 0),
(106, 'IT', 'Italy', 'إيطاليا', 39, NULL, 'يورو', 0),
(107, 'CI', 'Ivory Coast', 'ساحل العاج', 225, NULL, 'فرنك غرب أفريقي', 0),
(108, 'JE', 'Jersey', 'جيرزي', 44, NULL, 'جنيه إسترليني', 0),
(109, 'JM', 'Jamaica', 'جمايكا', 1876, NULL, 'دولار جامايكي', 0),
(110, 'JP', 'Japan', 'اليابان', 81, NULL, 'ين ياباني', 0),
(111, 'JO', 'Jordan', 'الأردن', 962, NULL, 'دينار أردني', 0),
(112, 'KZ', 'Kazakhstan', 'كازاخستان', 7, NULL, 'تينغ كازاخستاني', 0),
(113, 'KE', 'Kenya', 'كينيا', 254, NULL, 'شيلينغ كيني', 0),
(114, 'KI', 'Kiribati', 'كيريباتي', 686, NULL, 'دولار كريباتي', 0),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 'كوريا الشمالية', 850, NULL, 'وون كوري', 0),
(116, 'KR', 'Korea, Republic of', 'كوريا', 82, NULL, 'وون كوري', 0),
(117, 'XK', 'Kosovo', 'كوسوفو', 383, NULL, 'يورو', 0),
(118, 'KW', 'Kuwait', 'الكويت', 965, NULL, 'دينار', 0),
(119, 'KG', 'Kyrgyzstan', 'قيرغيزستان', 996, NULL, 'سوم قيرغيزستاني', 0),
(120, 'LA', 'Lao People\'s Democratic Republic', 'لاوس', 856, NULL, 'كيب لاوي', 0),
(121, 'LV', 'Latvia', 'لاتفيا', 371, NULL, 'يورو', 0),
(122, 'LB', 'Lebanon', 'لبنان', 961, NULL, 'ليرة لبنانية', 0),
(123, 'LS', 'Lesotho', 'ليسوتو', 266, NULL, 'لوتي ليسوتو', 0),
(124, 'LR', 'Liberia', 'ليبيريا', 231, NULL, 'دولار ليبيري', 0),
(125, 'LY', 'Libyan Arab Jamahiriya', 'ليبيا', 218, NULL, 'دينار ليبي', 0),
(126, 'LI', 'Liechtenstein', 'ليختنشتين', 423, NULL, 'فرنك سويسري', 0),
(127, 'LT', 'Lithuania', 'لتوانيا', 370, NULL, 'يورو', 0),
(128, 'LU', 'Luxembourg', 'لوكسمبورغ', 352, NULL, 'يورو', 0),
(129, 'MO', 'Macau', 'ماكاو', 853, NULL, 'باتاكا ماكاوية', 0),
(130, 'MK', 'Macedonia', 'جمهورية مقدونيا', 389, NULL, 'دينار مقدوني', 0),
(131, 'MG', 'Madagascar', 'مدغشقر', 261, NULL, 'أرياري مدغشقري', 0),
(132, 'MW', 'Malawi', 'مالاوي', 265, NULL, 'كواشا ملاوية', 0),
(133, 'MY', 'Malaysia', 'ماليزيا', 60, NULL, 'رينغيت ماليزي', 0),
(134, 'MV', 'Maldives', 'المالديف', 960, NULL, 'روفيه مالديفية', 0),
(135, 'ML', 'Mali', 'مالي', 223, NULL, 'فرنك غرب أفريقي', 0),
(136, 'MT', 'Malta', 'مالطا', 356, NULL, 'يورو', 0),
(137, 'MH', 'Marshall Islands', 'جزر مارشال', 692, NULL, 'دولار أمريكي', 0),
(138, 'MQ', 'Martinique', 'مارتينيك', 596, NULL, 'يورو', 0),
(139, 'MR', 'Mauritania', 'موريتانيا', 222, NULL, 'أوقية موريتانية', 0),
(140, 'MU', 'Mauritius', 'موريشيوس', 230, NULL, 'روبي موريشي', 0),
(141, 'TY', 'Mayotte', 'مايوت', 262, NULL, 'يورو', 0),
(142, 'MX', 'Mexico', 'المكسيك', 52, NULL, 'بيزو مكسيكي', 0),
(143, 'FM', 'Micronesia, Federated States of', 'ولايات ميكرونيسيا المتحدة', 691, NULL, 'دولار أمريكي', 0),
(144, 'MD', 'Moldova, Republic of', 'مولدافيا', 373, NULL, 'ليو مولدوفي', 0),
(145, 'MC', 'Monaco', 'موناكو', 377, NULL, 'يورو', 0),
(146, 'MN', 'Mongolia', 'منغوليا', 976, NULL, 'توغروغ منغولي', 0),
(147, 'ME', 'Montenegro', 'الجبلالأسو', 382, NULL, 'يورو', 0),
(148, 'MS', 'Montserrat', 'مونتسيرات', 664, NULL, 'دولار', 0),
(149, 'MA', 'Morocco', 'المغرب', 212, NULL, 'درهم مغربي', 0),
(150, 'MZ', 'Mozambique', 'موزمبيق', 258, NULL, 'متكال موزمبيقي', 0),
(151, 'MM', 'Myanmar', 'ميانمار', 95, NULL, 'كيات ميانماري', 0),
(152, 'NA', 'Namibia', 'ناميبيا', 264, NULL, 'دولار', 0),
(153, 'NR', 'Nauru', 'نورو', 674, NULL, 'دولار أسترالي', 0),
(154, 'NP', 'Nepal', 'نيبال', 977, NULL, 'روبية نيبالية', 0),
(155, 'NL', 'Netherlands', 'هولندا', 31, NULL, 'يورو', 0),
(156, 'AN', 'Netherlands Antilles', 'جزر الأنتيل الهولندي', 599, NULL, 'الغويلدر', 0),
(157, 'NC', 'New Caledonia', 'كاليدونيا الجديدة', 687, NULL, 'فرنك س ف ب', 0),
(158, 'NZ', 'New Zealand', 'نيوزيلندا', 64, NULL, 'دولار نيوزيلندي', 0),
(159, 'NI', 'Nicaragua', 'نيكاراجوا', 505, NULL, 'كوردبا نيكاراغوا', 0),
(160, 'NE', 'Niger', 'النيجر', 227, NULL, 'فرنك غرب أفريقي', 0),
(161, 'NG', 'Nigeria', 'نيجيريا', 234, NULL, 'نيرة نيجيرية', 0),
(162, 'NU', 'Niue', 'ني', 683, NULL, 'دولار نيوزيلندي', 0),
(163, 'NF', 'Norfolk Island', 'جزيرة نورفولك', 672, NULL, 'دولار أسترالي', 0),
(164, 'MP', 'Northern Mariana Islands', 'جزر ماريانا الشمالية', 1670, NULL, 'دولار أمريكي', 0),
(165, 'NO', 'Norway', 'النرويج', 47, NULL, 'كرونة نروجية', 0),
(166, 'OM', 'Oman', 'عُمان', 968, NULL, 'ريال عماني', 0),
(167, 'PK', 'Pakistan', 'باكستان', 92, NULL, 'روبية باكستانية', 0),
(168, 'PW', 'Palau', 'بالاو', 680, NULL, 'دولار أمريكي', 0),
(169, 'PS', 'Palestine', 'فلسطين', 970, NULL, 'جنيه فلسطيني', 0),
(170, 'PA', 'Panama', 'بنما', 507, NULL, 'بالبوا بنمي', 0),
(171, 'PG', 'Papua New Guinea', 'بابو اغينيا الجديدة', 675, NULL, 'كينا بابوا', 0),
(172, 'PY', 'Paraguay', 'باراغواي', 595, NULL, 'غواراني باراغواي', 0),
(173, 'PE', 'Peru', 'بيرو', 51, NULL, 'سول بيروفي جديد', 0),
(174, 'PH', 'Philippines', 'الفليبين', 63, NULL, 'بيسو فلبيني', 0),
(175, 'PN', 'Pitcairn', 'جزر بيتكيرن', 672, NULL, 'دولار نيوزيلندي', 0),
(176, 'PL', 'Poland', 'بولونيا', 48, NULL, 'زلوتي بولندي', 0),
(177, 'PT', 'Portugal', 'البرتغال', 351, NULL, 'يورو', 0),
(178, 'PR', 'Puerto Rico', 'بورتوريكو', 1787, NULL, 'دولار أمريكي', 0),
(179, 'QA', 'Qatar', 'قطر', 974, 8, 'ريال القطري', 1),
(180, 'RE', 'Reunion', 'لا ريونيون', 262, NULL, 'يورو', 0),
(181, 'RO', 'Romania', 'رومانيا', 40, NULL, 'ليو روماني', 0),
(182, 'RU', 'Russian Federation', 'روسيا', 7, NULL, 'روبل روسي', 0),
(183, 'RW', 'Rwanda', 'رواندا', 250, NULL, 'فرنك رواندي', 0),
(184, 'KN', 'Saint Kitts and Nevis', 'سانت كيتس ونيفيس', 1869, NULL, 'دولار شرق الكاريبي', 0),
(185, 'LC', 'Saint Lucia', 'سانت لوسيا', 1758, NULL, 'دولار شرق الكاريبي', 0),
(186, 'VC', 'Saint Vincent and the Grenadines', 'سانت فينسنت والغرينادين', 1784, NULL, 'دولار شرق الكاريبي', 0),
(187, 'WS', 'Samoa', 'المناطق', 685, NULL, 'تالا ساموي', 0),
(188, 'SM', 'San Marino', 'سان مارينو', 378, NULL, 'يورو', 0),
(189, 'ST', 'Sao Tome and Principe', 'ساو توميو برينسيبي', 239, NULL, 'دوبرا ساو', 0),
(190, 'SA', 'Saudi Arabia', 'المملكة العربية السعودية', 966, 9, 'الريال', 1),
(191, 'SN', 'Senegal', 'السنغال', 221, NULL, 'فرنك غرب أفريقي', 0),
(192, 'RS', 'Serbia', 'جمهورية صربيا', 381, NULL, 'دينار صربي', 0),
(193, 'SC', 'Seychelles', 'سيشيل', 248, NULL, 'روبية سيشلية', 0),
(194, 'SL', 'Sierra Leone', 'سيراليون', 232, NULL, 'ليون سيراليوني', 0),
(195, 'SG', 'Singapore', 'سنغافورة', 65, NULL, 'دولار سنغافوري', 0),
(196, 'SK', 'Slovakia', 'سلوفاكيا', 421, NULL, 'يورو', 0),
(197, 'SI', 'Slovenia', 'سلوفينيا', 386, NULL, 'يورو', 0),
(198, 'SB', 'Solomon Islands', 'جزرسليمان', 677, NULL, 'دولار', 0),
(199, 'SO', 'Somalia', 'الصومال', 252, NULL, 'شلن صومالي', 0),
(200, 'ZA', 'South Africa', 'جنوب أفريقيا', 27, NULL, 'راند ', 0),
(201, 'GS', 'South Georgia South Sandwich Islands', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية', 500, NULL, 'جنيه إسترليني', 0),
(202, 'ES', 'Spain', 'إسبانيا', 34, NULL, 'يورو', 0),
(203, 'LK', 'Sri Lanka', 'سريلانكا', 94, NULL, 'روبية سريلانكي', 0),
(204, 'SH', 'St. Helena', 'سانت هيلانة', 290, NULL, 'جنيه', 0),
(205, 'PM', 'St. Pierre and Miquelon', 'سان بيير وميكلون', 508, NULL, 'يورو', 0),
(206, 'SD', 'Sudan', 'السودان', 249, NULL, 'جنيه سوداني', 0),
(207, 'SR', 'Suriname', 'سورينام', 597, NULL, 'دولار سورينامي', 0),
(209, 'SZ', 'Swaziland', 'سوازيلند', 268, NULL, 'ليلانغيني سوازيلندي', 0),
(210, 'SE', 'Sweden', 'السويد', 46, NULL, 'كرونة سويدية', 0),
(211, 'CH', 'Switzerland', 'سويسرا', 41, NULL, 'فرنك سويسري', 0),
(212, 'SY', 'Syrian Arab Republic', 'سوريا', 963, NULL, 'ليرة سورية', 0),
(213, 'TW', 'Taiwan', 'تايوان', 886, NULL, 'دولار تايواني', 0),
(214, 'TJ', 'Tajikistan', 'طاجيكستان', 992, NULL, 'ساماني طاجيكي', 0),
(215, 'TZ', 'Tanzania, United Republic of', 'تنزانيا', 255, NULL, 'شيلينغ تانزاني', 0),
(216, 'TH', 'Thailand', 'تايلندا', 66, NULL, 'بات تايلاندي', 0),
(217, 'TG', 'Togo', 'توغو', 228, NULL, 'فرنك أفريقي', 0),
(218, 'TK', 'Tokelau', 'توكيلاو', 690, NULL, 'دولار نيوزيلندي', 0),
(219, 'TO', 'Tonga', 'تونغا', 676, NULL, 'بانغا تونغي', 0),
(220, 'TT', 'Trinidad and Tobago', 'ترينيدادوتوباغو', 1868, NULL, 'دولار ترينيداد', 0),
(221, 'TN', 'Tunisia', 'تونس', 216, NULL, 'دينار تونسي', 0),
(222, 'TR', 'Turkey', 'تركيا', 90, NULL, 'ليرة تركية', 0),
(223, 'TM', 'Turkmenistan', 'تركمانستان', 993, NULL, 'منات تركمانستاني', 0),
(224, 'TC', 'Turks and Caicos Islands', 'جزر توركس وكايكوس', 1649, NULL, 'دولار أمريكي', 0),
(225, 'TV', 'Tuvalu', 'توفالو', 688, NULL, 'دولار', 0),
(226, 'UG', 'Uganda', 'أوغندا', 256, NULL, 'شيلينغ أوغندي', 0),
(227, 'UA', 'Ukraine', 'أوكرانيا', 380, NULL, 'هريفنا أوكرانية', 0),
(228, 'AE', 'United Arab Emirates', 'الإمارات العرب', 971, NULL, 'درهم', 0),
(229, 'GB', 'United Kingdom', 'المملكةالمتحدة', 44, NULL, 'الجنيه الاسترليني', 0),
(230, 'US', 'United States', 'الولايات المتحدة', 1, NULL, 'دولار', 0),
(231, 'UM', 'United States minor outlying islands', 'جزر الولايات المتحدة الصغيرة النائية', 1, NULL, 'دولار', 0),
(232, 'UY', 'Uruguay', 'أورغواي', 598, NULL, 'بيزو أوروغواي', 0),
(233, 'UZ', 'Uzbekistan', 'أوزباكستان', 7, NULL, 'سوم أوزبكستاني', 0),
(234, 'VU', 'Vanuatu', 'فانواتو', 678, NULL, 'فاتو فانواتي', 0),
(235, 'VA', 'Vatican City State', 'الفاتيكان', 264, NULL, 'يورو', 0),
(236, 'VE', 'Venezuela', 'فنزويلا', 58, NULL, 'بوليفار فنزويلي', 0),
(237, 'VN', 'Vietnam', 'فيتنام', 84, NULL, 'دونغ فيتنامي', 0),
(238, 'VG', 'Virgin Islands (British)', 'جزر العذراء البريطانية', 1284, NULL, 'دولار أمريكي', 0),
(239, 'VI', 'Virgin Islands (U.S.)', 'جزر العذراء الأمريكية', 1340, NULL, 'دولار أمريكي', 0),
(240, 'WF', 'Wallis and Futuna Islands', 'واليس وفوتونا', 681, NULL, 'فرنك س ف ب', 0),
(241, 'EH', 'Western Sahara', 'الصحراء الغربية', 212, NULL, 'درهم مغربي', 0),
(242, 'YE', 'Yemen', 'اليمن', 967, NULL, 'ريال يمني', 0),
(243, 'ZR', 'Zaire', 'جمهورية الكونغو الديمقراطية', 93, NULL, 'فرنك كونغولي', 0),
(244, 'ZM', 'Zambia', 'زامبيا', 260, NULL, 'كواشا زامبي', 0),
(245, 'ZW', 'Zimbabwe', 'زمبابوي', 263, NULL, ' دولار أمريكي', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catering`
--

CREATE TABLE `catering` (
  `catering_id` int(11) NOT NULL,
  `catering_latitude` varchar(100) NOT NULL,
  `catering_longitude` varchar(100) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catering`
--

INSERT INTO `catering` (`catering_id`, `catering_latitude`, `catering_longitude`, `city_id`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(1, '4545', '45', 3, 1, 1, '2020-01-14 09:08:52', NULL),
(2, '685416845165', '654198654126', 1, 1, 1, '2019-12-24 10:43:08', NULL),
(3, '584', '555', 4, 1, 1, '2019-12-24 10:54:06', NULL),
(4, '584', '555', 4, 1, 1, '2019-12-24 10:57:27', NULL),
(7, '5655.156154', '5656894.564', 3, 1, 1, '2020-01-08 08:10:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catering_description`
--

CREATE TABLE `catering_description` (
  `catering_description_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `catering_name` varchar(50) NOT NULL,
  `catering_description_part` varchar(150) NOT NULL,
  `catering_description_full` text NOT NULL,
  `catering_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catering_description`
--

INSERT INTO `catering_description` (`catering_description_id`, `language_id`, `catering_name`, `catering_description_part`, `catering_description_full`, `catering_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Saudia Catering', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, '2019-12-18 09:03:47', NULL),
(2, 2, 'السعودية للتموين', 'لوريم', 'تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبىً', 1, '2020-01-14 09:10:03', NULL),
(3, 1, 'Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 2, '2019-12-24 10:43:08', NULL),
(4, 2, 'لوريم إيبسوم', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 2, '2019-12-24 10:43:08', NULL),
(9, 1, 'Oriental Food 4', 'fdej nkjn jngkjn rnjnjkrn n', 'i jijli flieifldefk ikif iif knf n', 7, '2020-01-14 08:22:37', NULL),
(10, 2, 'مأكولات شرقية رار 2', 'نب نلبيمنى لنىبينى بىم ىلمبن ُ', 'بنى نلقنم نقنن ىنلقى نلقن قن ً', 7, '2020-01-14 08:23:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `population` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `population`, `location`, `country_id`, `is_used`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4205961, 'https://www.google.com/maps/?q=24.68773,46.72185', 1, 0, 1, '2019-12-30 10:38:36', NULL),
(2, 2867446, 'https://www.google.com/maps/?q=21.54238,39.19797', 1, 0, 1, '2019-12-30 10:38:40', NULL),
(3, 1323624, 'https://www.google.com/maps/?q=21.42664,39.82563', 1, 0, 1, '2019-12-30 10:38:42', NULL),
(4, 1300000, 'https://www.google.com/maps/?q=24.46861,39.61417', 1, 0, 1, '2019-12-30 10:38:44', NULL),
(6, 768602, 'https://www.google.com/maps/?q=26.43442,50.10326', 1, 0, 1, '2019-12-30 11:27:55', NULL),
(92, NULL, NULL, 3, 0, 1, '2019-12-30 12:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city_description`
--

CREATE TABLE `city_description` (
  `city_description_id` int(11) NOT NULL,
  `city_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city_description`
--

INSERT INTO `city_description` (`city_description_id`, `city_name`, `city_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'Riyadh', 1, 1, '2019-12-30 10:33:11', NULL),
(2, 'مدينة الرياض', 1, 2, '2019-12-30 10:36:26', NULL),
(3, 'Jeddah', 2, 1, '2019-12-30 10:33:11', NULL),
(4, 'جدة', 2, 2, '2019-12-30 10:36:38', NULL),
(5, 'Mecca', 3, 1, '2019-12-30 10:33:11', NULL),
(6, 'مكة المكرمة', 3, 2, '2019-12-30 10:36:47', NULL),
(7, 'Medina', 4, 1, '2019-12-30 10:33:11', NULL),
(8, 'المدينة المنورة', 4, 2, '2019-12-30 10:37:00', NULL),
(11, 'Dammam', 6, 1, '2019-12-30 10:33:11', NULL),
(12, 'الدمام', 6, 2, '2019-12-30 10:37:16', NULL),
(183, 'LA', 92, 1, '2019-12-30 12:09:58', NULL),
(184, 'لوس انجلوس', 92, 2, '2019-12-30 12:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `clinic_id` int(11) NOT NULL,
  `clinic_latitude` varchar(100) DEFAULT NULL,
  `clinic_longitude` varchar(100) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `clinic_latitude`, `clinic_longitude`, `city_id`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(1, '4545', '4545', 3, 1, 1, '2020-01-14 09:02:59', NULL),
(4, '123457000', '123457000', NULL, NULL, 1, '2019-11-14 07:25:42', NULL),
(5, '854655', '5548900', NULL, NULL, 1, '2019-11-20 07:54:42', NULL),
(10, NULL, NULL, NULL, NULL, 1, '2019-11-20 10:54:08', NULL),
(11, NULL, NULL, NULL, NULL, 1, '2019-11-20 11:13:54', NULL),
(13, NULL, NULL, NULL, NULL, 1, '2019-11-22 15:18:28', NULL),
(14, NULL, NULL, NULL, NULL, 1, '2019-11-22 15:25:23', NULL),
(15, NULL, NULL, NULL, NULL, 1, '2019-11-22 15:32:45', NULL),
(16, NULL, NULL, NULL, NULL, 1, '2019-11-25 20:47:44', NULL),
(17, NULL, NULL, NULL, NULL, 1, '2019-11-25 20:50:23', NULL),
(19, '7777', '2222', 1, 1, 1, '2019-12-19 08:07:55', NULL),
(20, NULL, NULL, NULL, NULL, 1, '2019-12-19 08:43:19', NULL),
(22, '159753', '951753', 1, 1, 1, '2019-12-24 09:03:10', NULL),
(27, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:11:06', NULL),
(28, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:38:07', NULL),
(29, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:40:54', NULL),
(30, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:42:25', NULL),
(31, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:43:16', NULL),
(32, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:48:12', NULL),
(33, NULL, NULL, NULL, NULL, 1, '2019-12-25 12:55:47', NULL),
(34, NULL, NULL, NULL, NULL, 1, '2019-12-25 13:00:24', NULL),
(35, NULL, NULL, NULL, NULL, 1, '2019-12-25 13:00:57', NULL),
(36, NULL, NULL, NULL, NULL, 1, '2020-01-02 09:19:44', NULL),
(38, NULL, NULL, NULL, NULL, 1, '2020-01-06 13:07:23', NULL),
(40, NULL, NULL, NULL, NULL, 1, '2020-01-08 11:43:42', NULL),
(42, '456665', '258.5', 1, 1, 1, '2020-01-14 08:52:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clinic_description`
--

CREATE TABLE `clinic_description` (
  `clinic_description_id` int(11) NOT NULL,
  `clinic_name` varchar(50) NOT NULL,
  `clinic_description_part` varchar(150) DEFAULT NULL,
  `clinic_description_full` text,
  `clinic_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clinic_description`
--

INSERT INTO `clinic_description` (`clinic_description_id`, `clinic_name`, `clinic_description_part`, `clinic_description_full`, `clinic_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'Alhokama Eye Specialist Center xxx 5', 'Islamic universities first appeared in the world two centuries before Europe, where the Univers', 'The name of the Elders Specialized Eye Center came to complement the succe,ss of our Muslim scholars and include the history of Islamic medicine from its beginnings to our time.And the name of the Elders evokes the wisdom and cultural history of Muslims and the services provided to patients of ophthalmology are a combination of our history and the latest findings of medicine in our time.', 1, 1, '2020-01-14 08:17:13', NULL),
(2, 'مركز الحكماء للعيون 5', 'ظهرت الجامعات الإسلامية لأول مرة بالعالم قبل أوروبا بقرنين حيث كانت', 'جاءت تسمية مركز الحكماء التخصصي للعيون لتكون إكمالاً لما خلفه علمائنا المسلمون وتضم تاريخ الطب الإسلامي منذ بداياته حتى عصرنا هذا وليكون اسم الحكماء مستحضراً الحكمة والتاريخ الثقافي للمسلمين ولتكون الخدمات المقدمة لمرضى طب وجراحة العيون مزيجاً من تاريخنا و أحدث ما توصل إليه الطب في عصرنا هذا.', 1, 2, '2020-01-14 08:16:32', NULL),
(5, 'Department of Oncology', 'The Oncology Department has a team of over 70 highly skilled doctors, researchers.', 'The Department of Hematology and Oncology / Bone Marrow Transplantation (BMT) treats about 100 new cases of cancer in children under 14 years of age each year, representing 15% of all new cases of childhood cancer in Saudi Arabia. Approximately 64% of these children are diagnosed with leukemia / lymphoma, 20% have solid tumors such as sarcoma, and 13% have brain tumors. Most of the bone marrow transplants are performed in the western region. Each year, the unit performs about 32 autologous / congenital stem cell transplants for children with malignant tumors, hemoglobinopathy, acute bone marrow failure such as aplastic anemia, severe immunodeficiency such as severe common immunodeficiency (SCID) and rare genetic disorders.', 4, 1, '2019-11-12 09:38:13', NULL),
(6, 'قسم الأورام', 'ضة وفنيين يتمتعون بدرجة عالية من المهارة ويقدمون رعاية طبية ومساعدة ممتازة للمرضى', 'يعالج قسم أمراض الدم والأورام / زراعة النخاع العظمي (BMT) حوالي 100 حالة سرطان جديدة في الأطفال أقل من 14 سنة من العمر كل سنة، وهو ما يمثل 15% من جميع حالات سرطان الأطفال الجديدة في المملكة العربية السعودية. عادة ما يتم تشخيص حوالي 64% من هؤلاء الأطفال بسرطان الدم / سرطان الغدد الليمفاوية، و20% توجد لديهم أورام صلبة مثل ساركوما، و 13% توجد لديهم أورام دماغية. يتولى القسم معظم عمليات زراعة النخاع العظمي للأطفال في المنطقة الغربية. وتقوم الوحدة كل عام بإجراء حوالي 32 عملية زرع للخلايا الجذعية الذاتية / الخلقية للأطفال المصابين بالأورام الخبيثة، واعتلال الهيموغلوبين، والفشل الحاد للنخاع العظمي مثل فقر الدم اللاتنسجي، ونقص المناعة الشديدة مثل العوز المناعي المشترك الشديد (SCID) والاضطرابات الوراثية النادرة.', 4, 2, '2019-11-12 09:38:14', NULL),
(7, 'Alhokama Eye Specialist Center', 'Islamic universities first appeared in the world two centuries before Europe, where the Univers', 'test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test', 5, 1, '2019-11-13 10:07:33', NULL),
(8, 'مركز الحكماء للعيون', 'ظهرت الجامعات الإسلامية لأول مرة بالعالم قبل أوروبا بقرنين حيث كانت', 'تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى تجريبى', 5, 2, '2019-11-13 10:07:33', NULL),
(17, 'one', NULL, NULL, 10, 1, '2019-11-20 10:54:08', NULL),
(18, 'واحد', NULL, NULL, 10, 2, '2019-11-20 10:54:08', NULL),
(19, 'two', NULL, NULL, 11, 1, '2019-11-20 10:57:31', NULL),
(20, 'اتنين', NULL, NULL, 11, 2, '2019-11-20 10:57:31', NULL),
(23, 'ENT', NULL, NULL, 13, 1, '2019-11-22 15:18:28', NULL),
(24, 'انف اذن وحنجره', NULL, NULL, 13, 2, '2019-11-22 15:18:28', NULL),
(25, 'enteryar', NULL, NULL, 14, 1, '2019-11-22 15:25:23', NULL),
(26, 'باطنيه', NULL, NULL, 14, 2, '2019-11-22 15:25:23', NULL),
(27, 'orthopedic', NULL, NULL, 15, 1, '2019-11-22 15:39:40', NULL),
(28, 'عظام', NULL, NULL, 15, 2, '2019-11-22 15:36:47', NULL),
(29, 'nos', NULL, NULL, 16, 1, '2019-11-25 20:47:44', NULL),
(30, 'انف اذن حنجره', NULL, NULL, 16, 2, '2019-11-25 20:47:44', NULL),
(31, 'inter', NULL, NULL, 17, 1, '2019-11-25 20:50:23', NULL),
(32, 'باطنيه', NULL, NULL, 17, 2, '2019-11-25 20:50:23', NULL),
(35, 'test', NULL, NULL, 20, 1, '2019-12-19 08:43:19', NULL),
(36, 'عيادة تجريبي', NULL, NULL, 20, 2, '2019-12-19 08:43:19', NULL),
(39, 'clinic two', 'two two two two two two two', 'two two two two two two two two two two two two two two two two two two two two two two two two two two two two', 22, 1, '2019-12-24 09:03:10', NULL),
(40, 'عياده اتنين', 'سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه', 'سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعه سبعهسبعه سبعه سبعه سبعه سبعه سبعه سبعه', 22, 2, '2019-12-24 09:03:10', NULL),
(49, '333333', NULL, NULL, 27, 1, '2019-12-25 12:11:06', NULL),
(50, '٢٢٢٢', NULL, NULL, 27, 2, '2019-12-25 12:23:46', NULL),
(51, 'clinic two', NULL, NULL, 28, 1, '2019-12-25 12:38:07', NULL),
(52, 'عياده ٢٢٢٢', NULL, NULL, 28, 2, '2019-12-25 12:38:07', NULL),
(53, 'ddjn jn  7', NULL, NULL, 29, 1, '2019-12-25 12:40:54', NULL),
(54, 'تىيت ة ى', NULL, NULL, 29, 2, '2019-12-25 12:40:54', NULL),
(55, 'clinic two', NULL, NULL, 30, 1, '2019-12-25 12:42:25', NULL),
(56, 'عياده اتنين ٢٢٢', NULL, NULL, 30, 2, '2019-12-25 12:42:25', NULL),
(57, 'clinic two2', NULL, NULL, 31, 1, '2019-12-25 12:43:16', NULL),
(58, 'عياده اربعه٢٢٢ ٢٢٢', NULL, NULL, 31, 2, '2019-12-25 12:43:16', NULL),
(59, 'clinic 2 jfj', NULL, NULL, 32, 1, '2019-12-25 12:48:12', NULL),
(60, 'عيادة تجريبي 222', NULL, NULL, 32, 2, '2019-12-25 12:48:12', NULL),
(61, 'x clinic', NULL, NULL, 33, 1, '2019-12-25 12:55:47', NULL),
(62, 'عيادة )', NULL, NULL, 33, 2, '2019-12-25 12:55:47', NULL),
(63, 'x clinic', NULL, NULL, 34, 1, '2019-12-25 13:00:24', NULL),
(64, 'عيادة تجريبي ۳۳', NULL, NULL, 34, 2, '2019-12-25 13:00:24', NULL),
(65, 'ujuji', NULL, NULL, 35, 1, '2019-12-25 13:00:57', NULL),
(66, 'jhghg ghg', NULL, NULL, 35, 2, '2019-12-25 13:00:57', NULL),
(67, 'x clinickk', NULL, NULL, 36, 1, '2020-01-02 09:19:35', NULL),
(68, 'عيادة تجريبي', NULL, NULL, 36, 2, '2020-01-02 09:17:52', NULL),
(71, 'eye', NULL, NULL, 38, 1, '2020-01-06 13:07:23', NULL),
(72, 'عيون', NULL, NULL, 38, 2, '2020-01-06 13:07:23', NULL),
(75, 'rngk jkjkk', NULL, NULL, 40, 1, '2020-01-08 11:43:42', NULL),
(76, 'لىي نىنبا تقب', NULL, NULL, 40, 2, '2020-01-08 11:43:42', NULL),
(79, 'r egre', 'f gregre', 'r geg re', 42, 1, '2020-01-14 08:52:57', NULL),
(80, 'لىي نىنبا تقب', 're لقث ل', 'لقث لقث ً', 42, 2, '2020-01-14 08:52:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clinic_doctor`
--

CREATE TABLE `clinic_doctor` (
  `clinic_doctor_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clinic_doctor`
--

INSERT INTO `clinic_doctor` (`clinic_doctor_id`, `clinic_id`, `doctor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-11-05 14:57:22', NULL),
(3, 4, 3, '2019-11-12 10:19:38', NULL),
(6, 10, 6, '2019-11-20 11:50:45', NULL),
(8, 14, 8, '2019-11-22 15:30:42', NULL),
(9, 15, 9, '2019-11-22 15:36:04', NULL),
(10, 16, 10, '2019-11-25 20:49:53', NULL),
(12, 17, 12, '2019-11-25 20:54:10', NULL),
(16, 1, 19, '2019-12-17 08:19:49', NULL),
(17, 5, 20, '2019-12-18 12:07:00', NULL),
(18, 20, 21, '2019-12-19 08:45:11', NULL),
(21, 1, 24, '2019-12-24 10:22:19', NULL),
(22, 34, 25, '2020-01-02 09:21:52', NULL),
(23, 38, 26, '2020-01-06 13:09:24', NULL),
(24, 38, 27, '2020-01-06 14:15:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comments_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `contact_message` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_read` tinyint(1) DEFAULT '0',
  `notify_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_message`, `contact_read`, `notify_read`, `created_at`, `updated_at`) VALUES
(1, 'Hassan Gamal', 'hassan@gmail.com', '01010101010', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, '2019-11-18 11:34:06', NULL),
(2, 'Hefnawy Hefnawy', 'mohammed@hefny.me', '01000922720', 'تجريبى', 1, 1, '2019-11-18 11:34:06', NULL),
(3, 'TEST', 'TEST@TEST.TEST', '01000922720', 'تجريبى تجريبى تجريبى', 1, 1, '2019-11-18 11:34:06', NULL),
(4, 'Mohamed', 'admin@kfshrc.edu.sa', '01010101010', 'helllllloooooooooooooooo', 1, 1, '2019-11-18 11:34:06', NULL),
(5, 'Mohamed', 'hassan.alex26@yahoo.com', '01066365287', 'asddsfhjkhgfdsa', 1, 1, '2019-11-18 11:34:06', NULL),
(15, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-11-21 08:41:30', NULL),
(7, 'Mohamed', 'hassan.alex26@yahoo.com', '01066365287', 'sadfsgsfsadasdsada', 1, 1, '2019-11-18 11:34:06', NULL),
(8, 'Emann', 'eman@yahoo.com', '01010101010', 'emasssssssssss', 1, 1, '2019-11-18 11:34:06', NULL),
(9, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01010101010', 'ssssssssssssssssssss', 1, 1, '2019-11-18 11:34:06', NULL),
(10, 'Mohamed', 'hassan.alex26@yahoo.com', '01066365287', 'ffdsfdsf', 1, 1, '2019-11-19 13:21:07', NULL),
(11, 'Mohamed', 'hassan.alex26@yahoo.com', '01225892522', 'fgnm,n', 1, 1, '2019-11-19 13:21:07', NULL),
(12, 'Mohamed', 'mohamed@yahoo.com', '01010101010', 'asdasdsadsadsaddasd', 1, 1, '2019-11-19 13:21:07', NULL),
(13, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-11-19 13:21:07', NULL),
(16, 'saifallak', 'saifallakx@gmail.com', '01129261192', 'sadasdasdasd', 1, 1, '2019-11-21 08:41:30', NULL),
(17, 'saifallak', 'saifallak@yahoo.com', '01129261195', 'gihi', 1, 1, '2019-11-21 08:41:30', NULL),
(18, 'saifallak', 'saifallak@yahoo.com', '01129261195', 'ىي يىية', 1, 1, '2019-11-21 08:41:30', NULL),
(19, 'muhmmed', 'midorock2009@hotmail.com', '201552427342', 'heyu', 1, 1, '2019-11-23 22:27:40', NULL),
(20, 'زياة', 'g@gmail.com', '0000000000', 'call me', 1, 1, '2019-11-25 20:59:29', NULL),
(21, 'test', 't@t.com', '123456', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(22, 'test', 't@t.com', '123456', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(23, 'test', 't@t.com', '123456', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(24, 'test', 't@t.com', '123456', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(25, 'test', 't@t.com', '123456', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(26, 'test', 't@t.com', '159357', 'hello', 1, 1, '2019-12-11 10:11:13', NULL),
(27, 'ziyad', 'bsf7315@live.com', '0569135523', 'ok.', 1, 1, '2019-12-11 10:11:13', NULL),
(28, '11111', 'irondot@xyz.com', '593655556225', 'test', 1, 1, '2019-12-16 13:05:55', NULL),
(29, '11111', 'irondot@xyz.com', '593655556225', 'test 2', 1, 1, '2019-12-16 13:05:55', NULL),
(30, 'x', 'xyz@xyz.com', '11111111111', 'test', 1, 1, '2019-12-24 11:23:00', NULL),
(31, 'test new', 'xyz@xyz.com', '333333', 'test 2', 1, 1, '2019-12-24 11:23:00', NULL),
(34, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01066365287', 'Helllooooooooooooo', 1, 1, '2019-12-24 11:23:00', NULL),
(35, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01225892522', 'hekoooasdmjsakbcjsknbjkdsnzx', 1, 1, '2019-12-24 11:23:00', NULL),
(36, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01225892522', 'how are you????????????????', 1, 1, '2019-12-24 11:23:00', NULL),
(46, 'fedfd', 'fdfdf', '444444', 'fdfds', 1, 1, '2019-12-24 11:23:00', NULL),
(47, 'test new', 'dsf@fd', '5555555555', 'fds fd', 1, 1, '2019-12-24 11:23:00', NULL),
(48, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'how are you?', 1, 1, '2019-12-24 11:23:00', NULL),
(38, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01066365287', 'gdhKLASDBFDSKLJBJKSLABVJDK', 1, 1, '2019-12-24 11:23:00', NULL),
(39, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(40, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(41, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(42, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(43, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(44, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'what are you doing ???', 1, 1, '2019-12-24 11:23:00', NULL),
(45, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01066365287', 'jdsfhsdkjlfisadhfsadjhsdhpfsak', 1, 1, '2019-12-24 11:23:00', NULL),
(49, 'Hassan Gamal', 'admin@reservationsa.com', '01272252219', 'ئءءئرلاىةوزةيبلايباباؤلببللاللايفيافيايفيلف', 1, 1, '2019-12-24 11:23:00', NULL),
(50, 'iron dot test', 'admin@test.com', '454555454', 'jdfjjgh jjj', 1, 1, '2019-12-24 12:49:12', NULL),
(51, 'irondottest x', 'irondot4@testing3.com', '15427855', 'hello', 1, 0, '2019-12-26 09:01:50', NULL),
(53, 'اتلات تالا', 'sasdf@dfd.df', '0558785', 'ةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتىةيسن بىتيس نقن ىقى لتقتى', 1, 0, '2020-01-06 14:53:21', NULL),
(54, 'نةمن نىنى', 'catering@reg.com', '08565895588', 'تارارات لاا لاا لاا لاغا اارترتا', 1, 0, '2020-01-08 08:57:54', NULL),
(55, 'ايرون دوت تال', 'reg@test.com', '57558685', 'بنوبنبن', 0, 0, '2020-01-08 09:29:03', NULL),
(56, 'ايرون دوت تال', 'hreg@test.com', '57558685', 'gbnnm', 0, 0, '2020-01-08 11:51:47', NULL),
(57, 'Saif', 'saif@irondot.org', '1129261195', 'kjljljljljlj', 0, 0, '2020-01-16 11:19:41', NULL),
(58, 'Saif', 'saif@irondot.org', '1129261195', 'asdasd', 0, 0, '2020-01-16 11:28:06', NULL),
(59, 'Saif', 'saif@irondot.org', '1999129261195', 'lkljlkj', 0, 0, '2020-01-16 11:37:57', NULL),
(60, 'iron dot', 'irondot@xyz.com', '56913552', 'jfnfncm', 0, 0, '2020-01-16 11:57:31', NULL),
(61, 'iron dot', 'irondot@xyz.com', '56913552', 'rnfjfjfffggmicvj j kkckfndbucinejc', 0, 0, '2020-01-16 11:57:47', NULL),
(62, 'iron dot', 'irondot@xyz.com', '56913552', 'dfnfkkclckc djcnen dndjd jdjc djdnkdk jddjjd fjdjf jxkdmdnjjdbhdjjd dfnfkkclckc djcnen dndjd jdjc djdnkdk jddjjd fjdjf jxkdmdnjjdbhdjjd dfnfkkclckc djcnen dndjd jdjc djdnkdk jddjjd fjdjf jxkdmdnjjdbhdjjd dfnfkkclckc djcnen dndjd jdjc djdnkdk jddjjd fjdjf jxkdmdnjjdbhdjjd', 0, 0, '2020-01-16 11:58:40', NULL),
(33, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '01272252219', 'Helllloooooooooo', 1, 1, '2019-12-24 11:23:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-04 13:33:54', NULL),
(3, 1, '2019-12-29 14:17:37', NULL),
(4, 1, '2020-01-08 09:37:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_description`
--

CREATE TABLE `country_description` (
  `country_description_id` int(11) NOT NULL,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country_description`
--

INSERT INTO `country_description` (`country_description_id`, `country_name`, `country_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'Saudi Arabia', 1, 1, '2019-11-04 13:34:37', NULL),
(2, 'المملكة العربية السعودية', 1, 2, '2019-12-29 11:53:12', NULL),
(5, 'USA', 3, 1, '2019-12-29 14:17:37', NULL),
(6, 'الولايات المتحدة الامريكية', 3, 2, '2019-12-29 14:17:37', NULL),
(7, 'Egypt', 4, 1, '2020-01-08 09:37:11', NULL),
(8, 'مصر', 4, 2, '2020-01-08 09:37:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(20) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_name`, `coupon_discount`, `created_at`, `updated_at`) VALUES
(4, 'hassan34', 35, '2019-12-18 08:49:08', NULL),
(6, 'YALLA50', 50, '2019-11-17 08:16:36', NULL),
(28, 'www', 25, '2019-11-18 08:35:45', NULL),
(29, 'lorem', 21, '2019-12-18 09:13:23', NULL),
(32, 'black Friday', 60, '2019-12-18 10:26:43', NULL),
(33, 'تخفيض', 80, '2020-01-08 09:21:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doctor_available_start` int(11) NOT NULL,
  `doctor_available_end` int(11) NOT NULL,
  `doctor_price` double NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_available_start`, `doctor_available_end`, `doctor_price`, `active`, `created_at`, `updated_at`) VALUES
(1, 9, 12, 150, 1, '2019-12-24 11:46:03', NULL),
(2, 9, 7, 0, 1, '2019-11-06 07:20:13', NULL),
(3, 9, 15, 150, 1, '2019-11-22 21:45:48', NULL),
(4, 8, 18, 0, 1, '2019-11-16 15:05:44', NULL),
(6, 9, 17, 150, 1, '2019-11-20 11:50:45', NULL),
(7, 5, 12, 200, 1, '2019-11-20 12:25:35', NULL),
(8, 8, 20, 100, 1, '2019-11-22 15:30:42', NULL),
(9, 7, 17, 100, 1, '2019-11-22 15:36:04', NULL),
(10, 0, 10, 100, 0, '2019-12-24 09:18:09', NULL),
(12, 10, 12, 100, 1, '2019-11-25 20:54:10', NULL),
(13, 1, 19, 100, 1, '2019-12-16 12:44:32', NULL),
(14, 8, 20, 50, 1, '2019-12-17 11:03:44', NULL),
(16, 15, 19, 500, 1, '2019-12-17 08:18:28', NULL),
(17, 15, 19, 500, 1, '2019-12-17 08:18:46', NULL),
(18, 15, 19, 500, 1, '2019-12-17 08:19:05', NULL),
(19, 15, 19, 500, 1, '2019-12-17 08:23:42', NULL),
(20, 18, 23, 205, 1, '2019-12-18 12:07:00', NULL),
(21, 15, 20, 100, 1, '2019-12-19 08:45:11', NULL),
(24, 12, 16, 85, 1, '2019-12-24 10:22:19', NULL),
(25, 14, 18, 52, 1, '2020-01-02 09:21:52', NULL),
(26, 10, 14, 50, 1, '2020-01-06 13:09:24', NULL),
(27, 13, 17, 80, 1, '2020-01-06 14:21:49', NULL),
(28, 14, 18, 70, 1, '2020-01-06 14:28:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_detail`
--

CREATE TABLE `doctor_detail` (
  `doctor_detail_id` int(11) NOT NULL,
  `doctor_detail_name` varchar(60) NOT NULL,
  `doctor_detail_specialization` varchar(160) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor_detail`
--

INSERT INTO `doctor_detail` (`doctor_detail_id`, `doctor_detail_name`, `doctor_detail_specialization`, `doctor_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'mmmmmmmmmmmmmmmmmmmm', 'eyes x', 1, 1, '2019-12-17 07:52:48', NULL),
(2, 'اااااااااااااااااااا', 'عيون س', 1, 2, '2019-12-17 07:55:42', NULL),
(3, 'Lorem Ipsum', 'Lorem Ipsum is simply dummy', 2, 1, '2019-11-06 07:20:13', NULL),
(4, 'لوريم إيبسوم', 'هو ببساطة نص شكلي', 2, 2, '2019-11-06 07:20:13', NULL),
(5, 'mohammed hefny', 'Dentist', 3, 1, '2019-11-12 10:19:38', NULL),
(6, 'محمد حفنى', 'طبيب اسنان', 3, 2, '2019-11-12 10:19:38', NULL),
(7, 'doctor mohammed', 'eyes', 4, 1, '2019-11-16 15:05:44', NULL),
(8, 'دكتور محمد', 'عيون', 4, 2, '2019-11-16 15:05:44', NULL),
(11, 'hassan', 'mobermeg', 6, 1, '2019-11-20 11:50:45', NULL),
(12, 'حسن', 'مبرمج', 6, 2, '2019-11-20 11:50:45', NULL),
(13, 'Saad', 'Dentist', 7, 1, '2019-11-20 12:25:35', NULL),
(14, 'سعد', 'اسنان', 7, 2, '2019-11-20 12:25:35', NULL),
(15, 'nawab', 'profesor and has degree from USA in TSC', 8, 1, '2019-11-22 15:30:42', NULL),
(16, 'نواف', 'بزوفسور في الاوعيه الباطنيه من امريكا', 8, 2, '2019-11-22 15:30:42', NULL),
(17, 'Ali', 'boons PHD', 9, 1, '2019-11-22 15:38:53', NULL),
(18, 'علي', 'عظام حاصل علي شهاده دكتوراه', 9, 2, '2019-11-22 15:38:53', NULL),
(19, 'mohammed', 'nose', 10, 1, '2019-11-25 20:49:53', NULL),
(20, 'محمد', 'انف اذن حنجره', 10, 2, '2019-11-25 20:49:53', NULL),
(23, 'Ali', 'inter krgk r gkrk gr', 12, 1, '2020-01-16 10:47:34', NULL),
(24, 'علي', 'استاذ دكتور الغدد الصماء بكلية الطب جامعة الملك فهد', 12, 2, '2020-01-16 10:48:39', NULL),
(25, 'doc xy', 'dddd', 13, 1, '2019-12-16 11:49:10', NULL),
(26, 'دكتور ا', 'ببببب', 13, 2, '2019-12-16 11:48:14', NULL),
(27, 'wxyz', 'dddddd', 14, 1, '2019-12-16 12:26:30', NULL),
(28, 'ييييييييي', 'ءءءءءءء', 14, 2, '2019-12-16 12:26:30', NULL),
(31, 'xxxxxxxxxxxxxxxxxx', 'xxxx', 19, 1, '2019-12-17 08:19:49', NULL),
(32, 'تتتتتتتتتتتتتتتتتتتت', 'تتتت', 19, 2, '2019-12-17 08:19:49', NULL),
(33, 'fdsfsd', 'يسبيبي', 20, 1, '2019-12-18 12:07:00', NULL),
(34, 'fdfdfdsf', 'fdfdsgfd', 20, 2, '2019-12-18 12:07:00', NULL),
(35, 'magdy yaccob', 'heart', 21, 1, '2019-12-19 08:45:11', NULL),
(36, 'مجدي يعقوب', 'قلب غ', 21, 2, '2019-12-19 11:13:41', NULL),
(41, 'jnjj jbjj jnjn', 'jnujn hbh', 24, 1, '2019-12-24 10:22:19', NULL),
(42, 'نتن لاات تاناىا', 'الاالاغ', 24, 2, '2019-12-24 10:22:19', NULL),
(43, 'knkl', 'njnj', 25, 1, '2020-01-02 09:21:52', NULL),
(44, 'عتلاعلا', 'ىىتى', 25, 2, '2020-01-02 09:21:52', NULL),
(45, 'mohamed', 'eyes 5', 26, 1, '2020-01-06 14:09:49', NULL),
(46, 'محمد', 'عيون', 26, 2, '2020-01-06 13:09:24', NULL),
(47, 'hgbjhbh', 'eyes 5', 27, 1, '2020-01-06 14:15:27', NULL),
(48, 'لبتلت ت', 'ةىتى', 27, 2, '2020-01-06 14:15:27', NULL),
(49, 'Ahmed', 'dsa', 28, 1, '2020-01-06 14:28:44', NULL),
(50, 'احمد', 'نبىثق', 28, 2, '2020-01-06 14:28:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `history_status`
--

CREATE TABLE `history_status` (
  `history_status_id` int(11) NOT NULL,
  `reserve_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history_status`
--

INSERT INTO `history_status` (`history_status_id`, `reserve_id`, `status_id`, `type`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, NULL, '2019-11-06 07:05:44', NULL),
(2, 2, 2, 1, NULL, '2019-11-06 07:11:17', NULL),
(3, 1, 1, 2, NULL, '2019-11-06 07:39:53', NULL),
(4, 1, 2, 2, NULL, '2019-11-06 07:40:16', NULL),
(5, 2, 1, 1, NULL, '2019-11-06 07:49:31', NULL),
(6, 2, 1, 3, NULL, '2019-11-06 08:06:45', NULL),
(7, 1, 1, 4, NULL, '2019-11-06 08:30:14', NULL),
(8, 3, 1, 3, NULL, '2019-11-06 08:30:36', NULL),
(9, 1, 2, 4, NULL, '2019-11-06 08:51:20', NULL),
(10, 2, 1, 4, NULL, '2019-11-06 11:34:03', NULL),
(11, 4, 1, 3, NULL, '2019-11-06 11:48:35', NULL),
(12, 5, 1, 3, NULL, '2019-11-06 12:29:26', NULL),
(13, 3, 1, 4, NULL, '2019-11-06 15:00:21', NULL),
(14, 6, 1, 3, NULL, '2019-11-06 15:00:45', NULL),
(15, 4, 1, 4, NULL, '2019-11-07 14:13:41', NULL),
(16, 7, 1, 3, NULL, '2019-11-07 14:14:51', NULL),
(17, 8, 1, 4, NULL, '2019-11-11 08:23:31', NULL),
(18, 9, 1, 4, NULL, '2019-11-11 12:15:31', NULL),
(19, 1, 2, 4, 'helle world', '2019-11-11 13:45:16', NULL),
(20, 9, 2, 4, 'sadasdasd', '2019-11-11 13:45:34', NULL),
(21, 8, 1, 3, NULL, '2019-11-11 14:20:24', NULL),
(22, 9, 3, 4, NULL, '2019-11-11 14:23:59', NULL),
(23, 3, 1, 1, NULL, '2019-11-12 10:22:01', NULL),
(24, 3, 3, 1, 'المعاد السابق تحديده غير متاح', '2019-11-12 10:44:25', NULL),
(25, 4, 1, 1, NULL, '2019-11-12 11:06:44', NULL),
(26, 5, 1, 1, NULL, '2019-11-12 11:07:57', NULL),
(27, 6, 1, 1, NULL, '2019-11-12 11:08:58', NULL),
(28, 9, 1, 3, NULL, '2019-11-12 11:10:13', NULL),
(29, 10, 1, 3, NULL, '2019-11-12 11:11:07', NULL),
(30, 11, 1, 3, NULL, '2019-11-12 11:11:53', NULL),
(31, 12, 1, 3, NULL, '2019-11-12 11:12:58', NULL),
(32, 10, 1, 4, NULL, '2019-11-12 11:20:10', NULL),
(33, 6, 2, 1, NULL, '2019-11-12 11:21:05', NULL),
(34, 11, 1, 4, NULL, '2019-11-12 11:24:14', NULL),
(35, 7, 1, 1, NULL, '2019-11-12 11:31:46', NULL),
(36, 12, 1, 4, NULL, '2019-11-12 11:34:22', NULL),
(37, 13, 1, 3, NULL, '2019-11-12 11:34:38', NULL),
(38, 8, 1, 1, NULL, '2019-11-12 11:47:03', NULL),
(39, 14, 1, 3, NULL, '2019-11-12 11:52:28', NULL),
(40, 13, 1, 4, NULL, '2019-11-12 11:53:53', NULL),
(41, 14, 1, 4, NULL, '2019-11-12 11:56:38', NULL),
(42, 2, 2, 3, NULL, '2019-11-12 12:21:10', NULL),
(43, 9, 1, 1, NULL, '2019-11-12 12:27:38', NULL),
(44, 15, 1, 4, NULL, '2019-11-12 12:32:12', NULL),
(45, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:12:02', NULL),
(46, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:14:01', NULL),
(47, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:14:23', NULL),
(48, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:15:36', NULL),
(49, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:15:45', NULL),
(50, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:15:52', NULL),
(51, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:16:02', NULL),
(52, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:16:25', NULL),
(53, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:16:33', NULL),
(54, 6, 2, 1, 'تم قبول طلبك', '2019-11-12 14:17:37', NULL),
(55, 15, 1, 3, NULL, '2019-11-12 14:26:49', NULL),
(56, 4, 2, 1, 'تم قبول طلبك', '2019-11-12 14:34:22', NULL),
(57, 5, 2, 1, 'helle world', '2019-11-13 08:25:20', NULL),
(58, 10, 1, 1, NULL, '2019-11-13 08:28:41', NULL),
(59, 11, 1, 1, NULL, '2019-11-13 09:53:56', NULL),
(60, 16, 1, 4, NULL, '2019-11-13 09:56:04', NULL),
(61, 12, 1, 1, NULL, '2019-11-13 14:26:55', NULL),
(62, 13, 1, 1, NULL, '2019-11-13 15:03:33', NULL),
(63, 14, 1, 1, NULL, '2019-11-13 16:32:15', NULL),
(64, 15, 1, 1, NULL, '2019-11-14 09:57:48', NULL),
(65, 16, 1, 3, NULL, '2019-11-14 09:58:40', NULL),
(66, 16, 1, 1, NULL, '2019-11-14 10:04:26', NULL),
(67, 17, 1, 1, NULL, '2019-11-14 10:06:37', NULL),
(68, 17, 1, 4, NULL, '2019-11-14 10:59:57', NULL),
(69, 17, 2, 4, 'helle world', '2019-11-14 11:03:16', NULL),
(70, 18, 1, 4, NULL, '2019-11-14 11:12:54', NULL),
(71, 18, 3, 4, 'asdasda', '2019-11-14 11:13:04', NULL),
(72, 18, 1, 1, NULL, '2019-11-16 13:03:22', NULL),
(73, 17, 1, 3, NULL, '2019-11-16 14:05:29', NULL),
(74, 18, 1, 3, NULL, '2019-11-16 14:06:17', NULL),
(75, 17, 3, 1, 'لا', '2019-11-16 15:08:09', NULL),
(76, 19, 1, 1, NULL, '2019-11-16 15:12:04', NULL),
(77, 20, 1, 1, NULL, '2019-11-16 15:12:57', NULL),
(78, 20, 3, 1, 'برجاء اخيار ساعه اخرى', '2019-11-16 15:14:55', NULL),
(79, 2, 1, 2, NULL, '2019-11-16 15:39:17', NULL),
(80, 2, 2, 2, 'تم قبول الطلب', '2019-11-16 15:41:07', NULL),
(81, 3, 1, 2, NULL, '2019-11-16 15:41:21', NULL),
(82, 21, 1, 1, NULL, '2019-11-16 15:43:24', NULL),
(83, 19, 1, 4, NULL, '2019-11-16 15:52:32', NULL),
(84, 20, 1, 4, NULL, '2019-11-16 15:54:43', NULL),
(85, 21, 1, 4, NULL, '2019-11-16 15:58:12', NULL),
(86, 22, 1, 4, NULL, '2019-11-16 16:20:43', NULL),
(87, 23, 1, 4, NULL, '2019-11-16 16:25:00', NULL),
(88, 22, 1, 1, NULL, '2019-11-17 11:10:03', NULL),
(89, 22, 2, 1, 'تم قبول طلبك', '2019-11-18 13:12:40', NULL),
(90, 22, 3, 1, 'تم قبول طلبك', '2019-11-18 13:12:45', NULL),
(91, 16, 2, 1, 'تم قبول طلبك', '2019-11-18 13:24:42', NULL),
(92, 23, 2, 4, 'تم قبول طلبك', '2019-11-18 13:42:08', NULL),
(93, 23, 1, 1, NULL, '2019-11-18 14:55:22', NULL),
(94, 24, 1, 1, NULL, '2019-11-18 14:58:26', NULL),
(95, 24, 1, 4, NULL, '2019-11-18 15:04:26', NULL),
(96, 25, 1, 4, NULL, '2019-11-18 15:06:48', NULL),
(97, 29, 1, 1, NULL, '2019-11-19 07:52:42', NULL),
(98, 30, 1, 1, NULL, '2019-11-19 07:53:04', NULL),
(99, 31, 1, 1, NULL, '2019-11-19 07:53:10', NULL),
(100, 19, 1, 3, NULL, '2019-11-19 12:37:36', NULL),
(101, 31, 2, 1, 'h', '2019-11-19 13:26:58', NULL),
(102, 25, 2, 4, 'lo', '2019-11-19 13:29:31', NULL),
(103, 24, 3, 4, ';', '2019-11-19 13:31:16', NULL),
(104, 32, 1, 1, NULL, '2019-11-19 18:12:43', NULL),
(105, 33, 1, 1, NULL, '2019-11-20 11:52:48', NULL),
(106, 33, 2, 1, 'تم قبول طلبك', '2019-11-20 11:53:49', NULL),
(107, 4, 1, 2, NULL, '2019-11-20 12:27:04', NULL),
(108, 4, 2, 2, 'تم قبول طلبك', '2019-11-20 12:27:30', NULL),
(109, 20, 1, 3, NULL, '2019-11-20 12:35:37', NULL),
(110, 20, 2, 3, 'تم قبول طلبك', '2019-11-20 12:36:07', NULL),
(111, 26, 1, 4, NULL, '2019-11-20 13:29:49', NULL),
(112, 27, 1, 4, NULL, '2019-11-20 13:35:59', NULL),
(113, 27, 2, 4, 'تم قبول طلبك', '2019-11-20 13:55:25', NULL),
(114, 29, 2, 1, NULL, '2019-11-20 14:26:53', NULL),
(115, 24, 2, 1, NULL, '2019-11-20 14:38:51', NULL),
(116, 23, 2, 1, NULL, '2019-11-20 14:59:48', NULL),
(117, 34, 1, 1, NULL, '2019-11-21 02:06:50', NULL),
(118, 28, 1, 4, NULL, '2019-11-21 04:26:49', NULL),
(119, 29, 1, 4, NULL, '2019-11-21 07:10:55', NULL),
(120, 30, 1, 4, NULL, '2019-11-22 13:02:59', NULL),
(121, 21, 1, 3, NULL, '2019-11-22 13:05:23', NULL),
(122, 22, 1, 3, NULL, '2019-11-22 21:35:29', NULL),
(123, 23, 1, 3, NULL, '2019-11-22 21:49:58', NULL),
(124, 24, 1, 3, NULL, '2019-11-22 21:54:15', NULL),
(125, 25, 1, 3, NULL, '2019-11-22 21:54:43', NULL),
(126, 26, 1, 3, NULL, '2019-11-22 21:55:06', NULL),
(127, 35, 1, 1, NULL, '2019-11-22 21:58:49', NULL),
(128, 26, 2, 3, NULL, '2019-11-22 22:01:26', NULL),
(129, 27, 1, 3, NULL, '2019-11-22 22:05:51', NULL),
(130, 36, 1, 1, NULL, '2019-11-22 22:10:08', NULL),
(131, 5, 1, 2, NULL, '2019-11-22 22:13:10', NULL),
(132, 25, 2, 3, NULL, '2019-11-22 22:15:07', NULL),
(133, 24, 3, 3, NULL, '2019-11-22 22:15:47', NULL),
(134, 31, 1, 4, NULL, '2019-11-23 02:24:15', NULL),
(135, 37, 1, 1, NULL, '2019-11-23 07:17:41', NULL),
(136, 38, 1, 1, NULL, '2019-11-23 19:06:00', NULL),
(137, 6, 1, 2, NULL, '2019-11-23 19:07:12', NULL),
(138, 32, 1, 4, NULL, '2019-11-23 19:08:30', NULL),
(139, 28, 1, 3, NULL, '2019-11-23 19:09:00', NULL),
(140, 38, 2, 1, 'تم تاكيد الحجز يرجى التواجد قبل الساعه 1 ظهرا', '2019-11-23 19:13:39', NULL),
(141, 29, 2, 4, NULL, '2019-11-23 21:29:52', NULL),
(142, 33, 1, 4, NULL, '2019-11-23 22:15:56', NULL),
(143, 39, 1, 1, NULL, '2019-11-23 22:24:31', NULL),
(144, 7, 1, 2, NULL, '2019-11-23 22:24:51', NULL),
(145, 34, 1, 4, NULL, '2019-11-23 22:29:01', NULL),
(146, 35, 1, 4, NULL, '2019-11-23 22:30:59', NULL),
(147, 36, 1, 4, NULL, '2019-11-23 22:38:33', NULL),
(148, 37, 1, 4, NULL, '2019-11-23 22:39:00', NULL),
(149, 38, 1, 4, NULL, '2019-11-23 22:39:24', NULL),
(150, 39, 1, 4, NULL, '2019-11-23 23:09:47', NULL),
(151, 8, 1, 2, NULL, '2019-11-23 23:10:25', NULL),
(152, 40, 1, 1, NULL, '2019-11-25 20:37:24', NULL),
(153, 41, 1, 1, NULL, '2019-11-25 21:09:12', NULL),
(154, 42, 1, 1, NULL, '2019-11-25 21:09:51', NULL),
(155, 42, 3, 1, 'غير متوفر', '2019-11-25 21:11:29', NULL),
(156, 42, 3, 1, 'غير متوفر', '2019-11-25 21:12:32', NULL),
(157, 43, 1, 1, NULL, '2019-12-10 20:00:03', NULL),
(158, 44, 1, 1, NULL, '2019-12-10 20:01:57', NULL),
(159, 45, 1, 1, NULL, '2019-12-10 20:03:03', NULL),
(160, 45, 3, 1, 'تم رفض طلبك لعدم وجود', '2019-12-10 20:06:58', NULL),
(161, 44, 3, 1, '123456', '2019-12-10 20:08:10', NULL),
(162, 46, 1, 1, NULL, '2019-12-10 20:15:52', NULL),
(163, 47, 1, 1, NULL, '2019-12-10 20:17:15', NULL),
(164, 48, 1, 1, NULL, '2019-12-10 20:17:57', NULL),
(165, 9, 1, 2, NULL, '2019-12-10 20:18:23', NULL),
(166, 48, 2, 1, NULL, '2019-12-10 20:20:41', NULL),
(167, 47, 3, 1, 'يرجى اختيار معاد اخر يوم الخميس', '2019-12-10 20:21:08', NULL),
(168, 29, 1, 3, NULL, '2019-12-10 20:22:13', NULL),
(169, 30, 1, 3, NULL, '2019-12-10 20:23:01', NULL),
(170, 30, 2, 3, 'تم تاكيد الحجز يرجى التواجد قبل الساعه 1 ظهرا', '2019-12-10 20:24:53', NULL),
(171, 29, 3, 3, 'تم الغاء طلبك لعدم توافر الشروط المطلوبه', '2019-12-10 20:25:22', NULL),
(172, 40, 1, 4, NULL, '2019-12-10 20:29:05', NULL),
(173, 41, 1, 4, NULL, '2019-12-10 20:30:17', NULL),
(174, 41, 2, 4, NULL, '2019-12-10 20:36:33', NULL),
(175, 40, 3, 4, 'العدد مره كبير يرجى اختيار بحد اقصى لهذا اليوم 20 فرد', '2019-12-10 20:37:05', NULL),
(176, 10, 1, 2, NULL, '2019-12-10 20:38:06', NULL),
(177, 11, 1, 2, NULL, '2019-12-10 20:40:01', NULL),
(178, 12, 1, 2, NULL, '2019-12-10 20:40:33', NULL),
(179, 12, 2, 2, NULL, '2019-12-10 20:41:35', NULL),
(180, 13, 1, 2, NULL, '2019-12-10 20:41:35', NULL),
(181, 14, 1, 2, NULL, '2019-12-10 20:42:13', NULL),
(182, 15, 1, 2, NULL, '2019-12-10 20:42:49', NULL),
(183, 15, 3, 2, 'يرجى اختيار تاريخ تانى', '2019-12-10 20:44:44', NULL),
(184, 16, 1, 2, NULL, '2019-12-10 20:44:58', NULL),
(185, 16, 2, 2, NULL, '2019-12-10 20:45:50', NULL),
(186, 49, 1, 1, NULL, '2019-12-11 08:45:36', NULL),
(187, 50, 1, 1, NULL, '2019-12-11 08:47:06', NULL),
(188, 51, 1, 1, NULL, '2019-12-11 08:48:55', NULL),
(189, 52, 1, 1, NULL, '2019-12-11 19:02:12', NULL),
(190, 53, 1, 1, NULL, '2019-12-11 19:07:44', NULL),
(191, 54, 1, 1, NULL, '2019-12-11 20:05:37', NULL),
(192, 49, 2, 1, 'تعليقي الجميل', '2019-12-11 20:13:34', NULL),
(193, 55, 1, 1, NULL, '2019-12-11 20:14:27', NULL),
(194, 56, 1, 1, NULL, '2019-12-11 20:14:53', NULL),
(195, 57, 1, 1, NULL, '2019-12-11 21:27:42', NULL),
(196, 57, 3, 1, 'آسف المعياد غير متاح الان', '2019-12-11 21:29:51', NULL),
(197, 49, 4, 1, NULL, '2019-12-11 22:11:43', NULL),
(198, 58, 1, 1, NULL, '2019-12-12 17:43:19', NULL),
(199, 59, 1, 1, NULL, '2019-12-12 17:43:42', NULL),
(200, 59, 2, 1, 'تعليق تعليق تعليق تعليق تعليق تعليق تعليق', '2019-12-12 17:45:04', NULL),
(201, 59, 4, 1, NULL, '2019-12-12 17:49:40', NULL),
(202, 58, 2, 1, NULL, '2019-12-12 17:50:34', NULL),
(203, 42, 1, 4, NULL, '2019-12-12 17:55:32', NULL),
(204, 43, 1, 4, NULL, '2019-12-12 17:55:52', NULL),
(205, 44, 1, 4, NULL, '2019-12-12 17:57:24', NULL),
(206, 45, 1, 4, NULL, '2019-12-12 17:58:06', NULL),
(207, 17, 1, 2, NULL, '2019-12-12 17:58:29', NULL),
(208, 31, 1, 3, NULL, '2019-12-12 18:13:46', NULL),
(209, 58, 3, 1, NULL, '2019-12-12 18:38:00', NULL),
(210, 60, 1, 1, NULL, '2019-12-12 18:39:32', NULL),
(211, 60, 2, 1, NULL, '2019-12-12 18:39:47', NULL),
(212, 60, 3, 1, NULL, '2019-12-12 18:44:31', NULL),
(213, 61, 1, 1, NULL, '2019-12-12 18:46:46', NULL),
(214, 62, 1, 1, NULL, '2019-12-12 18:47:08', NULL),
(215, 61, 2, 1, NULL, '2019-12-12 18:47:22', NULL),
(216, 61, 3, 1, NULL, '2019-12-12 18:47:29', NULL),
(217, 62, 2, 1, NULL, '2019-12-12 18:48:27', NULL),
(218, 62, 3, 1, NULL, '2019-12-12 18:49:40', NULL),
(219, 63, 1, 1, NULL, '2019-12-12 18:54:06', NULL),
(220, 63, 2, 1, NULL, '2019-12-12 18:54:14', NULL),
(221, 63, 3, 1, NULL, '2019-12-12 19:03:19', NULL),
(222, 64, 1, 1, NULL, '2019-12-12 19:08:27', NULL),
(223, 64, 2, 1, NULL, '2019-12-12 19:08:40', NULL),
(224, 64, 4, 1, NULL, '2019-12-12 19:09:01', NULL),
(225, 65, 1, 1, NULL, '2019-12-12 21:49:03', NULL),
(226, 66, 1, 1, NULL, '2019-12-12 21:56:16', NULL),
(227, 67, 1, 1, NULL, '2019-12-12 21:56:44', NULL),
(228, 65, 2, 1, NULL, '2019-12-12 22:03:06', NULL),
(229, 67, 2, 1, NULL, '2019-12-12 22:03:32', NULL),
(230, 67, 3, 1, NULL, '2019-12-12 22:04:30', NULL),
(231, 66, 2, 1, NULL, '2019-12-12 22:07:06', NULL),
(232, 46, 1, 4, NULL, '2019-12-12 22:10:27', NULL),
(233, 47, 1, 4, NULL, '2019-12-12 22:13:01', NULL),
(234, 48, 1, 4, NULL, '2019-12-12 22:15:51', NULL),
(235, 49, 1, 4, NULL, '2019-12-12 22:19:35', NULL),
(236, 18, 1, 2, NULL, '2019-12-12 22:25:44', NULL),
(237, 50, 1, 4, NULL, '2019-12-12 22:39:29', NULL),
(238, 66, 3, 1, NULL, '2019-12-12 23:42:48', NULL),
(239, 65, 3, 1, NULL, '2019-12-12 23:52:00', NULL),
(240, 68, 1, 1, NULL, '2019-12-12 23:58:54', NULL),
(241, 68, 2, 1, NULL, '2019-12-12 23:59:08', NULL),
(242, 69, 1, 1, NULL, '2019-12-13 00:01:19', NULL),
(243, 68, 3, 1, NULL, '2019-12-13 00:06:42', NULL),
(244, 69, 2, 1, NULL, '2019-12-13 00:09:03', NULL),
(245, 70, 1, 1, NULL, '2019-12-14 02:23:14', NULL),
(246, 70, 2, 1, 'تم تاكيد الحجز يرجى التواجد قبل الساعه 1 ظهرا', '2019-12-14 02:29:21', NULL),
(247, 70, 4, 1, NULL, '2019-12-14 04:56:25', NULL),
(248, 15, 2, 1, NULL, '2019-12-14 05:02:05', NULL),
(249, 15, 4, 1, NULL, '2019-12-14 05:02:12', NULL),
(250, 14, 3, 1, NULL, '2019-12-14 05:02:30', NULL),
(251, 51, 1, 4, NULL, '2019-12-14 12:25:03', NULL),
(252, 52, 1, 4, NULL, '2019-12-14 12:26:12', NULL),
(253, 19, 1, 2, NULL, '2019-12-14 12:26:47', NULL),
(254, 19, 2, 2, NULL, '2019-12-14 12:27:12', NULL),
(255, 19, 4, 2, NULL, '2019-12-14 12:28:37', NULL),
(256, 53, 1, 4, NULL, '2019-12-15 21:57:55', NULL),
(257, 20, 1, 2, NULL, '2019-12-15 22:03:17', NULL),
(258, 21, 1, 2, NULL, '2019-12-15 22:04:09', NULL),
(259, 54, 1, 4, NULL, '2019-12-15 22:05:08', NULL),
(260, 71, 1, 1, NULL, '2019-12-15 22:06:23', NULL),
(261, 72, 1, 1, NULL, '2019-12-15 22:06:55', NULL),
(262, 32, 1, 3, NULL, '2019-12-15 22:09:19', NULL),
(263, 73, 1, 1, NULL, '2019-12-15 22:10:32', NULL),
(264, 74, 1, 1, NULL, '2019-12-15 22:28:27', NULL),
(265, 33, 1, 3, NULL, '2019-12-15 23:25:50', NULL),
(266, 72, 2, 1, 'hello', '2019-12-16 21:16:26', NULL),
(267, 72, 4, 1, 'test', '2019-12-16 21:17:19', NULL),
(268, 71, 3, 1, 'can', '2019-12-16 21:18:31', NULL),
(269, 75, 1, 1, NULL, '2019-12-16 21:42:06', NULL),
(270, 22, 1, 2, NULL, '2019-12-17 17:21:24', NULL),
(271, 22, 2, 2, 'ت', '2019-12-17 17:24:14', NULL),
(272, 22, 3, 2, 'فففففففففففففففففففففففففففففففففففففففففففففففففففففففففففففففففف', '2019-12-17 17:26:54', NULL),
(273, 22, 3, 2, 'ففففففففففففففففففففففففففففففففففففففففففففف', '2019-12-17 17:27:06', NULL),
(274, 23, 1, 2, NULL, '2019-12-17 17:28:46', NULL),
(275, 23, 2, 2, 'hello', '2019-12-17 17:29:13', NULL),
(276, 23, 4, 2, NULL, '2019-12-17 17:30:43', NULL),
(277, 76, 1, 1, NULL, '2019-12-17 17:45:54', NULL),
(278, 77, 1, 1, NULL, '2019-12-17 17:51:15', NULL),
(279, 78, 1, 1, NULL, '2019-12-17 17:54:34', NULL),
(280, 79, 1, 1, NULL, '2019-12-17 17:56:38', NULL),
(281, 80, 1, 1, NULL, '2019-12-17 17:57:21', NULL),
(282, 81, 1, 1, NULL, '2019-12-17 18:14:23', NULL),
(283, 82, 1, 1, NULL, '2019-12-17 18:23:16', NULL),
(284, 83, 1, 1, NULL, '2019-12-17 18:34:27', NULL),
(285, 34, 1, 3, NULL, '2019-12-17 19:35:19', NULL),
(286, 35, 1, 3, NULL, '2019-12-17 19:35:41', NULL),
(287, 36, 1, 3, NULL, '2019-12-17 19:38:47', NULL),
(288, 37, 1, 3, NULL, '2019-12-17 19:46:31', NULL),
(289, 38, 1, 3, NULL, '2019-12-17 19:46:43', NULL),
(290, 39, 1, 3, NULL, '2019-12-17 19:46:50', NULL),
(291, 40, 1, 3, NULL, '2019-12-17 19:48:36', NULL),
(292, 41, 1, 3, NULL, '2019-12-17 20:20:14', NULL),
(293, 55, 1, 4, NULL, '2019-12-17 23:04:45', NULL),
(294, 56, 1, 4, NULL, '2019-12-17 23:07:57', NULL),
(295, 56, 2, 4, 'ل', '2019-12-17 23:10:25', NULL),
(296, 56, 3, 4, NULL, '2019-12-17 23:10:58', NULL),
(297, 84, 1, 1, NULL, '2019-12-18 17:01:57', NULL),
(298, 84, 2, 1, NULL, '2019-12-18 17:04:03', NULL),
(299, 84, 3, 1, NULL, '2019-12-18 17:04:30', NULL),
(300, 87, 1, 1, NULL, '2019-12-18 17:19:33', NULL),
(301, 88, 1, 1, NULL, '2019-12-18 18:38:19', NULL),
(302, 88, 3, 1, NULL, '2019-12-18 18:38:46', NULL),
(303, 89, 1, 1, NULL, '2019-12-18 18:39:56', NULL),
(304, 89, 2, 1, 'y', '2019-12-18 18:40:18', NULL),
(305, 89, 4, 1, NULL, '2019-12-18 18:44:00', NULL),
(306, 91, 1, 1, NULL, '2019-12-18 20:04:33', NULL),
(307, 93, 1, 1, NULL, '2019-12-19 18:01:30', NULL),
(308, 93, 2, 1, 'تم', '2019-12-19 18:02:28', NULL),
(309, 93, 4, 1, 'jl', '2019-12-19 18:07:21', NULL),
(310, 94, 1, 1, NULL, '2019-12-19 18:08:47', NULL),
(311, 94, 2, 1, NULL, '2019-12-19 18:09:18', NULL),
(312, 94, 4, 1, NULL, '2019-12-19 18:10:27', NULL),
(313, 95, 1, 1, NULL, '2019-12-19 18:11:05', NULL),
(314, 95, 2, 1, NULL, '2019-12-19 18:11:38', NULL),
(315, 95, 3, 1, NULL, '2019-12-19 18:12:09', NULL),
(316, 96, 1, 1, NULL, '2019-12-19 18:18:23', NULL),
(317, 96, 2, 1, NULL, '2019-12-19 18:18:59', NULL),
(318, 97, 1, 1, NULL, '2019-12-19 19:19:52', NULL),
(319, 97, 2, 1, NULL, '2019-12-19 19:20:31', NULL),
(320, 97, 4, 1, 'j', '2019-12-19 19:21:00', NULL),
(321, 96, 3, 1, NULL, '2019-12-19 19:36:41', NULL),
(322, 98, 1, 1, NULL, '2019-12-19 19:40:48', NULL),
(323, 98, 2, 1, NULL, '2019-12-19 19:41:07', NULL),
(324, 98, 3, 1, NULL, '2019-12-19 19:59:17', NULL),
(325, 99, 1, 1, NULL, '2019-12-19 20:14:12', NULL),
(326, 100, 1, 1, NULL, '2019-12-19 20:25:26', NULL),
(327, 100, 2, 1, NULL, '2019-12-19 20:25:53', NULL),
(328, 100, 3, 1, NULL, '2019-12-19 20:49:14', NULL),
(329, 101, 1, 1, NULL, '2019-12-19 21:04:32', NULL),
(330, 101, 2, 1, NULL, '2019-12-19 21:04:39', NULL),
(331, 102, 1, 1, NULL, '2019-12-19 21:45:58', NULL),
(332, 102, 2, 1, NULL, '2019-12-19 21:46:44', NULL),
(333, 102, 4, 1, NULL, '2019-12-19 23:40:50', NULL),
(334, 103, 1, 1, NULL, '2019-12-19 23:49:00', NULL),
(335, 103, 2, 1, NULL, '2019-12-19 23:49:19', NULL),
(336, 103, 4, 1, NULL, '2019-12-19 23:50:24', NULL),
(337, 104, 1, 1, NULL, '2019-12-19 23:56:03', NULL),
(338, 104, 2, 1, NULL, '2019-12-19 23:56:19', NULL),
(339, 105, 1, 1, NULL, '2019-12-20 18:58:50', NULL),
(340, 105, 2, 1, 'حجز موكد', '2019-12-20 19:02:24', NULL),
(341, 57, 1, 4, NULL, '2019-12-20 19:04:07', NULL),
(342, 58, 1, 4, NULL, '2019-12-20 19:05:53', NULL),
(343, 58, 2, 4, 'conform', '2019-12-20 19:09:56', NULL),
(344, 57, 3, 4, 'not rady', '2019-12-20 19:10:39', NULL),
(345, 57, 3, 4, 'not rady', '2019-12-20 19:10:40', NULL),
(346, 57, 3, 4, 'not rady', '2019-12-20 19:10:41', NULL),
(347, 106, 1, 1, NULL, '2019-12-20 19:18:38', NULL),
(348, 42, 1, 3, NULL, '2019-12-20 19:20:10', NULL),
(349, 24, 1, 2, NULL, '2019-12-20 21:02:46', NULL),
(350, 59, 1, 4, NULL, '2019-12-20 21:04:44', NULL),
(351, 43, 1, 3, NULL, '2019-12-22 17:45:27', NULL),
(352, 44, 1, 3, NULL, '2019-12-22 17:56:24', NULL),
(353, 45, 1, 3, NULL, '2019-12-22 17:58:13', NULL),
(354, 25, 1, 2, NULL, '2019-12-22 18:18:23', NULL),
(355, 107, 1, 1, NULL, '2019-12-22 18:19:33', NULL),
(356, 108, 1, 1, NULL, '2019-12-22 18:21:38', NULL),
(357, 60, 1, 4, NULL, '2019-12-22 18:28:02', NULL),
(358, 109, 1, 1, NULL, '2019-12-23 18:04:25', NULL),
(359, 110, 1, 1, NULL, '2019-12-23 18:06:04', NULL),
(360, 110, 3, 1, NULL, '2019-12-23 18:59:31', NULL),
(361, 110, 3, 1, NULL, '2019-12-23 19:00:32', NULL),
(362, 96, 3, 1, NULL, '2019-12-23 19:03:56', NULL),
(363, 104, 3, 1, NULL, '2019-12-23 19:04:08', NULL),
(364, 111, 1, 1, NULL, '2019-12-23 19:08:04', NULL),
(365, 111, 2, 1, NULL, '2019-12-23 19:11:19', NULL),
(366, 111, 4, 1, NULL, '2019-12-23 19:11:36', NULL),
(367, 111, 3, 1, NULL, '2019-12-23 19:11:44', NULL),
(368, 112, 1, 1, NULL, '2019-12-23 20:05:14', NULL),
(369, 112, 2, 1, NULL, '2019-12-23 20:05:53', NULL),
(370, 112, 4, 1, NULL, '2019-12-23 20:06:06', NULL),
(371, 112, 3, 1, NULL, '2019-12-23 20:06:10', NULL),
(372, 109, 2, 1, NULL, '2019-12-23 20:06:43', NULL),
(373, 109, 4, 1, NULL, '2019-12-23 20:06:47', NULL),
(374, 109, 3, 1, NULL, '2019-12-23 20:06:50', NULL),
(375, 110, 3, 1, NULL, '2019-12-23 20:42:29', NULL),
(376, 113, 1, 1, NULL, '2019-12-23 20:43:46', NULL),
(377, 113, 2, 1, NULL, '2019-12-23 20:44:28', NULL),
(378, 113, 3, 1, NULL, '2019-12-23 20:44:36', NULL),
(379, 113, 3, 1, NULL, '2019-12-23 20:44:39', NULL),
(380, 113, 4, 1, NULL, '2019-12-23 20:44:45', NULL),
(381, 113, 3, 1, NULL, '2019-12-23 20:45:01', NULL),
(382, 113, 3, 1, NULL, '2019-12-23 20:45:43', NULL),
(383, 113, 3, 1, NULL, '2019-12-23 20:45:48', NULL),
(384, 113, 3, 1, NULL, '2019-12-23 20:45:49', NULL),
(385, 113, 3, 1, NULL, '2019-12-23 20:45:50', NULL),
(386, 113, 3, 1, NULL, '2019-12-23 20:45:52', NULL),
(387, 114, 1, 1, NULL, '2019-12-23 20:46:35', NULL),
(388, 113, 3, 1, NULL, '2019-12-23 20:46:45', NULL),
(389, 114, 3, 1, NULL, '2019-12-23 20:46:50', NULL),
(390, 114, 2, 1, NULL, '2019-12-23 20:46:53', NULL),
(391, 114, 3, 1, NULL, '2019-12-23 20:47:03', NULL),
(392, 114, 4, 1, NULL, '2019-12-23 20:47:09', NULL),
(393, 114, 3, 1, NULL, '2019-12-23 21:03:56', NULL),
(394, 115, 1, 1, NULL, '2019-12-23 21:07:51', NULL),
(395, 115, 3, 1, NULL, '2019-12-23 21:10:57', NULL),
(396, 115, 3, 1, NULL, '2019-12-23 21:11:22', NULL),
(397, 115, 3, 1, NULL, '2019-12-23 21:22:20', NULL),
(398, 116, 1, 1, NULL, '2019-12-23 21:46:13', NULL),
(399, 116, 2, 1, NULL, '2019-12-23 21:46:41', NULL),
(400, 116, 3, 1, NULL, '2019-12-23 21:47:38', NULL),
(401, 117, 1, 1, NULL, '2019-12-23 21:48:29', NULL),
(402, 117, 2, 1, NULL, '2019-12-23 21:48:54', NULL),
(403, 117, 3, 1, NULL, '2019-12-23 21:48:57', NULL),
(404, 117, 4, 1, NULL, '2019-12-23 21:49:00', NULL),
(405, 108, 2, 1, NULL, '2019-12-23 22:22:10', NULL),
(406, 118, 1, 1, NULL, '2019-12-23 22:22:18', NULL),
(407, 118, 2, 1, NULL, '2019-12-23 22:23:08', NULL),
(408, 118, 4, 1, NULL, '2019-12-23 22:23:40', NULL),
(409, 108, 3, 1, NULL, '2019-12-23 22:27:41', NULL),
(410, 119, 1, 1, NULL, '2019-12-23 22:55:51', NULL),
(411, 119, 2, 1, NULL, '2019-12-23 22:56:06', NULL),
(412, 119, 4, 1, NULL, '2019-12-23 23:01:24', NULL),
(413, 120, 1, 1, NULL, '2019-12-23 23:02:57', NULL),
(414, 120, 2, 1, NULL, '2019-12-23 23:03:08', NULL),
(415, 120, 3, 1, NULL, '2019-12-23 23:03:25', NULL),
(416, 121, 1, 1, NULL, '2019-12-23 23:07:34', NULL),
(417, 121, 2, 1, NULL, '2019-12-23 23:07:50', NULL),
(418, 121, 4, 1, NULL, '2019-12-23 23:08:32', NULL),
(419, 122, 1, 1, NULL, '2019-12-23 23:09:19', NULL),
(420, 122, 2, 1, '123123', '2019-12-23 23:09:58', NULL),
(421, 122, 3, 1, NULL, '2019-12-23 23:10:11', NULL),
(422, 123, 1, 1, NULL, '2019-12-23 23:30:40', NULL),
(423, 123, 2, 1, NULL, '2019-12-23 23:30:47', NULL),
(424, 123, 3, 1, NULL, '2019-12-23 23:31:56', NULL),
(425, 124, 1, 1, NULL, '2019-12-23 23:34:22', NULL),
(426, 124, 2, 1, NULL, '2019-12-23 23:34:31', NULL),
(427, 125, 1, 1, NULL, '2019-12-23 23:35:52', NULL),
(428, 124, 4, 1, NULL, '2019-12-23 23:39:49', NULL),
(429, 126, 1, 1, NULL, '2019-12-23 23:44:17', NULL),
(430, 125, 2, 1, NULL, '2019-12-23 23:44:30', NULL),
(431, 107, 2, 1, NULL, '2019-12-23 23:46:50', NULL),
(432, 127, 1, 1, NULL, '2019-12-23 23:47:34', NULL),
(433, 127, 2, 1, NULL, '2019-12-23 23:47:54', NULL),
(434, 128, 1, 1, NULL, '2019-12-23 23:58:55', NULL),
(435, 126, 2, 1, NULL, '2019-12-24 00:01:54', NULL),
(436, 127, 3, 1, NULL, '2019-12-24 00:02:22', NULL),
(437, 129, 1, 1, NULL, '2019-12-24 00:02:54', NULL),
(438, 129, 2, 1, NULL, '2019-12-24 00:03:17', NULL),
(439, 129, 3, 1, NULL, '2019-12-24 00:06:21', NULL),
(440, 130, 1, 1, NULL, '2019-12-24 16:49:02', NULL),
(441, 131, 1, 1, NULL, '2019-12-24 16:49:24', NULL),
(442, 132, 1, 1, NULL, '2019-12-24 16:49:50', NULL),
(443, 133, 1, 1, NULL, '2019-12-24 16:50:13', NULL),
(444, 134, 1, 1, NULL, '2019-12-24 16:50:37', NULL),
(445, 135, 1, 1, NULL, '2019-12-24 16:51:00', NULL),
(446, 130, 2, 1, NULL, '2019-12-24 16:52:26', NULL),
(447, 130, 3, 1, NULL, '2019-12-24 16:53:29', NULL),
(448, 131, 2, 1, NULL, '2019-12-24 16:56:58', NULL),
(449, 131, 3, 1, NULL, '2019-12-24 16:57:20', NULL),
(450, 132, 2, 1, NULL, '2019-12-24 16:59:17', NULL),
(451, 132, 3, 1, NULL, '2019-12-24 17:04:45', NULL),
(452, 133, 2, 1, NULL, '2019-12-24 17:16:31', NULL),
(453, 133, 4, 1, NULL, '2019-12-24 17:18:05', NULL),
(454, 136, 1, 1, NULL, '2019-12-24 17:29:25', NULL),
(455, 135, 3, 1, NULL, '2019-12-24 17:29:37', NULL),
(456, 137, 1, 1, NULL, '2019-12-24 18:01:17', NULL),
(457, 137, 2, 1, NULL, '2019-12-24 18:01:40', NULL),
(458, 138, 1, 1, NULL, '2019-12-24 18:16:51', NULL),
(459, 138, 2, 1, NULL, '2019-12-24 18:17:06', NULL),
(460, 136, 2, 1, NULL, '2019-12-24 18:36:29', NULL),
(461, 83, 2, 1, NULL, '2019-12-24 18:51:31', NULL),
(462, 83, 4, 1, NULL, '2019-12-24 18:51:54', NULL),
(463, 78, 2, 1, NULL, '2019-12-24 19:20:28', NULL),
(464, 78, 3, 1, NULL, '2019-12-24 19:21:14', NULL),
(465, 26, 1, 2, NULL, '2019-12-24 19:22:57', NULL),
(466, 26, 2, 2, 'تالا', '2019-12-24 19:24:28', NULL),
(467, 46, 1, 3, NULL, '2019-12-24 19:39:15', NULL),
(468, 46, 2, 3, NULL, '2019-12-24 19:39:31', NULL),
(469, 47, 1, 3, NULL, '2019-12-24 19:40:22', NULL),
(470, 47, 2, 3, NULL, '2019-12-24 19:40:46', NULL),
(471, 69, 4, 1, NULL, '2019-12-24 19:57:16', NULL),
(472, 61, 1, 4, NULL, '2019-12-24 20:31:47', NULL),
(473, 62, 1, 4, NULL, '2019-12-24 20:34:12', NULL),
(474, 26, 4, 2, NULL, '2019-12-24 20:42:43', NULL),
(475, 27, 1, 2, NULL, '2019-12-24 20:46:23', NULL),
(476, 27, 2, 2, NULL, '2019-12-24 20:46:41', NULL),
(477, 27, 3, 2, NULL, '2019-12-24 20:46:52', NULL),
(478, 48, 1, 3, NULL, '2019-12-24 21:02:41', NULL),
(479, 48, 2, 3, NULL, '2019-12-24 21:03:36', NULL),
(480, 48, 4, 3, NULL, '2019-12-24 21:04:31', NULL),
(481, 49, 1, 3, NULL, '2019-12-24 21:05:55', NULL),
(482, 49, 2, 3, NULL, '2019-12-24 21:06:12', NULL),
(483, 49, 3, 3, NULL, '2019-12-24 21:07:01', NULL),
(484, 62, 3, 4, NULL, '2019-12-24 21:40:07', NULL),
(485, 63, 1, 4, NULL, '2019-12-24 21:48:51', NULL),
(486, 63, 3, 4, NULL, '2019-12-24 21:54:22', NULL),
(487, 64, 1, 4, NULL, '2019-12-24 21:57:03', NULL),
(488, 139, 1, 1, NULL, '2019-12-24 23:26:10', NULL),
(489, 139, 2, 1, NULL, '2019-12-24 23:26:49', NULL),
(490, 139, 3, 1, NULL, '2019-12-24 23:28:24', NULL),
(491, 136, 4, 1, NULL, '2019-12-24 23:41:56', NULL),
(492, 134, 2, 1, NULL, '2019-12-24 23:43:11', NULL),
(493, 140, 1, 1, NULL, '2019-12-24 23:43:47', NULL),
(494, 140, 2, 1, NULL, '2019-12-24 23:44:03', NULL),
(495, 140, 4, 1, NULL, '2019-12-24 23:45:09', NULL),
(496, 141, 1, 1, NULL, '2019-12-26 17:05:56', NULL),
(497, 141, 2, 1, NULL, '2019-12-26 17:06:52', NULL),
(498, 141, 4, 1, NULL, '2019-12-26 17:07:58', NULL),
(499, 142, 1, 1, NULL, '2019-12-26 17:08:29', NULL),
(500, 142, 2, 1, NULL, '2019-12-26 17:08:50', NULL),
(501, 142, 4, 1, NULL, '2019-12-26 17:18:01', NULL),
(502, 143, 1, 1, NULL, '2019-12-26 17:24:24', NULL),
(503, 143, 2, 1, NULL, '2019-12-26 17:24:43', NULL),
(504, 144, 1, 1, NULL, '2019-12-26 17:41:40', NULL),
(505, 144, 2, 1, NULL, '2019-12-26 17:42:00', NULL),
(506, 144, 4, 1, NULL, '2019-12-26 17:42:14', NULL),
(507, 145, 1, 1, NULL, '2019-12-26 18:10:37', NULL),
(508, 50, 1, 3, NULL, '2019-12-26 18:10:56', NULL),
(509, 28, 1, 2, NULL, '2019-12-26 18:11:15', NULL),
(510, 65, 1, 4, NULL, '2019-12-26 18:11:53', NULL),
(511, 28, 2, 2, NULL, '2019-12-26 18:15:00', NULL),
(512, 28, 3, 2, NULL, '2019-12-26 18:15:17', NULL),
(513, 145, 3, 1, NULL, '2019-12-26 18:25:43', NULL),
(514, 65, 3, 4, NULL, '2019-12-26 18:25:55', NULL),
(515, 29, 1, 2, NULL, '2019-12-26 18:26:16', NULL),
(516, 29, 3, 2, NULL, '2019-12-26 18:26:39', NULL),
(517, 51, 1, 3, NULL, '2019-12-26 19:15:03', NULL),
(518, 66, 1, 4, NULL, '2019-12-26 19:16:04', NULL),
(519, 51, 2, 3, NULL, '2019-12-26 21:42:32', NULL),
(520, 51, 4, 3, NULL, '2019-12-26 21:43:41', NULL),
(521, 52, 1, 3, NULL, '2019-12-26 21:44:28', NULL),
(522, 52, 2, 3, NULL, '2019-12-26 21:47:09', NULL),
(523, 67, 1, 4, NULL, '2019-12-26 22:19:24', NULL),
(524, 67, 2, 4, NULL, '2019-12-26 22:19:59', NULL),
(525, 67, 4, 4, NULL, '2019-12-26 22:21:55', NULL),
(526, 68, 1, 4, NULL, '2019-12-26 22:22:53', NULL),
(527, 68, 2, 4, NULL, '2019-12-26 22:23:14', NULL),
(528, 68, 3, 4, NULL, '2019-12-26 22:23:33', NULL),
(529, 146, 1, 1, NULL, '2019-12-26 22:25:27', NULL),
(530, 146, 2, 1, NULL, '2019-12-26 22:27:19', NULL),
(531, 146, 4, 1, NULL, '2019-12-26 22:28:53', NULL),
(532, 143, 4, 1, NULL, '2019-12-26 22:29:35', NULL),
(533, 69, 1, 4, NULL, '2019-12-26 22:30:27', NULL),
(534, 69, 2, 4, NULL, '2019-12-26 22:30:57', NULL),
(535, 147, 1, 1, NULL, '2019-12-26 22:32:54', NULL),
(536, 147, 2, 1, NULL, '2019-12-26 22:33:36', NULL),
(537, 147, 4, 1, NULL, '2019-12-26 22:42:48', NULL),
(538, 134, 3, 1, NULL, '2019-12-26 22:43:23', NULL),
(539, 126, 4, 1, NULL, '2019-12-26 22:43:57', NULL),
(540, 125, 4, 1, NULL, '2019-12-26 22:44:04', NULL),
(541, 107, 4, 1, NULL, '2019-12-26 22:44:08', NULL),
(542, 48, 4, 1, NULL, '2019-12-26 22:44:11', NULL),
(543, 101, 4, 1, NULL, '2019-12-26 22:44:50', NULL),
(544, 105, 4, 1, NULL, '2019-12-26 22:44:51', NULL),
(545, 138, 4, 1, NULL, '2019-12-26 22:44:55', NULL),
(546, 128, 3, 1, NULL, '2019-12-26 22:45:32', NULL),
(547, 52, 3, 1, NULL, '2019-12-26 22:45:36', NULL),
(548, 46, 3, 1, NULL, '2019-12-26 22:45:38', NULL),
(549, 41, 3, 1, NULL, '2019-12-26 22:45:41', NULL),
(550, 70, 1, 4, NULL, '2019-12-26 22:55:12', NULL),
(551, 70, 2, 4, NULL, '2019-12-26 22:56:55', NULL),
(552, 70, 4, 4, NULL, '2019-12-26 22:57:30', NULL),
(553, 148, 1, 1, NULL, '2019-12-27 18:42:02', NULL),
(554, 149, 1, 1, NULL, '2019-12-27 18:42:37', NULL),
(555, 150, 1, 1, NULL, '2019-12-27 18:43:48', NULL),
(556, 151, 1, 1, NULL, '2019-12-27 18:45:24', NULL),
(557, 152, 1, 1, NULL, '2019-12-27 18:45:45', NULL),
(558, 153, 1, 1, NULL, '2019-12-27 18:46:01', NULL),
(559, 154, 1, 1, NULL, '2019-12-27 18:46:33', NULL),
(560, 155, 1, 1, NULL, '2019-12-27 18:46:35', NULL),
(561, 156, 1, 1, NULL, '2019-12-27 18:46:57', NULL),
(562, 157, 1, 1, NULL, '2019-12-27 18:47:07', NULL),
(563, 158, 1, 1, NULL, '2019-12-27 18:47:29', NULL),
(564, 159, 1, 1, NULL, '2019-12-27 18:48:01', NULL),
(565, 160, 1, 1, NULL, '2019-12-27 18:48:15', NULL),
(566, 161, 1, 1, NULL, '2019-12-27 20:51:28', NULL),
(567, 162, 1, 1, NULL, '2019-12-27 20:53:23', NULL),
(568, 162, 2, 1, NULL, '2019-12-27 21:04:18', NULL),
(569, 162, 4, 1, 'تمام', '2019-12-27 21:05:10', NULL),
(570, 71, 1, 4, NULL, '2019-12-28 03:37:15', NULL),
(571, 72, 1, 4, NULL, '2019-12-28 03:38:36', NULL),
(572, 72, 2, 4, 'Ok', '2019-12-28 03:45:04', NULL),
(573, 71, 3, 4, 'No', '2019-12-28 03:46:42', NULL),
(574, 163, 1, 1, NULL, '2019-12-28 03:49:19', NULL),
(575, 164, 1, 1, NULL, '2019-12-28 03:49:52', NULL),
(576, 163, 2, 1, 'Ok', '2019-12-28 03:53:12', NULL),
(577, 164, 3, 1, 'No', '2019-12-28 03:53:57', NULL),
(578, 165, 1, 1, NULL, '2019-12-28 04:00:57', NULL),
(579, 166, 1, 1, NULL, '2019-12-28 04:02:19', NULL),
(580, 166, 2, 1, 'Ok', '2019-12-28 04:03:38', NULL),
(581, 165, 3, 1, 'No', '2019-12-28 04:04:41', NULL),
(582, 73, 1, 4, NULL, '2019-12-28 04:06:03', NULL),
(583, 74, 1, 4, NULL, '2019-12-28 04:06:54', NULL),
(584, 73, 2, 4, NULL, '2019-12-28 04:08:06', NULL),
(585, 167, 1, 1, NULL, '2019-12-29 16:35:28', NULL),
(586, 168, 1, 1, NULL, '2019-12-29 16:37:26', NULL),
(587, 169, 1, 1, NULL, '2019-12-29 16:54:28', NULL),
(588, 170, 1, 1, NULL, '2019-12-29 17:05:22', NULL),
(589, 171, 1, 1, NULL, '2019-12-29 17:06:44', NULL),
(590, 172, 1, 1, NULL, '2019-12-29 17:08:08', NULL),
(591, 173, 1, 1, NULL, '2019-12-29 17:08:48', NULL),
(592, 174, 1, 1, NULL, '2019-12-29 17:19:12', NULL),
(593, 75, 1, 4, NULL, '2019-12-29 17:19:52', NULL),
(594, 76, 1, 4, NULL, '2019-12-29 17:20:46', NULL),
(595, 175, 1, 1, NULL, '2019-12-29 17:21:49', NULL),
(596, 175, 2, 1, NULL, '2019-12-29 17:22:14', NULL),
(597, 176, 1, 1, NULL, '2019-12-29 17:30:19', NULL),
(598, 177, 1, 1, NULL, '2019-12-29 18:03:35', NULL),
(599, 177, 2, 1, NULL, '2019-12-29 18:03:56', NULL),
(600, 177, 3, 1, NULL, '2019-12-29 18:04:14', NULL),
(601, 178, 1, 1, NULL, '2019-12-29 18:07:53', NULL),
(602, 178, 2, 1, NULL, '2019-12-29 18:08:39', NULL),
(603, 178, 4, 1, NULL, '2019-12-29 18:08:45', NULL),
(604, 179, 1, 1, NULL, '2019-12-29 18:09:37', NULL),
(605, 179, 2, 1, 'Hvhh', '2019-12-29 18:12:34', NULL),
(606, 179, 3, 1, NULL, '2019-12-29 18:12:43', NULL),
(607, 180, 1, 1, NULL, '2019-12-29 18:13:15', NULL),
(608, 180, 2, 1, NULL, '2019-12-29 18:13:35', NULL),
(609, 181, 1, 1, NULL, '2019-12-29 18:30:56', NULL),
(610, 182, 1, 1, NULL, '2019-12-29 18:32:06', NULL),
(611, 183, 1, 1, NULL, '2019-12-29 18:32:52', NULL),
(612, 184, 1, 1, NULL, '2019-12-29 19:23:39', NULL),
(613, 185, 1, 1, NULL, '2019-12-29 19:25:57', NULL),
(614, 186, 1, 1, NULL, '2019-12-30 17:16:51', NULL),
(615, 30, 1, 2, NULL, '2019-12-30 17:19:48', NULL),
(616, 31, 1, 2, NULL, '2019-12-30 18:18:44', NULL),
(617, 31, 2, 2, NULL, '2019-12-30 18:19:02', NULL),
(618, 31, 3, 2, NULL, '2019-12-30 18:19:25', NULL),
(619, 53, 1, 3, NULL, '2019-12-30 19:29:35', NULL),
(620, 187, 1, 1, NULL, '2019-12-30 23:21:46', NULL),
(621, 188, 1, 1, NULL, '2019-12-30 23:23:52', NULL),
(622, 188, 3, 1, NULL, '2019-12-31 16:47:48', NULL),
(623, 188, 2, 1, NULL, '2019-12-31 16:48:55', NULL),
(624, 172, 3, 1, NULL, '2019-12-31 16:51:49', NULL),
(625, 187, 3, 1, NULL, '2019-12-31 16:55:28', NULL),
(626, 189, 1, 1, NULL, '2019-12-31 17:42:40', NULL),
(627, 190, 1, 1, NULL, '2019-12-31 17:43:41', NULL),
(628, 191, 1, 1, NULL, '2019-12-31 18:20:32', NULL),
(629, 32, 1, 2, NULL, '2019-12-31 18:41:44', NULL),
(630, 54, 1, 3, NULL, '2019-12-31 18:42:07', NULL),
(631, 77, 1, 4, NULL, '2019-12-31 19:00:03', NULL),
(632, 192, 1, 1, NULL, '2019-12-31 19:04:55', NULL),
(633, 192, 2, 1, NULL, '2019-12-31 19:08:34', NULL),
(634, 192, 3, 1, NULL, '2019-12-31 19:09:48', NULL),
(635, 193, 1, 1, NULL, '2019-12-31 19:10:42', NULL),
(636, 193, 2, 1, NULL, '2019-12-31 19:11:06', NULL),
(637, 193, 3, 1, NULL, '2019-12-31 19:11:31', NULL),
(638, 173, 2, 1, NULL, '2019-12-31 19:57:55', NULL),
(639, 194, 1, 1, NULL, '2019-12-31 21:09:17', NULL),
(640, 194, 2, 1, NULL, '2019-12-31 21:15:43', NULL),
(641, 194, 4, 1, NULL, '2019-12-31 21:18:37', NULL),
(642, 54, 3, 3, NULL, '2019-12-31 22:46:03', NULL),
(643, 33, 1, 2, NULL, '2020-01-01 17:17:36', NULL),
(644, 78, 1, 4, NULL, '2020-01-02 17:34:21', NULL),
(645, 34, 1, 2, NULL, '2020-01-02 17:35:23', NULL),
(646, 55, 1, 3, NULL, '2020-01-02 17:35:41', NULL),
(647, 195, 1, 1, NULL, '2020-01-02 17:36:03', NULL),
(648, 35, 1, 2, NULL, '2020-01-02 17:36:35', NULL),
(649, 79, 1, 4, NULL, '2020-01-02 17:37:16', NULL),
(650, 80, 1, 4, NULL, '2020-01-02 17:58:15', NULL),
(651, 81, 1, 4, NULL, '2020-01-02 18:00:14', NULL),
(652, 36, 1, 2, NULL, '2020-01-02 18:01:28', NULL),
(653, 196, 1, 1, NULL, '2020-01-02 18:04:14', NULL),
(654, 196, 2, 1, NULL, '2020-01-02 18:04:45', NULL),
(655, 196, 4, 1, NULL, '2020-01-02 18:06:27', NULL),
(656, 197, 1, 1, NULL, '2020-01-02 18:22:19', NULL),
(657, 198, 1, 1, NULL, '2020-01-05 16:28:17', NULL),
(658, 198, 2, 1, 'تم قبول طلبك', '2020-01-05 16:28:40', NULL),
(659, 82, 1, 4, NULL, '2020-01-05 17:09:27', NULL),
(660, 83, 1, 4, NULL, '2020-01-05 17:10:06', NULL),
(661, 77, 3, 4, NULL, '2020-01-05 17:47:46', NULL),
(662, 83, 4, 4, NULL, '2020-01-05 17:49:21', NULL),
(663, 82, 2, 4, NULL, '2020-01-05 17:49:51', NULL),
(664, 197, 2, 1, NULL, '2020-01-05 18:06:43', NULL),
(665, 56, 1, 3, NULL, '2020-01-05 23:49:39', NULL),
(666, 199, 1, 1, NULL, '2020-01-06 06:16:45', NULL),
(667, 199, 2, 1, NULL, '2020-01-06 06:38:45', NULL),
(668, 199, 3, 1, NULL, '2020-01-06 06:39:44', NULL),
(669, 200, 1, 1, NULL, '2020-01-06 06:43:35', NULL),
(670, 200, 2, 1, NULL, '2020-01-06 06:43:56', NULL),
(671, 200, 3, 1, NULL, '2020-01-06 06:44:27', NULL),
(672, 198, 3, 1, NULL, '2020-01-06 17:54:16', NULL),
(673, 201, 1, 1, NULL, '2020-01-06 17:57:27', NULL),
(674, 202, 1, 1, NULL, '2020-01-06 18:16:12', NULL),
(675, 202, 3, 1, NULL, '2020-01-06 18:17:29', NULL),
(676, 201, 3, 1, NULL, '2020-01-06 18:20:18', NULL),
(677, 167, 3, 1, NULL, '2020-01-06 18:22:22', NULL),
(678, 160, 3, 1, NULL, '2020-01-06 18:29:51', NULL),
(679, 169, 3, 1, NULL, '2020-01-06 18:44:39', NULL),
(680, 168, 3, 1, NULL, '2020-01-06 18:52:59', NULL),
(681, 32, 3, 1, NULL, '2020-01-06 19:02:45', NULL),
(682, 203, 1, 1, NULL, '2020-01-06 19:41:10', NULL),
(683, 203, 3, 1, NULL, '2020-01-06 20:06:42', NULL),
(684, 204, 1, 1, NULL, '2020-01-06 20:07:47', NULL),
(685, 204, 3, 1, NULL, '2020-01-06 20:09:51', NULL),
(686, 205, 1, 1, NULL, '2020-01-06 20:13:13', NULL),
(687, 205, 3, 1, NULL, '2020-01-06 20:14:44', NULL),
(688, 206, 1, 1, NULL, '2020-01-06 21:10:41', NULL),
(689, 206, 3, 1, NULL, '2020-01-06 21:10:52', NULL),
(690, 207, 1, 1, NULL, '2020-01-06 21:18:28', NULL),
(691, 207, 3, 1, NULL, '2020-01-06 21:21:26', NULL),
(692, 208, 1, 1, NULL, '2020-01-06 21:27:38', NULL),
(693, 208, 2, 1, NULL, '2020-01-06 21:29:43', NULL),
(694, 197, 3, 1, NULL, '2020-01-06 21:30:12', NULL),
(695, 209, 1, 1, NULL, '2020-01-06 21:32:21', NULL),
(696, 209, 2, 1, NULL, '2020-01-06 21:33:30', NULL),
(697, 209, 3, 1, NULL, '2020-01-06 21:33:46', NULL),
(698, 210, 1, 1, NULL, '2020-01-06 21:43:23', NULL),
(699, 211, 1, 1, NULL, '2020-01-06 22:10:06', NULL),
(700, 212, 1, 1, NULL, '2020-01-06 22:14:12', NULL),
(701, 212, 3, 1, NULL, '2020-01-06 22:15:10', NULL),
(702, 211, 2, 1, 'edr  few', '2020-01-06 22:16:17', NULL),
(703, 213, 1, 1, NULL, '2020-01-06 22:36:05', NULL),
(704, 213, 2, 1, NULL, '2020-01-06 22:45:21', NULL),
(705, 213, 3, 1, NULL, '2020-01-06 22:46:17', NULL),
(706, 211, 3, 1, NULL, '2020-01-06 22:46:53', NULL),
(707, 214, 1, 1, NULL, '2020-01-06 22:47:41', NULL),
(708, 215, 1, 1, NULL, '2020-01-06 22:51:09', NULL),
(709, 215, 2, 1, NULL, '2020-01-06 23:10:33', NULL),
(710, 215, 3, 1, NULL, '2020-01-06 23:11:15', NULL),
(711, 214, 2, 1, NULL, '2020-01-06 23:11:31', NULL),
(712, 214, 4, 1, NULL, '2020-01-06 23:12:01', NULL),
(713, 37, 1, 2, NULL, '2020-01-06 23:29:27', NULL),
(714, 37, 2, 2, NULL, '2020-01-06 23:29:49', NULL),
(715, 37, 3, 2, NULL, '2020-01-06 23:30:52', NULL),
(716, 38, 1, 2, NULL, '2020-01-06 23:32:46', NULL),
(717, 38, 2, 2, NULL, '2020-01-06 23:33:15', NULL),
(718, 38, 4, 2, NULL, '2020-01-06 23:36:43', NULL),
(719, 39, 1, 2, NULL, '2020-01-06 23:38:05', NULL),
(720, 57, 1, 3, NULL, '2020-01-07 00:00:15', NULL),
(721, 58, 1, 3, NULL, '2020-01-07 00:00:52', NULL),
(722, 59, 1, 3, NULL, '2020-01-07 00:01:24', NULL),
(723, 60, 1, 3, NULL, '2020-01-07 00:03:09', NULL),
(724, 60, 2, 3, NULL, '2020-01-07 00:03:28', NULL),
(725, 84, 1, 4, NULL, '2020-01-08 17:14:20', NULL),
(726, 85, 1, 4, NULL, '2020-01-08 17:18:19', NULL),
(727, 86, 1, 4, NULL, '2020-01-08 17:20:13', NULL),
(728, 87, 1, 4, NULL, '2020-01-08 17:21:02', NULL),
(729, 88, 1, 4, NULL, '2020-01-08 17:22:46', NULL),
(730, 87, 2, 4, NULL, '2020-01-08 17:46:36', NULL),
(731, 85, 2, 4, NULL, '2020-01-08 17:47:03', NULL),
(732, 85, 3, 4, NULL, '2020-01-08 17:50:11', NULL),
(733, 216, 1, 1, NULL, '2020-01-08 18:17:47', NULL),
(734, 89, 1, 4, NULL, '2020-01-08 18:19:14', NULL),
(735, 90, 1, 4, NULL, '2020-01-08 18:22:55', NULL),
(736, 217, 1, 1, NULL, '2020-01-08 18:23:29', NULL),
(737, 218, 1, 1, NULL, '2020-01-08 20:46:22', NULL),
(738, 218, 2, 1, 'الاا', '2020-01-08 20:46:55', NULL),
(739, 40, 1, 2, NULL, '2020-01-08 21:20:31', NULL),
(740, 40, 2, 2, NULL, '2020-01-08 21:21:03', NULL),
(741, 40, 3, 2, NULL, '2020-01-08 21:21:36', NULL),
(742, 61, 1, 3, NULL, '2020-01-08 21:29:22', NULL),
(743, 61, 3, 3, NULL, '2020-01-08 21:29:41', NULL),
(744, 91, 1, 4, NULL, '2020-01-08 21:39:43', NULL),
(745, 91, 2, 4, NULL, '2020-01-08 21:40:39', NULL),
(746, 91, 4, 4, NULL, '2020-01-08 21:41:09', NULL),
(747, 92, 1, 4, NULL, '2020-01-08 21:48:49', NULL),
(748, 219, 1, 1, NULL, '2020-01-11 04:49:57', NULL),
(749, 220, 1, 1, NULL, '2020-01-16 13:40:48', NULL),
(750, 220, 2, 1, NULL, '2020-01-16 13:40:59', NULL),
(751, 221, 1, 1, NULL, '2020-01-16 20:11:35', NULL),
(752, 222, 1, 1, NULL, '2020-01-16 22:07:04', NULL),
(753, 222, 2, 1, NULL, '2020-01-16 22:07:52', NULL),
(754, 223, 1, 1, NULL, '2020-01-16 22:48:04', NULL),
(755, 223, 2, 1, NULL, '2020-01-16 22:48:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL,
  `hospital_latitude` varchar(100) NOT NULL,
  `hospital_longitude` varchar(100) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`hospital_id`, `hospital_latitude`, `hospital_longitude`, `city_id`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(6, '38.931', '21.4507', 2, 1, 1, '2019-11-20 07:45:58', NULL),
(22, '26.412841', '50.115491', 1, 1, 1, '2019-12-16 12:19:43', NULL),
(24, '1756', '555', 4, 1, 1, '2020-01-14 08:58:19', NULL),
(30, '4545', '4545', 2, 1, 1, '2020-01-14 08:58:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_clinic`
--

CREATE TABLE `hospital_clinic` (
  `hospital_clinic_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hospital_clinic`
--

INSERT INTO `hospital_clinic` (`hospital_clinic_id`, `hospital_id`, `clinic_id`, `created_at`, `updated_at`) VALUES
(2, 6, 4, '2019-11-12 09:38:14', NULL),
(3, 6, 5, '2019-11-12 12:03:44', NULL),
(13, 22, 16, '2019-11-25 20:47:44', NULL),
(14, 22, 17, '2019-11-25 20:50:23', NULL),
(17, 6, 27, '2019-12-25 12:11:06', NULL),
(18, 6, 28, '2019-12-25 12:38:07', NULL),
(20, 6, 30, '2019-12-25 12:42:25', NULL),
(21, 6, 31, '2019-12-25 12:43:16', NULL),
(22, 22, 32, '2019-12-25 12:48:12', NULL),
(23, 22, 33, '2019-12-25 12:55:47', NULL),
(24, 22, 34, '2019-12-25 13:00:24', NULL),
(25, 22, 35, '2019-12-25 13:00:57', NULL),
(26, 22, 36, '2019-12-25 13:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_description`
--

CREATE TABLE `hospital_description` (
  `hospital_description_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `hospital_name` varchar(50) NOT NULL,
  `hospital_description_part` varchar(150) NOT NULL,
  `hospital_description_full` text NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hospital_description`
--

INSERT INTO `hospital_description` (`hospital_description_id`, `language_id`, `hospital_name`, `hospital_description_part`, `hospital_description_full`, `hospital_id`, `created_at`, `updated_at`) VALUES
(9, 1, 'King Faisal Specialist Hospital in Jeddah', 'King Faisal Specialist Hospital Research Centre provides the highest level of specialized healthcare in .', 'King Abdullah Center for Oncology and Liver Diseases (KACO&LD) at King Faisal Specialist Hospital and Research Centre in Riyadh was inaugurated on Tuesday, April 11, 2017. It is the largest specialized center of its kind in the region, and represents a significant expansion to King Faisal Specialist Hospital in Riyadh with 300 beds in smart rooms plus 96 beds in the infusion centre (chemical and biological treatment) and 8 operating rooms equipped with the state-of-the-art specialized medical technology in addition to other medical support services such as radiology, pharmacy and laboratory, which will enable the Hospital to double the number of patients who are accepted and treated in the field of oncology and liver diseases. The KACO&LD’s smart technologies will provide a new and improved patient experience, and will also provide healthcare providers with access to the latest equipment and an enhanced working environment.', 6, '2020-01-14 07:49:31', NULL),
(10, 2, 'مستشفى الملك فيصل التخصصي بجدة', 'يوفر مستشفى الملك فيصل التخصصي ومركز الأبحاث أعلى مستوى من الرعاية الصحية المتخصصة في بيئة تعليمية وبحثية متكاملة.', 'تم افتتاح مركز الملك عبد الله لأورام وأمراض الكبد (KACO & LD) في مستشفى الملك فيصل التخصصي ومركز الأبحاث بالرياض يوم الثلاثاء الموافق 11 أبريل 2017. وهو أكبر مركز متخصص من نوعه في المنطقة ، ويمثل توسعًا كبيرًا في مستشفى الملك فيصل التخصصي بالرياض يضم 300 سرير في غرف ذكية بالإضافة إلى 96 سريراً في مركز الحقن (العلاج الكيميائي والبيولوجي) و 8 غرف عمليات مجهزة بأحدث التقنيات الطبية المتخصصة بالإضافة إلى خدمات الدعم الطبي الأخرى مثل كما الأشعة ، الصيدلة والمختبر ، والتي ستمكن المستشفى من مضاعفة عدد المرضى الذين يتم قبولهم وعلاجهم في مجال علاج الأورام وأمراض الكبد. ستوفر تقنيات KACO و LD الذكية تجربة جديدة ومحسّنة للمرضى ، وستوفر أيضًا لمقدمي الرعاية الصحية إمكانية الوصول إلى أحدث المعدات وبيئة عمل محسّنة.', 6, '2019-11-12 07:58:12', NULL),
(27, 1, 'hospital Almana', 'General hospital', 'general hospital', 22, '2019-12-16 11:43:38', NULL),
(28, 2, 'مستشفي المانع', 'مستشفي عام', 'مستشفي عامو   ً', 22, '2020-01-14 07:58:36', NULL),
(31, 1, 'hospital Almana 2', 'kjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j h (( 34 j hj hkjnkjkkjk j hjhj hjh hjhjh', 'kjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j h (( 34 j hj hkjnkjkkjk j hjhj hjh hjhjhkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j h (( 34 j hj hkjnkjkkjk j hjhj hjh hjhjhkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j hjhj hjh hjhjh jhj hj hj hkjnkjkkjk j h (( 34 j hj hkjnkjkkjk j hjhj hjh hjhjh', 24, '2019-12-25 07:35:31', NULL),
(32, 2, 'مستشفي المانع 2', 'ءينستينس بيبي بي سيبيس يسيس يسءينستي (( 2145 يسيس يسء   ،،ّ ٍ ِ~ْ}{لآآآ,. /،ـأألأ   ُ  ً  َ', 'ءينستينس بيبي بي سيبيس يسيس يسءينستي (( 2145 يسيس يسءينستينس بيبي بي سيبيس يسيس يسءينستينس بيبي بي سيبيس يسيس يسءينستينس بيبي بي سيبءينستينس بيبي بي سيبيس يسيس يسءينستي (( 2145 يسيس يسءينستينس بيبي بي سيبيس يسيس يسءينستينس بيبي بي سيبيس  ،،ّ ،،ّ ٍ ِ~ْ}{لآآآ,. /،ـأألأ   ُ  ً  َ', 24, '2020-01-14 07:56:03', NULL),
(43, 1, 'test', 'kdsfkedo', 'f ewfew f', 30, '2020-01-14 08:51:00', NULL),
(44, 2, 'تجريبي', 'dw d ثقصبن', 'يسمب بنثص ب ً', 30, '2020-01-14 08:51:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `image`, `type`, `type_id`, `created_at`, `updated_at`) VALUES
(7, 'images/hospital/1573120994_393458848.jpg', 1, 1, '2019-11-07 10:03:14', NULL),
(9, 'images/hospital/1573121756_290784779.jpg', 1, 1, '2019-11-07 10:15:56', NULL),
(10, 'images/hospital/1573121756_511871969.jpg', 1, 1, '2019-11-07 10:15:56', NULL),
(11, 'images/hospital/1573121756_484734110.jpeg', 1, 1, '2019-11-07 10:15:56', NULL),
(28, 'images/hospital/1573458966_1805099755.jpg', 1, 1, '2019-11-11 07:56:06', NULL),
(29, 'images/hospital/1573458966_1030917109.webp', 1, 1, '2019-11-11 07:56:06', NULL),
(30, 'images/hospital/1573458966_163037139.jpg', 1, 1, '2019-11-11 07:56:06', NULL),
(31, 'images/hospital/1573458966_1395450534.jpg', 1, 1, '2019-11-11 07:56:06', NULL),
(38, 'images/catering/gQ1ThXKMdJuQRfSetoIwNpz0NIVHb9I27yuzWAq0.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(39, 'images/catering/7lTEQcqWzrgUm0o2UzIDb4LjneYL0qq6rkzZmrRt.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(40, 'images/catering/WulDcsjuUuCdRmUVbPusnS2ebBV5f4pAqCBLQKqh.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(41, 'images/catering/0RYOhpwiBjd371WDseSsKNOYE8lmAH2dulcbv2Ye.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(42, 'images/catering/oUGed3mEXTdevzgPDNOFg4SdRlNFJwVisjbuq9wI.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(43, 'images/catering/adKuqgbjIikuPZwHy4TiavAWJrADQMjNwtkhoICK.webp', 4, 1, '2019-11-11 12:07:10', NULL),
(44, 'images/catering/XJuUbcZ9R9AZ93DJJ2FXHuevigyA4tSQkliUOsmY.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(45, 'images/catering/UtAzNY78teKCXmfYCEcMJMU4TohFGyRDSSwjNtQ8.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(46, 'images/catering/mDX9h5iVZOOQFLZjj827ZrrSMJGIKTbMI56TKy6o.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(47, 'images/catering/VkH3WwOd5SYxD27IM5zogZYDtD0IbtAQKMsa66IN.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(48, 'images/catering/udWEV3qAhIsTi8y9M2hMm9QeoAzISEdEsgRWZSP5.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(49, 'images/catering/pKeqHPun1WHLkQi7snER4hY4aR9MN1FScc3MrMD2.jpeg', 4, 1, '2019-11-11 12:07:10', NULL),
(50, 'images/hospital/hJwUQ08sqd8upMN85ihlC7aYV2o9w1lFhlGMuooS.png', 1, 6, '2019-12-18 12:02:26', NULL),
(52, 'images/clinic/wi7lttk3iw0uWBZeP0AyvtTWWB2I7ebY4fdEQJQE.png', 2, 1, '2019-11-12 11:50:15', NULL),
(53, 'images/clinic/vbncyITTw8SPIeUGbxQ676ICp3BhaPzJJH1cKh32.png', 2, 1, '2019-12-18 10:20:15', NULL),
(54, 'images/restaurant/gFVyfZH8oQU6Y9IytNMdlnwmWVmAQp8U5NGsdlHI.png', 3, 1, '2019-11-12 12:09:03', NULL),
(55, 'images/restaurant/90B3zPwQP7xifHgTj4jlAvHLGJ8MAjiW9DjCuKp1.png', 3, 1, '2019-11-12 12:09:17', NULL),
(56, 'images/hospital/niROZA1iLKkmOzrmRg4BJ8GydGyWw7CNznJMFuDx.jpeg', 1, 18, '2019-11-20 12:06:39', NULL),
(57, 'images/hospital/1vFnP9ANQ7PbXPBsPXbmXOpsmpQGmUn9dkZRv3gn.jpeg', 1, 18, '2019-11-20 12:06:39', NULL),
(58, 'images/clinic/NiDdSN3UeuOnBedp6i60Or0gZlvfp46TTfJLmXnR.jpeg', 2, 12, '2019-11-20 12:28:15', NULL),
(59, 'images/clinic/LPoU9L0266PH1UUNozZ57cPbtFgpBj6aTd9hb1Xs.jpeg', 2, 12, '2019-11-20 12:28:15', NULL),
(60, 'images/restaurant/5XTxs07w66UYgUkWQ2X6pFIjVfzicS4wak2i4DIA.jpeg', 3, 5, '2019-11-20 12:35:00', NULL),
(61, 'images/restaurant/wRIVwxgt2NVmeRSfEtrEBAGjqFRN7ezX8DGuK1YW.jpeg', 3, 5, '2019-11-20 12:35:00', NULL),
(62, 'images/catering/tQMmouULCdbMnHY2aQUcK0oTHN3bz4nb0LLlvOk6.jpeg', 4, 4, '2019-11-20 13:28:29', NULL),
(64, 'images/catering/z3TBRMvik5e1C5uwp7Uesri84hDG613qTcWOHg3F.jpeg', 4, 4, '2019-11-20 14:01:59', NULL),
(65, 'images/catering/BJRjz6GwxMjUCm7fM4TgoxQP6FCrU30aAAnaDe7s.jpeg', 4, 4, '2019-11-20 14:01:59', NULL),
(66, 'images/hospital/UUGGOyQ0lhDthbfFvaSepZ17u4C6bMd8vp6VsnDi.png', 1, 22, '2019-12-16 13:34:10', NULL),
(68, 'images/hospital/znw0K6Bw2OMS7cEuEmJAtkI18reZj5yXfTDATdj4.png', 1, 22, '2019-12-16 13:35:02', NULL),
(69, 'images/hospital/LxGU7G7azs9fPt9L0w3wr2J2DIygLvpNIyiS53td.png', 1, 22, '2019-12-16 13:35:24', NULL),
(71, 'images/hospital/I92fWPp1pEdFH0YtSzoTJ4hkpw5w5C5XyNBLapCK.jpeg', 4, 1, '2019-12-18 08:30:24', NULL),
(72, 'images/hospital/QMLxQyxB0xIlpzuMjR9vLVNSeIGvFtAA7PiKG5Oo.png', 1, 6, '2019-12-18 12:03:19', NULL),
(74, 'images/hospital/4MXb3H5pH0xBwO9Ww5Oyad0RsY7DtNhUFPVq9mqg.jpeg', 1, 22, '2020-01-02 09:31:52', NULL),
(75, 'images/clinic/sIQWfQ44Vt2IZU2fZNP4ZjiwaeME4b83WnRv8RYU.png', 2, 39, '2020-01-06 14:53:59', NULL),
(76, 'images/clinic/wyKSAQ5dCFPqsoPkLC5K6BWxsemUSvKNQ53KzJdR.png', 2, 39, '2020-01-06 14:54:10', NULL),
(77, 'images/catering/VkIbKuoHonrjgzCpe0OW2Mz8LPTNIQd6L2bipTRb.png', 4, 7, '2020-01-08 08:59:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `insurance_id` int(11) NOT NULL,
  `insurance_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`insurance_id`, `insurance_image`, `type`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 'images/insurance/insurance_avatar.jpg', 1, 1, '2019-11-07 10:59:54', NULL),
(2, 'images/insurance/f329SMLqFfCnzE3sh3ZpggGJrTp14BbRo97Piv0T.png', 2, 1, '2019-12-18 09:40:30', NULL),
(3, 'images/insurance/idzQGU9YjBOql9am3mLkUh54R5qrPtSPCjCfh3ta.png', 1, 1, '2019-11-07 17:41:18', NULL),
(8, 'insurance/Z9FbYns6IYWA90EQAahKwRPZzEEt4dZpjK4UchU3.jpeg', 1, 1, '2019-11-07 14:46:21', NULL),
(11, 'images/insurance/IWeINJA7sqllKmIB2mxJcRjgA6ouAPCCDWyWdgKz.jpeg', 1, 1, '2019-11-11 07:47:13', NULL),
(12, 'images/insurance/sqbq93c0BnFQDN7gxTRKMdCVE1SIZEU35CJrvepf.png', 1, 6, '2019-11-12 11:05:34', NULL),
(13, 'images/insurance/6yIj0vq0QsTPiP8FHTbLBcjcTD71JSAbLFpuAui5.jpeg', 1, 18, '2019-11-20 11:54:21', NULL),
(14, 'images/insurance/v3IbGVeAKNMN3NiodPJdEe2cFZ5r7YC8LUmRD3pf.jpeg', 1, 21, '2019-11-22 15:22:37', NULL),
(15, 'images/insurance/2g3WIeLU7rAqsx1xqmuCDGTITjeIFg62y7L4kcwu.jpeg', 1, 22, '2019-12-16 13:04:16', NULL),
(16, 'images/insurance/5VzbV7IOJwVTlaHwLB4TIHzYSoShl7BA6wnwBdi2.jpeg', 1, 6, '2019-12-18 08:27:50', NULL),
(18, 'images/insurance/OgdsEBLjhyXRQUZAZL9tHK0TJO03gqQRD8GtiIyq.png', 1, 23, '2019-12-19 09:53:29', NULL),
(19, 'images/insurance/J1VmIKqkJF76Zh0rjQjZlqIEJHBlqK3NijaDjlRI.png', 1, 26, '2020-01-06 13:33:56', NULL),
(20, 'images/insurance/yMcHppXxNLYJAUaB4q0RIpuWjLObqeY5uw3NGDMD.png', 1, 26, '2020-01-06 13:35:26', NULL),
(21, 'images/insurance/7vpkgmn3pQvbGBq0rBmHfxYGImlL6S4OJCtbUrdg.png', 2, 39, '2020-01-06 14:51:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_description`
--

CREATE TABLE `insurance_description` (
  `insurance_description_id` int(11) NOT NULL,
  `insurance_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `insurance_description_content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insurance_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `insurance_description`
--

INSERT INTO `insurance_description` (`insurance_description_id`, `insurance_name`, `insurance_description_content`, `insurance_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'one', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, 1, '2019-11-07 13:14:38', NULL),
(2, 'واحد', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 1, 2, '2019-11-07 13:14:38', NULL),
(3, 'twoxxxxxxs', 'Lorem Ipsum is simply is testing for no why hello all files are delete add remove what next done good bad happy sad', 2, 1, '2019-12-18 09:40:37', NULL),
(4, 'اتنينتتتت', 'لوريم إيبسوم(', 2, 2, '2019-12-17 08:52:54', NULL),
(5, 'three', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 3, 1, '2019-11-07 13:16:50', NULL),
(6, 'ثلاثه', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 3, 2, '2019-11-07 13:16:53', NULL),
(11, 'four', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 11, 1, '2019-11-11 07:47:13', NULL),
(12, 'اربعه', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 11, 2, '2019-11-11 07:47:13', NULL),
(13, 'ااااللبلفلف', 'للببتتن', 12, 1, '2019-12-18 12:19:06', NULL),
(14, 'gfgnn', 'hhhhhhh', 12, 2, '2019-12-18 12:19:06', NULL),
(15, 'four', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 13, 1, '2019-11-20 11:54:21', NULL),
(16, 'اربعه', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 13, 2, '2019-11-20 11:54:21', NULL),
(17, 'boba', 'insurance company', 14, 1, '2019-11-22 15:22:37', NULL),
(18, 'بوبا', 'تامين', 14, 2, '2019-11-22 15:22:37', NULL),
(19, 'boba xeee', 'insurance company x', 15, 1, '2019-12-18 10:32:23', NULL),
(20, 'بوبا س', 'تامين س', 15, 2, '2019-12-16 13:04:16', NULL),
(21, 'New insurance', 'Iste mollitia officiis accusamus odit modi minus autem perferendis veniam error non beatae nisi velit et voluptate Iste mollitia officiis accusamus odit modi minus autem perferendis veniam error non b', 16, 1, '2019-12-17 10:30:34', NULL),
(22, 'تأمين جديد', 'عربي عربي عربي عربي عربي عربي عربي عربي عربي 5 عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي  8 عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي عربي 9', 16, 2, '2019-12-17 10:30:34', NULL),
(25, 'xy ccfg', 'fdfd fdsfds fdsdf d dfd fdfd fds fds fdfdsfe ew bvcb b jjh jhj jhj jh j ggjgj jbj jjb  ghj jhjh jh jh jh jhjhjh ghghg gjhgj hg j jhj jh j', 18, 1, '2019-12-19 09:52:35', NULL),
(26, 'يستبني يسيس', 'رىنيب ىن نى نىنى نتن تنزى نوىنى ن', 18, 2, '2019-12-19 09:50:51', NULL),
(27, 'insurance new', 'Kmdk ek kflek fke fen', 19, 1, '2020-01-06 13:33:56', NULL),
(28, 'تامينات', 'نيثةنم بنثة  نبةثقنة بثق', 19, 2, '2020-01-06 13:33:56', NULL),
(29, 'insurance 23', 'dew fke lfmeklm f', 20, 1, '2020-01-06 13:36:26', NULL),
(30, 'تامين 2', 'ةنيثة نثةن ثمن بقث', 20, 2, '2020-01-06 13:35:26', NULL),
(31, 'kmknj jik nk jnj', 'hggyu gug ui', 21, 1, '2020-01-06 14:52:28', NULL),
(32, 'الرتا لعلاع ع تىتى', 'رلفر فغ رغف', 21, 2, '2020-01-06 14:52:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `interest_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`interest_id`, `created_at`, `updated_at`) VALUES
(1, '2019-10-21 07:24:19', NULL),
(2, '2019-10-21 07:24:19', NULL),
(3, '2019-10-21 07:24:19', NULL),
(36, '2020-01-08 09:28:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interest_description`
--

CREATE TABLE `interest_description` (
  `interest_description_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `interest_name` varchar(20) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interest_description`
--

INSERT INTO `interest_description` (`interest_description_id`, `interest_id`, `interest_name`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'shopping', 1, '2019-11-12 10:48:34', NULL),
(2, 1, 'التسوق', 2, '2019-11-12 10:48:34', NULL),
(3, 2, 'news', 1, '2019-10-21 07:24:01', NULL),
(4, 2, 'اخبار', 2, '2019-10-21 07:24:01', NULL),
(5, 3, 'movies', 1, '2019-10-21 07:24:01', NULL),
(6, 3, 'افلام', 2, '2019-10-21 07:24:01', NULL),
(21, 36, 'sports', 1, '2020-01-08 09:28:43', NULL),
(22, 36, 'رياضة', 2, '2020-01-08 09:28:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(20) NOT NULL,
  `language_code` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`, `language_code`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '2019-10-02 09:28:23', NULL),
(2, 'اللغة العربية', 'ar', '2019-10-02 09:28:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_image` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_image`, `user_id`, `type`, `type_id`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 'images/hospital/avatar_hospital.png', 38, 1, 6, 0, '2019-11-23 19:13:39', NULL),
(2, 'images/catering/avatar_catering.jpg', 2, 4, 1, 0, '2019-11-23 21:29:52', NULL),
(6, 'images/user/ic_launcher.png', 31, 5, 0, 1, '2019-12-18 14:23:10', NULL),
(7, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-20 09:21:45', NULL),
(8, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-20 09:21:45', NULL),
(9, 'images/hospital/avatar_hospital.png', 17, 1, 6, 1, '2019-12-20 09:21:45', NULL),
(10, 'images/hospital/avatar_hospital.png', 17, 1, 6, 1, '2019-12-20 09:21:45', NULL),
(11, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-20 09:21:45', NULL),
(12, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-20 09:21:45', NULL),
(13, 'images/restaurant/avatar_restaurant.png', 17, 3, 1, 1, '2019-12-20 09:21:45', NULL),
(14, 'images/restaurant/avatar_restaurant.png', 17, 3, 1, 1, '2019-12-20 09:21:45', NULL),
(15, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(16, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(17, 'images/clinic/avatar_clinic.jpg', 17, 2, 1, 1, '2019-12-20 09:21:45', NULL),
(18, 'images/clinic/avatar_clinic.jpg', 17, 2, 1, 1, '2019-12-20 09:21:45', NULL),
(19, 'images/clinic/avatar_clinic.jpg', 17, 2, 1, 1, '2019-12-20 09:21:45', NULL),
(20, 'images/hospital/avatar_hospital.png', 43, 1, 6, 0, '2019-12-11 20:13:34', NULL),
(21, 'images/hospital/avatar_hospital.png', 51, 1, 6, 0, '2019-12-11 21:29:51', NULL),
(22, 'images/hospital/avatar_hospital.png', 43, 1, 6, 0, '2019-12-11 22:11:43', NULL),
(23, 'images/hospital/avatar_hospital.png', 52, 1, 6, 0, '2019-12-12 17:45:04', NULL),
(24, 'images/hospital/avatar_hospital.png', 52, 1, 6, 0, '2019-12-12 17:49:40', NULL),
(25, 'images/hospital/avatar_hospital.png', 52, 1, 6, 0, '2019-12-12 17:50:34', NULL),
(26, 'images/hospital/avatar_hospital.png', 52, 1, 6, 0, '2019-12-12 18:38:00', NULL),
(27, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:39:47', NULL),
(28, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:44:31', NULL),
(29, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:47:22', NULL),
(30, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:47:29', NULL),
(31, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:48:27', NULL),
(32, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:49:40', NULL),
(33, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 18:54:14', NULL),
(34, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 19:03:19', NULL),
(35, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 19:08:40', NULL),
(36, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 19:09:01', NULL),
(37, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 22:03:06', NULL),
(38, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 22:03:32', NULL),
(39, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 22:04:30', NULL),
(40, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 22:07:06', NULL),
(41, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:46:23', NULL),
(42, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:55:31', NULL),
(43, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:55:56', NULL),
(44, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:56:19', NULL),
(45, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:56:57', NULL),
(46, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 13:57:16', NULL),
(47, 'images/user/ic_launcher.png', 55, 5, 0, 0, '2019-12-12 14:09:51', NULL),
(48, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 23:42:48', NULL),
(49, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 23:52:00', NULL),
(50, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-12 23:59:08', NULL),
(51, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-13 00:06:42', NULL),
(52, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-13 00:09:03', NULL),
(53, 'images/hospital/avatar_hospital.png', 55, 1, 6, 0, '2019-12-14 02:29:21', NULL),
(54, 'images/hospital/avatar_hospital.png', 55, 1, 6, 0, '2019-12-14 04:56:25', NULL),
(55, 'images/hospital/avatar_hospital.png', 11, 1, 6, 0, '2019-12-14 05:02:05', NULL),
(56, 'images/hospital/avatar_hospital.png', 11, 1, 6, 0, '2019-12-14 05:02:12', NULL),
(57, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-18 14:21:53', NULL),
(58, 'images/clinic/avatar_clinic.jpg', 55, 2, 1, 0, '2019-12-14 12:27:12', NULL),
(59, 'images/clinic/avatar_clinic.jpg', 55, 2, 1, 0, '2019-12-14 12:28:37', NULL),
(60, 'images/hospital/avatar_hospital.png', 58, 1, 22, 0, '2019-12-16 21:16:26', NULL),
(61, 'images/hospital/avatar_hospital.png', 58, 1, 22, 0, '2019-12-16 21:17:19', NULL),
(62, 'images/hospital/avatar_hospital.png', 58, 1, 22, 0, '2019-12-16 21:18:31', NULL),
(63, 'images/user/ic_launcher.png', 0, 5, 0, 1, '2019-12-19 09:41:15', NULL),
(64, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-18 14:06:44', NULL),
(65, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-18 14:06:44', NULL),
(66, 'images/clinic/avatar_clinic.jpg', 58, 2, 1, 0, '2019-12-17 17:24:14', NULL),
(67, 'images/clinic/avatar_clinic.jpg', 58, 2, 1, 0, '2019-12-17 17:27:06', NULL),
(68, 'images/clinic/avatar_clinic.jpg', 58, 2, 1, 0, '2019-12-17 17:29:13', NULL),
(69, 'images/clinic/avatar_clinic.jpg', 58, 2, 1, 0, '2019-12-17 17:30:43', NULL),
(70, 'images/catering/avatar_catering.jpg', 58, 4, 1, 0, '2019-12-17 23:10:25', NULL),
(71, 'images/catering/avatar_catering.jpg', 58, 4, 1, 0, '2019-12-17 23:10:58', NULL),
(72, 'images/hospital/avatar_hospital.png', 58, 1, 22, 0, '2019-12-18 17:04:03', NULL),
(73, 'images/hospital/avatar_hospital.png', 58, 1, 22, 0, '2019-12-18 17:04:30', NULL),
(74, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-18 14:27:22', NULL),
(75, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-18 14:27:22', NULL),
(76, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-18 14:27:22', NULL),
(77, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-18 14:27:22', NULL),
(79, 'images/hospital/avatar_hospital.png', 76, 1, 22, 1, '2019-12-18 14:27:22', NULL),
(80, 'images/hospital/avatar_hospital.png', 76, 1, 22, 1, '2019-12-18 14:27:22', NULL),
(81, 'images/hospital/avatar_hospital.png', 76, 1, 22, 1, '2019-12-18 14:27:22', NULL),
(83, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(84, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(85, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(86, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(87, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(88, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(89, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-19 09:33:21', NULL),
(90, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(91, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-22 07:31:05', NULL),
(92, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(93, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(94, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(95, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(96, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(97, 'images/hospital/avatar_hospital.png', 1, 1, 22, 1, '2019-12-23 13:01:51', NULL),
(98, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(99, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(100, 'images/user/ic_launcher.png', 2, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(101, 'images/user/ic_launcher.png', 5, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(102, 'images/user/ic_launcher.png', 7, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(103, 'images/user/ic_launcher.png', 9, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(104, 'images/user/ic_launcher.png', 11, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(105, 'images/user/ic_launcher.png', 12, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(106, 'images/user/ic_launcher.png', 13, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(107, 'images/user/ic_launcher.png', 14, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(108, 'images/user/ic_launcher.png', 16, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(109, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(110, 'images/user/ic_launcher.png', 18, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(111, 'images/user/ic_launcher.png', 19, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(112, 'images/user/ic_launcher.png', 20, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(113, 'images/user/ic_launcher.png', 21, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(114, 'images/user/ic_launcher.png', 22, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(115, 'images/user/ic_launcher.png', 24, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(116, 'images/user/ic_launcher.png', 25, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(117, 'images/user/ic_launcher.png', 26, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(118, 'images/user/ic_launcher.png', 27, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(119, 'images/user/ic_launcher.png', 28, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(120, 'images/user/ic_launcher.png', 30, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(121, 'images/user/ic_launcher.png', 31, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(122, 'images/user/ic_launcher.png', 33, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(123, 'images/user/ic_launcher.png', 34, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(124, 'images/user/ic_launcher.png', 36, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(125, 'images/user/ic_launcher.png', 38, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(126, 'images/user/ic_launcher.png', 39, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(127, 'images/user/ic_launcher.png', 40, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(128, 'images/user/ic_launcher.png', 42, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(129, 'images/user/ic_launcher.png', 45, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(130, 'images/user/ic_launcher.png', 46, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(131, 'images/user/ic_launcher.png', 47, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(132, 'images/user/ic_launcher.png', 48, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(133, 'images/user/ic_launcher.png', 49, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(134, 'images/user/ic_launcher.png', 51, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(135, 'images/user/ic_launcher.png', 53, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(136, 'images/user/ic_launcher.png', 54, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(137, 'images/user/ic_launcher.png', 66, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(138, 'images/user/ic_launcher.png', 70, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(139, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(140, 'images/user/ic_launcher.png', 77, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(141, 'images/user/ic_launcher.png', 78, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(142, 'images/user/ic_launcher.png', 79, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(143, 'images/user/ic_launcher.png', 80, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(144, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-19 14:26:38', NULL),
(145, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(146, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(147, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(148, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 08:28:03', NULL),
(149, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-20 09:21:45', NULL),
(150, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(151, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(152, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(153, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2019-12-20 09:21:45', NULL),
(154, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(155, 'images/user/ic_launcher.png', 2, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(156, 'images/user/ic_launcher.png', 5, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(157, 'images/user/ic_launcher.png', 7, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(158, 'images/user/ic_launcher.png', 9, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(159, 'images/user/ic_launcher.png', 11, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(160, 'images/user/ic_launcher.png', 12, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(161, 'images/user/ic_launcher.png', 13, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(162, 'images/user/ic_launcher.png', 14, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(163, 'images/user/ic_launcher.png', 16, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(164, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(165, 'images/user/ic_launcher.png', 18, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(166, 'images/user/ic_launcher.png', 19, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(167, 'images/user/ic_launcher.png', 20, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(168, 'images/user/ic_launcher.png', 21, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(169, 'images/user/ic_launcher.png', 22, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(170, 'images/user/ic_launcher.png', 24, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(171, 'images/user/ic_launcher.png', 25, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(172, 'images/user/ic_launcher.png', 26, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(173, 'images/user/ic_launcher.png', 27, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(174, 'images/user/ic_launcher.png', 28, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(175, 'images/user/ic_launcher.png', 30, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(176, 'images/user/ic_launcher.png', 31, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(177, 'images/user/ic_launcher.png', 33, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(178, 'images/user/ic_launcher.png', 34, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(179, 'images/user/ic_launcher.png', 36, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(180, 'images/user/ic_launcher.png', 38, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(181, 'images/user/ic_launcher.png', 39, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(182, 'images/user/ic_launcher.png', 40, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(183, 'images/user/ic_launcher.png', 42, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(184, 'images/user/ic_launcher.png', 45, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(185, 'images/user/ic_launcher.png', 46, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(186, 'images/user/ic_launcher.png', 47, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(187, 'images/user/ic_launcher.png', 48, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(188, 'images/user/ic_launcher.png', 49, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(189, 'images/user/ic_launcher.png', 51, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(190, 'images/user/ic_launcher.png', 53, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(191, 'images/user/ic_launcher.png', 54, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(192, 'images/user/ic_launcher.png', 66, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(193, 'images/user/ic_launcher.png', 70, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(194, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(195, 'images/user/ic_launcher.png', 77, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(196, 'images/user/ic_launcher.png', 78, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(197, 'images/user/ic_launcher.png', 79, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(198, 'images/user/ic_launcher.png', 80, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(199, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(200, 'images/user/ic_launcher.png', 84, 5, 0, 1, '2019-12-23 10:09:46', NULL),
(201, 'images/hospital/avatar_hospital.png', 77, 1, 6, 1, '2019-12-23 10:14:28', NULL),
(202, 'images/hospital/avatar_hospital.png', 77, 1, 6, 1, '2019-12-23 10:14:28', NULL),
(203, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(204, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(205, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:06:43', NULL),
(206, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:06:47', NULL),
(207, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:44:28', NULL),
(208, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:44:45', NULL),
(209, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:46:54', NULL),
(210, 'images/hospital/avatar_hospital.png', 84, 1, 22, 0, '2019-12-23 20:47:09', NULL),
(211, 'images/hospital/avatar_hospital.png', 85, 1, 22, 1, '2019-12-23 13:08:11', NULL),
(212, 'images/hospital/avatar_hospital.png', 85, 1, 22, 1, '2019-12-23 13:08:11', NULL),
(213, 'images/hospital/avatar_hospital.png', 85, 1, 22, 1, '2019-12-23 13:08:11', NULL),
(214, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:00:20', NULL),
(215, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:03:48', NULL),
(216, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:04:52', NULL),
(217, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:04:53', NULL),
(218, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:05:43', NULL),
(219, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(220, 'images/user/ic_launcher.png', 2, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(221, 'images/user/ic_launcher.png', 5, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(222, 'images/user/ic_launcher.png', 7, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(223, 'images/user/ic_launcher.png', 9, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(224, 'images/user/ic_launcher.png', 11, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(225, 'images/user/ic_launcher.png', 12, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(226, 'images/user/ic_launcher.png', 13, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(227, 'images/user/ic_launcher.png', 14, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(228, 'images/user/ic_launcher.png', 16, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(229, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(230, 'images/user/ic_launcher.png', 18, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(231, 'images/user/ic_launcher.png', 19, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(232, 'images/user/ic_launcher.png', 20, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(233, 'images/user/ic_launcher.png', 21, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(234, 'images/user/ic_launcher.png', 22, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(235, 'images/user/ic_launcher.png', 24, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(236, 'images/user/ic_launcher.png', 25, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(237, 'images/user/ic_launcher.png', 26, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(238, 'images/user/ic_launcher.png', 27, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(239, 'images/user/ic_launcher.png', 28, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(240, 'images/user/ic_launcher.png', 30, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(241, 'images/user/ic_launcher.png', 31, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(242, 'images/user/ic_launcher.png', 33, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(243, 'images/user/ic_launcher.png', 34, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(244, 'images/user/ic_launcher.png', 36, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(245, 'images/user/ic_launcher.png', 38, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(246, 'images/user/ic_launcher.png', 39, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(247, 'images/user/ic_launcher.png', 40, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(248, 'images/user/ic_launcher.png', 42, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(249, 'images/user/ic_launcher.png', 45, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(250, 'images/user/ic_launcher.png', 46, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(251, 'images/user/ic_launcher.png', 47, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(252, 'images/user/ic_launcher.png', 48, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(253, 'images/user/ic_launcher.png', 49, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(254, 'images/user/ic_launcher.png', 51, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(255, 'images/user/ic_launcher.png', 53, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(256, 'images/user/ic_launcher.png', 54, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(257, 'images/user/ic_launcher.png', 66, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(258, 'images/user/ic_launcher.png', 70, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(259, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(260, 'images/user/ic_launcher.png', 77, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(261, 'images/user/ic_launcher.png', 78, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(262, 'images/user/ic_launcher.png', 79, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(263, 'images/user/ic_launcher.png', 80, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(264, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(265, 'images/user/ic_launcher.png', 84, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(266, 'images/user/ic_launcher.png', 85, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(267, 'images/user/ic_launcher.png', 86, 5, 0, 1, '2019-12-23 13:11:31', NULL),
(268, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:13:42', NULL),
(269, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 13:22:33', NULL),
(270, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(271, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(272, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 13:23:45', NULL),
(273, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 13:28:13', NULL),
(274, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(275, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:03:51', NULL),
(276, 'images/hospital/avatar_hospital.png', 77, 1, 6, 1, '2019-12-23 14:03:51', NULL),
(277, 'images/hospital/avatar_hospital.png', 77, 1, 6, 1, '2019-12-23 14:03:51', NULL),
(278, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:10:05', NULL),
(279, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:10:05', NULL),
(280, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 14:10:05', NULL),
(281, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(282, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(283, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(284, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(285, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(286, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 14:43:03', NULL),
(287, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(288, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 14:45:15', NULL),
(289, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(290, 'images/user/ic_launcher.png', 2, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(291, 'images/user/ic_launcher.png', 5, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(292, 'images/user/ic_launcher.png', 7, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(293, 'images/user/ic_launcher.png', 9, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(294, 'images/user/ic_launcher.png', 11, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(295, 'images/user/ic_launcher.png', 12, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(296, 'images/user/ic_launcher.png', 13, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(297, 'images/user/ic_launcher.png', 14, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(298, 'images/user/ic_launcher.png', 16, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(299, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(300, 'images/user/ic_launcher.png', 18, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(301, 'images/user/ic_launcher.png', 19, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(302, 'images/user/ic_launcher.png', 20, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(303, 'images/user/ic_launcher.png', 21, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(304, 'images/user/ic_launcher.png', 22, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(305, 'images/user/ic_launcher.png', 24, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(306, 'images/user/ic_launcher.png', 25, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(307, 'images/user/ic_launcher.png', 26, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(308, 'images/user/ic_launcher.png', 27, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(309, 'images/user/ic_launcher.png', 28, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(310, 'images/user/ic_launcher.png', 30, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(311, 'images/user/ic_launcher.png', 31, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(312, 'images/user/ic_launcher.png', 33, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(313, 'images/user/ic_launcher.png', 34, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(314, 'images/user/ic_launcher.png', 36, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(315, 'images/user/ic_launcher.png', 38, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(316, 'images/user/ic_launcher.png', 39, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(317, 'images/user/ic_launcher.png', 40, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(318, 'images/user/ic_launcher.png', 42, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(319, 'images/user/ic_launcher.png', 45, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(320, 'images/user/ic_launcher.png', 46, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(321, 'images/user/ic_launcher.png', 47, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(322, 'images/user/ic_launcher.png', 48, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(323, 'images/user/ic_launcher.png', 49, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(324, 'images/user/ic_launcher.png', 51, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(325, 'images/user/ic_launcher.png', 53, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(326, 'images/user/ic_launcher.png', 54, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(327, 'images/user/ic_launcher.png', 66, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(328, 'images/user/ic_launcher.png', 70, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(329, 'images/user/ic_launcher.png', 76, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(330, 'images/user/ic_launcher.png', 77, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(331, 'images/user/ic_launcher.png', 78, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(332, 'images/user/ic_launcher.png', 79, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(333, 'images/user/ic_launcher.png', 80, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(334, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(335, 'images/user/ic_launcher.png', 84, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(336, 'images/user/ic_launcher.png', 85, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(337, 'images/user/ic_launcher.png', 86, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(338, 'images/user/ic_launcher.png', 87, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(339, 'images/user/ic_launcher.png', 88, 5, 0, 1, '2019-12-23 14:46:18', NULL),
(340, 'images/hospital/avatar_hospital.png', 76, 1, 22, 0, '2019-12-23 23:46:50', NULL),
(341, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 14:48:22', NULL),
(342, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 15:00:09', NULL),
(343, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-23 15:23:51', NULL),
(344, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 15:03:04', NULL),
(345, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 15:05:23', NULL),
(346, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 15:04:48', NULL),
(347, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-23 15:06:59', NULL),
(348, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-23 15:06:56', NULL),
(349, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-24 07:36:20', NULL),
(350, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-24 07:46:07', NULL),
(351, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 07:57:02', NULL),
(352, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 07:57:02', NULL),
(353, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 07:57:02', NULL),
(354, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 07:57:25', NULL),
(355, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 07:59:30', NULL),
(356, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 08:16:37', NULL),
(357, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 08:16:37', NULL),
(358, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 08:18:19', NULL),
(359, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-24 09:01:50', NULL),
(360, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-24 09:17:19', NULL),
(361, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 09:36:34', NULL),
(362, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-24 10:21:03', NULL),
(363, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-24 10:21:03', NULL),
(364, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-24 10:21:03', NULL),
(365, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-24 10:24:41', NULL),
(366, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 10:39:38', NULL),
(367, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 10:40:59', NULL),
(368, 'images/hospital/avatar_hospital.png', 54, 1, 6, 0, '2019-12-24 19:57:16', NULL),
(369, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-24 11:43:05', NULL),
(370, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-24 11:46:56', NULL),
(371, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-24 11:46:56', NULL),
(372, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 12:03:54', NULL),
(373, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 12:04:54', NULL),
(374, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 12:06:40', NULL),
(375, 'images/restaurant/avatar_restaurant.png', 81, 3, 1, 1, '2019-12-24 12:07:10', NULL),
(376, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-24 14:45:16', NULL),
(377, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-24 14:45:16', NULL),
(378, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 20:29:21', NULL),
(379, 'images/hospital/avatar_hospital.png', 77, 1, 22, 1, '2019-12-24 20:29:21', NULL),
(380, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-24 14:45:16', NULL),
(381, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-24 14:45:16', NULL),
(382, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 08:06:58', NULL),
(383, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 08:08:01', NULL),
(384, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 08:17:49', NULL),
(385, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 08:39:32', NULL),
(386, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 08:39:32', NULL),
(387, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2019-12-26 08:42:06', NULL),
(388, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2019-12-30 08:32:48', NULL),
(389, 'images/clinic/avatar_clinic.jpg', 96, 2, 1, 1, '2019-12-26 09:15:06', NULL),
(390, 'images/clinic/avatar_clinic.jpg', 96, 2, 1, 1, '2019-12-26 09:15:22', NULL),
(391, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 07:34:59', NULL),
(392, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(393, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(394, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(395, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(396, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(397, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(398, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(399, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(400, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(401, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2019-12-27 16:17:17', NULL),
(402, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(403, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(404, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(405, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(406, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(407, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(408, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(409, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(410, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(411, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(412, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(413, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(414, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(415, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(416, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(417, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(418, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(419, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(420, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(421, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(422, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(423, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(424, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(425, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(426, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(427, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(428, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(429, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(430, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(431, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(432, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(433, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(434, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(435, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(436, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-26 13:54:33', NULL),
(437, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(438, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(439, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(440, 'images/user/ic_launcher.png', 87, 5, 0, 1, '2019-12-29 09:02:08', NULL),
(441, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(442, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(443, 'images/user/ic_launcher.png', 90, 5, 0, 1, '2019-12-26 13:29:05', NULL),
(444, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(445, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(446, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(447, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 08:32:48', NULL),
(448, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-26 12:36:35', NULL),
(449, 'images/user/ic_launcher.png', 96, 5, 0, 1, '2019-12-26 12:42:44', NULL),
(450, 'images/restaurant/avatar_restaurant.png', 96, 3, 1, 1, '2019-12-26 12:42:44', NULL),
(451, 'images/restaurant/avatar_restaurant.png', 96, 3, 1, 1, '2019-12-26 12:44:05', NULL),
(452, 'images/restaurant/avatar_restaurant.png', 96, 3, 1, 1, '2019-12-26 12:47:44', NULL),
(453, 'images/catering/avatar_catering.jpg', 96, 4, 5, 1, '2019-12-26 13:20:12', NULL),
(454, 'images/catering/avatar_catering.jpg', 96, 4, 5, 1, '2019-12-26 13:22:04', NULL),
(455, 'images/catering/avatar_catering.jpg', 96, 4, 5, 1, '2019-12-26 13:23:18', NULL),
(456, 'images/catering/avatar_catering.jpg', 96, 4, 5, 1, '2019-12-26 13:23:39', NULL),
(457, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 13:29:05', NULL),
(458, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 13:29:05', NULL),
(459, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 13:33:53', NULL),
(460, 'images/catering/avatar_catering.jpg', 96, 4, 5, 0, '2019-12-26 22:30:56', NULL),
(461, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 13:33:53', NULL),
(462, 'images/hospital/avatar_hospital.png', 90, 1, 22, 1, '2019-12-26 13:42:54', NULL),
(463, 'images/hospital/avatar_hospital.png', 77, 1, 22, 0, '2019-12-26 22:43:22', NULL),
(464, 'images/hospital/avatar_hospital.png', 77, 1, 22, 0, '2019-12-26 22:43:57', NULL),
(465, 'images/hospital/avatar_hospital.png', 77, 1, 22, 0, '2019-12-26 22:44:04', NULL),
(466, 'images/hospital/avatar_hospital.png', 76, 1, 22, 0, '2019-12-26 22:44:07', NULL),
(467, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-27 16:17:17', NULL),
(468, 'images/hospital/avatar_hospital.png', 1, 1, 22, 1, '2019-12-29 07:34:59', NULL),
(469, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-27 16:17:17', NULL),
(470, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-26 13:54:33', NULL),
(471, 'images/hospital/avatar_hospital.png', 77, 1, 22, 0, '2019-12-26 22:45:32', NULL),
(472, 'images/hospital/avatar_hospital.png', 31, 1, 22, 0, '2019-12-26 22:45:35', NULL),
(473, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-27 16:17:17', NULL),
(474, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2019-12-27 16:17:17', NULL),
(475, 'images/catering/avatar_catering.jpg', 81, 4, 5, 1, '2019-12-26 13:57:10', NULL),
(476, 'images/catering/avatar_catering.jpg', 81, 4, 5, 1, '2019-12-26 13:57:53', NULL),
(477, 'images/hospital/avatar_hospital.png', 97, 1, 6, 1, '2019-12-27 12:04:31', NULL),
(478, 'images/hospital/avatar_hospital.png', 97, 1, 6, 1, '2019-12-27 12:05:55', NULL),
(479, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2020-01-10 17:09:04', NULL),
(480, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2020-01-10 17:09:04', NULL),
(481, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2020-01-10 17:09:04', NULL),
(482, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2020-01-10 17:09:04', NULL),
(483, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2020-01-10 17:09:04', NULL),
(484, 'images/hospital/avatar_hospital.png', 17, 1, 22, 1, '2020-01-10 17:09:04', NULL),
(485, 'images/catering/avatar_catering.jpg', 17, 4, 1, 1, '2020-01-10 17:09:04', NULL),
(486, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-29 08:27:30', NULL),
(487, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 09:04:00', NULL),
(488, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 09:04:19', NULL),
(489, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 09:08:44', NULL),
(490, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 09:08:48', NULL),
(491, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(492, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 10:09:50', NULL),
(493, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 10:09:50', NULL),
(494, 'images/hospital/avatar_hospital.png', 98, 1, 6, 1, '2019-12-29 10:09:50', NULL),
(495, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(496, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(497, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(498, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(499, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(500, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(501, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(502, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(503, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(504, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(505, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(506, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(507, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(508, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:00:21', NULL),
(509, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(510, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(511, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(512, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(513, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(514, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(515, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(516, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(517, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(518, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(519, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(520, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(521, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(522, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(523, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(524, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(525, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(526, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(527, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(528, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(529, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(530, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(531, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(532, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(533, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(534, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(535, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(536, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(537, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(538, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(539, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(540, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(541, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(542, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(543, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(544, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(545, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(546, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(547, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(548, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(549, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(550, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(551, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(552, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(553, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-29 10:32:22', NULL),
(554, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(555, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(556, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(557, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(558, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(559, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(560, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(561, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(562, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(563, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(564, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 08:32:48', NULL),
(565, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(566, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(567, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2019-12-29 09:58:38', NULL),
(568, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2019-12-29 10:09:50', NULL),
(569, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:19:55', NULL),
(570, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(571, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(572, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(573, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(574, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(575, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(576, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(577, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(578, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(579, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(580, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(581, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(582, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(583, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(584, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(585, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(586, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(587, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(588, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(589, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(590, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(591, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(592, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(593, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(594, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(595, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(596, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(597, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(598, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(599, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(600, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(601, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(602, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(603, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(604, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(605, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(606, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(607, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(608, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(609, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(610, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(611, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(612, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(613, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(614, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-29 10:32:22', NULL),
(615, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(616, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(617, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(618, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(619, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(620, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(621, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(622, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(623, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-29 10:11:56', NULL);
INSERT INTO `notifications` (`notification_id`, `notification_image`, `user_id`, `type`, `type_id`, `is_seen`, `created_at`, `updated_at`) VALUES
(624, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(625, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 08:32:48', NULL),
(626, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(627, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(628, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2019-12-29 10:11:56', NULL),
(629, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2019-12-29 10:15:51', NULL),
(630, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:19:55', NULL),
(631, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(632, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(633, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(634, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(635, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(636, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(637, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(638, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(639, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(640, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(641, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(642, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(643, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(644, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(645, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(646, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(647, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(648, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(649, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(650, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(651, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(652, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(653, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(654, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(655, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(656, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(657, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(658, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(659, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(660, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(661, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(662, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(663, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(664, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(665, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(666, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(667, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(668, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(669, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(670, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(671, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(672, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(673, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(674, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(675, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-29 10:32:22', NULL),
(676, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(677, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(678, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(679, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(680, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(681, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(682, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(683, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(684, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(685, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(686, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 08:32:48', NULL),
(687, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(688, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(689, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2019-12-29 10:13:57', NULL),
(690, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2019-12-29 10:15:51', NULL),
(691, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-29 10:19:55', NULL),
(692, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(693, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(694, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(695, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(696, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(697, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(698, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(699, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(700, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(701, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(702, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(703, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(704, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(705, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(706, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(707, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(708, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(709, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(710, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(711, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(712, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(713, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(714, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(715, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(716, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(717, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(718, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(719, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(720, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(721, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(722, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(723, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(724, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(725, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(726, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(727, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(728, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(729, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(730, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(731, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(732, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(733, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(734, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(735, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(736, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-29 10:32:22', NULL),
(737, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(738, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(739, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(740, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(741, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(742, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(743, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(744, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(745, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(746, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(747, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 08:32:48', NULL),
(748, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(749, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(750, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2019-12-29 10:15:08', NULL),
(751, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2019-12-29 10:15:51', NULL),
(752, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-30 09:40:03', NULL),
(753, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-29 14:15:21', NULL),
(754, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-30 09:40:03', NULL),
(755, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-30 09:40:03', NULL),
(756, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-30 09:19:12', NULL),
(757, 'images/clinic/avatar_clinic.jpg', 81, 2, 1, 1, '2019-12-30 09:19:46', NULL),
(758, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2019-12-30 10:44:45', NULL),
(759, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(760, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(761, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(762, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(763, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(764, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(765, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(766, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(767, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(768, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(769, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(770, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(771, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(772, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(773, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(774, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(775, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(776, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(777, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(778, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(779, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(780, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(781, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(782, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(783, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(784, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(785, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(786, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(787, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(788, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(789, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(790, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(791, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(792, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(793, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(794, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(795, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(796, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(797, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(798, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(799, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(800, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(801, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(802, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(803, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-30 10:35:17', NULL),
(804, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(805, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(806, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(807, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(808, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(809, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(810, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(811, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(812, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(813, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(814, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2019-12-30 10:36:34', NULL),
(815, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(816, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(817, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2019-12-30 10:35:08', NULL),
(818, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2020-01-05 21:50:03', NULL),
(819, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-30 13:35:30', NULL),
(820, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2019-12-30 13:36:29', NULL),
(821, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(822, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(823, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(824, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(825, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(826, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(827, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2019-12-31 08:07:53', NULL),
(828, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-31 10:09:07', NULL),
(829, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-31 10:09:51', NULL),
(830, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-31 10:11:15', NULL),
(831, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2019-12-31 10:11:37', NULL),
(832, 'images/hospital/avatar_hospital.png', 81, 1, 6, 1, '2019-12-31 12:07:06', NULL),
(833, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-31 12:18:24', NULL),
(834, 'images/hospital/avatar_hospital.png', 81, 1, 23, 1, '2019-12-31 12:19:42', NULL),
(835, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2020-01-02 09:04:57', NULL),
(836, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2020-01-02 09:09:57', NULL),
(837, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2020-01-05 07:27:20', NULL),
(838, 'images/hospital/avatar_hospital.png', 1, 1, 6, 1, '2020-01-05 07:29:13', NULL),
(839, 'images/catering/avatar_catering.jpg', 1, 4, 1, 1, '2020-01-05 14:07:42', NULL),
(840, 'images/catering/avatar_catering.jpg', 81, 4, 1, 1, '2020-01-05 08:49:30', NULL),
(841, 'images/catering/avatar_catering.jpg', 81, 4, 1, 1, '2020-01-05 08:50:00', NULL),
(842, 'images/hospital/avatar_hospital.png', 81, 1, 22, 1, '2020-01-05 21:50:09', NULL),
(843, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2020-01-05 14:07:42', NULL),
(844, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2020-01-05 14:07:42', NULL),
(845, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2020-01-05 21:53:17', NULL),
(846, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2020-01-05 21:53:17', NULL),
(847, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2020-01-05 21:53:17', NULL),
(848, 'images/hospital/avatar_hospital.png', 94, 1, 22, 1, '2020-01-05 21:53:17', NULL),
(849, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2020-01-06 08:53:39', NULL),
(850, 'images/user/ic_launcher.png', 2, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(851, 'images/user/ic_launcher.png', 5, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(852, 'images/user/ic_launcher.png', 7, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(853, 'images/user/ic_launcher.png', 9, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(854, 'images/user/ic_launcher.png', 11, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(855, 'images/user/ic_launcher.png', 12, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(856, 'images/user/ic_launcher.png', 13, 5, 0, 0, '2020-01-05 21:49:43', NULL),
(857, 'images/user/ic_launcher.png', 14, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(858, 'images/user/ic_launcher.png', 16, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(859, 'images/user/ic_launcher.png', 17, 5, 0, 1, '2020-01-10 17:09:04', NULL),
(860, 'images/user/ic_launcher.png', 18, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(861, 'images/user/ic_launcher.png', 19, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(862, 'images/user/ic_launcher.png', 20, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(863, 'images/user/ic_launcher.png', 21, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(864, 'images/user/ic_launcher.png', 22, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(865, 'images/user/ic_launcher.png', 24, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(866, 'images/user/ic_launcher.png', 25, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(867, 'images/user/ic_launcher.png', 26, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(868, 'images/user/ic_launcher.png', 27, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(869, 'images/user/ic_launcher.png', 28, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(870, 'images/user/ic_launcher.png', 30, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(871, 'images/user/ic_launcher.png', 31, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(872, 'images/user/ic_launcher.png', 33, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(873, 'images/user/ic_launcher.png', 34, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(874, 'images/user/ic_launcher.png', 36, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(875, 'images/user/ic_launcher.png', 38, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(876, 'images/user/ic_launcher.png', 39, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(877, 'images/user/ic_launcher.png', 40, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(878, 'images/user/ic_launcher.png', 42, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(879, 'images/user/ic_launcher.png', 45, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(880, 'images/user/ic_launcher.png', 46, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(881, 'images/user/ic_launcher.png', 47, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(882, 'images/user/ic_launcher.png', 48, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(883, 'images/user/ic_launcher.png', 49, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(884, 'images/user/ic_launcher.png', 51, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(885, 'images/user/ic_launcher.png', 53, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(886, 'images/user/ic_launcher.png', 54, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(887, 'images/user/ic_launcher.png', 66, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(888, 'images/user/ic_launcher.png', 70, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(889, 'images/user/ic_launcher.png', 76, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(890, 'images/user/ic_launcher.png', 77, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(891, 'images/user/ic_launcher.png', 78, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(892, 'images/user/ic_launcher.png', 79, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(893, 'images/user/ic_launcher.png', 80, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(894, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2020-01-05 21:50:09', NULL),
(895, 'images/user/ic_launcher.png', 84, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(896, 'images/user/ic_launcher.png', 85, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(897, 'images/user/ic_launcher.png', 86, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(898, 'images/user/ic_launcher.png', 87, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(899, 'images/user/ic_launcher.png', 88, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(900, 'images/user/ic_launcher.png', 89, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(901, 'images/user/ic_launcher.png', 90, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(902, 'images/user/ic_launcher.png', 91, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(903, 'images/user/ic_launcher.png', 92, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(904, 'images/user/ic_launcher.png', 93, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(905, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:53:17', NULL),
(906, 'images/user/ic_launcher.png', 95, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(907, 'images/user/ic_launcher.png', 96, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(908, 'images/user/ic_launcher.png', 97, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(909, 'images/user/ic_launcher.png', 98, 5, 0, 1, '2020-01-05 21:50:03', NULL),
(910, 'images/user/ic_launcher.png', 99, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(911, 'images/user/ic_launcher.png', 100, 5, 0, 0, '2020-01-05 21:49:44', NULL),
(912, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:53:17', NULL),
(913, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:53:17', NULL),
(914, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:53:17', NULL),
(915, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:53:17', NULL),
(916, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:55:12', NULL),
(917, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:55:42', NULL),
(918, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:57:37', NULL),
(919, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 21:57:56', NULL),
(920, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 22:10:45', NULL),
(922, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 22:12:49', NULL),
(923, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 22:30:33', NULL),
(924, 'images/user/ic_launcher.png', 94, 5, 0, 1, '2020-01-05 22:30:33', NULL),
(926, 'images/hospital/avatar_hospital.png', 81, 1, 6, 1, '2020-01-06 12:22:03', NULL),
(927, 'images/hospital/avatar_hospital.png', 81, 1, 6, 1, '2020-01-06 12:29:55', NULL),
(928, 'images/hospital/avatar_hospital.png', 81, 1, 6, 1, '2020-01-06 12:33:34', NULL),
(929, 'images/hospital/avatar_hospital.png', 105, 1, 26, 1, '2020-01-06 13:16:26', NULL),
(930, 'images/hospital/avatar_hospital.png', 105, 1, 26, 1, '2020-01-06 14:10:49', NULL),
(931, 'images/hospital/avatar_hospital.png', 105, 1, 26, 1, '2020-01-06 14:10:49', NULL),
(932, 'images/hospital/avatar_hospital.png', 105, 1, 26, 1, '2020-01-06 14:28:57', NULL),
(933, 'images/hospital/avatar_hospital.png', 105, 1, 26, 1, '2020-01-06 14:28:57', NULL),
(934, 'images/clinic/avatar_clinic.jpg', 105, 2, 39, 1, '2020-01-06 14:33:29', NULL),
(935, 'images/clinic/avatar_clinic.jpg', 105, 2, 39, 1, '2020-01-06 14:33:29', NULL),
(936, 'images/clinic/avatar_clinic.jpg', 105, 2, 39, 1, '2020-01-06 14:33:29', NULL),
(937, 'images/clinic/avatar_clinic.jpg', 105, 2, 39, 1, '2020-01-06 15:00:37', NULL),
(938, 'images/restaurant/avatar_restaurant.png', 105, 3, 17, 1, '2020-01-08 08:01:48', NULL),
(939, 'images/catering/avatar_catering.jpg', 1, 4, 7, 1, '2020-01-12 08:48:23', NULL),
(940, 'images/catering/avatar_catering.jpg', 105, 4, 7, 1, '2020-01-08 08:49:44', NULL),
(941, 'images/user/ic_launcher.png', 107, 5, 0, 1, '2020-01-08 09:25:26', NULL),
(942, 'images/hospital/avatar_hospital.png', 107, 1, 29, 1, '2020-01-08 11:47:15', NULL),
(943, 'images/clinic/avatar_clinic.jpg', 107, 2, 41, 1, '2020-01-08 12:21:10', NULL),
(944, 'images/restaurant/avatar_restaurant.png', 107, 3, 18, 1, '2020-01-08 12:30:21', NULL),
(945, 'images/catering/avatar_catering.jpg', 107, 4, 7, 1, '2020-01-08 12:40:50', NULL),
(946, 'images/catering/avatar_catering.jpg', 107, 4, 7, 1, '2020-01-08 12:44:32', NULL),
(947, 'images/user/ic_launcher.png', 1, 5, 0, 1, '2020-01-12 08:48:23', NULL),
(948, 'images/user/ic_launcher.png', 81, 5, 0, 1, '2020-01-16 11:54:56', NULL),
(949, 'images/hospital/avatar_hospital.png', 94, 1, 22, 0, '2020-01-16 13:40:59', NULL),
(950, 'images/hospital/avatar_hospital.png', 110, 1, 22, 1, '2020-01-16 13:08:07', NULL),
(951, 'images/hospital/avatar_hospital.png', 111, 1, 22, 1, '2020-01-16 13:48:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_description`
--

CREATE TABLE `notification_description` (
  `notification_description_id` int(11) NOT NULL,
  `notification_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_description`
--

INSERT INTO `notification_description` (`notification_description_id`, `notification_name`, `notification_content`, `notification_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test test test', 496, 1, '2019-12-29 09:20:02', NULL),
(2, 'اختبار', 'اختبار اختبار اختبار', 496, 2, '2019-12-29 09:20:02', NULL),
(3, 'test', 'test test test test test', 497, 1, '2019-12-29 09:49:05', NULL),
(4, 'اختبار', 'اختبار اختبار اختبار اختبار', 497, 2, '2019-12-29 09:49:05', NULL),
(5, 'test', 'test test test test test', 498, 1, '2019-12-29 09:49:30', NULL),
(6, 'اختبار', 'اختبار اختبار اختبار اختبار', 498, 2, '2019-12-29 09:49:30', NULL),
(7, 'test', 'test test test test test', 499, 1, '2019-12-29 09:51:50', NULL),
(8, 'اختبار', 'اختبار اختبار اختبار اختبار', 499, 2, '2019-12-29 09:51:50', NULL),
(9, 'test', 'test test test test test', 500, 1, '2019-12-29 09:52:59', NULL),
(10, 'اختبار', 'اختبار اختبار اختبار اختبار', 500, 2, '2019-12-29 09:52:59', NULL),
(11, 'test', 'test test test test test', 501, 1, '2019-12-29 09:53:34', NULL),
(12, 'اختبار', 'اختبار اختبار اختبار اختبار', 501, 2, '2019-12-29 09:53:34', NULL),
(13, 'test', 'test test test test test', 502, 1, '2019-12-29 09:53:45', NULL),
(14, 'اختبار', 'اختبار اختبار اختبار اختبار', 502, 2, '2019-12-29 09:53:45', NULL),
(15, 'test', 'test test test test test', 503, 1, '2019-12-29 09:54:05', NULL),
(16, 'اختبار', 'اختبار اختبار اختبار اختبار', 503, 2, '2019-12-29 09:54:05', NULL),
(17, 'test', 'test test test test test', 504, 1, '2019-12-29 09:55:23', NULL),
(18, 'اختبار', 'اختبار اختبار اختبار اختبار', 504, 2, '2019-12-29 09:55:23', NULL),
(19, 'test', 'test test test test test', 505, 1, '2019-12-29 09:55:44', NULL),
(20, 'اختبار', 'اختبار اختبار اختبار اختبار', 505, 2, '2019-12-29 09:55:44', NULL),
(21, 'test', 'test test test test test', 506, 1, '2019-12-29 09:55:57', NULL),
(22, 'اختبار', 'اختبار اختبار اختبار اختبار', 506, 2, '2019-12-29 09:55:57', NULL),
(23, 'test', 'test test test test test', 507, 1, '2019-12-29 09:56:12', NULL),
(24, 'اختبار', 'اختبار اختبار اختبار اختبار', 507, 2, '2019-12-29 09:56:12', NULL),
(25, 'test', 'test test test test', 508, 1, '2019-12-29 09:58:38', NULL),
(26, 'اختبار', 'اختبار اختبار اختبار اختبار', 508, 2, '2019-12-29 09:58:38', NULL),
(27, 'test', 'test test test test', 509, 1, '2019-12-29 09:58:38', NULL),
(28, 'اختبار', 'اختبار اختبار اختبار اختبار', 509, 2, '2019-12-29 09:58:38', NULL),
(29, 'test', 'test test test test', 510, 1, '2019-12-29 09:58:38', NULL),
(30, 'اختبار', 'اختبار اختبار اختبار اختبار', 510, 2, '2019-12-29 09:58:38', NULL),
(31, 'test', 'test test test test', 511, 1, '2019-12-29 09:58:38', NULL),
(32, 'اختبار', 'اختبار اختبار اختبار اختبار', 511, 2, '2019-12-29 09:58:38', NULL),
(33, 'test', 'test test test test', 512, 1, '2019-12-29 09:58:38', NULL),
(34, 'اختبار', 'اختبار اختبار اختبار اختبار', 512, 2, '2019-12-29 09:58:38', NULL),
(35, 'test', 'test test test test', 513, 1, '2019-12-29 09:58:38', NULL),
(36, 'اختبار', 'اختبار اختبار اختبار اختبار', 513, 2, '2019-12-29 09:58:38', NULL),
(37, 'test', 'test test test test', 514, 1, '2019-12-29 09:58:38', NULL),
(38, 'اختبار', 'اختبار اختبار اختبار اختبار', 514, 2, '2019-12-29 09:58:38', NULL),
(39, 'test', 'test test test test', 515, 1, '2019-12-29 09:58:38', NULL),
(40, 'اختبار', 'اختبار اختبار اختبار اختبار', 515, 2, '2019-12-29 09:58:38', NULL),
(41, 'test', 'test test test test', 516, 1, '2019-12-29 09:58:38', NULL),
(42, 'اختبار', 'اختبار اختبار اختبار اختبار', 516, 2, '2019-12-29 09:58:38', NULL),
(43, 'test', 'test test test test', 517, 1, '2019-12-29 09:58:38', NULL),
(44, 'اختبار', 'اختبار اختبار اختبار اختبار', 517, 2, '2019-12-29 09:58:38', NULL),
(45, 'test', 'test test test test', 518, 1, '2019-12-29 09:58:38', NULL),
(46, 'اختبار', 'اختبار اختبار اختبار اختبار', 518, 2, '2019-12-29 09:58:38', NULL),
(47, 'test', 'test test test test', 519, 1, '2019-12-29 09:58:38', NULL),
(48, 'اختبار', 'اختبار اختبار اختبار اختبار', 519, 2, '2019-12-29 09:58:38', NULL),
(49, 'test', 'test test test test', 520, 1, '2019-12-29 09:58:38', NULL),
(50, 'اختبار', 'اختبار اختبار اختبار اختبار', 520, 2, '2019-12-29 09:58:38', NULL),
(51, 'test', 'test test test test', 521, 1, '2019-12-29 09:58:38', NULL),
(52, 'اختبار', 'اختبار اختبار اختبار اختبار', 521, 2, '2019-12-29 09:58:38', NULL),
(53, 'test', 'test test test test', 522, 1, '2019-12-29 09:58:38', NULL),
(54, 'اختبار', 'اختبار اختبار اختبار اختبار', 522, 2, '2019-12-29 09:58:38', NULL),
(55, 'test', 'test test test test', 523, 1, '2019-12-29 09:58:38', NULL),
(56, 'اختبار', 'اختبار اختبار اختبار اختبار', 523, 2, '2019-12-29 09:58:38', NULL),
(57, 'test', 'test test test test', 524, 1, '2019-12-29 09:58:38', NULL),
(58, 'اختبار', 'اختبار اختبار اختبار اختبار', 524, 2, '2019-12-29 09:58:38', NULL),
(59, 'test', 'test test test test', 525, 1, '2019-12-29 09:58:38', NULL),
(60, 'اختبار', 'اختبار اختبار اختبار اختبار', 525, 2, '2019-12-29 09:58:38', NULL),
(61, 'test', 'test test test test', 526, 1, '2019-12-29 09:58:38', NULL),
(62, 'اختبار', 'اختبار اختبار اختبار اختبار', 526, 2, '2019-12-29 09:58:38', NULL),
(63, 'test', 'test test test test', 527, 1, '2019-12-29 09:58:38', NULL),
(64, 'اختبار', 'اختبار اختبار اختبار اختبار', 527, 2, '2019-12-29 09:58:38', NULL),
(65, 'test', 'test test test test', 528, 1, '2019-12-29 09:58:38', NULL),
(66, 'اختبار', 'اختبار اختبار اختبار اختبار', 528, 2, '2019-12-29 09:58:38', NULL),
(67, 'test', 'test test test test', 529, 1, '2019-12-29 09:58:38', NULL),
(68, 'اختبار', 'اختبار اختبار اختبار اختبار', 529, 2, '2019-12-29 09:58:38', NULL),
(69, 'test', 'test test test test', 530, 1, '2019-12-29 09:58:38', NULL),
(70, 'اختبار', 'اختبار اختبار اختبار اختبار', 530, 2, '2019-12-29 09:58:38', NULL),
(71, 'test', 'test test test test', 531, 1, '2019-12-29 09:58:38', NULL),
(72, 'اختبار', 'اختبار اختبار اختبار اختبار', 531, 2, '2019-12-29 09:58:38', NULL),
(73, 'test', 'test test test test', 532, 1, '2019-12-29 09:58:38', NULL),
(74, 'اختبار', 'اختبار اختبار اختبار اختبار', 532, 2, '2019-12-29 09:58:38', NULL),
(75, 'test', 'test test test test', 533, 1, '2019-12-29 09:58:38', NULL),
(76, 'اختبار', 'اختبار اختبار اختبار اختبار', 533, 2, '2019-12-29 09:58:38', NULL),
(77, 'test', 'test test test test', 534, 1, '2019-12-29 09:58:38', NULL),
(78, 'اختبار', 'اختبار اختبار اختبار اختبار', 534, 2, '2019-12-29 09:58:38', NULL),
(79, 'test', 'test test test test', 535, 1, '2019-12-29 09:58:38', NULL),
(80, 'اختبار', 'اختبار اختبار اختبار اختبار', 535, 2, '2019-12-29 09:58:38', NULL),
(81, 'test', 'test test test test', 536, 1, '2019-12-29 09:58:38', NULL),
(82, 'اختبار', 'اختبار اختبار اختبار اختبار', 536, 2, '2019-12-29 09:58:38', NULL),
(83, 'test', 'test test test test', 537, 1, '2019-12-29 09:58:38', NULL),
(84, 'اختبار', 'اختبار اختبار اختبار اختبار', 537, 2, '2019-12-29 09:58:38', NULL),
(85, 'test', 'test test test test', 538, 1, '2019-12-29 09:58:38', NULL),
(86, 'اختبار', 'اختبار اختبار اختبار اختبار', 538, 2, '2019-12-29 09:58:38', NULL),
(87, 'test', 'test test test test', 539, 1, '2019-12-29 09:58:38', NULL),
(88, 'اختبار', 'اختبار اختبار اختبار اختبار', 539, 2, '2019-12-29 09:58:38', NULL),
(89, 'test', 'test test test test', 540, 1, '2019-12-29 09:58:38', NULL),
(90, 'اختبار', 'اختبار اختبار اختبار اختبار', 540, 2, '2019-12-29 09:58:38', NULL),
(91, 'test', 'test test test test', 541, 1, '2019-12-29 09:58:38', NULL),
(92, 'اختبار', 'اختبار اختبار اختبار اختبار', 541, 2, '2019-12-29 09:58:38', NULL),
(93, 'test', 'test test test test', 542, 1, '2019-12-29 09:58:38', NULL),
(94, 'اختبار', 'اختبار اختبار اختبار اختبار', 542, 2, '2019-12-29 09:58:38', NULL),
(95, 'test', 'test test test test', 543, 1, '2019-12-29 09:58:38', NULL),
(96, 'اختبار', 'اختبار اختبار اختبار اختبار', 543, 2, '2019-12-29 09:58:38', NULL),
(97, 'test', 'test test test test', 544, 1, '2019-12-29 09:58:38', NULL),
(98, 'اختبار', 'اختبار اختبار اختبار اختبار', 544, 2, '2019-12-29 09:58:38', NULL),
(99, 'test', 'test test test test', 545, 1, '2019-12-29 09:58:38', NULL),
(100, 'اختبار', 'اختبار اختبار اختبار اختبار', 545, 2, '2019-12-29 09:58:38', NULL),
(101, 'test', 'test test test test', 546, 1, '2019-12-29 09:58:38', NULL),
(102, 'اختبار', 'اختبار اختبار اختبار اختبار', 546, 2, '2019-12-29 09:58:38', NULL),
(103, 'test', 'test test test test', 547, 1, '2019-12-29 09:58:38', NULL),
(104, 'اختبار', 'اختبار اختبار اختبار اختبار', 547, 2, '2019-12-29 09:58:38', NULL),
(105, 'test', 'test test test test', 548, 1, '2019-12-29 09:58:38', NULL),
(106, 'اختبار', 'اختبار اختبار اختبار اختبار', 548, 2, '2019-12-29 09:58:38', NULL),
(107, 'test', 'test test test test', 549, 1, '2019-12-29 09:58:38', NULL),
(108, 'اختبار', 'اختبار اختبار اختبار اختبار', 549, 2, '2019-12-29 09:58:38', NULL),
(109, 'test', 'test test test test', 550, 1, '2019-12-29 09:58:38', NULL),
(110, 'اختبار', 'اختبار اختبار اختبار اختبار', 550, 2, '2019-12-29 09:58:38', NULL),
(111, 'test', 'test test test test', 551, 1, '2019-12-29 09:58:38', NULL),
(112, 'اختبار', 'اختبار اختبار اختبار اختبار', 551, 2, '2019-12-29 09:58:38', NULL),
(113, 'test', 'test test test test', 552, 1, '2019-12-29 09:58:38', NULL),
(114, 'اختبار', 'اختبار اختبار اختبار اختبار', 552, 2, '2019-12-29 09:58:38', NULL),
(115, 'test', 'test test test test', 553, 1, '2019-12-29 09:58:38', NULL),
(116, 'اختبار', 'اختبار اختبار اختبار اختبار', 553, 2, '2019-12-29 09:58:38', NULL),
(117, 'test', 'test test test test', 554, 1, '2019-12-29 09:58:38', NULL),
(118, 'اختبار', 'اختبار اختبار اختبار اختبار', 554, 2, '2019-12-29 09:58:38', NULL),
(119, 'test', 'test test test test', 555, 1, '2019-12-29 09:58:38', NULL),
(120, 'اختبار', 'اختبار اختبار اختبار اختبار', 555, 2, '2019-12-29 09:58:38', NULL),
(121, 'test', 'test test test test', 556, 1, '2019-12-29 09:58:38', NULL),
(122, 'اختبار', 'اختبار اختبار اختبار اختبار', 556, 2, '2019-12-29 09:58:38', NULL),
(123, 'test', 'test test test test', 557, 1, '2019-12-29 09:58:38', NULL),
(124, 'اختبار', 'اختبار اختبار اختبار اختبار', 557, 2, '2019-12-29 09:58:38', NULL),
(125, 'test', 'test test test test', 558, 1, '2019-12-29 09:58:38', NULL),
(126, 'اختبار', 'اختبار اختبار اختبار اختبار', 558, 2, '2019-12-29 09:58:38', NULL),
(127, 'test', 'test test test test', 559, 1, '2019-12-29 09:58:38', NULL),
(128, 'اختبار', 'اختبار اختبار اختبار اختبار', 559, 2, '2019-12-29 09:58:38', NULL),
(129, 'test', 'test test test test', 560, 1, '2019-12-29 09:58:38', NULL),
(130, 'اختبار', 'اختبار اختبار اختبار اختبار', 560, 2, '2019-12-29 09:58:38', NULL),
(131, 'test', 'test test test test', 561, 1, '2019-12-29 09:58:38', NULL),
(132, 'اختبار', 'اختبار اختبار اختبار اختبار', 561, 2, '2019-12-29 09:58:38', NULL),
(133, 'test', 'test test test test', 562, 1, '2019-12-29 09:58:38', NULL),
(134, 'اختبار', 'اختبار اختبار اختبار اختبار', 562, 2, '2019-12-29 09:58:38', NULL),
(135, 'test', 'test test test test', 563, 1, '2019-12-29 09:58:38', NULL),
(136, 'اختبار', 'اختبار اختبار اختبار اختبار', 563, 2, '2019-12-29 09:58:38', NULL),
(137, 'test', 'test test test test', 564, 1, '2019-12-29 09:58:38', NULL),
(138, 'اختبار', 'اختبار اختبار اختبار اختبار', 564, 2, '2019-12-29 09:58:38', NULL),
(139, 'test', 'test test test test', 565, 1, '2019-12-29 09:58:38', NULL),
(140, 'اختبار', 'اختبار اختبار اختبار اختبار', 565, 2, '2019-12-29 09:58:38', NULL),
(141, 'test', 'test test test test', 566, 1, '2019-12-29 09:58:38', NULL),
(142, 'اختبار', 'اختبار اختبار اختبار اختبار', 566, 2, '2019-12-29 09:58:38', NULL),
(143, 'test', 'test test test test', 567, 1, '2019-12-29 09:58:38', NULL),
(144, 'اختبار', 'اختبار اختبار اختبار اختبار', 567, 2, '2019-12-29 09:58:38', NULL),
(145, 'test', 'test test test test', 568, 1, '2019-12-29 09:58:38', NULL),
(146, 'اختبار', 'اختبار اختبار اختبار اختبار', 568, 2, '2019-12-29 09:58:38', NULL),
(147, 'test', 'test test test test', 569, 1, '2019-12-29 10:11:56', NULL),
(148, 'اختبار', 'اختبار اختبار اختبار اختبار', 569, 2, '2019-12-29 10:11:56', NULL),
(149, 'test', 'test test test test', 570, 1, '2019-12-29 10:11:56', NULL),
(150, 'اختبار', 'اختبار اختبار اختبار اختبار', 570, 2, '2019-12-29 10:11:56', NULL),
(151, 'test', 'test test test test', 571, 1, '2019-12-29 10:11:56', NULL),
(152, 'اختبار', 'اختبار اختبار اختبار اختبار', 571, 2, '2019-12-29 10:11:56', NULL),
(153, 'test', 'test test test test', 572, 1, '2019-12-29 10:11:56', NULL),
(154, 'اختبار', 'اختبار اختبار اختبار اختبار', 572, 2, '2019-12-29 10:11:56', NULL),
(155, 'test', 'test test test test', 573, 1, '2019-12-29 10:11:56', NULL),
(156, 'اختبار', 'اختبار اختبار اختبار اختبار', 573, 2, '2019-12-29 10:11:56', NULL),
(157, 'test', 'test test test test', 574, 1, '2019-12-29 10:11:56', NULL),
(158, 'اختبار', 'اختبار اختبار اختبار اختبار', 574, 2, '2019-12-29 10:11:56', NULL),
(159, 'test', 'test test test test', 575, 1, '2019-12-29 10:11:56', NULL),
(160, 'اختبار', 'اختبار اختبار اختبار اختبار', 575, 2, '2019-12-29 10:11:56', NULL),
(161, 'test', 'test test test test', 576, 1, '2019-12-29 10:11:56', NULL),
(162, 'اختبار', 'اختبار اختبار اختبار اختبار', 576, 2, '2019-12-29 10:11:56', NULL),
(163, 'test', 'test test test test', 577, 1, '2019-12-29 10:11:56', NULL),
(164, 'اختبار', 'اختبار اختبار اختبار اختبار', 577, 2, '2019-12-29 10:11:56', NULL),
(165, 'test', 'test test test test', 578, 1, '2019-12-29 10:11:56', NULL),
(166, 'اختبار', 'اختبار اختبار اختبار اختبار', 578, 2, '2019-12-29 10:11:56', NULL),
(167, 'test', 'test test test test', 579, 1, '2019-12-29 10:11:56', NULL),
(168, 'اختبار', 'اختبار اختبار اختبار اختبار', 579, 2, '2019-12-29 10:11:56', NULL),
(169, 'test', 'test test test test', 580, 1, '2019-12-29 10:11:56', NULL),
(170, 'اختبار', 'اختبار اختبار اختبار اختبار', 580, 2, '2019-12-29 10:11:56', NULL),
(171, 'test', 'test test test test', 581, 1, '2019-12-29 10:11:56', NULL),
(172, 'اختبار', 'اختبار اختبار اختبار اختبار', 581, 2, '2019-12-29 10:11:56', NULL),
(173, 'test', 'test test test test', 582, 1, '2019-12-29 10:11:56', NULL),
(174, 'اختبار', 'اختبار اختبار اختبار اختبار', 582, 2, '2019-12-29 10:11:56', NULL),
(175, 'test', 'test test test test', 583, 1, '2019-12-29 10:11:56', NULL),
(176, 'اختبار', 'اختبار اختبار اختبار اختبار', 583, 2, '2019-12-29 10:11:56', NULL),
(177, 'test', 'test test test test', 584, 1, '2019-12-29 10:11:56', NULL),
(178, 'اختبار', 'اختبار اختبار اختبار اختبار', 584, 2, '2019-12-29 10:11:56', NULL),
(179, 'test', 'test test test test', 585, 1, '2019-12-29 10:11:56', NULL),
(180, 'اختبار', 'اختبار اختبار اختبار اختبار', 585, 2, '2019-12-29 10:11:56', NULL),
(181, 'test', 'test test test test', 586, 1, '2019-12-29 10:11:56', NULL),
(182, 'اختبار', 'اختبار اختبار اختبار اختبار', 586, 2, '2019-12-29 10:11:56', NULL),
(183, 'test', 'test test test test', 587, 1, '2019-12-29 10:11:56', NULL),
(184, 'اختبار', 'اختبار اختبار اختبار اختبار', 587, 2, '2019-12-29 10:11:56', NULL),
(185, 'test', 'test test test test', 588, 1, '2019-12-29 10:11:56', NULL),
(186, 'اختبار', 'اختبار اختبار اختبار اختبار', 588, 2, '2019-12-29 10:11:56', NULL),
(187, 'test', 'test test test test', 589, 1, '2019-12-29 10:11:56', NULL),
(188, 'اختبار', 'اختبار اختبار اختبار اختبار', 589, 2, '2019-12-29 10:11:56', NULL),
(189, 'test', 'test test test test', 590, 1, '2019-12-29 10:11:56', NULL),
(190, 'اختبار', 'اختبار اختبار اختبار اختبار', 590, 2, '2019-12-29 10:11:56', NULL),
(191, 'test', 'test test test test', 591, 1, '2019-12-29 10:11:56', NULL),
(192, 'اختبار', 'اختبار اختبار اختبار اختبار', 591, 2, '2019-12-29 10:11:56', NULL),
(193, 'test', 'test test test test', 592, 1, '2019-12-29 10:11:56', NULL),
(194, 'اختبار', 'اختبار اختبار اختبار اختبار', 592, 2, '2019-12-29 10:11:56', NULL),
(195, 'test', 'test test test test', 593, 1, '2019-12-29 10:11:56', NULL),
(196, 'اختبار', 'اختبار اختبار اختبار اختبار', 593, 2, '2019-12-29 10:11:56', NULL),
(197, 'test', 'test test test test', 594, 1, '2019-12-29 10:11:56', NULL),
(198, 'اختبار', 'اختبار اختبار اختبار اختبار', 594, 2, '2019-12-29 10:11:56', NULL),
(199, 'test', 'test test test test', 595, 1, '2019-12-29 10:11:56', NULL),
(200, 'اختبار', 'اختبار اختبار اختبار اختبار', 595, 2, '2019-12-29 10:11:56', NULL),
(201, 'test', 'test test test test', 596, 1, '2019-12-29 10:11:56', NULL),
(202, 'اختبار', 'اختبار اختبار اختبار اختبار', 596, 2, '2019-12-29 10:11:56', NULL),
(203, 'test', 'test test test test', 597, 1, '2019-12-29 10:11:56', NULL),
(204, 'اختبار', 'اختبار اختبار اختبار اختبار', 597, 2, '2019-12-29 10:11:56', NULL),
(205, 'test', 'test test test test', 598, 1, '2019-12-29 10:11:56', NULL),
(206, 'اختبار', 'اختبار اختبار اختبار اختبار', 598, 2, '2019-12-29 10:11:56', NULL),
(207, 'test', 'test test test test', 599, 1, '2019-12-29 10:11:56', NULL),
(208, 'اختبار', 'اختبار اختبار اختبار اختبار', 599, 2, '2019-12-29 10:11:56', NULL),
(209, 'test', 'test test test test', 600, 1, '2019-12-29 10:11:56', NULL),
(210, 'اختبار', 'اختبار اختبار اختبار اختبار', 600, 2, '2019-12-29 10:11:56', NULL),
(211, 'test', 'test test test test', 601, 1, '2019-12-29 10:11:56', NULL),
(212, 'اختبار', 'اختبار اختبار اختبار اختبار', 601, 2, '2019-12-29 10:11:56', NULL),
(213, 'test', 'test test test test', 602, 1, '2019-12-29 10:11:56', NULL),
(214, 'اختبار', 'اختبار اختبار اختبار اختبار', 602, 2, '2019-12-29 10:11:56', NULL),
(215, 'test', 'test test test test', 603, 1, '2019-12-29 10:11:56', NULL),
(216, 'اختبار', 'اختبار اختبار اختبار اختبار', 603, 2, '2019-12-29 10:11:56', NULL),
(217, 'test', 'test test test test', 604, 1, '2019-12-29 10:11:56', NULL),
(218, 'اختبار', 'اختبار اختبار اختبار اختبار', 604, 2, '2019-12-29 10:11:56', NULL),
(219, 'test', 'test test test test', 605, 1, '2019-12-29 10:11:56', NULL),
(220, 'اختبار', 'اختبار اختبار اختبار اختبار', 605, 2, '2019-12-29 10:11:56', NULL),
(221, 'test', 'test test test test', 606, 1, '2019-12-29 10:11:56', NULL),
(222, 'اختبار', 'اختبار اختبار اختبار اختبار', 606, 2, '2019-12-29 10:11:56', NULL),
(223, 'test', 'test test test test', 607, 1, '2019-12-29 10:11:56', NULL),
(224, 'اختبار', 'اختبار اختبار اختبار اختبار', 607, 2, '2019-12-29 10:11:56', NULL),
(225, 'test', 'test test test test', 608, 1, '2019-12-29 10:11:56', NULL),
(226, 'اختبار', 'اختبار اختبار اختبار اختبار', 608, 2, '2019-12-29 10:11:56', NULL),
(227, 'test', 'test test test test', 609, 1, '2019-12-29 10:11:56', NULL),
(228, 'اختبار', 'اختبار اختبار اختبار اختبار', 609, 2, '2019-12-29 10:11:56', NULL),
(229, 'test', 'test test test test', 610, 1, '2019-12-29 10:11:56', NULL),
(230, 'اختبار', 'اختبار اختبار اختبار اختبار', 610, 2, '2019-12-29 10:11:56', NULL),
(231, 'test', 'test test test test', 611, 1, '2019-12-29 10:11:56', NULL),
(232, 'اختبار', 'اختبار اختبار اختبار اختبار', 611, 2, '2019-12-29 10:11:56', NULL),
(233, 'test', 'test test test test', 612, 1, '2019-12-29 10:11:56', NULL),
(234, 'اختبار', 'اختبار اختبار اختبار اختبار', 612, 2, '2019-12-29 10:11:56', NULL),
(235, 'test', 'test test test test', 613, 1, '2019-12-29 10:11:56', NULL),
(236, 'اختبار', 'اختبار اختبار اختبار اختبار', 613, 2, '2019-12-29 10:11:56', NULL),
(237, 'test', 'test test test test', 614, 1, '2019-12-29 10:11:56', NULL),
(238, 'اختبار', 'اختبار اختبار اختبار اختبار', 614, 2, '2019-12-29 10:11:56', NULL),
(239, 'test', 'test test test test', 615, 1, '2019-12-29 10:11:56', NULL),
(240, 'اختبار', 'اختبار اختبار اختبار اختبار', 615, 2, '2019-12-29 10:11:56', NULL),
(241, 'test', 'test test test test', 616, 1, '2019-12-29 10:11:56', NULL),
(242, 'اختبار', 'اختبار اختبار اختبار اختبار', 616, 2, '2019-12-29 10:11:56', NULL),
(243, 'test', 'test test test test', 617, 1, '2019-12-29 10:11:56', NULL),
(244, 'اختبار', 'اختبار اختبار اختبار اختبار', 617, 2, '2019-12-29 10:11:56', NULL),
(245, 'test', 'test test test test', 618, 1, '2019-12-29 10:11:56', NULL),
(246, 'اختبار', 'اختبار اختبار اختبار اختبار', 618, 2, '2019-12-29 10:11:56', NULL),
(247, 'test', 'test test test test', 619, 1, '2019-12-29 10:11:56', NULL),
(248, 'اختبار', 'اختبار اختبار اختبار اختبار', 619, 2, '2019-12-29 10:11:56', NULL),
(249, 'test', 'test test test test', 620, 1, '2019-12-29 10:11:56', NULL),
(250, 'اختبار', 'اختبار اختبار اختبار اختبار', 620, 2, '2019-12-29 10:11:56', NULL),
(251, 'test', 'test test test test', 621, 1, '2019-12-29 10:11:56', NULL),
(252, 'اختبار', 'اختبار اختبار اختبار اختبار', 621, 2, '2019-12-29 10:11:56', NULL),
(253, 'test', 'test test test test', 622, 1, '2019-12-29 10:11:56', NULL),
(254, 'اختبار', 'اختبار اختبار اختبار اختبار', 622, 2, '2019-12-29 10:11:56', NULL),
(255, 'test', 'test test test test', 623, 1, '2019-12-29 10:11:56', NULL),
(256, 'اختبار', 'اختبار اختبار اختبار اختبار', 623, 2, '2019-12-29 10:11:56', NULL),
(257, 'test', 'test test test test', 624, 1, '2019-12-29 10:11:56', NULL),
(258, 'اختبار', 'اختبار اختبار اختبار اختبار', 624, 2, '2019-12-29 10:11:56', NULL),
(259, 'test', 'test test test test', 625, 1, '2019-12-29 10:11:56', NULL),
(260, 'اختبار', 'اختبار اختبار اختبار اختبار', 625, 2, '2019-12-29 10:11:56', NULL),
(261, 'test', 'test test test test', 626, 1, '2019-12-29 10:11:56', NULL),
(262, 'اختبار', 'اختبار اختبار اختبار اختبار', 626, 2, '2019-12-29 10:11:56', NULL),
(263, 'test', 'test test test test', 627, 1, '2019-12-29 10:11:56', NULL),
(264, 'اختبار', 'اختبار اختبار اختبار اختبار', 627, 2, '2019-12-29 10:11:56', NULL),
(265, 'test', 'test test test test', 628, 1, '2019-12-29 10:11:56', NULL),
(266, 'اختبار', 'اختبار اختبار اختبار اختبار', 628, 2, '2019-12-29 10:11:56', NULL),
(267, 'test', 'test test test test', 629, 1, '2019-12-29 10:11:56', NULL),
(268, 'اختبار', 'اختبار اختبار اختبار اختبار', 629, 2, '2019-12-29 10:11:56', NULL),
(269, 'test', 'test test test test', 630, 1, '2019-12-29 10:13:57', NULL),
(270, 'اختبار', 'اختبار اختبار اختبار اختبار', 630, 2, '2019-12-29 10:13:57', NULL),
(271, 'test', 'test test test test', 631, 1, '2019-12-29 10:13:57', NULL),
(272, 'اختبار', 'اختبار اختبار اختبار اختبار', 631, 2, '2019-12-29 10:13:57', NULL),
(273, 'test', 'test test test test', 632, 1, '2019-12-29 10:13:57', NULL),
(274, 'اختبار', 'اختبار اختبار اختبار اختبار', 632, 2, '2019-12-29 10:13:57', NULL),
(275, 'test', 'test test test test', 633, 1, '2019-12-29 10:13:57', NULL),
(276, 'اختبار', 'اختبار اختبار اختبار اختبار', 633, 2, '2019-12-29 10:13:57', NULL),
(277, 'test', 'test test test test', 634, 1, '2019-12-29 10:13:57', NULL),
(278, 'اختبار', 'اختبار اختبار اختبار اختبار', 634, 2, '2019-12-29 10:13:57', NULL),
(279, 'test', 'test test test test', 635, 1, '2019-12-29 10:13:57', NULL),
(280, 'اختبار', 'اختبار اختبار اختبار اختبار', 635, 2, '2019-12-29 10:13:57', NULL),
(281, 'test', 'test test test test', 636, 1, '2019-12-29 10:13:57', NULL),
(282, 'اختبار', 'اختبار اختبار اختبار اختبار', 636, 2, '2019-12-29 10:13:57', NULL),
(283, 'test', 'test test test test', 637, 1, '2019-12-29 10:13:57', NULL),
(284, 'اختبار', 'اختبار اختبار اختبار اختبار', 637, 2, '2019-12-29 10:13:57', NULL),
(285, 'test', 'test test test test', 638, 1, '2019-12-29 10:13:57', NULL),
(286, 'اختبار', 'اختبار اختبار اختبار اختبار', 638, 2, '2019-12-29 10:13:57', NULL),
(287, 'test', 'test test test test', 639, 1, '2019-12-29 10:13:57', NULL),
(288, 'اختبار', 'اختبار اختبار اختبار اختبار', 639, 2, '2019-12-29 10:13:57', NULL),
(289, 'test', 'test test test test', 640, 1, '2019-12-29 10:13:57', NULL),
(290, 'اختبار', 'اختبار اختبار اختبار اختبار', 640, 2, '2019-12-29 10:13:57', NULL),
(291, 'test', 'test test test test', 641, 1, '2019-12-29 10:13:57', NULL),
(292, 'اختبار', 'اختبار اختبار اختبار اختبار', 641, 2, '2019-12-29 10:13:57', NULL),
(293, 'test', 'test test test test', 642, 1, '2019-12-29 10:13:57', NULL),
(294, 'اختبار', 'اختبار اختبار اختبار اختبار', 642, 2, '2019-12-29 10:13:57', NULL),
(295, 'test', 'test test test test', 643, 1, '2019-12-29 10:13:57', NULL),
(296, 'اختبار', 'اختبار اختبار اختبار اختبار', 643, 2, '2019-12-29 10:13:57', NULL),
(297, 'test', 'test test test test', 644, 1, '2019-12-29 10:13:57', NULL),
(298, 'اختبار', 'اختبار اختبار اختبار اختبار', 644, 2, '2019-12-29 10:13:57', NULL),
(299, 'test', 'test test test test', 645, 1, '2019-12-29 10:13:57', NULL),
(300, 'اختبار', 'اختبار اختبار اختبار اختبار', 645, 2, '2019-12-29 10:13:57', NULL),
(301, 'test', 'test test test test', 646, 1, '2019-12-29 10:13:57', NULL),
(302, 'اختبار', 'اختبار اختبار اختبار اختبار', 646, 2, '2019-12-29 10:13:57', NULL),
(303, 'test', 'test test test test', 647, 1, '2019-12-29 10:13:57', NULL),
(304, 'اختبار', 'اختبار اختبار اختبار اختبار', 647, 2, '2019-12-29 10:13:57', NULL),
(305, 'test', 'test test test test', 648, 1, '2019-12-29 10:13:57', NULL),
(306, 'اختبار', 'اختبار اختبار اختبار اختبار', 648, 2, '2019-12-29 10:13:57', NULL),
(307, 'test', 'test test test test', 649, 1, '2019-12-29 10:13:57', NULL),
(308, 'اختبار', 'اختبار اختبار اختبار اختبار', 649, 2, '2019-12-29 10:13:57', NULL),
(309, 'test', 'test test test test', 650, 1, '2019-12-29 10:13:57', NULL),
(310, 'اختبار', 'اختبار اختبار اختبار اختبار', 650, 2, '2019-12-29 10:13:57', NULL),
(311, 'test', 'test test test test', 651, 1, '2019-12-29 10:13:57', NULL),
(312, 'اختبار', 'اختبار اختبار اختبار اختبار', 651, 2, '2019-12-29 10:13:57', NULL),
(313, 'test', 'test test test test', 652, 1, '2019-12-29 10:13:57', NULL),
(314, 'اختبار', 'اختبار اختبار اختبار اختبار', 652, 2, '2019-12-29 10:13:57', NULL),
(315, 'test', 'test test test test', 653, 1, '2019-12-29 10:13:57', NULL),
(316, 'اختبار', 'اختبار اختبار اختبار اختبار', 653, 2, '2019-12-29 10:13:57', NULL),
(317, 'test', 'test test test test', 654, 1, '2019-12-29 10:13:57', NULL),
(318, 'اختبار', 'اختبار اختبار اختبار اختبار', 654, 2, '2019-12-29 10:13:57', NULL),
(319, 'test', 'test test test test', 655, 1, '2019-12-29 10:13:57', NULL),
(320, 'اختبار', 'اختبار اختبار اختبار اختبار', 655, 2, '2019-12-29 10:13:57', NULL),
(321, 'test', 'test test test test', 656, 1, '2019-12-29 10:13:57', NULL),
(322, 'اختبار', 'اختبار اختبار اختبار اختبار', 656, 2, '2019-12-29 10:13:57', NULL),
(323, 'test', 'test test test test', 657, 1, '2019-12-29 10:13:57', NULL),
(324, 'اختبار', 'اختبار اختبار اختبار اختبار', 657, 2, '2019-12-29 10:13:57', NULL),
(325, 'test', 'test test test test', 658, 1, '2019-12-29 10:13:57', NULL),
(326, 'اختبار', 'اختبار اختبار اختبار اختبار', 658, 2, '2019-12-29 10:13:57', NULL),
(327, 'test', 'test test test test', 659, 1, '2019-12-29 10:13:57', NULL),
(328, 'اختبار', 'اختبار اختبار اختبار اختبار', 659, 2, '2019-12-29 10:13:57', NULL),
(329, 'test', 'test test test test', 660, 1, '2019-12-29 10:13:57', NULL),
(330, 'اختبار', 'اختبار اختبار اختبار اختبار', 660, 2, '2019-12-29 10:13:57', NULL),
(331, 'test', 'test test test test', 661, 1, '2019-12-29 10:13:57', NULL),
(332, 'اختبار', 'اختبار اختبار اختبار اختبار', 661, 2, '2019-12-29 10:13:57', NULL),
(333, 'test', 'test test test test', 662, 1, '2019-12-29 10:13:57', NULL),
(334, 'اختبار', 'اختبار اختبار اختبار اختبار', 662, 2, '2019-12-29 10:13:57', NULL),
(335, 'test', 'test test test test', 663, 1, '2019-12-29 10:13:57', NULL),
(336, 'اختبار', 'اختبار اختبار اختبار اختبار', 663, 2, '2019-12-29 10:13:57', NULL),
(337, 'test', 'test test test test', 664, 1, '2019-12-29 10:13:57', NULL),
(338, 'اختبار', 'اختبار اختبار اختبار اختبار', 664, 2, '2019-12-29 10:13:57', NULL),
(339, 'test', 'test test test test', 665, 1, '2019-12-29 10:13:57', NULL),
(340, 'اختبار', 'اختبار اختبار اختبار اختبار', 665, 2, '2019-12-29 10:13:57', NULL),
(341, 'test', 'test test test test', 666, 1, '2019-12-29 10:13:57', NULL),
(342, 'اختبار', 'اختبار اختبار اختبار اختبار', 666, 2, '2019-12-29 10:13:57', NULL),
(343, 'test', 'test test test test', 667, 1, '2019-12-29 10:13:57', NULL),
(344, 'اختبار', 'اختبار اختبار اختبار اختبار', 667, 2, '2019-12-29 10:13:57', NULL),
(345, 'test', 'test test test test', 668, 1, '2019-12-29 10:13:57', NULL),
(346, 'اختبار', 'اختبار اختبار اختبار اختبار', 668, 2, '2019-12-29 10:13:57', NULL),
(347, 'test', 'test test test test', 669, 1, '2019-12-29 10:13:57', NULL),
(348, 'اختبار', 'اختبار اختبار اختبار اختبار', 669, 2, '2019-12-29 10:13:57', NULL),
(349, 'test', 'test test test test', 670, 1, '2019-12-29 10:13:57', NULL),
(350, 'اختبار', 'اختبار اختبار اختبار اختبار', 670, 2, '2019-12-29 10:13:57', NULL),
(351, 'test', 'test test test test', 671, 1, '2019-12-29 10:13:57', NULL),
(352, 'اختبار', 'اختبار اختبار اختبار اختبار', 671, 2, '2019-12-29 10:13:57', NULL),
(353, 'test', 'test test test test', 672, 1, '2019-12-29 10:13:57', NULL),
(354, 'اختبار', 'اختبار اختبار اختبار اختبار', 672, 2, '2019-12-29 10:13:57', NULL),
(355, 'test', 'test test test test', 673, 1, '2019-12-29 10:13:57', NULL),
(356, 'اختبار', 'اختبار اختبار اختبار اختبار', 673, 2, '2019-12-29 10:13:57', NULL),
(357, 'test', 'test test test test', 674, 1, '2019-12-29 10:13:57', NULL),
(358, 'اختبار', 'اختبار اختبار اختبار اختبار', 674, 2, '2019-12-29 10:13:57', NULL),
(359, 'test', 'test test test test', 675, 1, '2019-12-29 10:13:57', NULL),
(360, 'اختبار', 'اختبار اختبار اختبار اختبار', 675, 2, '2019-12-29 10:13:57', NULL),
(361, 'test', 'test test test test', 676, 1, '2019-12-29 10:13:57', NULL),
(362, 'اختبار', 'اختبار اختبار اختبار اختبار', 676, 2, '2019-12-29 10:13:57', NULL),
(363, 'test', 'test test test test', 677, 1, '2019-12-29 10:13:57', NULL),
(364, 'اختبار', 'اختبار اختبار اختبار اختبار', 677, 2, '2019-12-29 10:13:57', NULL),
(365, 'test', 'test test test test', 678, 1, '2019-12-29 10:13:57', NULL),
(366, 'اختبار', 'اختبار اختبار اختبار اختبار', 678, 2, '2019-12-29 10:13:57', NULL),
(367, 'test', 'test test test test', 679, 1, '2019-12-29 10:13:57', NULL),
(368, 'اختبار', 'اختبار اختبار اختبار اختبار', 679, 2, '2019-12-29 10:13:57', NULL),
(369, 'test', 'test test test test', 680, 1, '2019-12-29 10:13:57', NULL),
(370, 'اختبار', 'اختبار اختبار اختبار اختبار', 680, 2, '2019-12-29 10:13:57', NULL),
(371, 'test', 'test test test test', 681, 1, '2019-12-29 10:13:57', NULL),
(372, 'اختبار', 'اختبار اختبار اختبار اختبار', 681, 2, '2019-12-29 10:13:57', NULL),
(373, 'test', 'test test test test', 682, 1, '2019-12-29 10:13:57', NULL),
(374, 'اختبار', 'اختبار اختبار اختبار اختبار', 682, 2, '2019-12-29 10:13:57', NULL),
(375, 'test', 'test test test test', 683, 1, '2019-12-29 10:13:57', NULL),
(376, 'اختبار', 'اختبار اختبار اختبار اختبار', 683, 2, '2019-12-29 10:13:57', NULL),
(377, 'test', 'test test test test', 684, 1, '2019-12-29 10:13:57', NULL),
(378, 'اختبار', 'اختبار اختبار اختبار اختبار', 684, 2, '2019-12-29 10:13:57', NULL),
(379, 'test', 'test test test test', 685, 1, '2019-12-29 10:13:57', NULL),
(380, 'اختبار', 'اختبار اختبار اختبار اختبار', 685, 2, '2019-12-29 10:13:57', NULL),
(381, 'test', 'test test test test', 686, 1, '2019-12-29 10:13:57', NULL),
(382, 'اختبار', 'اختبار اختبار اختبار اختبار', 686, 2, '2019-12-29 10:13:57', NULL),
(383, 'test', 'test test test test', 687, 1, '2019-12-29 10:13:57', NULL),
(384, 'اختبار', 'اختبار اختبار اختبار اختبار', 687, 2, '2019-12-29 10:13:57', NULL),
(385, 'test', 'test test test test', 688, 1, '2019-12-29 10:13:57', NULL),
(386, 'اختبار', 'اختبار اختبار اختبار اختبار', 688, 2, '2019-12-29 10:13:57', NULL),
(387, 'test', 'test test test test', 689, 1, '2019-12-29 10:13:57', NULL),
(388, 'اختبار', 'اختبار اختبار اختبار اختبار', 689, 2, '2019-12-29 10:13:57', NULL),
(389, 'test', 'test test test test', 690, 1, '2019-12-29 10:13:57', NULL),
(390, 'اختبار', 'اختبار اختبار اختبار اختبار', 690, 2, '2019-12-29 10:13:57', NULL),
(391, 'test', 'test test test test', 691, 1, '2019-12-29 10:15:08', NULL),
(392, 'اختبار', 'اختبار اختبار اختبار اختبار', 691, 2, '2019-12-29 10:15:08', NULL),
(393, 'test', 'test test test test', 692, 1, '2019-12-29 10:15:08', NULL),
(394, 'اختبار', 'اختبار اختبار اختبار اختبار', 692, 2, '2019-12-29 10:15:08', NULL),
(395, 'test', 'test test test test', 693, 1, '2019-12-29 10:15:08', NULL),
(396, 'اختبار', 'اختبار اختبار اختبار اختبار', 693, 2, '2019-12-29 10:15:08', NULL),
(397, 'test', 'test test test test', 694, 1, '2019-12-29 10:15:08', NULL),
(398, 'اختبار', 'اختبار اختبار اختبار اختبار', 694, 2, '2019-12-29 10:15:08', NULL),
(399, 'test', 'test test test test', 695, 1, '2019-12-29 10:15:08', NULL),
(400, 'اختبار', 'اختبار اختبار اختبار اختبار', 695, 2, '2019-12-29 10:15:08', NULL),
(401, 'test', 'test test test test', 696, 1, '2019-12-29 10:15:08', NULL),
(402, 'اختبار', 'اختبار اختبار اختبار اختبار', 696, 2, '2019-12-29 10:15:08', NULL),
(403, 'test', 'test test test test', 697, 1, '2019-12-29 10:15:08', NULL),
(404, 'اختبار', 'اختبار اختبار اختبار اختبار', 697, 2, '2019-12-29 10:15:08', NULL),
(405, 'test', 'test test test test', 698, 1, '2019-12-29 10:15:08', NULL),
(406, 'اختبار', 'اختبار اختبار اختبار اختبار', 698, 2, '2019-12-29 10:15:08', NULL),
(407, 'test', 'test test test test', 699, 1, '2019-12-29 10:15:08', NULL),
(408, 'اختبار', 'اختبار اختبار اختبار اختبار', 699, 2, '2019-12-29 10:15:08', NULL),
(409, 'test', 'test test test test', 700, 1, '2019-12-29 10:15:08', NULL),
(410, 'اختبار', 'اختبار اختبار اختبار اختبار', 700, 2, '2019-12-29 10:15:08', NULL),
(411, 'test', 'test test test test', 701, 1, '2019-12-29 10:15:08', NULL),
(412, 'اختبار', 'اختبار اختبار اختبار اختبار', 701, 2, '2019-12-29 10:15:08', NULL),
(413, 'test', 'test test test test', 702, 1, '2019-12-29 10:15:08', NULL),
(414, 'اختبار', 'اختبار اختبار اختبار اختبار', 702, 2, '2019-12-29 10:15:08', NULL),
(415, 'test', 'test test test test', 703, 1, '2019-12-29 10:15:08', NULL),
(416, 'اختبار', 'اختبار اختبار اختبار اختبار', 703, 2, '2019-12-29 10:15:08', NULL),
(417, 'test', 'test test test test', 704, 1, '2019-12-29 10:15:08', NULL),
(418, 'اختبار', 'اختبار اختبار اختبار اختبار', 704, 2, '2019-12-29 10:15:08', NULL),
(419, 'test', 'test test test test', 705, 1, '2019-12-29 10:15:08', NULL),
(420, 'اختبار', 'اختبار اختبار اختبار اختبار', 705, 2, '2019-12-29 10:15:08', NULL),
(421, 'test', 'test test test test', 706, 1, '2019-12-29 10:15:08', NULL),
(422, 'اختبار', 'اختبار اختبار اختبار اختبار', 706, 2, '2019-12-29 10:15:08', NULL),
(423, 'test', 'test test test test', 707, 1, '2019-12-29 10:15:08', NULL),
(424, 'اختبار', 'اختبار اختبار اختبار اختبار', 707, 2, '2019-12-29 10:15:08', NULL),
(425, 'test', 'test test test test', 708, 1, '2019-12-29 10:15:08', NULL),
(426, 'اختبار', 'اختبار اختبار اختبار اختبار', 708, 2, '2019-12-29 10:15:08', NULL),
(427, 'test', 'test test test test', 709, 1, '2019-12-29 10:15:08', NULL),
(428, 'اختبار', 'اختبار اختبار اختبار اختبار', 709, 2, '2019-12-29 10:15:08', NULL),
(429, 'test', 'test test test test', 710, 1, '2019-12-29 10:15:08', NULL),
(430, 'اختبار', 'اختبار اختبار اختبار اختبار', 710, 2, '2019-12-29 10:15:08', NULL),
(431, 'test', 'test test test test', 711, 1, '2019-12-29 10:15:08', NULL),
(432, 'اختبار', 'اختبار اختبار اختبار اختبار', 711, 2, '2019-12-29 10:15:08', NULL),
(433, 'test', 'test test test test', 712, 1, '2019-12-29 10:15:08', NULL),
(434, 'اختبار', 'اختبار اختبار اختبار اختبار', 712, 2, '2019-12-29 10:15:08', NULL),
(435, 'test', 'test test test test', 713, 1, '2019-12-29 10:15:08', NULL),
(436, 'اختبار', 'اختبار اختبار اختبار اختبار', 713, 2, '2019-12-29 10:15:08', NULL),
(437, 'test', 'test test test test', 714, 1, '2019-12-29 10:15:08', NULL),
(438, 'اختبار', 'اختبار اختبار اختبار اختبار', 714, 2, '2019-12-29 10:15:08', NULL),
(439, 'test', 'test test test test', 715, 1, '2019-12-29 10:15:08', NULL),
(440, 'اختبار', 'اختبار اختبار اختبار اختبار', 715, 2, '2019-12-29 10:15:08', NULL),
(441, 'test', 'test test test test', 716, 1, '2019-12-29 10:15:08', NULL),
(442, 'اختبار', 'اختبار اختبار اختبار اختبار', 716, 2, '2019-12-29 10:15:08', NULL),
(443, 'test', 'test test test test', 717, 1, '2019-12-29 10:15:08', NULL),
(444, 'اختبار', 'اختبار اختبار اختبار اختبار', 717, 2, '2019-12-29 10:15:08', NULL),
(445, 'test', 'test test test test', 718, 1, '2019-12-29 10:15:08', NULL),
(446, 'اختبار', 'اختبار اختبار اختبار اختبار', 718, 2, '2019-12-29 10:15:08', NULL),
(447, 'test', 'test test test test', 719, 1, '2019-12-29 10:15:08', NULL),
(448, 'اختبار', 'اختبار اختبار اختبار اختبار', 719, 2, '2019-12-29 10:15:08', NULL),
(449, 'test', 'test test test test', 720, 1, '2019-12-29 10:15:08', NULL),
(450, 'اختبار', 'اختبار اختبار اختبار اختبار', 720, 2, '2019-12-29 10:15:08', NULL),
(451, 'test', 'test test test test', 721, 1, '2019-12-29 10:15:08', NULL),
(452, 'اختبار', 'اختبار اختبار اختبار اختبار', 721, 2, '2019-12-29 10:15:08', NULL),
(453, 'test', 'test test test test', 722, 1, '2019-12-29 10:15:08', NULL),
(454, 'اختبار', 'اختبار اختبار اختبار اختبار', 722, 2, '2019-12-29 10:15:08', NULL),
(455, 'test', 'test test test test', 723, 1, '2019-12-29 10:15:08', NULL),
(456, 'اختبار', 'اختبار اختبار اختبار اختبار', 723, 2, '2019-12-29 10:15:08', NULL),
(457, 'test', 'test test test test', 724, 1, '2019-12-29 10:15:08', NULL),
(458, 'اختبار', 'اختبار اختبار اختبار اختبار', 724, 2, '2019-12-29 10:15:08', NULL),
(459, 'test', 'test test test test', 725, 1, '2019-12-29 10:15:08', NULL),
(460, 'اختبار', 'اختبار اختبار اختبار اختبار', 725, 2, '2019-12-29 10:15:08', NULL),
(461, 'test', 'test test test test', 726, 1, '2019-12-29 10:15:08', NULL),
(462, 'اختبار', 'اختبار اختبار اختبار اختبار', 726, 2, '2019-12-29 10:15:08', NULL),
(463, 'test', 'test test test test', 727, 1, '2019-12-29 10:15:08', NULL),
(464, 'اختبار', 'اختبار اختبار اختبار اختبار', 727, 2, '2019-12-29 10:15:08', NULL),
(465, 'test', 'test test test test', 728, 1, '2019-12-29 10:15:08', NULL),
(466, 'اختبار', 'اختبار اختبار اختبار اختبار', 728, 2, '2019-12-29 10:15:08', NULL),
(467, 'test', 'test test test test', 729, 1, '2019-12-29 10:15:08', NULL),
(468, 'اختبار', 'اختبار اختبار اختبار اختبار', 729, 2, '2019-12-29 10:15:08', NULL),
(469, 'test', 'test test test test', 730, 1, '2019-12-29 10:15:08', NULL),
(470, 'اختبار', 'اختبار اختبار اختبار اختبار', 730, 2, '2019-12-29 10:15:08', NULL),
(471, 'test', 'test test test test', 731, 1, '2019-12-29 10:15:08', NULL),
(472, 'اختبار', 'اختبار اختبار اختبار اختبار', 731, 2, '2019-12-29 10:15:08', NULL),
(473, 'test', 'test test test test', 732, 1, '2019-12-29 10:15:08', NULL),
(474, 'اختبار', 'اختبار اختبار اختبار اختبار', 732, 2, '2019-12-29 10:15:08', NULL),
(475, 'test', 'test test test test', 733, 1, '2019-12-29 10:15:08', NULL),
(476, 'اختبار', 'اختبار اختبار اختبار اختبار', 733, 2, '2019-12-29 10:15:08', NULL),
(477, 'test', 'test test test test', 734, 1, '2019-12-29 10:15:08', NULL),
(478, 'اختبار', 'اختبار اختبار اختبار اختبار', 734, 2, '2019-12-29 10:15:08', NULL),
(479, 'test', 'test test test test', 735, 1, '2019-12-29 10:15:08', NULL),
(480, 'اختبار', 'اختبار اختبار اختبار اختبار', 735, 2, '2019-12-29 10:15:08', NULL),
(481, 'test', 'test test test test', 736, 1, '2019-12-29 10:15:08', NULL),
(482, 'اختبار', 'اختبار اختبار اختبار اختبار', 736, 2, '2019-12-29 10:15:08', NULL),
(483, 'test', 'test test test test', 737, 1, '2019-12-29 10:15:08', NULL),
(484, 'اختبار', 'اختبار اختبار اختبار اختبار', 737, 2, '2019-12-29 10:15:08', NULL),
(485, 'test', 'test test test test', 738, 1, '2019-12-29 10:15:08', NULL),
(486, 'اختبار', 'اختبار اختبار اختبار اختبار', 738, 2, '2019-12-29 10:15:08', NULL),
(487, 'test', 'test test test test', 739, 1, '2019-12-29 10:15:08', NULL),
(488, 'اختبار', 'اختبار اختبار اختبار اختبار', 739, 2, '2019-12-29 10:15:08', NULL),
(489, 'test', 'test test test test', 740, 1, '2019-12-29 10:15:08', NULL),
(490, 'اختبار', 'اختبار اختبار اختبار اختبار', 740, 2, '2019-12-29 10:15:08', NULL),
(491, 'test', 'test test test test', 741, 1, '2019-12-29 10:15:08', NULL),
(492, 'اختبار', 'اختبار اختبار اختبار اختبار', 741, 2, '2019-12-29 10:15:08', NULL),
(493, 'test', 'test test test test', 742, 1, '2019-12-29 10:15:08', NULL),
(494, 'اختبار', 'اختبار اختبار اختبار اختبار', 742, 2, '2019-12-29 10:15:08', NULL),
(495, 'test', 'test test test test', 743, 1, '2019-12-29 10:15:08', NULL),
(496, 'اختبار', 'اختبار اختبار اختبار اختبار', 743, 2, '2019-12-29 10:15:08', NULL),
(497, 'test', 'test test test test', 744, 1, '2019-12-29 10:15:08', NULL),
(498, 'اختبار', 'اختبار اختبار اختبار اختبار', 744, 2, '2019-12-29 10:15:08', NULL),
(499, 'test', 'test test test test', 745, 1, '2019-12-29 10:15:08', NULL),
(500, 'اختبار', 'اختبار اختبار اختبار اختبار', 745, 2, '2019-12-29 10:15:08', NULL),
(501, 'test', 'test test test test', 746, 1, '2019-12-29 10:15:08', NULL),
(502, 'اختبار', 'اختبار اختبار اختبار اختبار', 746, 2, '2019-12-29 10:15:08', NULL),
(503, 'test', 'test test test test', 747, 1, '2019-12-29 10:15:08', NULL),
(504, 'اختبار', 'اختبار اختبار اختبار اختبار', 747, 2, '2019-12-29 10:15:08', NULL),
(505, 'test', 'test test test test', 748, 1, '2019-12-29 10:15:08', NULL),
(506, 'اختبار', 'اختبار اختبار اختبار اختبار', 748, 2, '2019-12-29 10:15:08', NULL),
(507, 'test', 'test test test test', 749, 1, '2019-12-29 10:15:08', NULL),
(508, 'اختبار', 'اختبار اختبار اختبار اختبار', 749, 2, '2019-12-29 10:15:08', NULL),
(509, 'test', 'test test test test', 750, 1, '2019-12-29 10:15:08', NULL),
(510, 'اختبار', 'اختبار اختبار اختبار اختبار', 750, 2, '2019-12-29 10:15:08', NULL),
(511, 'test', 'test test test test', 751, 1, '2019-12-29 10:15:08', NULL),
(512, 'اختبار', 'اختبار اختبار اختبار اختبار', 751, 2, '2019-12-29 10:15:08', NULL),
(513, 'test', 'testtesttesttesttesttest', 752, 1, '2019-12-29 13:51:41', NULL),
(514, 'اختبار', 'اختباراختباراختباراختباراختبار', 752, 2, '2019-12-29 13:51:41', NULL),
(515, 'test', 'test test test', 753, 1, '2019-12-29 14:14:59', NULL),
(516, 'اختبار', 'اختبار اختبار اختبار', 753, 2, '2019-12-29 14:14:59', NULL),
(517, 'test', 'ewrf', 758, 1, '2019-12-30 10:35:08', NULL),
(518, 'اختبار', 'ؤي', 758, 2, '2019-12-30 10:35:08', NULL),
(519, 'test', 'ewrf', 759, 1, '2019-12-30 10:35:08', NULL),
(520, 'اختبار', 'ؤي', 759, 2, '2019-12-30 10:35:08', NULL),
(521, 'test', 'ewrf', 760, 1, '2019-12-30 10:35:08', NULL),
(522, 'اختبار', 'ؤي', 760, 2, '2019-12-30 10:35:08', NULL),
(523, 'test', 'ewrf', 761, 1, '2019-12-30 10:35:08', NULL),
(524, 'اختبار', 'ؤي', 761, 2, '2019-12-30 10:35:08', NULL),
(525, 'test', 'ewrf', 762, 1, '2019-12-30 10:35:08', NULL),
(526, 'اختبار', 'ؤي', 762, 2, '2019-12-30 10:35:08', NULL),
(527, 'test', 'ewrf', 763, 1, '2019-12-30 10:35:08', NULL),
(528, 'اختبار', 'ؤي', 763, 2, '2019-12-30 10:35:08', NULL),
(529, 'test', 'ewrf', 764, 1, '2019-12-30 10:35:08', NULL),
(530, 'اختبار', 'ؤي', 764, 2, '2019-12-30 10:35:08', NULL),
(531, 'test', 'ewrf', 765, 1, '2019-12-30 10:35:08', NULL),
(532, 'اختبار', 'ؤي', 765, 2, '2019-12-30 10:35:08', NULL),
(533, 'test', 'ewrf', 766, 1, '2019-12-30 10:35:08', NULL),
(534, 'اختبار', 'ؤي', 766, 2, '2019-12-30 10:35:08', NULL),
(535, 'test', 'ewrf', 767, 1, '2019-12-30 10:35:08', NULL),
(536, 'اختبار', 'ؤي', 767, 2, '2019-12-30 10:35:08', NULL),
(537, 'test', 'ewrf', 768, 1, '2019-12-30 10:35:08', NULL),
(538, 'اختبار', 'ؤي', 768, 2, '2019-12-30 10:35:08', NULL),
(539, 'test', 'ewrf', 769, 1, '2019-12-30 10:35:08', NULL),
(540, 'اختبار', 'ؤي', 769, 2, '2019-12-30 10:35:08', NULL),
(541, 'test', 'ewrf', 770, 1, '2019-12-30 10:35:08', NULL),
(542, 'اختبار', 'ؤي', 770, 2, '2019-12-30 10:35:08', NULL),
(543, 'test', 'ewrf', 771, 1, '2019-12-30 10:35:08', NULL),
(544, 'اختبار', 'ؤي', 771, 2, '2019-12-30 10:35:08', NULL),
(545, 'test', 'ewrf', 772, 1, '2019-12-30 10:35:08', NULL),
(546, 'اختبار', 'ؤي', 772, 2, '2019-12-30 10:35:08', NULL),
(547, 'test', 'ewrf', 773, 1, '2019-12-30 10:35:08', NULL),
(548, 'اختبار', 'ؤي', 773, 2, '2019-12-30 10:35:08', NULL),
(549, 'test', 'ewrf', 774, 1, '2019-12-30 10:35:08', NULL),
(550, 'اختبار', 'ؤي', 774, 2, '2019-12-30 10:35:08', NULL),
(551, 'test', 'ewrf', 775, 1, '2019-12-30 10:35:08', NULL),
(552, 'اختبار', 'ؤي', 775, 2, '2019-12-30 10:35:08', NULL),
(553, 'test', 'ewrf', 776, 1, '2019-12-30 10:35:08', NULL),
(554, 'اختبار', 'ؤي', 776, 2, '2019-12-30 10:35:08', NULL),
(555, 'test', 'ewrf', 777, 1, '2019-12-30 10:35:08', NULL),
(556, 'اختبار', 'ؤي', 777, 2, '2019-12-30 10:35:08', NULL),
(557, 'test', 'ewrf', 778, 1, '2019-12-30 10:35:08', NULL),
(558, 'اختبار', 'ؤي', 778, 2, '2019-12-30 10:35:08', NULL),
(559, 'test', 'ewrf', 779, 1, '2019-12-30 10:35:08', NULL),
(560, 'اختبار', 'ؤي', 779, 2, '2019-12-30 10:35:08', NULL),
(561, 'test', 'ewrf', 780, 1, '2019-12-30 10:35:08', NULL),
(562, 'اختبار', 'ؤي', 780, 2, '2019-12-30 10:35:08', NULL),
(563, 'test', 'ewrf', 781, 1, '2019-12-30 10:35:08', NULL),
(564, 'اختبار', 'ؤي', 781, 2, '2019-12-30 10:35:08', NULL),
(565, 'test', 'ewrf', 782, 1, '2019-12-30 10:35:08', NULL),
(566, 'اختبار', 'ؤي', 782, 2, '2019-12-30 10:35:08', NULL),
(567, 'test', 'ewrf', 783, 1, '2019-12-30 10:35:08', NULL),
(568, 'اختبار', 'ؤي', 783, 2, '2019-12-30 10:35:08', NULL),
(569, 'test', 'ewrf', 784, 1, '2019-12-30 10:35:08', NULL),
(570, 'اختبار', 'ؤي', 784, 2, '2019-12-30 10:35:08', NULL),
(571, 'test', 'ewrf', 785, 1, '2019-12-30 10:35:08', NULL),
(572, 'اختبار', 'ؤي', 785, 2, '2019-12-30 10:35:08', NULL),
(573, 'test', 'ewrf', 786, 1, '2019-12-30 10:35:08', NULL),
(574, 'اختبار', 'ؤي', 786, 2, '2019-12-30 10:35:08', NULL),
(575, 'test', 'ewrf', 787, 1, '2019-12-30 10:35:08', NULL),
(576, 'اختبار', 'ؤي', 787, 2, '2019-12-30 10:35:08', NULL),
(577, 'test', 'ewrf', 788, 1, '2019-12-30 10:35:08', NULL),
(578, 'اختبار', 'ؤي', 788, 2, '2019-12-30 10:35:08', NULL),
(579, 'test', 'ewrf', 789, 1, '2019-12-30 10:35:08', NULL),
(580, 'اختبار', 'ؤي', 789, 2, '2019-12-30 10:35:08', NULL),
(581, 'test', 'ewrf', 790, 1, '2019-12-30 10:35:08', NULL),
(582, 'اختبار', 'ؤي', 790, 2, '2019-12-30 10:35:08', NULL),
(583, 'test', 'ewrf', 791, 1, '2019-12-30 10:35:08', NULL),
(584, 'اختبار', 'ؤي', 791, 2, '2019-12-30 10:35:08', NULL),
(585, 'test', 'ewrf', 792, 1, '2019-12-30 10:35:08', NULL),
(586, 'اختبار', 'ؤي', 792, 2, '2019-12-30 10:35:08', NULL),
(587, 'test', 'ewrf', 793, 1, '2019-12-30 10:35:08', NULL),
(588, 'اختبار', 'ؤي', 793, 2, '2019-12-30 10:35:08', NULL),
(589, 'test', 'ewrf', 794, 1, '2019-12-30 10:35:08', NULL),
(590, 'اختبار', 'ؤي', 794, 2, '2019-12-30 10:35:08', NULL),
(591, 'test', 'ewrf', 795, 1, '2019-12-30 10:35:08', NULL),
(592, 'اختبار', 'ؤي', 795, 2, '2019-12-30 10:35:08', NULL),
(593, 'test', 'ewrf', 796, 1, '2019-12-30 10:35:08', NULL),
(594, 'اختبار', 'ؤي', 796, 2, '2019-12-30 10:35:08', NULL),
(595, 'test', 'ewrf', 797, 1, '2019-12-30 10:35:08', NULL),
(596, 'اختبار', 'ؤي', 797, 2, '2019-12-30 10:35:08', NULL),
(597, 'test', 'ewrf', 798, 1, '2019-12-30 10:35:08', NULL),
(598, 'اختبار', 'ؤي', 798, 2, '2019-12-30 10:35:08', NULL),
(599, 'test', 'ewrf', 799, 1, '2019-12-30 10:35:08', NULL),
(600, 'اختبار', 'ؤي', 799, 2, '2019-12-30 10:35:08', NULL),
(601, 'test', 'ewrf', 800, 1, '2019-12-30 10:35:08', NULL),
(602, 'اختبار', 'ؤي', 800, 2, '2019-12-30 10:35:08', NULL),
(603, 'test', 'ewrf', 801, 1, '2019-12-30 10:35:08', NULL),
(604, 'اختبار', 'ؤي', 801, 2, '2019-12-30 10:35:08', NULL),
(605, 'test', 'ewrf', 802, 1, '2019-12-30 10:35:08', NULL),
(606, 'اختبار', 'ؤي', 802, 2, '2019-12-30 10:35:08', NULL),
(607, 'test', 'ewrf', 803, 1, '2019-12-30 10:35:08', NULL),
(608, 'اختبار', 'ؤي', 803, 2, '2019-12-30 10:35:08', NULL),
(609, 'test', 'ewrf', 804, 1, '2019-12-30 10:35:08', NULL),
(610, 'اختبار', 'ؤي', 804, 2, '2019-12-30 10:35:08', NULL),
(611, 'test', 'ewrf', 805, 1, '2019-12-30 10:35:08', NULL),
(612, 'اختبار', 'ؤي', 805, 2, '2019-12-30 10:35:08', NULL),
(613, 'test', 'ewrf', 806, 1, '2019-12-30 10:35:08', NULL),
(614, 'اختبار', 'ؤي', 806, 2, '2019-12-30 10:35:08', NULL),
(615, 'test', 'ewrf', 807, 1, '2019-12-30 10:35:08', NULL),
(616, 'اختبار', 'ؤي', 807, 2, '2019-12-30 10:35:08', NULL),
(617, 'test', 'ewrf', 808, 1, '2019-12-30 10:35:08', NULL),
(618, 'اختبار', 'ؤي', 808, 2, '2019-12-30 10:35:08', NULL),
(619, 'test', 'ewrf', 809, 1, '2019-12-30 10:35:08', NULL),
(620, 'اختبار', 'ؤي', 809, 2, '2019-12-30 10:35:08', NULL),
(621, 'test', 'ewrf', 810, 1, '2019-12-30 10:35:08', NULL),
(622, 'اختبار', 'ؤي', 810, 2, '2019-12-30 10:35:08', NULL),
(623, 'test', 'ewrf', 811, 1, '2019-12-30 10:35:08', NULL),
(624, 'اختبار', 'ؤي', 811, 2, '2019-12-30 10:35:08', NULL),
(625, 'test', 'ewrf', 812, 1, '2019-12-30 10:35:08', NULL),
(626, 'اختبار', 'ؤي', 812, 2, '2019-12-30 10:35:08', NULL),
(627, 'test', 'ewrf', 813, 1, '2019-12-30 10:35:08', NULL),
(628, 'اختبار', 'ؤي', 813, 2, '2019-12-30 10:35:08', NULL),
(629, 'test', 'ewrf', 814, 1, '2019-12-30 10:35:08', NULL),
(630, 'اختبار', 'ؤي', 814, 2, '2019-12-30 10:35:08', NULL),
(631, 'test', 'ewrf', 815, 1, '2019-12-30 10:35:08', NULL),
(632, 'اختبار', 'ؤي', 815, 2, '2019-12-30 10:35:08', NULL),
(633, 'test', 'ewrf', 816, 1, '2019-12-30 10:35:08', NULL),
(634, 'اختبار', 'ؤي', 816, 2, '2019-12-30 10:35:08', NULL),
(635, 'test', 'ewrf', 817, 1, '2019-12-30 10:35:08', NULL),
(636, 'اختبار', 'ؤي', 817, 2, '2019-12-30 10:35:08', NULL),
(637, 'test', 'ewrf', 818, 1, '2019-12-30 10:35:08', NULL),
(638, 'اختبار', 'ؤي', 818, 2, '2019-12-30 10:35:08', NULL),
(639, 'fde c', 'ew cfe', 819, 1, '2019-12-30 13:35:21', NULL),
(640, 'اختبار', 'يبي يبثص', 819, 2, '2019-12-30 13:35:21', NULL),
(641, 'test few w', 'jbjb bh bhbh', 820, 1, '2019-12-30 13:36:19', NULL),
(642, 'اختبار', 'تالات عاع اعاع ا', 820, 2, '2019-12-30 13:36:19', NULL),
(646, 'King Faisal Specialist Hospital in Jeddah', ' , Please make a new request', 1, 1, '2019-12-31 07:47:48', NULL),
(647, 'مستشفى الملك فيصل التخصصي بجدة', ' , يرجى عمل طلب جديد', 1, 2, '2019-12-31 07:47:48', NULL),
(648, 'King Faisal Specialist Hospital in Jeddah', ' , Please make a new request', 1, 1, '2019-12-31 07:48:55', NULL),
(649, 'مستشفى الملك فيصل التخصصي بجدة', ' , يرجى عمل طلب جديد', 1, 2, '2019-12-31 07:48:55', NULL),
(650, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been denied , Please make a new request', 1, 1, '2019-12-31 07:51:49', NULL),
(651, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 1, 2, '2019-12-31 07:51:49', NULL),
(652, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been denied , Please make a new request', 827, 1, '2019-12-31 07:55:27', NULL),
(653, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 827, 2, '2019-12-31 07:55:27', NULL),
(654, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 828, 1, '2019-12-31 10:08:34', NULL),
(655, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 828, 2, '2019-12-31 10:08:34', NULL),
(656, 'hospital Almana', 'Your request has been denied , Please make a new request', 829, 1, '2019-12-31 10:09:48', NULL),
(657, 'مستشفي المانع', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 829, 2, '2019-12-31 10:09:48', NULL),
(658, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 830, 1, '2019-12-31 10:11:06', NULL),
(659, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 830, 2, '2019-12-31 10:11:06', NULL),
(660, 'hospital Almana', 'Your request has been denied , Please make a new request', 831, 1, '2019-12-31 10:11:31', NULL),
(661, 'مستشفي المانع', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 831, 2, '2019-12-31 10:11:31', NULL),
(662, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been successfully accepted , Please make a new request', 832, 1, '2019-12-31 10:57:55', NULL),
(663, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 832, 2, '2019-12-31 10:57:55', NULL),
(664, 'Hospital test', 'Your request has been successfully accepted , Please make a new request', 833, 1, '2019-12-31 12:15:42', NULL);
INSERT INTO `notification_description` (`notification_description_id`, `notification_name`, `notification_content`, `notification_id`, `language_id`, `created_at`, `updated_at`) VALUES
(665, 'مستفي تجريبي', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 833, 2, '2019-12-31 12:15:42', NULL),
(666, 'Hospital test', 'the reserve is finished , Please make a new request', 834, 1, '2019-12-31 12:18:37', NULL),
(667, 'مستفي تجريبي', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 834, 2, '2019-12-31 12:18:37', NULL),
(668, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 835, 1, '2020-01-02 09:04:45', NULL),
(669, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 835, 2, '2020-01-02 09:04:45', NULL),
(670, 'hospital Almana', 'the reserve is finished , Please make a new request', 836, 1, '2020-01-02 09:06:27', NULL),
(671, 'مستشفي المانع', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 836, 2, '2020-01-02 09:06:27', NULL),
(672, 'hello', 'hello hello hello hello hello hello', 837, 1, '2020-01-05 07:18:33', NULL),
(673, 'اهلا', 'اهلا اهلا اهلا اهلا اهلا اهلا اهلا اهلا', 837, 2, '2020-01-05 07:18:33', NULL),
(674, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been successfully accepted , تم قبول طلبكPlease make a new request', 838, 1, '2020-01-05 07:28:40', NULL),
(675, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم قبول طلبك بنجاح , تم قبول طلبكيرجى عمل طلب جديد', 838, 2, '2020-01-05 07:28:40', NULL),
(676, 'Saudia Catering', 'Your request has been denied , Please make a new request', 839, 1, '2020-01-05 08:47:46', NULL),
(677, 'السعودية للتموين', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 839, 2, '2020-01-05 08:47:46', NULL),
(678, 'Saudia Catering', 'the reserve is finished , Please make a new request', 840, 1, '2020-01-05 08:49:21', NULL),
(679, 'السعودية للتموين', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 840, 2, '2020-01-05 08:49:21', NULL),
(680, 'Saudia Catering', 'Your request has been successfully accepted , Please make a new request', 841, 1, '2020-01-05 08:49:51', NULL),
(681, 'السعودية للتموين', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 841, 2, '2020-01-05 08:49:51', NULL),
(682, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 842, 1, '2020-01-05 09:06:43', NULL),
(683, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 842, 2, '2020-01-05 09:06:43', NULL),
(684, 'hello', 'hello hello hello', 843, 1, '2020-01-05 13:54:21', NULL),
(685, 'اهلا', 'اهلا اهلا اهلا', 843, 2, '2020-01-05 13:54:21', NULL),
(686, 'hello', 'hellohellohellohello', 844, 1, '2020-01-05 14:01:36', NULL),
(687, 'اهلا', 'اهلااهلااهلا', 844, 2, '2020-01-05 14:01:36', NULL),
(688, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 845, 1, '2020-01-05 21:38:45', NULL),
(689, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 845, 2, '2020-01-05 21:38:45', NULL),
(690, 'hospital Almana', 'Your request has been denied , Please make a new request', 846, 1, '2020-01-05 21:39:44', NULL),
(691, 'مستشفي المانع', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 846, 2, '2020-01-05 21:39:44', NULL),
(692, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 847, 1, '2020-01-05 21:43:56', NULL),
(693, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 847, 2, '2020-01-05 21:43:56', NULL),
(694, 'hospital Almana', 'Your request has been denied , Please make a new request', 848, 1, '2020-01-05 21:44:27', NULL),
(695, 'مستشفي المانع', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 848, 2, '2020-01-05 21:44:27', NULL),
(696, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 849, 1, '2020-01-05 21:49:43', NULL),
(697, 'س شيشس يشسي', 'سشيشسيشسي', 849, 2, '2020-01-05 21:49:43', NULL),
(698, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 850, 1, '2020-01-05 21:49:43', NULL),
(699, 'س شيشس يشسي', 'سشيشسيشسي', 850, 2, '2020-01-05 21:49:43', NULL),
(700, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 851, 1, '2020-01-05 21:49:43', NULL),
(701, 'س شيشس يشسي', 'سشيشسيشسي', 851, 2, '2020-01-05 21:49:43', NULL),
(702, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 852, 1, '2020-01-05 21:49:43', NULL),
(703, 'س شيشس يشسي', 'سشيشسيشسي', 852, 2, '2020-01-05 21:49:43', NULL),
(704, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 853, 1, '2020-01-05 21:49:43', NULL),
(705, 'س شيشس يشسي', 'سشيشسيشسي', 853, 2, '2020-01-05 21:49:43', NULL),
(706, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 854, 1, '2020-01-05 21:49:43', NULL),
(707, 'س شيشس يشسي', 'سشيشسيشسي', 854, 2, '2020-01-05 21:49:43', NULL),
(708, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 855, 1, '2020-01-05 21:49:43', NULL),
(709, 'س شيشس يشسي', 'سشيشسيشسي', 855, 2, '2020-01-05 21:49:43', NULL),
(710, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 856, 1, '2020-01-05 21:49:43', NULL),
(711, 'س شيشس يشسي', 'سشيشسيشسي', 856, 2, '2020-01-05 21:49:44', NULL),
(712, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 857, 1, '2020-01-05 21:49:44', NULL),
(713, 'س شيشس يشسي', 'سشيشسيشسي', 857, 2, '2020-01-05 21:49:44', NULL),
(714, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 858, 1, '2020-01-05 21:49:44', NULL),
(715, 'س شيشس يشسي', 'سشيشسيشسي', 858, 2, '2020-01-05 21:49:44', NULL),
(716, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 859, 1, '2020-01-05 21:49:44', NULL),
(717, 'س شيشس يشسي', 'سشيشسيشسي', 859, 2, '2020-01-05 21:49:44', NULL),
(718, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 860, 1, '2020-01-05 21:49:44', NULL),
(719, 'س شيشس يشسي', 'سشيشسيشسي', 860, 2, '2020-01-05 21:49:44', NULL),
(720, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 861, 1, '2020-01-05 21:49:44', NULL),
(721, 'س شيشس يشسي', 'سشيشسيشسي', 861, 2, '2020-01-05 21:49:44', NULL),
(722, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 862, 1, '2020-01-05 21:49:44', NULL),
(723, 'س شيشس يشسي', 'سشيشسيشسي', 862, 2, '2020-01-05 21:49:44', NULL),
(724, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 863, 1, '2020-01-05 21:49:44', NULL),
(725, 'س شيشس يشسي', 'سشيشسيشسي', 863, 2, '2020-01-05 21:49:44', NULL),
(726, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 864, 1, '2020-01-05 21:49:44', NULL),
(727, 'س شيشس يشسي', 'سشيشسيشسي', 864, 2, '2020-01-05 21:49:44', NULL),
(728, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 865, 1, '2020-01-05 21:49:44', NULL),
(729, 'س شيشس يشسي', 'سشيشسيشسي', 865, 2, '2020-01-05 21:49:44', NULL),
(730, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 866, 1, '2020-01-05 21:49:44', NULL),
(731, 'س شيشس يشسي', 'سشيشسيشسي', 866, 2, '2020-01-05 21:49:44', NULL),
(732, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 867, 1, '2020-01-05 21:49:44', NULL),
(733, 'س شيشس يشسي', 'سشيشسيشسي', 867, 2, '2020-01-05 21:49:44', NULL),
(734, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 868, 1, '2020-01-05 21:49:44', NULL),
(735, 'س شيشس يشسي', 'سشيشسيشسي', 868, 2, '2020-01-05 21:49:44', NULL),
(736, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 869, 1, '2020-01-05 21:49:44', NULL),
(737, 'س شيشس يشسي', 'سشيشسيشسي', 869, 2, '2020-01-05 21:49:44', NULL),
(738, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 870, 1, '2020-01-05 21:49:44', NULL),
(739, 'س شيشس يشسي', 'سشيشسيشسي', 870, 2, '2020-01-05 21:49:44', NULL),
(740, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 871, 1, '2020-01-05 21:49:44', NULL),
(741, 'س شيشس يشسي', 'سشيشسيشسي', 871, 2, '2020-01-05 21:49:44', NULL),
(742, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 872, 1, '2020-01-05 21:49:44', NULL),
(743, 'س شيشس يشسي', 'سشيشسيشسي', 872, 2, '2020-01-05 21:49:44', NULL),
(744, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 873, 1, '2020-01-05 21:49:44', NULL),
(745, 'س شيشس يشسي', 'سشيشسيشسي', 873, 2, '2020-01-05 21:49:44', NULL),
(746, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 874, 1, '2020-01-05 21:49:44', NULL),
(747, 'س شيشس يشسي', 'سشيشسيشسي', 874, 2, '2020-01-05 21:49:44', NULL),
(748, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 875, 1, '2020-01-05 21:49:44', NULL),
(749, 'س شيشس يشسي', 'سشيشسيشسي', 875, 2, '2020-01-05 21:49:44', NULL),
(750, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 876, 1, '2020-01-05 21:49:44', NULL),
(751, 'س شيشس يشسي', 'سشيشسيشسي', 876, 2, '2020-01-05 21:49:44', NULL),
(752, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 877, 1, '2020-01-05 21:49:44', NULL),
(753, 'س شيشس يشسي', 'سشيشسيشسي', 877, 2, '2020-01-05 21:49:44', NULL),
(754, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 878, 1, '2020-01-05 21:49:44', NULL),
(755, 'س شيشس يشسي', 'سشيشسيشسي', 878, 2, '2020-01-05 21:49:44', NULL),
(756, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 879, 1, '2020-01-05 21:49:44', NULL),
(757, 'س شيشس يشسي', 'سشيشسيشسي', 879, 2, '2020-01-05 21:49:44', NULL),
(758, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 880, 1, '2020-01-05 21:49:44', NULL),
(759, 'س شيشس يشسي', 'سشيشسيشسي', 880, 2, '2020-01-05 21:49:44', NULL),
(760, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 881, 1, '2020-01-05 21:49:44', NULL),
(761, 'س شيشس يشسي', 'سشيشسيشسي', 881, 2, '2020-01-05 21:49:44', NULL),
(762, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 882, 1, '2020-01-05 21:49:44', NULL),
(763, 'س شيشس يشسي', 'سشيشسيشسي', 882, 2, '2020-01-05 21:49:44', NULL),
(764, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 883, 1, '2020-01-05 21:49:44', NULL),
(765, 'س شيشس يشسي', 'سشيشسيشسي', 883, 2, '2020-01-05 21:49:44', NULL),
(766, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 884, 1, '2020-01-05 21:49:44', NULL),
(767, 'س شيشس يشسي', 'سشيشسيشسي', 884, 2, '2020-01-05 21:49:44', NULL),
(768, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 885, 1, '2020-01-05 21:49:44', NULL),
(769, 'س شيشس يشسي', 'سشيشسيشسي', 885, 2, '2020-01-05 21:49:44', NULL),
(770, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 886, 1, '2020-01-05 21:49:44', NULL),
(771, 'س شيشس يشسي', 'سشيشسيشسي', 886, 2, '2020-01-05 21:49:44', NULL),
(772, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 887, 1, '2020-01-05 21:49:44', NULL),
(773, 'س شيشس يشسي', 'سشيشسيشسي', 887, 2, '2020-01-05 21:49:44', NULL),
(774, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 888, 1, '2020-01-05 21:49:44', NULL),
(775, 'س شيشس يشسي', 'سشيشسيشسي', 888, 2, '2020-01-05 21:49:44', NULL),
(776, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 889, 1, '2020-01-05 21:49:44', NULL),
(777, 'س شيشس يشسي', 'سشيشسيشسي', 889, 2, '2020-01-05 21:49:44', NULL),
(778, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 890, 1, '2020-01-05 21:49:44', NULL),
(779, 'س شيشس يشسي', 'سشيشسيشسي', 890, 2, '2020-01-05 21:49:44', NULL),
(780, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 891, 1, '2020-01-05 21:49:44', NULL),
(781, 'س شيشس يشسي', 'سشيشسيشسي', 891, 2, '2020-01-05 21:49:44', NULL),
(782, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 892, 1, '2020-01-05 21:49:44', NULL),
(783, 'س شيشس يشسي', 'سشيشسيشسي', 892, 2, '2020-01-05 21:49:44', NULL),
(784, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 893, 1, '2020-01-05 21:49:44', NULL),
(785, 'س شيشس يشسي', 'سشيشسيشسي', 893, 2, '2020-01-05 21:49:44', NULL),
(786, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 894, 1, '2020-01-05 21:49:44', NULL),
(787, 'س شيشس يشسي', 'سشيشسيشسي', 894, 2, '2020-01-05 21:49:44', NULL),
(788, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 895, 1, '2020-01-05 21:49:44', NULL),
(789, 'س شيشس يشسي', 'سشيشسيشسي', 895, 2, '2020-01-05 21:49:44', NULL),
(790, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 896, 1, '2020-01-05 21:49:44', NULL),
(791, 'س شيشس يشسي', 'سشيشسيشسي', 896, 2, '2020-01-05 21:49:44', NULL),
(792, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 897, 1, '2020-01-05 21:49:44', NULL),
(793, 'س شيشس يشسي', 'سشيشسيشسي', 897, 2, '2020-01-05 21:49:44', NULL),
(794, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 898, 1, '2020-01-05 21:49:44', NULL),
(795, 'س شيشس يشسي', 'سشيشسيشسي', 898, 2, '2020-01-05 21:49:44', NULL),
(796, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 899, 1, '2020-01-05 21:49:44', NULL),
(797, 'س شيشس يشسي', 'سشيشسيشسي', 899, 2, '2020-01-05 21:49:44', NULL),
(798, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 900, 1, '2020-01-05 21:49:44', NULL),
(799, 'س شيشس يشسي', 'سشيشسيشسي', 900, 2, '2020-01-05 21:49:44', NULL),
(800, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 901, 1, '2020-01-05 21:49:44', NULL),
(801, 'س شيشس يشسي', 'سشيشسيشسي', 901, 2, '2020-01-05 21:49:44', NULL),
(802, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 902, 1, '2020-01-05 21:49:44', NULL),
(803, 'س شيشس يشسي', 'سشيشسيشسي', 902, 2, '2020-01-05 21:49:44', NULL),
(804, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 903, 1, '2020-01-05 21:49:44', NULL),
(805, 'س شيشس يشسي', 'سشيشسيشسي', 903, 2, '2020-01-05 21:49:44', NULL),
(806, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 904, 1, '2020-01-05 21:49:44', NULL),
(807, 'س شيشس يشسي', 'سشيشسيشسي', 904, 2, '2020-01-05 21:49:44', NULL),
(808, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 905, 1, '2020-01-05 21:49:44', NULL),
(809, 'س شيشس يشسي', 'سشيشسيشسي', 905, 2, '2020-01-05 21:49:44', NULL),
(810, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 906, 1, '2020-01-05 21:49:44', NULL),
(811, 'س شيشس يشسي', 'سشيشسيشسي', 906, 2, '2020-01-05 21:49:44', NULL),
(812, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 907, 1, '2020-01-05 21:49:44', NULL),
(813, 'س شيشس يشسي', 'سشيشسيشسي', 907, 2, '2020-01-05 21:49:44', NULL),
(814, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 908, 1, '2020-01-05 21:49:44', NULL),
(815, 'س شيشس يشسي', 'سشيشسيشسي', 908, 2, '2020-01-05 21:49:44', NULL),
(816, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 909, 1, '2020-01-05 21:49:44', NULL),
(817, 'س شيشس يشسي', 'سشيشسيشسي', 909, 2, '2020-01-05 21:49:44', NULL),
(818, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 910, 1, '2020-01-05 21:49:44', NULL),
(819, 'س شيشس يشسي', 'سشيشسيشسي', 910, 2, '2020-01-05 21:49:44', NULL),
(820, 'Anthony Ochoa', 'Perferendis ab numquam rerum enim quis officiis voluptatibus dolor animi est', 911, 1, '2020-01-05 21:49:44', NULL),
(821, 'س شيشس يشسي', 'سشيشسيشسي', 911, 2, '2020-01-05 21:49:44', NULL),
(822, 'sadasdasd', 'sadasd', 912, 1, '2020-01-05 21:51:19', NULL),
(823, 'سشيشسي', 'شسيسشي', 912, 2, '2020-01-05 21:51:19', NULL),
(824, 'asdasdasd', 'asdasd', 913, 1, '2020-01-05 21:51:50', NULL),
(825, 'سشيشسي', 'سشيشسي', 913, 2, '2020-01-05 21:51:50', NULL),
(826, 'asdas', 'sdasd', 914, 1, '2020-01-05 21:52:33', NULL),
(827, 'شسيشسيش', 'يشسيشسي', 914, 2, '2020-01-05 21:52:33', NULL),
(828, 'asdasdasd', 'asdasd', 915, 1, '2020-01-05 21:53:14', NULL),
(829, 'سيشسيشسي', 'شسيشسيشس', 915, 2, '2020-01-05 21:53:14', NULL),
(830, 'Emma Slater', 'Quas eius quos lorem ea commodi voluptate sed autem', 916, 1, '2020-01-05 21:55:08', NULL),
(831, 'سشيشسي', 'سشيشسي', 916, 2, '2020-01-05 21:55:08', NULL),
(832, 'sadasdasd', 'asdasdasd', 917, 1, '2020-01-05 21:55:37', NULL),
(833, 'سشيشسي', 'شسيشسي', 917, 2, '2020-01-05 21:55:37', NULL),
(834, 'sadasdasd', 'asdasdasd', 918, 1, '2020-01-05 21:57:09', NULL),
(835, 'سشيشسيشسي', 'شسيشسيشيشسي', 918, 2, '2020-01-05 21:57:09', NULL),
(836, 'asdasdasd', 'sadasdsad', 919, 1, '2020-01-05 21:57:52', NULL),
(837, 'سشيشسي', 'شسيشسيشسي', 919, 2, '2020-01-05 21:57:52', NULL),
(838, 'sadasdasd', 'asdasd', 920, 1, '2020-01-05 22:10:42', NULL),
(839, 'سشيشسي', 'سشسشيشسي', 920, 2, '2020-01-05 22:10:42', NULL),
(842, 'asdasdasd', 'asdasdsa', 922, 1, '2020-01-05 22:12:40', NULL),
(843, 'سشيشسي', 'سشيشسيشس', 922, 2, '2020-01-05 22:12:40', NULL),
(844, 'sadasdasd', 'sadasd', 923, 1, '2020-01-05 22:28:47', NULL),
(845, 'سشيشسيشسي', 'شسيشسيشس', 923, 2, '2020-01-05 22:28:47', NULL),
(846, 'asdasdasd', 'asdasd', 924, 1, '2020-01-05 22:29:57', NULL),
(847, 'سشيشسي', 'سشيشسي', 924, 2, '2020-01-05 22:29:57', NULL),
(850, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been denied , Please make a new request', 926, 1, '2020-01-06 12:21:26', NULL),
(851, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 926, 2, '2020-01-06 12:21:26', NULL),
(852, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been successfully accepted , Please make a new request', 927, 1, '2020-01-06 12:29:43', NULL),
(853, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 927, 2, '2020-01-06 12:29:43', NULL),
(854, 'King Faisal Specialist Hospital in Jeddah', 'Your request has been successfully accepted , Please make a new request', 928, 1, '2020-01-06 12:33:29', NULL),
(855, 'مستشفى الملك فيصل التخصصي بجدة', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 928, 2, '2020-01-06 12:33:29', NULL),
(856, 're-test', 'Your request has been successfully accepted , edr  fewPlease make a new request', 929, 1, '2020-01-06 13:16:16', NULL),
(857, 'تجريبي اخير', 'لقد تم قبول طلبك بنجاح , edr  fewيرجى عمل طلب جديد', 929, 2, '2020-01-06 13:16:16', NULL),
(858, 're-test', 'Your request has been successfully accepted , Please make a new request', 930, 1, '2020-01-06 13:45:20', NULL),
(859, 'تجريبي اخير', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 930, 2, '2020-01-06 13:45:20', NULL),
(860, 're-test', 'Your request has been successfully accepted , Please make a new request', 931, 1, '2020-01-06 14:10:33', NULL),
(861, 'تجريبي اخير', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 931, 2, '2020-01-06 14:10:33', NULL),
(862, 're-test', 'Your request has been successfully accepted , Please make a new request', 932, 1, '2020-01-06 14:11:31', NULL),
(863, 'تجريبي اخير', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 932, 2, '2020-01-06 14:11:31', NULL),
(864, 're-test', 'the reserve is finished , Please make a new request', 933, 1, '2020-01-06 14:12:01', NULL),
(865, 'تجريبي اخير', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 933, 2, '2020-01-06 14:12:01', NULL),
(866, 'final clinic', 'Your request has been successfully accepted , Please make a new request', 934, 1, '2020-01-06 14:29:49', NULL),
(867, 'عيادة اخيرة', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 934, 2, '2020-01-06 14:29:49', NULL),
(868, 'final clinic', 'Your request has been denied , Please make a new request', 935, 1, '2020-01-06 14:30:52', NULL),
(869, 'عيادة اخيرة', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 935, 2, '2020-01-06 14:30:52', NULL),
(870, 'final clinic', 'Your request has been successfully accepted , Please make a new request', 936, 1, '2020-01-06 14:33:15', NULL),
(871, 'عيادة اخيرة', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 936, 2, '2020-01-06 14:33:15', NULL),
(872, 'final clinic', 'the reserve is finished , Please make a new request', 937, 1, '2020-01-06 14:36:43', NULL),
(873, 'عيادة اخيرة', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 937, 2, '2020-01-06 14:36:43', NULL),
(874, 'final restaurant njjn', 'Your request has been successfully accepted , Please make a new request', 938, 1, '2020-01-06 15:03:27', NULL),
(875, 'مطعم اخير نىن', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 938, 2, '2020-01-06 15:03:28', NULL),
(876, 'Oriental Food', 'Your request has been successfully accepted , Please make a new request', 939, 1, '2020-01-08 08:46:36', NULL),
(877, 'مأكولات شرقية', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 939, 2, '2020-01-08 08:46:36', NULL),
(878, 'Oriental Food', 'Your request has been successfully accepted , Please make a new request', 940, 1, '2020-01-08 08:47:03', NULL),
(879, 'مأكولات شرقية', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 940, 2, '2020-01-08 08:47:03', NULL),
(880, 'nknkln', 'jbjhb bj bhh h h', 941, 1, '2020-01-08 09:24:58', NULL),
(881, 'لااتلالا الاال ا  ارار الا', 'ل رلار لار لا لر', 941, 2, '2020-01-08 09:24:58', NULL),
(882, 're-test', 'Your request has been successfully accepted , الااPlease make a new request', 942, 1, '2020-01-08 11:46:55', NULL),
(883, 'تجريبي اخير', 'لقد تم قبول طلبك بنجاح , الاايرجى عمل طلب جديد', 942, 2, '2020-01-08 11:46:55', NULL),
(884, 'rngk jkjkk', 'Your request has been successfully accepted , Please make a new request', 943, 1, '2020-01-08 12:21:02', NULL),
(885, 'لىي نىنبا تقب', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 943, 2, '2020-01-08 12:21:02', NULL),
(886, 'gvhgv', 'Your request has been denied , Please make a new request', 944, 1, '2020-01-08 12:29:41', NULL),
(887, 'اراتراتر', 'لقد تم رفض طلبك , يرجى عمل طلب جديد', 944, 2, '2020-01-08 12:29:41', NULL),
(888, 'Oriental Food', 'Your request has been successfully accepted , Please make a new request', 945, 1, '2020-01-08 12:40:39', NULL),
(889, 'مأكولات شرقية رار', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 945, 2, '2020-01-08 12:40:39', NULL),
(890, 'Oriental Food', 'the reserve is finished , Please make a new request', 946, 1, '2020-01-08 12:41:09', NULL),
(891, 'مأكولات شرقية رار', 'لقد تم الانتهاء من طلبك بنجاح , يرجى عمل طلب جديد', 946, 2, '2020-01-08 12:41:09', NULL),
(892, 'hello', 'sadsads', 947, 1, '2020-01-12 08:43:41', NULL),
(893, 'اهلا', 'سبسيبسيببسي', 947, 2, '2020-01-12 08:43:41', NULL),
(894, 'hello', 'sadsasadasd', 948, 1, '2020-01-12 08:44:29', NULL),
(895, 'مرحبا', 'يئبسيبسيبيسب', 948, 2, '2020-01-12 08:44:29', NULL),
(896, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 949, 1, '2020-01-16 04:40:59', NULL),
(897, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 949, 2, '2020-01-16 04:40:59', NULL),
(898, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 950, 1, '2020-01-16 13:07:52', NULL),
(899, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 950, 2, '2020-01-16 13:07:52', NULL),
(900, 'hospital Almana', 'Your request has been successfully accepted , Please make a new request', 951, 1, '2020-01-16 13:48:43', NULL),
(901, 'مستشفي المانع', 'لقد تم قبول طلبك بنجاح , يرجى عمل طلب جديد', 951, 2, '2020-01-16 13:48:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `created_at`, `updated_at`) VALUES
(1, '2019-11-05 14:18:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_description`
--

CREATE TABLE `page_description` (
  `page_description_id` int(11) NOT NULL,
  `page_description_name` varchar(100) NOT NULL,
  `page_description_content` text NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_description`
--

INSERT INTO `page_description` (`page_description_id`, `page_description_name`, `page_description_content`, `page_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', '<h2><strong>Terms and Conditions</strong></h2>\r\n\r\n<p>Welcome to IronDot!</p>\r\n\r\n<p>These terms and conditions outline the rules and regulations for the use of IronDot&#39;s Website, located at IronDot.com.</p>\r\n\r\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use IronDot if you do not agree to take all of the terms and conditions stated on this page. Our Terms and Conditions were created with the help of the <a href=\"https://www.termsandconditionsgenerator.com\">Terms And Conditions Generator</a> and the <a href=\"https://www.termsconditionsgenerator.com\">Terms &amp; Conditions Generator</a>.</p>\r\n\r\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: &quot;Client&quot;, &quot;You&quot; and &quot;Your&quot; refers to you, the person log on this website and compliant to the Company&rsquo;s terms and conditions. &quot;The Company&quot;, &quot;Ourselves&quot;, &quot;We&quot;, &quot;Our&quot; and &quot;Us&quot;, refers to our Company. &quot;Party&quot;, &quot;Parties&quot;, or &quot;Us&quot;, refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\r\n\r\n<h3><strong>Cookies</strong></h3>\r\n\r\n<p>We employ the use of cookies. By accessing IronDot, you agreed to use cookies in agreement with the IronDot&#39;s Privacy Policy.</p>\r\n\r\n<p>Most interactive websites use cookies to let us retrieve the user&rsquo;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\r\n\r\n<h3><strong>License</strong></h3>\r\n\r\n<p>Unless otherwise stated, IronDot and/or its licensors own the intellectual property rights for all material on IronDot. All intellectual property rights are reserved. You may access this from IronDot for your own personal use subjected to restrictions set in these terms and conditions.</p>\r\n\r\n<p>You must not:</p>\r\n\r\n<ul>\r\n	<li>Republish material from IronDot</li>\r\n	<li>Sell, rent or sub-license material from IronDot</li>\r\n	<li>Reproduce, duplicate or copy material from IronDot</li>\r\n	<li>Redistribute content from IronDot</li>\r\n</ul>\r\n\r\n<p>This Agreement shall begin on the date hereof.</p>\r\n\r\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. IronDot does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of IronDot,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, IronDot shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\r\n\r\n<p>IronDot reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\r\n\r\n<p>You warrant and represent that:</p>\r\n\r\n<ul>\r\n	<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\r\n	<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\r\n	<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\r\n	<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\r\n</ul>\r\n\r\n<p>You hereby grant IronDot a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\r\n\r\n<h3><strong>Hyperlinking to our Content</strong></h3>\r\n\r\n<p>The following organizations may link to our Website without prior written approval:</p>\r\n\r\n<ul>\r\n	<li>Government agencies;</li>\r\n	<li>Search engines;</li>\r\n	<li>News organizations;</li>\r\n	<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\r\n	<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\r\n</ul>\r\n\r\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\r\n\r\n<p>We may consider and approve other link requests from the following types of organizations:</p>\r\n\r\n<ul>\r\n	<li>commonly-known consumer and/or business information sources;</li>\r\n	<li>dot.com community sites;</li>\r\n	<li>associations or other groups representing charities;</li>\r\n	<li>online directory distributors;</li>\r\n	<li>internet portals;</li>\r\n	<li>accounting, law and consulting firms; and</li>\r\n	<li>educational institutions and trade associations.</li>\r\n</ul>\r\n\r\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of IronDot; and (d) the link is in the context of general resource information.</p>\r\n\r\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\r\n\r\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to IronDot. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\r\n\r\n<p>Approved organizations may hyperlink to our Website as follows:</p>\r\n\r\n<ul>\r\n	<li>By use of our corporate name; or</li>\r\n	<li>By use of the uniform resource locator being linked to; or</li>\r\n	<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&rsquo;s site.</li>\r\n</ul>\r\n\r\n<p>No use of IronDot&#39;s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\r\n\r\n<h3><strong>iFrames</strong></h3>\r\n\r\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\r\n\r\n<h3><strong>Content Liability</strong></h3>\r\n\r\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\r\n\r\n<h3><strong>Your Privacy</strong></h3>\r\n\r\n<p>Please read Privacy Policy</p>\r\n\r\n<h3><strong>Reservation of Rights</strong></h3>\r\n\r\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&rsquo;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\r\n\r\n<h3><strong>Removal of links from our website</strong></h3>\r\n\r\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\r\n\r\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\r\n\r\n<h3><strong>Disclaimer</strong></h3>\r\n\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\r\n\r\n<ul>\r\n	<li>limit or exclude our or your liability for death or personal injury;</li>\r\n	<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n	<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n	<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n\r\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\r\n\r\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>', 1, 1, '2019-11-18 14:30:16', NULL),
(2, 'لوريم إيبسوم', '<div class=\"article article-body\">\r\n<div class=\"static-page-render\">\r\n<p><strong>بيان</strong></p>\r\n\r\n<p dir=\"RTL\">تنطبق هذه الشروط والأحكام على استخدامك للموقع الإلكتروني الموجود على <a href=\"http://www.skynewsarabia.com/\">www.skynewsarabia.com</a> (&quot;موقع سكاي نيوز عربية&quot;).</p>\r\n\r\n<p dir=\"RTL\">&nbsp;باستخدام موقع سكاي نيوز عربية فأنت توافق على الالتزام بهذه الشروط والأحكام. وفي حال عدم موافقتك على الشروط والأحكام يتعين عليك عدم استخدام الموقع.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;نحتفظ بحقنا بتغيير الشروط والأحكام من وقت لآخر وعليه يتعين عليك الاطلاع على هذه الشروط والأحكام دوريا. ولا يتوجب علينا الاتصال بك أو إعلامك بأي تغييرات تم إجراؤها على الشروط والأحكام. ويعتبر استمرار استخدامك لموقع سكاي نيوز عربية بمثابة موافقة على الشروط والأحكام المطبقة في وقت استخدامك للموقع.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;كجزء من التزامنا بجعل موقع سكاي نيوز عربية مكانا ترغب في زيارته باستمرار فإننا نرحب بكافة تعليقاتك على أي من السياسات أو القواعد التي ندرجها أدناه.</p>\r\n\r\n<p dir=\"RTL\"><strong>1- </strong><strong>تعريفات</strong></p>\r\n\r\n<p dir=\"RTL\">&quot;أنت\\صيغة المخاطب&quot; تشير إلى مستخدم موقع سكاي نيوز عربية، وتراعى كافة التعبيرات المؤدية إلى ذلك. &quot;نحن\\ صيغة المتحدث&quot; تعني شركة سكاي نيوز عربية منطقة حرة ذ.م.م. صندوق بريد 77845، أبو ظبي، الإمارات العربية المتحدة، وتراعى كافة التعبيرات المؤدية إلى ذلك. &quot;موقع سكاي نيوز عربية&quot; تشير إلى المعنى المحدد أعلاه. &quot;معلومات المستخدم&quot; تعني التفاصيل الشخصية التي تقدمها لنا من خلال موقع سكاي نيوز عربية. &quot;المستخدمون&quot; تعني مستخدمي موقع سكاي نيوز عربية بعمومهم و\\أو أفرادا حسبما يشير السياق. &quot;الموقع الإلكتروني&quot; يعني الموقع على شبكة المعلوماتية العالمية. &quot;المحتوى&quot; تعني أي مراجعات، تعليقات، رسائل، بيانات، معلومات، نص، موسيقى، صوت، صورة، رسم، فيديو، رمز أو غيرها من المواد التي يتم بثها إلى أو عرضها على موقع سكاي نيوز عربية مباشرة أو من خلال موقع إلكتروني للغير. &quot;مناطق تفاعلية&quot; تعني منتديات النقاش، لوحات الإعلانات، خدمات المراجعة، أو الدردشة، أو غيرها من المنتديات التي يوفرها موقع سكاي نيوز عربية والتي تستخدمها أو يستخدمها مستخدمون آخرون لنشر المحتوى. &quot;المعالجة الآلية&quot; تعني أي روبوت، عنكبوت، أدوات تحليل المحتوى المكتوب (screen scraper)، أدوات تجميع البيانات أو غيرها من أدوات أو روتين أو عملية آلية. &quot;الشروط والأحكام&quot; تعني هذه الشروط والأحكام، والتي قد تخضع للتعديل أو التغيير من وقت إلى آخر.</p>\r\n\r\n<p dir=\"RTL\"><strong>2- </strong><strong>الاستخدام المشروع</strong></p>\r\n\r\n<p dir=\"RTL\">2.1&nbsp; للدخول إلى موقع سكاي نيوز عربية، يجب أن لا يقل عمرك عن 21 عاما (حسب التقويم الميلادي) وأن تكون ذا أهلية قانونية كاملة.</p>\r\n\r\n<p dir=\"RTL\">2.2&nbsp;&nbsp; يحتاج أي شخص أقل من 21 عاما (حسب التقويم الميلادي) يقوم باستخدام موقع سكاي نيوز عربية إلى الحصول على موافقة والديه أو وصيه للقيام بذلك.</p>\r\n\r\n<p dir=\"RTL\">2.3 تقر وتتعهد بأنك تتمتع بالحق والقدرة القانونية على استخدام موقع سكاي نيوز عربية حسب ما هو منصوص عليه في هذه الشروط والأحكام.</p>\r\n\r\n<p dir=\"RTL\">2.4 تقر بأن أي استخدام تقوم به لموقع سكاي نيوز عربية سيكون حسب ما هو منصوص عليه في الشروط التالية:</p>\r\n\r\n<p dir=\"RTL\">(أ&zwnj;) لن تقوم بنسخ، تحميل، إعادة إنتاج، إعادة نشر، تأطير، بث، أو إرسال بأي شكل من الأشكال أي من المواد التي يوفرها موقع سكاي نيوز عربية باستثناء لاستخداماتك الشخصية المنزلية غير التجارية فقط؛</p>\r\n\r\n<p dir=\"RTL\">(ب&zwnj;)&nbsp; تلتزم بالقواعد المحددة التي تنطبق على أي ترويج تشارك فيه بأي شكل من خلال موقع سكاي نيوز عربية؛ و</p>\r\n\r\n<p dir=\"RTL\">(ت&zwnj;)&nbsp; تلتزم بعدم القيام بأي شيء يكون من شأنه التأثير على تشغيل أو أمن موقع سكاي نيوز عربية أو يتسبب في انزعاج غير منطقي أو إساءة أو تعطيل أي من المستخدمين الآخرين أو العاملين لدينا.</p>\r\n\r\n<p dir=\"RTL\">2.5 توافق على الامتناع عن الأمور التالية (سواء قمت أنت بها شخصيا أو من خلال طرف ثالث):</p>\r\n\r\n<p dir=\"RTL\">(أ&zwnj;) استخدام عملية آلية لمعالجة، مراقبة، نسخ، استخراج أي صفحات موجودة على موقع سكاي نيوز عربية، أو أي معلومات، أو محتوى أو بيانات يحتويها أو يتم الوصول إليها عن طريق موقع سكاي نيوز عربية، دون الحصول على الموافقة الخطية المسبقة من قبلنا؛</p>\r\n\r\n<p dir=\"RTL\">(ب&zwnj;) استخدام عملية آلية لتجميع أو دمج المعلومات، أو المحتوى أو البيانات التي يحتويها أو يمكن الوصول إليها عن طريق موقع سكاي نيوز عربية مع المعلومات، أو المواد أو البيانات التي يتم الوصول إليها عن طريق أو التي يكون مصدرها طرف ثالث؛</p>\r\n\r\n<p dir=\"RTL\">(ت&zwnj;) استخدام أي عملية آلية للتدخل في أو محاولة التدخل في طريقة العمل السليمة لموقع سكاي نيوز عربية؛</p>\r\n\r\n<p dir=\"RTL\">(ث&zwnj;) القيام بأي فعل يكون من شأنه فرض حمل كبير بشكل غير منطقي أو غير متناسب مع البنية التحتية المتاحة أو النطاق الترددي لموقع سكاي نيوز عربية؛</p>\r\n\r\n<p dir=\"RTL\">(ج&zwnj;) تطبيق هندسة عكسية، أو جمع عكسي، أو تفكيك، أو أي عمل آخر من يكون شأنه اكتشاف رمز مصدري أو غيره من الصيغ الحسابية أو المعالجات فيما يخص برنامج الحاسوب المستخدم في البنية التحتية والعمليات المتعلقة بموقع سكاي نيوز عربية؛ أو</p>\r\n\r\n<p dir=\"RTL\">(ح&zwnj;) نسخ، إعادة إنتاج، تغيير، تعديل، اشتقاق أعمال من، أو إقامة عرض عام، لأي جزء من محتوى موقع سكاي نيوز عربية دون الموافقة الخطية المسبقة من قبلنا.</p>\r\n\r\n<p dir=\"RTL\">2.6 من أجل الوصول إلى موقع سكاي نيوز عربية، ستحتاج إلى الوصول إلى الإنترنت. تتحمل مسؤولية أي اتصال، أو خدمة أو رسوم مرتبطة بالوصول إلى الإنترنت وتوفير كافة المعدات اللازمة لتمكينك من الاتصال بالإنترنت (بما في ذلك الحاسوب والمودم وغيرها من الأجهزة الضرورية للوصول).</p>\r\n\r\n<p dir=\"RTL\">2.7&nbsp; نظرا لمحدودية قدرة كافة أجهزة الخادم (سيرفر) واستخدامها من قبل العديد من الأشخاص في الوقت نفسه، فإنك تلتزم بعدم استخدام موقع سكاي نيوز عربية بأي شكل من الأشكال التي تؤدي إلى تخريب أو تتجاوز قدرة تحمل أجهزة الخادم (سيرفر) لدينا أو أي شبكة مرتبطة بأي من خوادمنا. كما يجب أن تمتنع عن استخدام موقع سكاي نيوز عربية بأي شكل من الأشكال يؤدي، أو قد يؤدي منطقيا، بالتدخل في استخدام أي طرف آخر لموقع سكاي نيوز عربية على نحو يخالف، أو من المحتمل أن يخالف، أي قوانين مرعية ومطبقة، أو حقوق أو استحقاقات قانونية لأي طرف آخر وذلك طبقا لكافة القوانين المرعية والمطبقة.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>3- </strong><strong>المحتوى الذي ينتجه المستخدم</strong></p>\r\n\r\n<p dir=\"RTL\">3.1 بتقديمك أي محتوى لموقع سكاي نيوز عربية فإنك تمنحنا ترخيصا غير حصريا، ومجانيا، ودائما، وقابلا للتحويل، وعالميا، غير قابلا للنقض، وقابل للترخيص الفرعي من أجل (أ) استخدامه، وإعادة إنتاجه، وتعديله، وتحريره، وتكييفه، وترجمته، وتوزيعه، ونشره، ونسخه، وبثه وتوصيله بأي شكل من الأشكال، وفي أعمال مقتبسة منه لعرضه أو أدائه أمام جمهور في أي مكان في العالم ومن خلال أي وسيلة إعلامية، معروفة الآن أو يتم ابتداعها مستقبلا؛ و(ب) استخدام الاسم الذي قمت بتقديمه بالترابط مع المحتوى. كما تمنحنا رخصة للملاحقة القانونية لأي شخص حقيقي أو اعتباري يخالف حقوقك أو حقوقنا في هذا المحتوى. وأنت تقر وتوافق على أن جميع المحتوى المقدم لموقع سكاي نيوز عربية من قِبلك هو غير سري وغير مملوك. كما تقر كافة الأشياء وتنفيذ جميع الوثائق المطلوبة لتمكيننا والسماح لنا بالاستفادة المطلقة من الحقوق الممنوحة لنا حسب متطلبات هذه الشروط والأحكام.</p>\r\n\r\n<p dir=\"RTL\">3.2 نحن غير ملزمون، ولا يلزمنا أي بند من بنود هذه الشروط والأحكام بأي شكل من الأشكال، باستخدام أي محتوى. إلى جانب ذلك، فإننا وفي حال استخدام المحتوى غير مطالبون بأداء أي التزامات مالية تجاهك نتيجة هذا الاستخدام.</p>\r\n\r\n<p dir=\"RTL\">3.3 أنت وحدك مسؤول عن استخدام المناطق التفاعلية وكل استخدام لها هي على مسؤوليتك الخاصة. باستخدامك للمناطق التفاعلية، فأنت توافق على عدم نشر، أو رفع، أو إرسال، أو توزيع، أو تخزين، أو إيجاد أو نشر بأي شكل من الأشكال، أو التسبب في نشر على موقع سكاي نيوز عربية بشكل مباشر أو غير مباشر عن طريق موقع إلكتروني للغير أي من الأمور التالية:</p>\r\n\r\n<p dir=\"RTL\">(أ&zwnj;) محتوى غير قانوني، أو تشهير، أو ذم، أو مسيء لأي مجموعة دينية أو أخلاقية، أو محتوى فاضح، أو إباحي، أو فاحش، أو بذيء، أو فيه إيحاءات، أو مضايقات، أو تهديدات، أو خرق لحقوق الخصوصية والنشر، أو عنيف، أو مثير للحساسيات، أو احتيالي أو غير مقبول بأي شكل من الأشكال؛</p>\r\n\r\n<p dir=\"RTL\">(ب&zwnj;) محتوى يشكل، أو يشجع، أو يقدم تعليمات لمخالفة جرمية، أو خرق حقوق أي طرف كان، أو يتسبب بأي شكل من الأشكال في مسؤولية قانونية أو يخرق أي من القوانين المحلية أو الوطنية أو الدولية، بما في ذلك، على سبيل الذكر وليس الحصر، التشريعات المتعلقة بمنظم سوق الأوراق المالية في ذلك الاختصاص الذي تم نشر المحتوى فيه؛</p>\r\n\r\n<p dir=\"RTL\">(ت&zwnj;) محتوى يتسبب في إزعاج أو مضايقة الآخرين؛</p>\r\n\r\n<p dir=\"RTL\">(ث&zwnj;) محتوى لا تمتلكه أنت شخصيا دون إذن صريح من مالك ذلك المحتوى؛</p>\r\n\r\n<p dir=\"RTL\">(ج&zwnj;) محتوى قد يتسبب في خرق أي براءة اختراع، أو علامة تجارية، أو سر تجاري، أو حقوق التأليف والنشر، أو غيرها من الحقوق الفكرية أو الملكية لأي طرف؛</p>\r\n\r\n<p dir=\"RTL\">(ح&zwnj;) محتوى ينتحل شخصية أي شخص حقيقي أو اعتباري أو يتسبب بأي شكل من الأشكال في ادعاء كاذب بتبعية لذلك الشخص الحقيقي أو الاعتباري، بما في ذلك نحن؛</p>\r\n\r\n<p dir=\"RTL\">(خ&zwnj;) مواد ترويجية غير مرغوبة، أو حملات سياسية، أو الإعلانات، أو المسابقات، أو السحوبات، أو تقديم عروض؛</p>\r\n\r\n<p dir=\"RTL\">(د&zwnj;) معلومات خاصة بطرف ثالث، وعلى سبيل المثال لا الحصر، اسم العائلة، وعنوان، وأرقام هواتف، وعناوين بريد إلكتروني، وأرقام بطاقات ائتمان؛</p>\r\n\r\n<p dir=\"RTL\">(ذ&zwnj;) فيروسات، أو بيانات مخربة، أو ملفات أخرى تتسبب في أضرار، أو أعطال أو تخريب؛</p>\r\n\r\n<p dir=\"RTL\">(ر&zwnj;) محتوى غير مرتبط بموضوع المنطقة (المناطق) التفاعلية والتي يتم نشر المحتوى فيها؛ أو</p>\r\n\r\n<p dir=\"RTL\">(ز&zwnj;) محتوى أو وصلات إلى محتوى نعتبره وبناء على حكمنا المطلق بأنه (أ) يخرق أي بند من البنود المذكورة أعلاه؛ (ب) غير مقبول (ت) يحد من أو يمنع أي شخص آخر من استخدام أو التمتع بالمناطق التفاعلية أو موقع سكاي نيوز عربية؛ أو (ث) يتسبب في تعريضنا بأي شكل من الأشكال نحن أو أي من شركاتنا الفرعية، أو المستخدمين الآخرين للضرر أو المساءلة القانونية بأي شكل من الأشكال.</p>\r\n\r\n<p dir=\"RTL\">3.4 لا نتحمل مسؤولية أو نقر أي محتوى ينشره المستخدمون، أو يرفعونه في، أو يبثونه، أو يوزعونه، أو يخزنونه، أو يوجدونه، أو ينشرونه بأي شكل من الأشكال أو يتسببون في نشره على موقع سكاي نيوز عربية مباشرة أو من خلال موقع إلكتروني للغير.</p>\r\n\r\n<p dir=\"RTL\">3.5 لا نتحمل أي مسؤولية عن أي محتوى يتم نشره أو تخزينه أو رفعه في المناطق التفاعلية من قبلك أو من قبل أي طرف ثالث، أو عن أي خسارة أو أضرار ناجمة عن ذلك، كما أننا لا نتحمل مسؤولية أية أخطاء، أو ذم، أو تحقير، أو تشهير، أو سهو، أو أكاذيب، أو إساءة، أو إباحية، أو شتائم قد تصادفك أثناء استخدامك للمناطق التفاعلية. كما لا نتحمل أية مسؤولية عن أي عبارات، أو تعهدات أو محتوى يقدمه المستخدمون في أي منتدى عام، صفحة رئيسية شخصية، أو غيرها من المناطق التفاعلية. ورغم أننا غير ملزمون بمسؤولية فرز أو تحرير أو متابعة أي من المحتوى الذين يتم نشره أو توزيعه من خلال المنطقة التفاعلية، فإننا، وطبقا لتقديرنا المطلق، من الممكن أن نزيل، أو نفرز، أو نرفض نشر، أو تحرير دون تنبيه مسبق، أي محتوى تم نشره أو تخزينه عن طريق موقع سكاي نيوز عربية في أي وقت ونتيجة لأي سبب. وتكون أنت وحدك فقط مسؤولا عن إنشاء نسخ احتياطية أو استبدال المحتوى الذي نشرته أو حفظته على موقع سكاي نيوز عربية وعلى نفقتك الخاصة.</p>\r\n\r\n<p dir=\"RTL\">3.6 في حال تم التوصل إلى حيازتك لأي حقوق أخلاقية (بما في ذلك حقوق النسبة والنزاهة) في المحتوى، فإنك، طبقا لذلك، تعلن، بأنه ضمن الحدود التي يسمح بها القانوني فإنك (أ) لا تطلب استخدام أي معلومات تعريف شخصية فيما يتعلق بالمحتوى، أو أي أعمال مشتقة منه، أو تحديثات أو تحسينات يتم إجراؤها عليه؛ (ب) ليس لديك أي اعتراض على نشر، واستخدام، وتعديل، وحذف، والاستفادة من المحتوى من قبلنا أو من قبل شركاتنا الفرعية، أو المرخصين، أو المالكين اللاحقين، أو المتنازل لهم؛ (ت) تقر أنك وإلى الأبد تتنازل عن وتوافق على عدم ادعاء أو تأكيد أي حقوق في أي أو كافة الحقوق الأخلاقية الخاصة بالمؤلف في المحتوى أو أي من أجزائه؛ (ث) تقر أنك وإلى الأبد تعفينا وتعفي كل الجهات التابعة لنا، والمرخصين، والمالكين اللاحقين، أو المتنازل لهم من أي مطالبات قد تطالبنا بها نتيجة وجود أي حقوق أخلاقية من أي نوع.</p>\r\n\r\n<p dir=\"RTL\">3.7 يؤدي استخدامك المناطق التفاعلية أو غيرها من صفحات موقع سكاي نيوز عربية على نحو يخرق بنود الشروط والأحكام المبينة هنا إلى، ولا تقتصر على، إنهاء أو تعليق حقوق استخدامك المناطق التفاعلية و\\أو موقع سكاي نيوز عربية. وضمانا للتعاون مع الطلبات الحكومية المشروعة، واستدعاءات وأوامر المحكمة، وحماية للمستخدمين الآخرين، وأنظمتنا، فإننا قد نقوم بالوصول إلى والإفصاح عن أية معلومات نعتقد أنها ضرورية أو مناسبة، بما في ذلك، على سبيل المثال لا الحصر، معلومات ملف المستخدم الخاص بك (الاسم، عنوان البريد الإلكتروني، إلخ)، عنوان بروتوكول الإنترنت، ومعلومات المرور، وتاريخ الاستخدام، والمحتوى الذي تم تقديمه لموقع سكاي نيوز عربية. ويكون حقنا في الإفصاح عن أية معلومات من هذا النوع مقدما على وسابقا لالتزامنا ببنود سياسة الخصوصية.</p>\r\n\r\n<p dir=\"RTL\">3.8 إذا كانت لديك أية شكاوى ناشئة عن المحتوى الذي قام مستخدم بنشره أو رفعه، أو بثه، أو توزيعه، أو حفظه، أو إيجاده، أو تسبب بأي شكل من الأشكال بنشره على موقع سكاي نيوز عربية مباشرة أو عن طريق موقع إلكتروني للغير، فأنت توافق على مباشرة الشكوى ضد ذلك المستخدم وليس ضدنا نحن.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>4- المواقع الإلكترونية للغير</strong></p>\r\n\r\n<p dir=\"RTL\">4.1 تقر وتوافق على أننا غير مسؤولين عن توافر أو محتوى أي موقع إلكتروني للغير والذي وصلت إليه عن طريق موقع سكاي نيوز عربية.</p>\r\n\r\n<p dir=\"RTL\">4.2 نحن لا نقر ولا يجوز بأي شكل كان أن نتحمل مسؤولية أي محتوى، أو إعلان، أو منتج، أو خدمة موجودة على أو متوفرة في مواقع إلكترونية للغير. ومع التقيد بالقوانين النافذة والتي لا يمكن استثنائها، فإننا لا نقدم ضمانات أو تعهدات أو التزامات مهما كانت (أ) فيما يخص نوعية، ودقة، وقابلية بيع، أو ملاءمة المادة للغرض منها، والمنتجات، والخدمات على أو متوافرة من خلال المواقع الإلكترونية للغير؛ أو (ب) أن المادة على أو المتوفرة من خلال المواقع الإلكترونية للغير لا تخالف حقوق الملكية الفكرية لأي شخص.</p>\r\n\r\n<p dir=\"RTL\">4.3 أي تعامل يتم بينك وبين أطراف ثالثة من معلنين أو تجار موجودين على أو من خلال موقع سكاي نيوز عربية، بما في ذلك الدفع مقابل وتوصيل المنتجات، والخدمات أو أي شروط، أو أحكام، أو ضمانات، أو تعهدات مرتبطة بتلك التعاملات، فإنها تتم بينك وبين المعلن أو التاجر المعني. وعليه، فإننا لا نتحمل أية مسؤولية أو التزام نتيجة الخسارة أو الأضرار من أي نوع والتي حدثت نتيجة لمثل هذه التعاملات.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>5- الملكية الفكرية</strong></p>\r\n\r\n<p dir=\"RTL\">5.1 إن حقوق النشر وكافة حقوق الملكية الفكرية الأخرى في كافة المواد والمحتوى الذي يتم توفيره كجزء من موقع سكاي نيوز عربية هي ملك لنا أو مانحي الرخصة في كافة الأوقات. يجوز لك استخدام هذه المادة أو المحتوى فقط على النحو المصرح به خطّيا من قبلنا أو من قبل مانحي الرخصة. ولن تعمل على، ولن تقوم بمساعدة أو تسهيل عمل الغير على، نسخ المادة أو المحتوى، أو إعادة إنتاجه، أو بثه، أو توزيعه، أو تكييفه، أو استخدامه على نحو تجاري، أو إيجاد أعمال مبنية عليها.</p>\r\n\r\n<p dir=\"RTL\">5.2 إذا علمت بوجود توزيع أو استغلال تجاري من أي نوع، فأنت توافق على إعلامنا بذلك مباشرة.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>6 - المسؤولية عن والمعلومات التي يوفرها موقع سكاي نيوز عربية</strong></p>\r\n\r\n<p dir=\"RTL\">6.1 مع التقيد بالمسؤوليات التي يقررها القانون والتي لا يمكن استثناؤها، فإننا وكل من مديرينا، أو موظفينا، أو وكلائنا، أو المتعاقدين معنا، لا نتحمل أي مسؤولية تجاهك نتيجة أي خسائر، وأضرار، ومسؤوليات، ومطالبات، وتكاليف (بما في ذلك دون تقييد ودون حصر التكاليف القانونية ورسوم الدفاع أو تكاليف التسوية) بأي شكل من الأشكال أو وجه من الوجوه، سواء على نحو مباشر، أو غير مباشر، أو كنتيجة، ناشئة عن أو راجعة إلى الوصول إلى موقع سكاي نيوز عربية من قبلك، أو محتوى، أو موقع إلكتروني للغير، أو خدمات الغير، بأي شكل نتجت، سواء في عقد، أو ضرر (بما في ذلك الإهمال)، أو قانون، أو غير ذلك.</p>\r\n\r\n<p dir=\"RTL\">6.2 نلتزم بالسعي الحثيث من أجل إحاطة موقع سكاي نيوز عربية بكافة أشكال العناية المنطقية. باستثناء ما يلزم به القانون، فإننا لن نتحمل مسؤولية النوعية، والدقة، وملاءمة غرض محدد في موقع سكاي نيوز عربية ولا نقدم وعدا بأن المادة التي يحتويها موقع سكاي نيوز عربية، أو أي من الوظائف التي يحتويها موقع سكاي نيوز عربية أو أي من أجهزة الخادم لديه سوف يعمل دون انقطاع أو تأخير أو يكون دون أخطاء، وخاليا من الفيروسات أو الأخطاء البرمجية أو يعمل بتوافق مع أي برنامج آخر أو مادة أخرى.</p>\r\n\r\n<p dir=\"RTL\">6.3 نتحمل مسؤولية أية ادعاء كاذب احتيالي نقوم به وأيضا أية وفاة أو إصابة شخصية ناتجة عن إهمالنا. ولا نتحمل مسؤولية تجاهك نتيجة أي خسائر أو أضرار قد تعاني منها أنت أو الغير نتيجة استخدام أو فيما يتصل بقيامك باستخدام موقع سكاي نيوز عربية.</p>\r\n\r\n<p dir=\"RTL\">6.4 لا نتحمل مسؤولية تجاهك أو أي شخص آخر نتيجة أي خسارة ناجمة عن أمر لا سيطرة لنا عليه. وهذا يتضمن تعطل المعدات الإلكترونية أو الميكانيكية أو خطوط الاتصالات (بما في ذلك الهاتف، والكابل، والإنترنت)، أو الوصول غير المشروع، أو الرموز المخربة، أو السرقة، أو أخطاء التشغيل، أو الأحوال الجوية القاسية أو غير الاعتيادية (بما في ذلك الفيضانات، والزلازل، أو غيرها من أعمال القدر)، أو النار، أو الحرب، أو التمرد، أو الأعمال الإرهابية، أو الشغب، أو الخلافات العمالية، أو المشكلات العمالية الأخرى، أو الحوادث، أو الطوارئ، أو التأخير، أو الحجوزات الزائدة، أو الإلغاء، أو وفاة حاكم، أو عمل تقوم به الحكومة.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>7- الخصوصية</strong></p>\r\n\r\n<p dir=\"RTL\">7.1&nbsp;نهتم بخصوصيتك وأمنك بشكل كبير. ويتم جمع بعض البيانات لاستخدامها عن طريق موقع سكاي نيوز عربية من أجل توفير خدمات عبر الإنترنت التي يتم توفيرها عن طريق موقع سكاي نيوز عربية. سوف يقوم موقع سكاي نيوز عربية بتسجيل ومتابعة استخدامك لموقع سكاي نيوز عربية من خلال استخدام، على سبيل المثال لا الحصر، الملفات النصية القصيرة (كوكيز) وغيرها من أدوات وأجهزة المتابعة. ويخضع استخدام هذه البيانات لبنود سياسة الخصوصية التي نطبقها. تعتبر سياسية الخصوصية جزءا من هذه الشروط والأحكام ويجب أن تقرأها بالكامل. في حال عدم قبولك بالشروط في سياسة الخصوصية، فيتوجب عليك أن تمتنع عن استخدام موقع سكاي نيوز عربية.</p>\r\n\r\n<p dir=\"RTL\">7.2 نقر التزامنا بكافة تشريعات حماية الخصوصية المرعية وقت صدورها فيما يتعلق بأي معلومات شخصية تتعلق بك قمنا نحن بجمعها.</p>\r\n\r\n<p dir=\"RTL\">7.3 قد يطلب منك أن تدخل معلومات عن نفسك على صفحات مختلفة على موقع سكاي نيوز عربية. ونحن نلتزم بعدم استخدام هذه المعلومات التي زودتنا بها لأي غرض لم يتم إدراجه في سياسة الخصوصية، ولغير الغرض الذي يحدده كل موقع حيث يتم طلب مثل هذه المعلومات.</p>\r\n\r\n<p dir=\"RTL\">7.4&nbsp;تفضل باستخدام نموذج التغذية الراجعة على موقع سكاي نيوز عربية لإعلامنا بأي تغيير في المعلومات التي قدمتها مسبقا أو إذا رغبت في سحب موافقتك على استخدامنا للمعلومات التي قدمتها لنا للأغراض التي تم تحديدها أو من أجل أي شكل من أشكال التواصل الإعلاني.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>8&nbsp;-&nbsp;السلامة</strong></p>\r\n\r\n<p dir=\"RTL\">8.1&nbsp;نتعهد بالتزامنا المستمر من خلال سياستنا الخاصة بالسلامة بإتاحة استخدام موثوق لموقع سكاي نيوز عربية. عند استخدام موقع سكاي نيوز عربية وبخاصة، عند استخدام أي من المناطق التفاعلية المتوافرة على موقع سكاي نيوز عربية، ويتوجب عليك دائما أخذ الاحتياطات التالية:</p>\r\n\r\n<p dir=\"RTL\">(أ&zwnj;) المحافظة على سرية هويتك. لا تعطي اسمك الكامل، أو عنوانك البريدي، أو رقم الهاتف، أو عنوان البريد الإلكتروني، أو اسم مدرستك، أو غيرها من المعلومات (باستثناء تلك التي نطلبها تحديدا منك)، والتي قد يتمكن أحد ما من خلالها معرفة هويتك الحقيقية؛</p>\r\n\r\n<p dir=\"RTL\">(ب&zwnj;)&nbsp;لا تقابل شخصا تتعرف عليه من خلال الشبكة؛ و</p>\r\n\r\n<p dir=\"RTL\">(ت&zwnj;)&nbsp;لا ترد على أية رسائل تتسم بالعدائية، أو الوقاحة، أو قلة اللياقة، أو تتسبب لك بالشعور بعدم الراحة بأي شكل.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>9&nbsp;- التعويضات</strong></p>\r\n\r\n<p dir=\"RTL\">9.1&nbsp;تقر وتوافق بتعويضنا نحن و\\أو أي من الجهات المرتبطة بنا وموظفي، ومديري، والعاملين لدينا و\\أو لدى الجهات المرتبطة بنا وبشكل فوري وعند الطلب، عن كافة المطالبات، والالتزامات، والخسائر، والتكاليف، بما في ذلك الرسوم القانونية الناشئة عن أي خرق أو مخالفة لهذه الشروط والأحكام من قبلك أنت أو غيرها من الأضرار الناشئة عن استخدامك لموقع سكاي نيوز عربية.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>10&nbsp;- الإنهاء</strong></p>\r\n\r\n<p dir=\"RTL\">10.1 نحتفظ بحقنا في الإنهاء الفوري لاستخدامك لموقع سكاي نيوز عربية في حال قيامك بخرق بنود هذه الشروط والأحكام أو في حال اعتقدنا بناء على أسباب منطقية أنك من الممكن أن تقوم بخرق بنود هذه الشروط والأحكام أو في حال قيامك بسلوك نرى أنه وبناء على تقديرنا المطلق غير مقبول.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>11&nbsp;- التواصل </strong></p>\r\n\r\n<p dir=\"RTL\">11.1&nbsp;في حال رغبت بإبداء أي تعليق موجه لنا حول موقع سكاي نيوز عربية أو في حال رغبت في توجيه أية أسئلة تتعلق بذلك رجاء تفضل بالاتصال بنا من خلال نموذج الم الموجود على موقع سكاي نيوز عربية.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>12- توفر الموقع</strong></p>\r\n\r\n<p dir=\"RTL\">12.1&nbsp;نظرا إلى تعرض الخدمات الإلكترونية إلى الانقطاع أو الانهيار، فإن الوصول إلى موقع سكاي نيوز عربية يتوفر كما هو وفي حالته الراهنة فقط.</p>\r\n\r\n<p dir=\"RTL\">12.2 يحق لنا، وبناء على تقديرنا المطلق، فرض حدود أو قيود على استخدامك لموقع سكاي نيوز عربية. إضافة إلى ذلك، ولأغراض الأمن، ولأسباب تقنية، أو صيانة، أو قانونية أو تشريعية، أو نتيجة لأي خرق لهذه الشروط والأحكام، فإنه يحق لنا سحب موقع سكاي نيوز عربية أو وصولك إلى موقع سكاي نيوز عربية، في أي وقت ودون أي سابق إنذار من طرفنا.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>13- عام</strong></p>\r\n\r\n<p dir=\"RTL\">13.1 البطلان وغيرها. في حال قررت أي محكمة أو مشرع أن بنود هذه الشروط والأحكام هي باطلة أو بأي شكل من الأشكال غير قابلة للتطبيق، فسيتم إلغاء وشطب هذه البنود من هذه الشروط والأحكام، في حين تبقى البنود الباقية في الشروط والأحكام نافذة بشكل تام.</p>\r\n\r\n<p dir=\"RTL\">13.2&nbsp;القانون المطبق. تخضع هذه الشروط والأحكام وموقع سكاي نيوز عربية للقوانين المرعية في الإمارات العربية المتحدة، وحسب تطبيقها في إمارة أبو ظبي وحسب تشريعات المنطقة الإعلامية الحرة في أبو ظبي. وأي نزاع ينشأ يكون خاضعا غير حصرا أمام المحاكم المختصة في أبو ظبي.</p>\r\n\r\n<p dir=\"RTL\">13.3 الأطراف الثالثة. تنطبق هذه الشروط والأحكام بيننا وبين المستخدمين. ولا يحق لأي شخص آخر الاستفادة من هذه الأحكام والشروط. ونحتفظ بحقنا في أداء أي من التزاماتنا، وممارسة حقوقنا التي تمنحها لنا الشروط والأحكام، من خلال طرف ثالث.</p>\r\n\r\n<p dir=\"RTL\">13.4&nbsp;الإحالة. نحتفظ بحقنا في إحالة أو بأي شكل من الأشكال نقل أية أو كافة حقوقنا والتزاماتنا المنصوص عليها في هذه الشروط والأحكام لأي طرف ثالث.</p>\r\n\r\n<p dir=\"RTL\">&nbsp;<strong>14&nbsp;- معلومات الشركة</strong></p>\r\n\r\n<p dir=\"RTL\">سكاي نيوز عربية شركة استثمار خاصة-منطقة حرة، هي شركة مرخصة تعمل في المنطقة الحرة الإعلامية في أبو ظبي، رقم تسجيل 96، وعنوان مسجل على صندوق بريد 77845، أبو ظبي، الإمارات العربية المتحدة. سكاي، وسكاي نيوز، وسكاي نيوز عربية، والعلامات التجارية المرتبطة بها، والأسماء، والشعارات هي ملكية لسكاي آي بي إنترناشونال ليميتد وهي مسجلة و\\أو مستخدمة في أرجاء العالم، ويتم استخدامها من قبل سكاي نيوز عربية منطقة حرة ذ.م.م. بناء على رخصة من سكاي آي بي إنترناشونال ليميتد.</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>', 1, 2, '2019-11-18 14:30:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_description`
--

CREATE TABLE `payment_description` (
  `payment_description_id` int(11) NOT NULL,
  `payment_name` varchar(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_description`
--

INSERT INTO `payment_description` (`payment_description_id`, `payment_name`, `payment_method_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'cash', 1, 1, '2019-10-23 09:52:55', NULL),
(2, 'كاش', 1, 2, '2019-10-23 09:53:43', NULL),
(3, 'online payment', 2, 1, '2019-10-23 09:53:47', NULL),
(4, 'الدفع الالكترونى', 2, 2, '2019-10-23 09:53:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `created_at`, `updated_at`) VALUES
(1, '2019-10-08 10:44:06', NULL),
(2, '2019-10-08 10:44:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_plan`
--

CREATE TABLE `price_plan` (
  `price_plan_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `catering_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_plan`
--

INSERT INTO `price_plan` (`price_plan_id`, `price`, `catering_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 60000, 1, 1, '2019-12-17 11:45:33', NULL),
(2, 5000, 1, 1, '2019-12-17 12:14:10', NULL),
(3, 50, 1, 1, '2019-12-17 14:02:02', NULL),
(5, 50, 7, 1, '2020-01-08 08:12:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_plan_description`
--

CREATE TABLE `price_plan_description` (
  `price_plan_description_id` int(11) NOT NULL,
  `price_plan_description_name` varchar(80) NOT NULL,
  `price_plan_description_part` text NOT NULL,
  `price_plan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_plan_description`
--

INSERT INTO `price_plan_description` (`price_plan_description_id`, `price_plan_description_name`, `price_plan_description_part`, `price_plan_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, 1, '2019-11-06 08:10:09', NULL),
(2, 'لوريم إيبسوم', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', 1, 2, '2019-11-12 13:02:45', NULL),
(3, 'xyz test', 'text', 2, 1, '2019-12-17 12:14:10', NULL),
(4, 'يمبنيبي', 'نص', 2, 2, '2019-12-17 12:14:10', NULL),
(5, 'test', 'test eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 3, 1, '2019-12-17 14:02:02', NULL),
(6, 'تجريبي', 'وصف جزئييييييييييييييييييييييييييييييييييييييي', 3, 2, '2019-12-17 14:02:02', NULL),
(9, 'fdsfd f fdsf', 'dksn knefwkn kfnk', 5, 1, '2020-01-08 08:12:43', NULL),
(10, 'بيتى تىتبى تى', 'يبنن نبثن بنىث نبىث', 5, 2, '2020-01-08 08:12:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rate_id` int(11) NOT NULL,
  `rate_star` float NOT NULL,
  `rate_content` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `reserve_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`rate_id`, `rate_star`, `rate_content`, `user_id`, `type`, `type_id`, `reserve_id`, `created_at`, `updated_at`) VALUES
(6, 2.97963, 'hello world', 2, 3, 1, 3, '2019-11-06 10:14:37', NULL),
(7, 2, 'asdasdasdasd', 2, 3, 1, 3, '2019-11-06 10:15:22', NULL),
(8, 5, 'jejejejejeh', 2, 3, 1, 3, '2019-11-06 14:55:19', NULL),
(9, 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, 1, 1, 1, '2019-11-06 15:14:40', NULL),
(10, 3, 'hello', 2, 3, 1, 4, '2019-11-11 11:47:57', NULL),
(11, 3, '5555555566632132143438438', 2, 3, 1, 5, '2019-11-11 11:55:12', NULL),
(12, 3, 'asdasdasd', 2, 3, 1, 6, '2019-11-11 12:01:17', NULL),
(13, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:00', NULL),
(14, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:05', NULL),
(15, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:11', NULL),
(16, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:26', NULL),
(17, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:37', NULL),
(18, 3, 'asdasdasd', 2, 3, 1, 7, '2019-11-11 12:02:49', NULL),
(19, 2, 'زلتتت', 6, 1, 6, 3, '2019-11-12 10:22:47', NULL),
(21, 1, 'Ff', 6, 4, 1, 11, '2019-11-12 11:25:54', NULL),
(22, 2, 'Hyhu', 6, 1, 6, 5, '2019-11-12 11:33:17', NULL),
(23, 3, '123123123', 9, 3, 1, 15, '2019-11-13 08:24:21', NULL),
(24, 3, 'jbibibi', 2, 3, 1, 8, '2019-11-13 10:13:29', NULL),
(25, 3, 'uvuvuv', 2, 4, 1, 4, '2019-11-13 10:14:37', NULL),
(26, 3, 'ibib7v7v7v', 2, 4, 1, 3, '2019-11-13 10:14:53', NULL),
(27, 3, 'ubibib7', 2, 4, 1, 2, '2019-11-13 10:15:11', NULL),
(28, 2.68982, 'Hhh', 11, 1, 6, 13, '2019-11-13 15:04:23', NULL),
(32, 2.82519, 'djejruri4u', 2, 4, 1, 1, '2019-11-14 10:42:29', NULL),
(33, 4.55329, 'ممتاز', 17, 3, 1, 18, '2019-11-16 14:21:46', NULL),
(34, 3.39455, 'what', 1, 1, 6, 32, '2019-11-20 07:16:15', NULL),
(35, 4, 'ddggsdghh', 24, 4, 4, 27, '2019-11-20 13:58:30', NULL),
(36, 3.63, 'Thanks', 38, 3, 1, 25, '2019-11-22 22:18:08', NULL),
(37, 5, 'ok', 17, 2, 1, 16, '2019-12-10 20:50:45', NULL),
(38, 5, 'ok', 17, 4, 1, 41, '2019-12-10 20:52:25', NULL),
(39, 5, 'ok', 17, 2, 1, 12, '2019-12-10 20:55:42', NULL),
(45, 3, 'تت', 76, 1, 22, 89, '2019-12-18 09:44:22', NULL),
(48, 5, 'done', 97, 1, 6, 162, '2019-12-27 12:05:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_catering`
--

CREATE TABLE `reserve_catering` (
  `reserve_catering_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(13) NOT NULL,
  `user_phone_code` smallint(6) NOT NULL,
  `catering_id` int(11) NOT NULL,
  `catering_name` varchar(80) NOT NULL,
  `catering_email` varchar(100) NOT NULL,
  `catering_phone` varchar(20) NOT NULL,
  `price_plan_id` int(11) NOT NULL,
  `price_plan_name` varchar(80) NOT NULL,
  `price_plane_price` double NOT NULL,
  `reserve_catering_time` time NOT NULL,
  `reserve_catering_day` date NOT NULL,
  `reserve_catering_payment_id` int(11) DEFAULT NULL,
  `reserve_catering_num_of_person` int(11) NOT NULL,
  `reserve_catering_notice` varchar(255) DEFAULT NULL,
  `reserve_catering_sub_price` int(11) NOT NULL,
  `reserve_catering_coupon_code` varchar(20) DEFAULT NULL,
  `reserve_catering_coupon_discount` int(11) DEFAULT NULL,
  `reserve_catering_final_price` float DEFAULT NULL,
  `reserve_latitude` float NOT NULL,
  `reserve_longitude` float NOT NULL,
  `status_id` int(11) NOT NULL,
  `notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `cron_notify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve_catering`
--

INSERT INTO `reserve_catering` (`reserve_catering_id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_phone_code`, `catering_id`, `catering_name`, `catering_email`, `catering_phone`, `price_plan_id`, `price_plan_name`, `price_plane_price`, `reserve_catering_time`, `reserve_catering_day`, `reserve_catering_payment_id`, `reserve_catering_num_of_person`, `reserve_catering_notice`, `reserve_catering_sub_price`, `reserve_catering_coupon_code`, `reserve_catering_coupon_discount`, `reserve_catering_final_price`, `reserve_latitude`, `reserve_longitude`, `status_id`, `notify_count`, `cron_notify`, `created_at`, `updated_at`) VALUES
(1, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:10', '2019-11-06', NULL, 25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1500, NULL, NULL, NULL, 0, 0, 2, 1, 0, '2019-11-18 12:28:21', NULL),
(2, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:18', '2019-11-06', NULL, 12, 'hellow world', 720, 'waaa1', 0, 720, 0, 0, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(3, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:16', '2019-11-06', NULL, 20, 'reeeee', 1200, NULL, NULL, NULL, 0, 0, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(4, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:16', '2019-11-07', NULL, 10, 'dddddd', 600, NULL, NULL, NULL, 0, 0, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(8, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:11', '2019-10-26', NULL, 3, 'what what what what what what', 32, '456789', 20, 250, 12, 12, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(9, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:18', '2019-11-19', NULL, 180, 'comment my comment beauty center', 10800, NULL, NULL, NULL, 31.194, 29.9141, 3, 1, 0, '2019-11-18 12:28:21', NULL),
(10, 6, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-12', NULL, 6, 'Bbhh', 360, NULL, NULL, NULL, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(11, 6, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-12', NULL, 8, 'Vhh', 480, NULL, NULL, NULL, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(12, 6, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-12', NULL, 7, 'Bh', 420, NULL, NULL, NULL, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(13, 7, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-12', NULL, 2, 'Hhhhh', 120, 'hyyuyu', 0, 120, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(14, 7, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-12', NULL, 2, 'Bhgg', 120, 'lorrm', 0, 120, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(15, 7, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:14', '2019-11-12', NULL, 2, 'Bbj', 120, NULL, NULL, NULL, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(16, 5, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:11', '2019-11-13', NULL, 23, 'لغهع', 1380, NULL, NULL, NULL, 90, 160, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(17, 13, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:12', '2019-11-14', NULL, 2, 'Ghh', 120, NULL, NULL, NULL, 90, 160, 2, 1, 0, '2019-11-18 12:28:21', NULL),
(18, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:13', '2019-11-14', NULL, 2, 'Bbb', 120, NULL, NULL, NULL, 90, 160, 3, 1, 0, '2019-11-18 12:28:21', NULL),
(19, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:18', '2019-11-17', NULL, 20, 'مع', 1200, NULL, NULL, NULL, 24.6765, 46.7048, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(20, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:18', '2019-11-17', NULL, 10, 'ه', 600, NULL, NULL, NULL, 24.6749, 46.6965, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(21, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:18', '2019-11-17', NULL, 10, 'ععع', 600, NULL, NULL, NULL, 24.6753, 46.7046, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(22, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:19', '2019-11-17', NULL, 10, 'غ', 600, 'yallay350', 0, 600, 31.2645, 29.9916, 1, 1, 0, '2019-11-18 12:28:21', NULL),
(23, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:19', '2019-11-17', NULL, 20, 'jj', 1200, 'YALLA50', 0, 1200, 31.2645, 29.9916, 2, 1, 0, '2019-11-18 13:42:08', NULL),
(24, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:11', '2019-10-26', NULL, 3, 'what what what what what what', 32, 'www', 25, 24, 123456, 654321, 3, 1, 0, '2019-11-19 13:31:16', NULL),
(25, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:17', '2019-11-18', NULL, 5, 'sodium', 300, 'www', 0, 300, 31.2645, 29.9916, 2, 1, 0, '2019-11-19 13:29:32', NULL),
(28, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:06', '2019-11-21', NULL, 25, NULL, 1500, NULL, NULL, NULL, 31.2645, 29.9916, 1, 1, 0, '2019-11-23 21:29:38', NULL),
(29, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:09', '2019-11-23', NULL, 58, NULL, 3480, 'www', 25, 2610, 31.2645, 29.9916, 2, 1, 0, '2019-11-23 21:29:52', NULL),
(30, 36, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:16', '2019-11-22', NULL, 20, NULL, 1200, NULL, NULL, NULL, 26.4489, 50.0743, 1, 1, 0, '2019-11-23 21:29:38', NULL),
(31, 40, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:04', '2019-11-23', NULL, 20, 'bbbbh', 1200, NULL, NULL, NULL, 30.7927, 31.0093, 1, 1, 0, '2019-11-23 21:29:38', NULL),
(32, 38, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:21', '2019-11-26', NULL, 5, NULL, 300, '٨', 0, 300, 31.2098, 29.9133, 1, 1, 0, '2019-11-23 21:29:38', NULL),
(33, 38, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:05', '2019-11-28', NULL, 77, NULL, 4620, '9', 0, 4620, 31.2178, 29.9162, 1, 1, 0, '2019-12-10 20:26:37', NULL),
(34, 38, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-11-27', NULL, 85, NULL, 5100, 'lorem', 50, 2550, 31.2036, 29.9253, 1, 1, 1, '2019-12-12 20:00:02', NULL),
(35, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-11-24', NULL, 25855, 'comm', 1551300, NULL, NULL, NULL, 31.1006, 29.7543, 1, 1, 1, '2019-12-12 20:00:02', NULL),
(36, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-11-24', NULL, 25, NULL, 1500, NULL, NULL, NULL, 31.1005, 29.7545, 1, 1, 1, '2019-12-12 20:00:02', NULL),
(37, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-11-24', NULL, 25, NULL, 1500, NULL, NULL, NULL, 31.1005, 29.7545, 1, 1, 1, '2019-12-12 20:00:02', NULL),
(38, 2, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-11-24', NULL, 25, NULL, 1500, 'lorem', 50, 750, 31.1007, 29.7541, 1, 1, 1, '2019-12-12 20:00:02', NULL),
(39, 40, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:01', '2019-11-24', NULL, 6, 'vvgghhh', 360, NULL, NULL, NULL, 30.7927, 31.0093, 1, 1, 0, '2019-12-10 20:26:37', NULL),
(40, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:21', '2019-12-14', NULL, 50, NULL, 3000, NULL, NULL, NULL, 24.6761, 46.7047, 3, 1, 0, '2019-12-10 20:37:05', NULL),
(41, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:12', '2019-12-14', NULL, 80, NULL, 4800, NULL, NULL, NULL, 24.6592, 46.6373, 2, 1, 0, '2019-12-10 20:36:33', NULL),
(42, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:11', '2019-10-26', NULL, 3, 'what what what what what what', 32, 'www', 25, 24, 123456, 654321, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(43, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '11:12:00', '2019-10-26', NULL, 3, 'what what what what what what', 32, 'www', 25, 24, 123456, 654321, 1, 1, 1, '2019-12-24 11:34:13', NULL),
(45, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '11:12:00', '2019-10-26', NULL, 3, 'what what what what what what', 32, 'www', 25, 24, 123456, 654321, 1, 1, 1, '2019-12-24 11:34:13', NULL),
(46, 51, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:16', '2019-12-12', NULL, 2, 'jfhxjcjvbv', 120, NULL, NULL, NULL, 31.2634, 29.9899, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(47, 51, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:16', '2019-12-12', NULL, 2, 'is is id if to', 120, NULL, NULL, NULL, 31.2637, 29.9909, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(48, 51, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '16:16:00', '2019-12-12', NULL, 2, 'so good office', 120, NULL, NULL, NULL, 31.2642, 29.9911, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(49, 51, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '17:30:00', '2019-12-12', NULL, 2, 'so ethnic Rick', 120, NULL, NULL, NULL, 31.2642, 29.991, 1, 1, 1, '2019-12-24 11:34:13', NULL),
(50, 51, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '17:55:00', '2019-12-12', NULL, 2, 'gf his is id this', 120, NULL, NULL, NULL, 31.2642, 29.991, 1, 1, 1, '2019-12-24 11:34:13', NULL),
(57, 17, '0', '0', '0', 0, 1, '', '', '', 3, '', 0, '18:31:00', '2019-12-21', NULL, 70, NULL, 3500, NULL, NULL, NULL, 26.449, 50.0742, 3, 1, 0, '2019-12-24 11:34:13', NULL),
(58, 17, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '22:50:00', '2019-12-20', NULL, 50, NULL, 250000, NULL, NULL, NULL, 26.449, 50.0742, 2, 1, 0, '2019-12-24 11:34:13', NULL),
(59, 17, '0', '0', '0', 0, 1, '', '', '', 3, '', 0, '14:04:00', '2019-12-25', NULL, 70, NULL, 3500, NULL, NULL, NULL, 26.4489, 50.0743, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(60, 81, '0', '0', '0', 0, 1, '', '', '', 3, '', 0, '11:27:00', '2019-12-24', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2642, 29.9909, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(61, 81, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '15:17:00', '2019-12-26', NULL, 2, NULL, 10000, NULL, NULL, NULL, 31.2071, 29.9215, 1, 1, 0, '2019-12-24 11:34:13', NULL),
(62, 81, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '16:20:00', '2019-12-26', NULL, 2, NULL, 10000, NULL, NULL, NULL, 31.2642, 29.9909, 3, 1, 1, '2019-12-24 12:40:07', NULL),
(63, 81, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '14:48:00', '2019-12-27', NULL, 52, NULL, 260000, NULL, NULL, NULL, 31.2642, 29.9909, 3, 1, 0, '2019-12-24 12:54:25', NULL),
(64, 81, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '14:56:00', '2019-12-26', NULL, 2, NULL, 10000, NULL, NULL, NULL, 31.2603, 29.9948, 1, 1, 0, '2019-12-24 12:57:05', NULL),
(65, 96, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '11:11:00', '2019-12-31', NULL, 5, 'Zbc.', 300000, NULL, NULL, NULL, 31.2074, 29.9254, 3, 1, 0, '2019-12-29 08:19:54', NULL),
(66, 96, '0', '0', '0', 0, 1, '', '', '', 2, '', 0, '18:15:00', '2019-12-30', NULL, 88, 'نتلب', 440000, NULL, NULL, NULL, 31.211, 29.93, 1, 1, 0, '2019-12-29 08:19:54', NULL),
(67, 96, '0', '0', '0', 0, 5, '', '', '', 4, '', 0, '17:19:00', '2019-12-30', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2074, 29.9248, 4, 0, 0, '2019-12-26 13:21:55', NULL),
(68, 96, '0', '0', '0', 0, 5, '', '', '', 4, '', 0, '15:15:00', '2019-12-30', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2063, 29.9256, 3, 0, 0, '2019-12-26 13:23:33', NULL),
(69, 96, '0', '0', '0', 0, 5, '', '', '', 4, '', 0, '15:29:00', '2019-12-30', NULL, 5, 'Gkd', 250, NULL, NULL, NULL, 31.2095, 29.9225, 2, 0, 0, '2019-12-26 13:30:56', NULL),
(70, 81, '0', '0', '0', 0, 5, '', '', '', 4, '', 0, '16:25:00', '2019-12-31', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2074, 29.9334, 4, 0, 0, '2019-12-26 13:57:30', NULL),
(71, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '20:36:00', '2019-12-31', NULL, 50, NULL, 3000000, NULL, NULL, NULL, 26.4489, 50.0742, 3, 1, 0, '2019-12-29 08:19:54', NULL),
(72, 17, '0', '0', '0', 0, 1, '', '', '', 3, '', 0, '20:38:00', '2019-12-31', NULL, 50, NULL, 2500, NULL, NULL, NULL, 26.449, 50.0742, 2, 1, 0, '2019-12-29 08:19:54', NULL),
(73, 17, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '21:05:00', '2019-12-28', NULL, 50, NULL, 3000000, NULL, NULL, NULL, 26.4489, 50.0742, 2, 1, 0, '2019-12-29 08:19:54', NULL),
(74, 17, '0', '0', '0', 0, 1, '', '', '', 3, '', 0, '19:06:00', '2019-12-31', NULL, 100, NULL, 5000, NULL, NULL, NULL, 26.4539, 50.0901, 1, 1, 0, '2019-12-29 08:19:54', NULL),
(75, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '00:00:00', '2019-12-29', NULL, 5, NULL, 300000, NULL, NULL, NULL, 31.2643, 29.9911, 1, 1, 1, '2019-12-29 20:00:03', NULL),
(76, 1, '0', '0', '0', 0, 1, '', '', '', 1, '', 0, '02:20:00', '2019-12-29', NULL, 6, NULL, 360000, NULL, NULL, NULL, 31.2642, 29.9909, 1, 1, 1, '2019-12-29 22:20:01', NULL),
(77, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 1, 'Lorem Ipsum', 60000, '00:00:11', '2019-10-26', NULL, 3, 'what what what what what what', 32, 'www', 25, 24, 123456, 654321, 3, 0, 0, '2020-01-05 08:47:46', NULL),
(78, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 2, 'xyz test', 5000, '03:34:00', '2020-01-24', NULL, 5, 'بونل', 25000, NULL, NULL, NULL, 31.2077, 29.9244, 1, 0, 0, '2020-01-02 17:34:21', NULL),
(79, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 1, 'Lorem Ipsum', 60000, '03:37:00', '2020-01-23', NULL, 4, 'نم.', 240000, NULL, NULL, NULL, 31.2079, 29.9208, 1, 0, 0, '2020-01-02 17:37:16', NULL),
(80, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 1, 'Lorem Ipsum', 60000, '10:57:00', '2020-01-22', NULL, 9, NULL, 540000, NULL, NULL, NULL, 31.2483, 29.9783, 1, 0, 0, '2020-01-02 17:58:15', NULL),
(81, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 1, 'Lorem Ipsum', 60000, '05:00:00', '2020-01-24', NULL, 55, NULL, 3300000, NULL, NULL, NULL, 31.2539, 29.9834, 1, 0, 0, '2020-01-02 18:00:13', NULL),
(82, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 1, 'Lorem Ipsum', 60000, '10:09:00', '2020-01-23', NULL, 2, NULL, 120000, NULL, NULL, NULL, 31.2071, 29.9234, 2, 0, 0, '2020-01-05 08:49:51', NULL),
(83, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Saudia Catering', 'admin@saudiacatering.com', '0125892527', 2, 'xyz test', 5000, '05:09:00', '2020-01-22', NULL, 2, NULL, 10000, NULL, NULL, NULL, 31.207, 29.9234, 4, 0, 0, '2020-01-05 08:49:21', NULL),
(84, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 7, 'Oriental Food', 'catering@reg.com', '0548822564', 5, 'fdsfd f fdsf', 50, '02:13:00', '2020-01-08', NULL, 5, 'Chug', 250, NULL, NULL, NULL, 31.204, 29.9261, 1, 1, 0, '2020-01-08 08:14:22', NULL),
(85, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 7, 'Oriental Food', 'catering@reg.com', '0548822564', 5, 'fdsfd f fdsf', 50, '05:18:00', '2020-01-29', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2126, 29.9393, 3, 1, 0, '2020-01-08 08:50:11', NULL),
(86, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 7, 'مأكولات شرقية', 'catering@reg.com', '0548822564', 5, 'بيتى تىتبى تى', 50, '10:19:00', '2020-01-08', NULL, 3, NULL, 150, NULL, NULL, NULL, 31.2642, 29.9911, 1, 1, 0, '2020-01-08 08:20:15', NULL),
(87, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 7, 'مأكولات شرقية', 'catering@reg.com', '0548822564', 5, 'بيتى تىتبى تى', 50, '10:20:00', '2020-01-13', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2642, 29.9909, 2, 1, 0, '2020-01-08 09:19:15', NULL),
(88, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 1, 'السعودية للتموين', 'admin@saudiacatering.com', '0125892527', 1, 'لوريم إيبسوم', 60000, '10:22:00', '2020-01-14', NULL, 5, NULL, 300000, NULL, NULL, NULL, 31.2641, 29.9911, 1, 0, 0, '2020-01-08 17:22:46', NULL),
(89, 107, 'ايرون دوت', 'reg@test.com', '57558685', 974, 7, 'مأكولات شرقية رار', 'catering@reg.com', '0548822564', 5, 'بيتى تىتبى تى', 50, '11:18:00', '2020-01-20', NULL, 5, 'ربتلنب', 250, NULL, NULL, NULL, 31.2012, 29.9206, 1, 1, 0, '2020-01-08 09:19:15', NULL),
(90, 107, 'ايرون دوت', 'reg@test.com', '57558685', 974, 7, 'مأكولات شرقية رار', 'catering@reg.com', '0548822564', 5, 'بيتى تىتبى تى', 50, '11:22:00', '2020-01-21', NULL, 2, 'لنبنداا', 100, 'تخفيض', 80, 20, 31.2058, 29.9239, 1, 1, 0, '2020-01-08 09:22:57', NULL),
(91, 107, 'ايرون دوت تال', 'hreg@test.com', '57558685', 974, 7, 'Oriental Food', 'catering@reg.com', '0548822564', 5, 'fdsfd f fdsf', 50, '15:39:00', '2020-01-14', NULL, 6, 'Gjk', 300, NULL, NULL, NULL, 28.4319, -53.077, 4, 1, 0, '2020-01-08 12:41:08', NULL),
(92, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 7, 'Oriental Food', 'catering@reg.com', '0548822564', 5, 'fdsfd f fdsf', 50, '14:48:00', '2020-01-16', NULL, 5, NULL, 250, NULL, NULL, NULL, 31.2101, 29.9269, 1, 1, 0, '2020-01-08 12:48:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_clinic`
--

CREATE TABLE `reserve_clinic` (
  `reserve_clinic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(13) NOT NULL,
  `user_phone_code` smallint(6) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `clinic_name` varchar(80) NOT NULL,
  `clinic_email` varchar(100) NOT NULL,
  `clinic_phone` varchar(20) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(60) NOT NULL,
  `doctor_specialization` varchar(100) NOT NULL,
  `doctor_price` double NOT NULL,
  `reserve_clinic_day` date NOT NULL,
  `reserve_clinic_time` int(11) NOT NULL,
  `reserve_clinic_is_insurance` tinyint(1) NOT NULL,
  `reserve_clinic_payment_id` int(11) NOT NULL,
  `reserve_clinic_has_file` tinyint(1) NOT NULL,
  `reserve_clinic_notice` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `cron_notify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve_clinic`
--

INSERT INTO `reserve_clinic` (`reserve_clinic_id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_phone_code`, `clinic_id`, `clinic_name`, `clinic_email`, `clinic_phone`, `doctor_id`, `doctor_name`, `doctor_specialization`, `doctor_price`, `reserve_clinic_day`, `reserve_clinic_time`, `reserve_clinic_is_insurance`, `reserve_clinic_payment_id`, `reserve_clinic_has_file`, `reserve_clinic_notice`, `status_id`, `notify_count`, `cron_notify`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-06', 11, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, 1, 1, '2019-12-13 07:00:02', NULL),
(2, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-17', 9, 1, 1, 1, 'iiiii', 2, 1, 1, '2019-12-13 05:00:02', NULL),
(3, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-17', 10, 1, 1, 1, 'iii', 1, 1, 1, '2019-12-13 06:00:02', NULL),
(5, 39, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-25', 10, 1, 1, 0, NULL, 1, 1, 1, '2019-12-13 06:00:02', NULL),
(6, 38, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-26', 14, 1, 1, 1, NULL, 1, 1, 1, '2019-12-13 10:00:02', NULL),
(7, 38, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-29', 12, 0, 1, 1, NULL, 1, 1, 1, '2019-12-13 08:00:02', NULL),
(8, 40, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-24', 12, 0, 1, 1, 'ghgg', 1, 1, 1, '2019-12-13 08:00:02', NULL),
(9, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-10', 9, 1, 1, 1, 'Uu', 1, 1, 1, '2019-12-13 05:00:02', NULL),
(10, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-14', 11, 0, 1, 0, NULL, 1, 1, 1, '2019-12-13 07:00:02', NULL),
(11, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-14', 12, 1, 1, 1, NULL, 1, 1, 1, '2019-12-13 08:00:02', NULL),
(12, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-13', 13, 0, 1, 0, NULL, 2, 1, 1, '2019-12-13 09:00:02', NULL),
(13, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-17', 15, 1, 1, 1, NULL, 1, 1, 1, '2019-12-13 11:00:03', NULL),
(14, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-12', 11, 0, 1, 0, NULL, 1, 1, 1, '2019-12-13 07:00:02', NULL),
(15, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-18', 13, 1, 1, 1, NULL, 3, 1, 1, '2019-12-13 09:00:02', NULL),
(16, 17, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-25', 17, 0, 1, 0, NULL, 2, 1, 1, '2019-12-12 13:12:01', NULL),
(17, 1, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-11-06', 11, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-14 03:25:21', NULL),
(18, 51, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-12', 17, 1, 1, 1, NULL, 1, 1, 1, '2019-12-14 03:25:21', NULL),
(24, 17, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2019-12-20', 16, 0, 1, 0, NULL, 1, 0, 1, '2019-12-20 12:00:02', NULL),
(25, 76, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2019-12-31', 17, 0, 1, 1, NULL, 1, 0, 1, '2019-12-22 13:00:02', NULL),
(26, 81, '', '', '', 0, 1, '', '', '', 24, '', '', 0, '2019-12-28', 14, 0, 1, 0, NULL, 4, 0, 1, '2019-12-24 11:42:43', NULL),
(27, 81, '', '', '', 0, 1, '', '', '', 1, '', '', 0, '2019-12-26', 11, 0, 1, 1, NULL, 3, 0, 1, '2019-12-25 07:00:03', NULL),
(28, 96, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2019-12-30', 17, 0, 1, 1, NULL, 3, 0, 1, '2019-12-26 13:00:02', NULL),
(29, 96, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2019-12-26', 19, 0, 1, 1, NULL, 3, 0, 1, '2019-12-26 15:00:02', NULL),
(30, 94, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2020-04-17', 17, 0, 1, 1, 'asd', 1, 0, 1, '2019-12-30 13:00:02', NULL),
(31, 81, '', '', '', 0, 1, '', '', '', 19, '', '', 0, '2019-12-31', 18, 0, 1, 1, NULL, 3, 0, 0, '2019-12-30 09:19:25', NULL),
(32, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 1, 'Alhokama Eye Specialist Center xxx 5', 'admin@alhokama.com', '114797777', 1, 'mmmmmmmmmmmmmmmmmmmm', 'eyes x', 150, '2019-11-06', 11, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 0, 0, '2019-12-31 18:41:43', NULL),
(33, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 1, 'مركز الحكماء للعيون مممممممممممممم', 'admin@alhokama.com', '114797777', 1, 'اااااااااااااااااااا', 'عيون س', 150, '2020-01-02', 9, 1, 1, 1, NULL, 1, 0, 0, '2020-01-01 17:17:36', NULL),
(34, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Alhokama Eye Specialist Center xxx 5', 'admin@alhokama.com', '114797777', 19, 'xxxxxxxxxxxxxxxxxx', 'xxxx', 500, '2020-01-23', 18, 0, 1, 1, NULL, 1, 0, 0, '2020-01-02 17:35:23', NULL),
(35, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Alhokama Eye Specialist Center xxx 5', 'admin@alhokama.com', '114797777', 1, 'mmmmmmmmmmmmmmmmmmmm', 'eyes x', 150, '2020-01-22', 11, 0, 1, 1, NULL, 1, 0, 0, '2020-01-02 17:36:34', NULL),
(36, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 1, 'Alhokama Eye Specialist Center xxx 5', 'admin@alhokama.com', '114797777', 1, 'mmmmmmmmmmmmmmmmmmmm', 'eyes x', 150, '2020-01-16', 11, 0, 1, 1, NULL, 1, 0, 0, '2020-01-02 18:01:28', NULL),
(37, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 39, 'final clinic', 'clinic@reg.com', '058742884', 28, 'Ahmed', 'dsa', 70, '2020-01-20', 16, 0, 1, 1, NULL, 3, 1, 0, '2020-01-06 14:30:52', NULL),
(38, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 39, 'final clinic', 'clinic@reg.com', '058742884', 28, 'Ahmed', 'dsa', 70, '2020-01-17', 15, 0, 1, 1, NULL, 4, 1, 0, '2020-01-06 14:36:43', NULL),
(39, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 39, 'final clinic', 'clinic@reg.com', '058742884', 28, 'Ahmed', 'dsa', 70, '2020-01-22', 16, 1, 1, 1, NULL, 1, 1, 0, '2020-01-06 14:38:09', NULL),
(40, 107, 'ايرون دوت تال', 'hreg@test.com', '57558685', 974, 41, 'rngk jkjkk', 'jdnsf@dnjf.de', '121515', 30, 'Ahmed', 'eyes 5', 80, '2020-01-14', 12, 0, 1, 1, NULL, 3, 1, 0, '2020-01-08 12:21:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_hospital`
--

CREATE TABLE `reserve_hospital` (
  `reserve_hospital_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(13) NOT NULL,
  `user_phone_code` smallint(6) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(80) NOT NULL,
  `hospital_email` varchar(100) NOT NULL,
  `hospital_phone` varchar(20) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `clinic_name` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(60) NOT NULL,
  `doctor_specialization` varchar(100) NOT NULL,
  `doctor_price` double NOT NULL,
  `reserve_hospital_day` date NOT NULL,
  `reserve_hospital_hour` int(11) NOT NULL,
  `reserve_hospital_is_insurance` tinyint(1) NOT NULL,
  `reserve_hospital_payment_id` int(11) NOT NULL,
  `reserve_hospital_has_file` tinyint(1) NOT NULL,
  `reserve_hospital_notice` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `cron_notify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve_hospital`
--

INSERT INTO `reserve_hospital` (`reserve_hospital_id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_phone_code`, `hospital_id`, `hospital_name`, `hospital_email`, `hospital_phone`, `clinic_id`, `clinic_name`, `doctor_id`, `doctor_name`, `doctor_specialization`, `doctor_price`, `reserve_hospital_day`, `reserve_hospital_hour`, `reserve_hospital_is_insurance`, `reserve_hospital_payment_id`, `reserve_hospital_has_file`, `reserve_hospital_notice`, `status_id`, `notify_count`, `cron_notify`, `created_at`, `updated_at`) VALUES
(3, 6, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 12, 0, 1, 1, 'تاررزارر', 3, 1, 1, '2019-12-13 08:00:02', NULL),
(4, 6, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 9, 1, 1, 0, 'ززز', 2, 1, 1, '2019-12-13 05:00:02', NULL),
(5, 6, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 11, 0, 1, 0, 'Hrhre', 2, 1, 1, '2019-12-13 07:00:02', NULL),
(6, 6, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 14, 0, 1, 0, 'Cccf', 2, 1, 1, '2019-12-12 10:25:39', NULL),
(7, 6, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 13, 0, 1, 0, 'Nnnn', 1, 1, 1, '2019-12-13 09:00:02', NULL),
(8, 7, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 15, 0, 1, 0, 'Bbb', 1, 1, 1, '2019-12-12 11:13:26', NULL),
(9, 7, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-12', 10, 1, 1, 1, 'Ggg', 1, 1, 1, '2019-12-13 06:00:02', NULL),
(10, 9, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-13', 13, 0, 1, 0, 'asdnlasdnlasdnlkasd', 1, 1, 1, '2019-12-13 09:00:02', NULL),
(11, 5, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-26', 14, 0, 1, 0, 'نعم', 1, 1, 1, '2019-12-12 10:25:39', NULL),
(12, 2, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-13', 12, 0, 1, 0, '1234567890', 1, 1, 1, '2019-12-13 08:00:02', NULL),
(13, 11, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-13', 10, 0, 1, 0, 'Mmm', 1, 1, 1, '2019-12-13 06:00:02', NULL),
(14, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-13', 9, 0, 1, 0, 'hhhh', 3, 1, 1, '2019-12-13 20:02:30', NULL),
(15, 11, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-14', 13, 0, 1, 0, 'Nn', 4, 1, 1, '2019-12-13 20:02:12', NULL),
(16, 12, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-14', 11, 0, 1, 0, 'Nn', 2, 1, 1, '2019-12-13 07:00:02', NULL),
(17, 12, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-17', 11, 1, 1, 1, 'Vvg', 3, 1, 1, '2019-12-13 07:00:02', NULL),
(18, 19, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-29', 13, 1, 1, 1, '8', 1, 1, 1, '2019-12-13 09:00:02', NULL),
(19, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-17', 10, 1, 1, 1, 'ttt', 1, 1, 1, '2019-12-13 06:00:02', NULL),
(20, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-17', 9, 1, 1, 1, 't', 3, 1, 1, '2019-12-13 05:00:02', NULL),
(21, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-17', 12, 1, 1, 1, 'oo', 1, 1, 1, '2019-12-13 08:00:02', NULL),
(22, 16, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-17', 15, 0, 1, 0, 'rff', 3, 1, 1, '2019-12-12 11:13:26', NULL),
(23, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-18', 13, 0, 1, 0, 'hdhfgghfjhjj cleric is id is id do of DJ', 2, 1, 1, '2019-12-13 09:00:02', NULL),
(24, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-18', 10, 1, 1, 1, 'rustic', 2, 1, 1, '2019-12-13 06:00:02', NULL),
(29, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, NULL, 2, 1, 1, '2019-12-13 05:00:02', NULL),
(30, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, NULL, 2, 1, 1, '2019-12-13 05:00:02', NULL),
(31, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, 1, 1, '2019-12-13 05:00:02', NULL),
(32, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-19', 13, 0, 1, 0, 'فبةلا', 3, 1, 1, '2020-01-06 10:02:45', NULL),
(34, 28, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-22', 12, 0, 1, 0, NULL, 1, 1, 1, '2019-12-13 08:00:02', NULL),
(37, 2, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-23', 12, 0, 1, 1, NULL, 1, 1, 1, '2019-12-13 08:00:02', NULL),
(38, 38, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-27', 13, 0, 1, 0, NULL, 2, 1, 1, '2019-12-13 09:00:02', NULL),
(40, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-27', 12, 1, 1, 1, 'u', 1, 1, 1, '2019-12-13 08:00:02', NULL),
(41, 17, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-11-26', 10, 1, 1, 1, 'i', 3, 1, 1, '2019-12-26 13:45:41', NULL),
(42, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-11-26', 12, 0, 1, 0, 'y', 3, 1, 1, '2019-12-13 08:00:02', NULL),
(43, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-10', 9, 0, 1, 0, NULL, 1, 1, 1, '2019-12-13 05:00:02', NULL),
(44, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-11', 10, 0, 1, 0, NULL, 3, 1, 1, '2019-12-13 06:00:02', NULL),
(45, 17, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-11', 10, 1, 1, 1, NULL, 3, 1, 1, '2019-12-13 06:00:02', NULL),
(46, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-11', 10, 1, 1, 1, NULL, 3, 1, 1, '2019-12-26 13:45:38', NULL),
(47, 17, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-12', 1, 1, 1, 1, NULL, 3, 1, 1, '2019-12-12 21:00:02', NULL),
(48, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-12', 10, 0, 1, 0, NULL, 4, 1, 1, '2019-12-26 13:44:11', NULL),
(52, 31, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-12', 7, 0, 1, 0, NULL, 3, 1, 1, '2019-12-26 13:45:35', NULL),
(57, 51, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-12', 10, 1, 1, 1, NULL, 3, 1, 1, '2019-12-13 06:00:02', NULL),
(60, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-12', 12, 0, 1, 1, NULL, 3, 1, 1, '2019-12-13 08:00:02', NULL),
(61, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-12', 9, 1, 1, 1, '123', 3, 1, 1, '2019-12-13 05:00:02', NULL),
(62, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-12', 14, 1, 1, 1, '13', 3, 1, 1, '2019-12-12 10:25:39', NULL),
(63, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-12', 13, 1, 1, 1, NULL, 3, 1, 1, '2019-12-13 09:00:02', NULL),
(64, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-20', 14, 1, 1, 0, 'fgh', 4, 1, 1, '2019-12-12 10:25:39', NULL),
(65, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-26', 13, 0, 1, 0, NULL, 3, 1, 1, '2019-12-13 09:00:02', NULL),
(66, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-24', 10, 0, 1, 0, 'asdasdasdasdasdasdas', 3, 1, 1, '2019-12-13 06:00:02', NULL),
(67, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-24', 11, 0, 1, 0, 'asdasdasd', 3, 1, 1, '2019-12-13 07:00:02', NULL),
(68, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-24', 9, 0, 1, 0, NULL, 3, 1, 1, '2019-12-13 05:00:02', NULL),
(69, 54, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-24', 13, 1, 1, 1, NULL, 4, 1, 1, '2019-12-24 10:57:16', NULL),
(76, 51, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-17', 12, 1, 1, 1, NULL, 1, 1, 1, '2019-12-27 09:45:26', NULL),
(77, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-27 09:45:26', NULL),
(78, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 1, 1, '2019-12-27 09:45:26', NULL),
(79, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-27 09:45:26', NULL),
(80, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-27 09:45:26', NULL),
(81, 51, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-17', 13, 1, 1, 1, NULL, 1, 1, 1, '2019-12-27 09:45:26', NULL),
(82, 51, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-17', 15, 1, 1, 1, NULL, 1, 1, 1, '2019-12-27 09:45:26', NULL),
(83, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, 1, 1, '2019-12-27 09:45:26', NULL),
(89, 76, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-29', 12, 1, 1, 1, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(93, 81, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-30', 20, 0, 1, 1, 'ا', 4, 0, 1, '2019-12-19 16:00:02', NULL),
(94, 81, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-31', 18, 0, 1, 1, NULL, 4, 0, 1, '2019-12-19 14:00:02', NULL),
(95, 81, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-30', 17, 0, 1, 0, NULL, 3, 0, 1, '2019-12-19 13:00:02', NULL),
(96, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-19', 5, 1, 1, 1, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(97, 81, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-30', 19, 0, 1, 1, NULL, 4, 0, 1, '2019-12-19 15:00:02', NULL),
(98, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-19', 3, 0, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(99, 81, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-30', 18, 0, 1, 0, NULL, 1, 0, 1, '2019-12-19 14:00:02', NULL),
(100, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-19', 2, 0, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(101, 1, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-20', 3, 1, 1, 1, NULL, 4, 1, 1, '2019-12-26 13:44:50', NULL),
(102, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-19', 6, 1, 1, 1, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(103, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-29', 4, 1, 1, 1, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(104, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-19', 7, 1, 1, 1, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(105, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-21', 10, 1, 1, 1, NULL, 4, 1, 1, '2019-12-26 13:44:51', NULL),
(106, 17, '', '', '', 0, 23, '', '', '', 20, '', 21, '', '', 0, '2019-12-26', 16, 0, 1, 0, NULL, 1, 0, 1, '2019-12-20 12:00:02', NULL),
(107, 76, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-25', 11, 0, 1, 1, NULL, 4, 1, 1, '2019-12-26 13:44:07', NULL),
(108, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-25', 10, 1, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(109, 84, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 4, 1, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(110, 84, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-23', 12, 0, 1, 1, NULL, 3, 1, 1, '2019-12-27 09:45:26', NULL),
(111, 77, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-23', 14, 1, 1, 0, NULL, 3, 1, 1, '2019-12-27 09:45:26', NULL),
(112, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 3, 1, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(113, 84, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 0, 0, 1, 0, NULL, 3, 1, 0, '2019-12-24 08:29:28', NULL),
(114, 84, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 6, 0, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(115, 1, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-23', 20, 1, 1, 0, NULL, 3, 1, 1, '2019-12-27 09:45:26', NULL),
(116, 85, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 7, 1, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(117, 85, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 5, 1, 1, 1, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(118, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-24', 3, 0, 1, 0, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(119, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 1, 0, 1, 0, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(120, 77, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-23', 15, 0, 1, 1, NULL, 3, 1, 1, '2019-12-27 09:45:26', NULL),
(121, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 9, 0, 1, 1, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(122, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 8, 0, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(123, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 10, 0, 1, 0, NULL, 3, 1, 1, '2019-12-24 08:29:28', NULL),
(124, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-23', 2, 0, 1, 0, NULL, 4, 1, 1, '2019-12-24 08:29:28', NULL),
(125, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-27', 4, 0, 1, 0, NULL, 4, 1, 1, '2019-12-26 13:44:04', NULL),
(126, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-28', 4, 0, 1, 0, NULL, 4, 1, 1, '2019-12-26 13:43:57', NULL),
(127, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-27', 11, 0, 1, 1, 'Hh', 3, 1, 1, '2019-12-24 08:29:28', NULL),
(128, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-26', 3, 1, 1, 1, NULL, 3, 1, 1, '2019-12-26 13:45:32', NULL),
(129, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-27', 11, 0, 1, 0, 'Cf', 3, 1, 1, '2019-12-24 08:29:28', NULL),
(130, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-26', 4, 0, 1, 0, NULL, 3, 1, 1, '2019-12-25 00:00:02', NULL),
(131, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-26', 7, 0, 1, 0, NULL, 3, 1, 1, '2019-12-25 03:00:02', NULL),
(132, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-31', 5, 1, 1, 1, NULL, 3, 1, 1, '2019-12-25 01:00:03', NULL),
(133, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-31', 4, 1, 1, 1, NULL, 4, 1, 1, '2019-12-25 00:00:02', NULL),
(134, 77, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-31', 11, 1, 1, 1, NULL, 3, 1, 1, '2019-12-26 13:43:22', NULL),
(135, 77, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-24', 12, 1, 1, 1, NULL, 3, 1, 1, '2019-12-24 08:29:37', NULL),
(136, 77, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-24', 4, 0, 1, 0, NULL, 4, 1, 1, '2019-12-25 00:00:02', NULL),
(138, 81, '', '', '', 0, 22, '', '', '', 16, '', 10, '', '', 0, '2019-12-26', 8, 0, 1, 1, NULL, 4, 1, 1, '2019-12-26 13:44:55', NULL),
(139, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-24', 11, 0, 1, 0, NULL, 3, 1, 1, '2019-12-26 08:08:31', NULL),
(140, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-24', 10, 0, 1, 0, NULL, 4, 1, 1, '2019-12-26 08:08:31', NULL),
(141, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-26', 12, 1, 1, 0, NULL, 4, 1, 1, '2019-12-26 08:20:02', NULL),
(142, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-26', 11, 0, 1, 0, NULL, 4, 1, 1, '2019-12-27 07:00:01', NULL),
(143, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-26', 10, 0, 1, 1, 'hhh', 4, 1, 1, '2019-12-27 06:00:02', NULL),
(144, 94, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-31', 10, 0, 1, 0, NULL, 4, 1, 1, '2019-12-27 06:00:02', NULL),
(145, 96, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-30', 12, 0, 1, 1, NULL, 3, 1, 1, '2019-12-27 09:45:26', NULL),
(146, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-28', 11, 0, 1, 0, NULL, 4, 1, 1, '2019-12-27 07:00:01', NULL),
(147, 90, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-31', 12, 0, 1, 0, NULL, 4, 1, 1, '2019-12-27 08:00:03', NULL),
(148, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(149, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(150, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(151, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(152, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(153, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(154, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(155, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(156, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(157, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(158, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(159, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-28 05:00:02', NULL),
(160, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 1, 1, '2020-01-06 09:29:51', NULL),
(161, 97, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-30', 21, 1, 1, 0, NULL, 1, 1, 1, '2019-12-27 17:00:02', NULL),
(162, 97, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-30', 20, 1, 1, 0, NULL, 4, 1, 1, '2019-12-27 16:00:02', NULL),
(163, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-30', 10, 0, 1, 1, NULL, 2, 1, 1, '2019-12-29 08:30:21', NULL),
(164, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-29', 10, 1, 1, 0, NULL, 3, 1, 1, '2019-12-29 08:30:21', NULL),
(165, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-30', 11, 1, 1, 0, NULL, 3, 1, 1, '2019-12-29 08:30:21', NULL),
(166, 17, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-30', 12, 0, 1, 1, NULL, 2, 1, 1, '2019-12-29 08:30:21', NULL),
(167, 1, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-30', 18, 1, 1, 1, NULL, 3, 1, 1, '2020-01-06 09:22:22', NULL),
(168, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 11, 1, 1, 1, NULL, 3, 1, 1, '2020-01-06 09:52:59', NULL),
(169, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 13, 1, 1, 1, NULL, 3, 1, 1, '2020-01-06 09:44:39', NULL),
(170, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 14, 1, 1, 1, NULL, 3, 1, 1, '2019-12-29 14:40:51', NULL),
(171, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 12, 1, 1, 1, NULL, 3, 1, 1, '2019-12-29 14:38:19', NULL),
(172, 1, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 15, 1, 1, 1, NULL, 3, 1, 1, '2019-12-31 07:51:49', NULL),
(173, 81, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-31', 15, 1, 1, 0, NULL, 2, 1, 1, '2019-12-31 10:57:55', NULL),
(174, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-01-02', 11, 1, 1, 0, NULL, 1, 1, 1, '2019-12-30 07:00:03', NULL),
(175, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-01-01', 11, 1, 1, 0, NULL, 2, 1, 1, '2019-12-30 07:00:03', NULL),
(176, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-01-01', 10, 1, 1, 0, NULL, 1, 1, 1, '2019-12-30 06:00:03', NULL),
(177, 98, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-29', 18, 1, 1, 0, 'Uuu', 3, 1, 1, '2019-12-29 14:00:02', NULL),
(178, 98, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-29', 10, 0, 1, 0, 'Vhh', 4, 1, 1, '2019-12-30 06:00:03', NULL),
(179, 98, '', '', '', 0, 6, '', '', '', 5, '', 20, '', '', 0, '2019-12-29', 21, 1, 1, 0, 'Bvgy', 3, 1, 1, '2019-12-29 17:00:02', NULL),
(180, 98, '', '', '', 0, 6, '', '', '', 4, '', 3, '', '', 0, '2019-12-31', 13, 1, 1, 0, NULL, 2, 1, 1, '2020-01-06 12:10:43', NULL),
(181, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-01-23', 11, 1, 1, 0, NULL, 1, 1, 1, '2019-12-30 07:00:03', NULL),
(182, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2019-12-29', 11, 0, 1, 1, NULL, 1, 1, 1, '2019-12-30 07:00:03', NULL),
(183, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-02-14', 12, 1, 1, 1, NULL, 1, 1, 1, '2019-12-30 08:00:02', NULL),
(184, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-02-19', 11, 0, 1, 1, NULL, 1, 1, 1, '2019-12-31 08:43:43', NULL),
(185, 81, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-01-23', 12, 0, 1, 1, NULL, 1, 1, 1, '2019-12-31 08:43:43', NULL),
(186, 94, '', '', '', 0, 22, '', '', '', 17, '', 12, '', '', 0, '2020-03-26', 11, 0, 1, 0, NULL, 1, 1, 0, '2019-12-31 08:43:43', NULL),
(187, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2019-11-20', 9, 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 1, 0, '2020-01-06 12:10:43', NULL),
(188, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2019-12-30', 11, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(189, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-01-07', 10, 1, 1, 1, NULL, 1, 1, 0, '2019-12-31 08:43:43', NULL),
(190, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-01-02', 10, 1, 1, 1, NULL, 1, 1, 0, '2019-12-31 08:43:43', NULL),
(191, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-04-23', 11, 1, 1, 1, NULL, 1, 1, 0, '2019-12-31 09:20:34', NULL),
(192, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-03-20', 12, 1, 1, 0, NULL, 3, 1, 0, '2020-01-02 09:22:21', NULL),
(193, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-03-09', 11, 1, 1, 0, NULL, 3, 1, 0, '2020-01-02 09:22:21', NULL),
(194, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 23, 'مستفي تجريبي', 'admin@hospitlatest.com', '555555555', 20, 'عيادة تجريبي', 21, 'مجدي يعقوب', 'قلب غ', 100, '2020-02-19', 19, 1, 1, 0, NULL, 4, 0, 0, '2019-12-31 12:18:37', NULL),
(195, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-01-23', 10, 0, 1, 1, NULL, 1, 1, 0, '2020-01-02 09:22:21', NULL),
(196, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-01-17', 11, 0, 1, 1, NULL, 4, 1, 0, '2020-01-02 09:22:21', NULL),
(197, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 34, 'x clinic', 25, 'knkl', 'njnj', 52, '2020-01-23', 17, 0, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:30:12', NULL),
(198, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-05', 9, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(199, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-01-07', 12, 0, 1, 0, NULL, 3, 1, 0, '2020-01-16 11:28:07', NULL),
(200, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-01-06', 11, 1, 1, 0, NULL, 3, 1, 0, '2020-01-16 11:28:07', NULL),
(201, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 5, 'مركز الحكماء للعيون', 20, 'fdfdfdsf', 'fdfdsgfd', 205, '2020-01-06', 18, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(202, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 9, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(203, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 12, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(204, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 10, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(205, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 13, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:43', NULL),
(206, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 11, 1, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:10:51', NULL),
(207, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2020-01-14', 11, 1, 1, 0, NULL, 3, 1, 0, '2020-01-06 12:21:26', NULL),
(208, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2020-01-23', 11, 0, 1, 1, NULL, 2, 1, 0, '2020-01-06 12:29:43', NULL),
(209, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2020-01-09', 11, 0, 1, 1, NULL, 3, 1, 0, '2020-01-06 12:33:45', NULL),
(210, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2020-01-06', 14, 0, 1, 1, NULL, 1, 0, 0, '2020-01-06 21:43:23', NULL),
(211, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 26, 're-test', 'hospitaltest@reg.com', '57488925', 38, 'eye', 26, 'mohamed', 'eyes', 50, '2020-01-23', 12, 0, 1, 1, NULL, 3, 1, 0, '2020-01-06 13:47:43', NULL),
(212, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 6, 'مستشفى الملك فيصل التخصصي بجدة', 'admin@kfshrc.edu.sa', '920012312', 4, 'قسم الأورام', 3, 'محمد حفنى', 'طبيب اسنان', 150, '2020-01-06', 15, 1, 1, 1, NULL, 3, 0, 0, '2020-01-06 13:15:10', NULL),
(213, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 26, 're-test', 'hospitaltest@reg.com', '57488925', 38, 'eye', 26, 'mohamed', 'eyes', 50, '2020-01-06', 13, 1, 1, 0, NULL, 3, 1, 0, '2020-01-06 13:47:43', NULL),
(214, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 26, 're-test', 'hospitaltest@reg.com', '57488925', 38, 'eye', 26, 'mohamed', 'eyes', 50, '2020-01-06', 10, 1, 1, 0, NULL, 4, 1, 0, '2020-01-06 14:12:01', NULL),
(215, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 26, 're-test', 'hospitaltest@reg.com', '57488925', 38, 'eye', 26, 'mohamed', 'eyes', 50, '2020-01-06', 12, 1, 1, 0, NULL, 3, 1, 0, '2020-01-06 14:11:15', NULL),
(216, 107, 'ايرون دوت', 'reg@test.com', '57558685', 974, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-01-21', 11, 1, 1, 0, NULL, 1, 1, 0, '2020-01-16 11:28:07', NULL),
(217, 107, 'ايرون دوت', 'reg@test.com', '57558685', 974, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'باطنيه', 100, '2020-01-11', 12, 0, 1, 0, NULL, 1, 1, 0, '2020-01-16 11:28:07', NULL),
(218, 107, 'ايرون دوت تال', 'reg@test.com', '57558685', 974, 29, 'تجريبي اخير', 'hospital@test.com', '21525455', 40, 'لىي نىنبا تقب', 29, 'احمد', 'نبىثق', 80, '2020-01-22', 14, 1, 1, 0, 'Fgjk', 2, 1, 0, '2020-01-08 11:46:54', NULL),
(219, 17, 'ziyad', 'bsf7315@live.com', '569135523', 966, 6, 'King Faisal Specialist Hospital in Jeddah', 'admin@kfshrc.edu.sa', '920012312', 4, 'Department of Oncology', 3, 'mohammed hefny', 'Dentist', 150, '2020-01-11', 11, 0, 1, 0, NULL, 1, 0, 0, '2020-01-11 04:49:57', NULL),
(220, 94, 'Saif', 'saif@irondot.org', '1129261195', 20, 22, 'hospital Almana', 'admin@almana.com', '01272252219', 17, 'inter', 12, 'Ali', 'inter', 100, '2020-01-16', 11, 0, 1, 0, NULL, 2, 1, 0, '2020-01-16 11:28:07', NULL),
(221, 109, 'amal', 'amalelrefaey5@gmail.com', '58467578', 974, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'استاذ دكتور الغدد الصماء بكلية الطب جامعة الملك فهد', 100, '2020-01-20', 11, 1, 1, 0, 'Hdjcnnskks', 1, 1, 0, '2020-01-16 11:28:07', NULL),
(222, 110, 'iron dot', 'irondot@xyz.com', '8404667880', 20, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'استاذ دكتور الغدد الصماء بكلية الطب جامعة الملك فهد', 100, '2020-01-20', 12, 1, 1, 0, NULL, 2, 0, 0, '2020-01-16 13:07:51', NULL),
(223, 111, 'irondot', 'irondot@xyz.com', '545494658', 966, 22, 'مستشفي المانع', 'admin@almana.com', '01272252219', 17, 'باطنيه', 12, 'علي', 'استاذ دكتور الغدد الصماء بكلية الطب جامعة الملك فهد', 100, '2020-01-20', 10, 0, 1, 0, NULL, 2, 0, 0, '2020-01-16 13:48:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_restaurant`
--

CREATE TABLE `reserve_restaurant` (
  `reserve_restaurant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(13) NOT NULL,
  `user_phone_code` smallint(6) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(80) NOT NULL,
  `restaurant_email` varchar(100) NOT NULL,
  `restaurant_phone` varchar(20) NOT NULL,
  `reserve_restaurant_day` date NOT NULL,
  `reserve_restaurant_time` time NOT NULL,
  `reserve_restaurant_num_person` int(11) NOT NULL,
  `reserve_restaurant_notice` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `cron_notify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve_restaurant`
--

INSERT INTO `reserve_restaurant` (`reserve_restaurant_id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_phone_code`, `restaurant_id`, `restaurant_name`, `restaurant_email`, `restaurant_phone`, `reserve_restaurant_day`, `reserve_restaurant_time`, `reserve_restaurant_num_person`, `reserve_restaurant_notice`, `status_id`, `notify_count`, `cron_notify`, `created_at`, `updated_at`) VALUES
(2, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, 1, 0, '2019-11-22 21:50:45', NULL),
(3, 2, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:10', 25, '13467', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(4, 2, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:13', 120, 'ghhgh', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(5, 2, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:14', 12, '1213132', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(6, 2, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:17', 20, 'xxx', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(7, 2, '', '', '', 0, 1, '', '', '', '2019-11-07', '00:00:16', 12, 'ssss', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(8, 2, '', '', '', 0, 1, '', '', '', '2019-11-11', '00:00:16', 12, '12123123123', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(10, 6, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:13', 6, 'Bbh', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(11, 6, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:13', 4, 'Hhu', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(12, 6, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:13', 5, 'Hjj', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(13, 6, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:13', 5, 'Jj', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(14, 7, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:13', 5, 'Hhh', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(15, 9, '', '', '', 0, 1, '', '', '', '2019-11-12', '00:00:16', 5, 'jjkjkkkjkjjkjk', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(16, 11, '', '', '', 0, 1, '', '', '', '2019-11-14', '00:00:11', 5, 'Nnn', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(17, 17, '', '', '', 0, 1, '', '', '', '2019-11-17', '00:00:20', 5, 'حفل خطوبه', 2, 1, 0, '2019-11-22 21:50:45', NULL),
(18, 17, '', '', '', 0, 1, '', '', '', '2019-11-17', '00:00:18', 5, 'زواج', 2, 1, 0, '2019-11-22 21:50:45', NULL),
(19, 1, '', '', '', 0, 1, '', '', '', '2019-11-19', '00:00:14', 3, 'عتت', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(21, 37, '', '', '', 0, 1, '', '', '', '2019-11-24', '00:00:20', 5, 'حجزطاولتين', 1, 1, 0, '2019-11-22 21:50:45', NULL),
(22, 39, '', '', '', 0, 1, '', '', '', '2019-11-24', '00:00:00', 2, 'احلا اكل', 1, 1, 1, '2019-12-12 20:00:02', NULL),
(23, 38, '', '', '', 0, 1, '', '', '', '2019-11-29', '00:00:20', 5, NULL, 1, 1, 0, '2019-11-22 21:50:45', NULL),
(24, 38, '', '', '', 0, 1, '', '', '', '2019-11-27', '00:00:17', 3, NULL, 3, 1, 0, '2019-11-22 22:15:47', NULL),
(25, 38, '', '', '', 0, 1, '', '', '', '2019-11-28', '00:00:23', 7, NULL, 2, 1, 0, '2019-11-22 22:15:07', NULL),
(26, 38, '', '', '', 0, 1, '', '', '', '2019-11-26', '00:00:23', 4, NULL, 2, 1, 0, '2019-11-22 22:01:26', NULL),
(27, 39, '', '', '', 0, 1, '', '', '', '2019-11-26', '00:00:08', 2, NULL, 1, 1, 0, '2019-11-22 22:05:52', NULL),
(28, 38, '', '', '', 0, 1, '', '', '', '2019-11-26', '00:00:17', 5, NULL, 1, 1, 0, '2019-12-10 20:24:16', NULL),
(29, 17, '', '', '', 0, 1, '', '', '', '2019-12-12', '00:00:23', 5, NULL, 3, 1, 0, '2019-12-10 20:25:22', NULL),
(30, 17, '', '', '', 0, 1, '', '', '', '2019-12-13', '00:00:23', 8, NULL, 2, 1, 0, '2019-12-10 20:24:53', NULL),
(31, 1, '', '', '', 0, 1, '', '', '', '2019-11-13', '13:25:00', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 1, '2019-12-17 10:38:49', NULL),
(34, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:38:49', NULL),
(35, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:38:49', NULL),
(36, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:38:49', NULL),
(37, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:46:34', NULL),
(38, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:46:45', NULL),
(39, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:46:52', NULL),
(40, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 10:48:39', NULL),
(41, 1, '', '', '', 0, 1, '', '', '', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 1, 0, '2019-12-17 11:20:17', NULL),
(42, 17, '', '', '', 0, 1, '', '', '', '2019-12-26', '12:20:00', 5, NULL, 1, 0, 1, '2019-12-21 08:20:02', NULL),
(43, 81, '', '', '', 0, 1, '', '', '', '2019-12-26', '04:45:00', 2, NULL, 1, 0, 0, '2019-12-22 17:45:27', NULL),
(44, 81, '', '', '', 0, 1, '', '', '', '2019-12-24', '15:00:00', 5, 'اتم', 1, 0, 1, '2019-12-22 11:00:02', NULL),
(45, 76, '', '', '', 0, 1, '', '', '', '2019-12-24', '15:00:00', 6, 'Hhf', 1, 0, 1, '2019-12-22 11:00:02', NULL),
(46, 81, '', '', '', 0, 1, '', '', '', '2019-12-27', '15:10:00', 10, NULL, 2, 0, 0, '2019-12-24 10:39:31', NULL),
(47, 81, '', '', '', 0, 1, '', '', '', '2019-12-27', '13:05:00', 5, NULL, 2, 0, 0, '2019-12-24 10:40:45', NULL),
(48, 81, '', '', '', 0, 1, '', '', '', '2019-12-28', '14:02:00', 2, NULL, 4, 0, 0, '2019-12-24 12:04:31', NULL),
(49, 81, '', '', '', 0, 1, '', '', '', '2019-12-28', '14:05:00', 5, NULL, 3, 0, 0, '2019-12-24 12:07:01', NULL),
(50, 96, '', '', '', 0, 2, '', '', '', '2019-12-30', '11:10:00', 5, 'Dbf', 1, 0, 0, '2019-12-26 18:10:56', NULL),
(51, 96, '', '', '', 0, 1, '', '', '', '2019-12-29', '12:14:00', 4, 'Gjn', 4, 0, 0, '2019-12-26 12:43:41', NULL),
(52, 96, '', '', '', 0, 1, '', '', '', '2019-12-31', '17:24:00', 2, NULL, 2, 0, 0, '2019-12-26 12:47:09', NULL),
(53, 81, '', '', '', 0, 1, '', '', '', '2019-12-31', '12:29:00', 5, NULL, 1, 0, 0, '2019-12-30 19:29:35', NULL),
(54, 1, 'Hassan Gamal', 'hassan.alex26@yahoo.com', '1225892523', 20, 1, 'Al Baik x', 'admin@albaik.com', '01066365287', '2019-11-06', '00:00:11', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 0, 0, '2019-12-31 13:46:03', NULL),
(55, 81, 'iron dot', 'irondot@xyz.com', '56913552', 973, 2, 'restaurant test r', 'test@gmail.com', '111111111111', '2020-01-23', '03:35:00', 5, 'رن', 1, 0, 0, '2020-01-02 17:35:41', NULL),
(56, 98, 'mmmm', 'mm@m.com', '1062351616', 20, 1, 'Al Baik x', 'admin@albaik.com', '01066365287', '2020-01-05', '17:49:00', 12, 'Tt', 1, 0, 0, '2020-01-05 23:49:39', NULL),
(57, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 1, 'Al Baik x', 'admin@albaik.com', '01066365287', '2020-01-30', '15:59:00', 5, NULL, 1, 0, 0, '2020-01-07 00:00:15', NULL),
(58, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 17, 'final restaurant njjn', 'restaurant@reg.com', '01145852523', '2020-01-23', '14:00:00', 5, NULL, 1, 1, 0, '2020-01-06 15:00:53', NULL),
(59, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 17, 'final restaurant njjn', 'restaurant@reg.com', '01145852523', '2020-01-08', '15:01:00', 1, 'ليا ده من بدق للنقد', 1, 1, 0, '2020-01-06 15:01:26', NULL),
(60, 105, 'hello reservation', 'hello@irondot.com', '542187365', 966, 17, 'final restaurant njjn', 'restaurant@reg.com', '01145852523', '2020-01-07', '13:11:00', 5, 'Ffgg', 2, 1, 0, '2020-01-06 15:03:27', NULL),
(61, 107, 'ايرون دوت تال', 'hreg@test.com', '57558685', 974, 18, 'gvhgv', 'yffy@gh.hg', '5485345', '2020-01-30', '15:29:00', 2, 'Fhmk', 3, 1, 0, '2020-01-08 12:29:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_latitude` varchar(100) NOT NULL,
  `restaurant_longitude` varchar(100) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `restaurant_latitude`, `restaurant_longitude`, `city_id`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(1, '4545', '45', 2, 1, 1, '2020-01-14 09:06:05', NULL),
(2, '5555', '44444', 6, 1, 1, '2019-12-16 15:01:12', NULL),
(3, '8888', '22222', 6, 1, 1, '2019-12-22 08:15:22', NULL),
(4, '8888', '22222', 6, 1, 1, '2019-12-22 08:16:42', NULL),
(5, '8888', '22222', 6, 1, 1, '2019-12-22 08:17:14', NULL),
(6, '8888', '22222', 1, 1, 1, '2019-12-22 08:18:24', NULL),
(7, '8888', '22222', 1, 1, 1, '2019-12-22 08:18:50', NULL),
(8, '8888', '22222', 1, 1, 1, '2019-12-22 08:19:33', NULL),
(9, '8888', '22222', 1, 1, 1, '2019-12-22 08:22:03', NULL),
(10, '8888', '22222', 1, 1, 1, '2019-12-22 08:22:21', NULL),
(11, '8888', '22222', 1, 1, 1, '2019-12-22 08:23:18', NULL),
(12, '8888', '22222', 1, 1, 1, '2019-12-22 08:23:56', NULL),
(13, '8888', '22222', 1, 1, 1, '2019-12-22 08:24:21', NULL),
(19, '4545', '4545', 3, 1, 1, '2020-01-14 09:05:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_description`
--

CREATE TABLE `restaurant_description` (
  `restaurant_description_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `restaurant_name` varchar(50) NOT NULL,
  `restaurant_description_part` varchar(150) NOT NULL,
  `restaurant_description_full` text NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant_description`
--

INSERT INTO `restaurant_description` (`restaurant_description_id`, `language_id`, `restaurant_name`, `restaurant_description_part`, `restaurant_description_full`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Al Baik x', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, '2019-12-17 13:28:40', NULL),
(2, 2, 'البيك', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي ويُستخدم في صناعات المطابع ودور النشر.', '(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف.', 1, '2020-01-13 14:07:46', NULL),
(3, 1, 'restaurant test r 4', 'dddddddddd', 'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 2, '2020-01-14 08:21:17', NULL),
(4, 2, 'مطعم تجريبي ع', 'ييييييييييييييييييييييييييييييييييي', 'ييييييييييييييييييييييييييييييييييييييييً', 2, '2020-01-14 08:21:17', NULL),
(5, 1, 'jhhh 77', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhh ghh ghj jhjhgh ghh ghj jhjhhgh g', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhghghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh gh', 9, '2019-12-22 08:22:03', NULL),
(6, 1, 'jhhh 77', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhh ghh ghj jhjhgh ghh ghj jhjhhgh g', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhghghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh gh', 10, '2019-12-22 08:22:21', NULL),
(7, 1, 'jhhh 77', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhh ghh ghj jhjhgh ghh ghj jhjhhgh g', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhghghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh gh', 11, '2019-12-22 08:23:18', NULL),
(8, 1, 'jhhh 77', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhh ghh ghj jhjhgh ghh ghj jhjhhgh g', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhghghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh gh', 12, '2019-12-22 08:23:56', NULL),
(9, 1, 'jhhh 77', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhh ghh ghj jhjhgh ghh ghj jhjhhgh g', 'hgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhghghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh ghj jhjhgh ghh gh', 13, '2019-12-22 08:24:21', NULL),
(20, 1, 'restaurant test r 4', 'dmf e m few', 'femj fkwefkewk fkjwejkf ewjf', 19, '2020-01-14 09:05:13', NULL),
(21, 2, 'البيك جديد 5', 'لوريم إيبسوم هو ببساطة نص شكلي ويستخدم في صناعات المطابع ودور النشر.', 'ى يبنثصبنتثصبتصث بثصتً kem fwe', 19, '2020-01-14 09:05:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `created_at`, `updated_at`) VALUES
(1, '2019-11-18 13:00:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_description`
--

CREATE TABLE `setting_description` (
  `setting_description_id` int(11) NOT NULL,
  `currency_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `setting_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `setting_description`
--

INSERT INTO `setting_description` (`setting_description_id`, `currency_name`, `setting_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'SAR', 1, 1, '2019-11-18 13:03:15', NULL),
(2, 'ريال', 1, 2, '2019-11-18 13:03:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `created_at`, `updated_at`) VALUES
(1, '2019-10-23 10:35:56', NULL),
(2, '2019-10-23 10:36:07', NULL),
(3, '2019-10-23 10:36:07', NULL),
(4, '2019-12-11 12:42:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status_description`
--

CREATE TABLE `status_description` (
  `status_description_id` int(11) NOT NULL,
  `status_name` varchar(20) NOT NULL,
  `status_title` varchar(100) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_description`
--

INSERT INTO `status_description` (`status_description_id`, `status_name`, `status_title`, `status_id`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'new', NULL, 1, 1, '2019-10-23 11:03:01', NULL),
(2, 'جديد', NULL, 1, 2, '2019-10-23 11:03:01', NULL),
(3, 'accepted', 'Your request has been successfully accepted', 2, 1, '2019-11-22 22:11:02', NULL),
(4, 'مقبول', 'لقد تم قبول طلبك بنجاح', 2, 2, '2019-11-22 22:10:24', NULL),
(5, 'canceled', 'Your request has been denied', 3, 1, '2019-11-22 22:11:33', NULL),
(6, 'مرفوض', 'لقد تم رفض طلبك', 3, 2, '2019-11-22 22:10:41', NULL),
(7, 'finished', 'the reserve is finished', 4, 1, '2019-12-11 12:45:22', NULL),
(8, 'تم الانتهاء', 'لقد تم الانتهاء من طلبك بنجاح', 4, 2, '2019-12-13 20:28:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `api_token` varchar(60) DEFAULT NULL,
  `pin_code` varchar(20) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `token` text,
  `phone_code` smallint(6) NOT NULL,
  `default_language` int(11) NOT NULL DEFAULT '2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `gender`, `image`, `api_token`, `pin_code`, `is_used`, `active`, `token`, `phone_code`, `default_language`, `created_at`, `updated_at`) VALUES
(1, 'Hassan Gamal', '1225892523', 'hassan.alex26@yahoo.com', '$2y$10$OU1yYVR09fxqxpclI03ZSu60DoWPsoJTXk/HCFeXEbWW8Niz7/GFu', 'male', 'images/user/pic_1573562901.jpg', 'Dykg3VUesGQofaleAdzWU1gW8UOJPO7eFILmZkXBoawLqTVGXZs6jEkqaskv', NULL, 0, 1, NULL, 20, 1, '2020-01-08 08:15:07', '2019-12-23 20:06:13'),
(2, 'saifallak', '01129261195', 'saifallak@yahoo.com', '$2y$10$Eijqp5/AqR93BjUqoMCczuMDG0A4lxd4ZeGl8Qwv2TweZM3odCy9.', 'male', 'images/user/avatar_user.png', 'Y77wNcb304GpMzUF9VUIROE8JARO9gih9wQ5OGfroQMv3klvjzcIOQe3whYO', '2544', 1, 1, 'fsQOSDAoP-o:APA91bGQprQblE5bOQ2SFBLUwn8XKOLFGa3khU-sJkX5tovI1BadsPLwogbwz6pvk_2greh5ju5gcH0XVKPO2ZtbQ8rva3vyWT13T9dIb_BKg3-cKGnFrcLZi04pw3sUiLTubIm8jtHk', 0, 2, '2019-11-23 22:29:52', '2019-11-23 04:17:35'),
(5, 'Why Should I Tell you my name dear friend', '01129261190', 'Why@irondot.com', '$2y$10$R.ttq3BHH82Z9.hsCfjgn.5IS0aIUCZC9UruzMhsABwYlpZqs6Xd6', 'male', 'images/user/pic_1573554287.jpg', '9enmK8DvIoLZZZJb7BhAi7YdwPjYUsqjCJzfcCaS1016nU5WO1cNo6ZVqnfW', NULL, 0, 1, '', 0, 2, '2019-11-13 09:37:04', '2019-11-13 16:37:04'),
(6, 'mohamed', '01000922720', 'mohammed@hefny.me', '$2y$10$8Dfl6eS68fctWnuqOPXN6OVec4MXnhT3WaL1sjQJ.Gn3YeHCvvBY2', 'male', 'images/user/HEzrHXJhssPV5GyIVn1V63BmEi5JREgoYpQUwok3.jpeg', 'i8rYfv7OZ0EsgZwYOinv7cMq5HXsLCgX69abwXxGx8LYReMf8uhWI7vKjbY8', NULL, 0, 0, '', 0, 2, '2019-11-20 07:44:48', '2019-11-12 19:58:20'),
(7, 'mmm', '01062351615', 'midorock2009@gmail.com', '$2y$10$bPdikHISaDJp0TSlXRc5TObxRjGbJQthARsbPfrLYEaW3h9k2Gb0W', 'male', 'images/user/pic_1573558659.jpg', 'qp4dOFmXcMw1bCOKr7RfzjJE1mXpX9gv12fK9YC8QaTIyOx8fq5jd1rYZA6b', NULL, 0, 1, '', 0, 2, '2019-11-12 18:37:39', '2019-11-12 18:37:39'),
(9, 'Saif', '01129261199', 'Saif@IronDot.com', '$2y$10$7nx0MMvQp.ovwQEdVMWTue8ek62mzNo80fuh3wy/roFmxbDaTyqQq', 'male', 'images/user/pic_1573632277.jpg', 'nnHlsgjPelbyQY5W1EMkznQOj4SGjZwHeBJb9LjCZaGQuxMn8ZCBMs3uF2NL', NULL, 0, 1, '', 0, 2, '2019-11-13 13:53:07', '2019-11-13 15:04:50'),
(11, 'hefnawy', '01000922723', 'hefnawy@me.co', '$2y$10$s6iYXyHXTU4zTuzGB/hFZeUX8wLadSL8f88gNQWIlvLz7vVvctlqq', 'male', 'images/user/pic_1573655141.jpg', 'c1aCm0YjYaghfBVe7T3vqmszodjr9fvXQzVnHTNVn8H5j9urHvA13gRZftHE', NULL, 0, 1, '', 0, 2, '2019-11-13 15:02:45', '2019-11-13 22:02:45'),
(12, 'fgcv', '0123456789', 'h@n.m', '$2y$10$rJFrqEC/2SCulh0ANvXoRuGMhbHzwxRAtRft7BI.D5uL9HeM0N4mC', 'male', 'images/user/pic_1573725796.jpg', 'q3obFSKxH1EGRKQiF9izcDr1lskNlGRO55MkekvzO0bhR2nBLbLTOeFlCvtt', NULL, 0, 1, '', 0, 2, '2019-11-14 17:03:16', '2019-11-14 17:03:16'),
(13, 'mmmm', '01062351619', 'midorock2089@gmail.com', '$2y$10$B5qBHfPRKhy6BwacA4ThB.5fSvpMND.RMQl.V0xpGAb97w2QJ0MF6', 'male', 'images/user/pic_1573729133.jpg', 'hV20d0kQqvVy4ulKkWHTG6SMeXuBuSF1rzMUhG8SA56HUNNLHsvNa5Q5jbJD', NULL, 0, 1, '', 0, 2, '2019-11-14 17:58:53', '2019-11-14 17:58:53'),
(14, 'Hassan', '01272252319', 'hassan.alex30@gmail.com', '$2y$10$/NIH2GBY59.S2WFEHeAc7eo9tST7qbUOgfKacUXIp0lyfCoZk0P8O', 'male', 'images/user/pic_1573729458.jpg', 'ONEyOXWkGSijJ6CXztjWftE4aqT3JJjRu3ROmk0SFikHJWgJeB3dvgAperji', NULL, 0, 1, '', 0, 2, '2019-11-14 18:04:18', '2019-11-14 18:04:18'),
(16, 'nassar', '0123456780', 'nassar@test.com', '$2y$10$9sBngEeUABkNV4pqZNylFeCQJZ3sxwBMTHI/tafy0XU4uQRzzi2Tu', 'male', 'images/user/pic_1573904272.jpg', 'W8uDyYG0vRilPdnaroWFxqadaBwnRCAa60rqzjOlQ3GZng5SFzjTFgR2wfXi', NULL, 0, 1, '', 0, 2, '2019-11-16 18:37:52', '2019-11-16 18:37:52'),
(17, 'ziyad', '569135523', 'bsf7315@live.com', '$2y$10$y8N3C9VtvUltSgKjkG5fE.yx8atRy7nIpDZnzXP/ayLoVIKv8JruK', 'male', 'images/user/pic_1573906365.jpg', 'nIdyrHuEUB6YU7ho8QJKwtXUlcmrIPO2Ad320HGS98xXkHlVGUlz6UUaPoxs', '1440', 1, 1, 'f8nUI94KVyQ:APA91bFyA-7NQqhNsSQy8QmzYQLPoKcsIx7pox4SkNOAxxsCykozMim9WQ6ymi7SqzhosX76AQW7L3t-mjByG9RBNpHy8u3_-dHlaQ7hE8kLTyIg0FqXmLVCpnwW8ZEGuyTyHsjegW2w', 966, 2, '2019-12-27 18:09:34', '2019-12-28 01:09:34'),
(18, 'nnnnmm', '0123456785', 'midorock2009@yahoo.com', '$2y$10$zuTK5xdhVrjH4DnZkqisMeO7DmzM6SkmZcoZErjFmTarWsCfgVmDK', 'male', 'images/user/pic_1573907445.jpg', 'uxPEPtBv4BXizN2BEYgPOuIfrSrT9iDe7NlAGJWC0bQC7Ftpkdn8aWyUClyi', NULL, 0, 1, '', 0, 2, '2019-11-16 19:30:45', '2019-11-16 19:30:45'),
(19, 'ahmed', '0505280633', 'bsf73155@gmail.com', '$2y$10$3imijH7fuU8/3MWLY9OjkOuvFi1FPFKnMOnOTX74Ed9tUNkBSy8H.', 'male', 'images/user/pic_1573908890.jpg', 'T0rQIoPC3RvqsGN6q9I6uBWWvLZofoMxpV7R3g0rzX1nzAG1vLgTEWEMwZGI', NULL, 0, 1, '', 0, 2, '2019-11-16 19:54:50', '2019-11-16 19:54:50'),
(20, 'mmmm', '01062356119', 'mido@test.com', '$2y$10$0G4kNfaCvxGBmqVt45ToCeR9toyveLUSDEGaos/zG2NIUKDe/2THq', 'male', 'images/user/pic_1573909607.jpg', '3vUxDA5zN95WMOCeSeunva8Y8Rrcyl23VrLwo6Ft2H8qYVq7Dc4eyYMKb7Gg', NULL, 0, 1, '', 0, 2, '2019-11-16 14:36:24', '2019-11-16 20:06:47'),
(21, 'asb', '1122334455', 'a@g.com', '$2y$10$f2JAEwNgMLqdjSEH1e5UT.Vu5cm/ovT/6ZCyiS80c7KKfsA.craMe', 'male', 'images/user/pic_1573990427.jpg', 'Yq5kXQxsJmTghK5WjUtq6xUiklCtt79ECtgHORNg6pFyzrBXyyXgrWfWBT6v', '1504', 0, 1, '', 0, 2, '2019-11-17 11:50:58', '2019-11-17 18:50:58'),
(22, 'test1', '1122334467', 'aaa@g.com', '$2y$10$W9/W5dujThbupBpA3U3cH.RYmgJHAJufvECw7Wwx9iqNpmu7Z/fR6', 'male', 'images/user/pic_1573992050.jpg', 'TN9qXEd3qIbottwAD7DyeE490afCVlO0egmmmnf5MvjfqB7CGeFBGVPhm8rQ', '9513', 0, 1, '', 0, 2, '2019-11-20 07:40:57', '2019-11-17 19:48:20'),
(24, 'Hassan Gamal Hassan', '01272252219', 'hassan.alex50@yahoo.com', '$2y$10$hkLMtcar9HaLML09M/qvMuyV4KBvDs4NpCd.5IEPMHjcNkRj94XcK', 'male', 'images/user/iVC1epGbKcFt3Iwh1IVvHZmrAJ9Oku4qzFcKz8Dz.jpeg', 'nuiJvvyXWX4WPaGZ3AtHxWdXobZATHTgopb9p6dC0SYvwa20gAaMvziYK9Rl', NULL, 0, 1, '', 0, 2, '2019-11-20 14:46:14', '2019-11-20 21:46:14'),
(25, 'Ali alyosef', '0503243943', 'alialyosef@gmail.com', '$2y$10$8Hp/HUYWSIVLj.K3k9w..uNXhKt6Z9HLt8MU8wSJEcTKuGCvO4YT.', 'male', 'images/user/pic_1574254815.jpg', 'P4ynRQP0NJGUwx4ES73ta6wh0idetJvPggM40jj2oFCZIwjDwC5l1npp5RuY', NULL, 0, 1, '', 0, 2, '2019-11-20 17:57:24', '2019-11-20 20:00:15'),
(26, 'Hassan Gamal Hassan', '01275252219', 'hassan.lex50@yahoo.com', '$2y$10$TMV4guiMUyxlnrcRJozYku4/7voB9dWyA8.Uknp9ckpNnI7Yjwwxa', 'male', 'images/user/avatar_user.png', '3RhLr76NHWBC8LRDO0zAJnNjwdQ8yl2LwqO1eCaZKQG0MGWhuOv3AH5My3ZX', NULL, 0, 1, '', 0, 2, '2019-11-21 08:23:11', '2019-11-21 08:23:11'),
(27, 'my name is mohamed fathy', '1234567890', 'myemail@ishere.withyou', '$2y$10$loQoUUhh5ZX29gEQe6EIt.aUF6kJPTuoiuBRiWHuiWwbbA9TVAGuO', 'male', 'images/user/avatar_user.png', 'cELICbXjZnR3Va1toWWYPDR1rjt8Ar2nTAuB7GTXgpSH4cLIxiGj79CsXhmc', NULL, 0, 1, '', 0, 2, '2019-11-21 08:28:47', '2019-11-21 08:28:47'),
(28, 'saifallak', '01129261192', 'saifallakx@gmail.com', '$2y$10$6hfIjtNFifRZy7TurXc6oOMy7cmlElaPWIYB6yxAMyN76TCQ2qgrO', 'male', 'images/user/avatar_user.png', '1GSZ3PQYlnCqGdERHwjzwowQmlbu8EcHWXrCfQiTGaFBdIkSiI5UhYNzpmoW', '3687', 0, 1, '', 0, 2, '2019-11-21 04:10:41', '2019-11-21 11:10:41'),
(30, 'Hassan Gamal Hassan', '01272252218', 'hassan.alex51@yahoo.com', '$2y$10$7EcPbRFbRrko5nngYO9.gehdk1DAkw7Ua6fRecl/Rg3ftnu7.ydYy', 'male', 'images/user/logo_avatar.png', 'tEbV4vc4f9nlUw1oTlu1eQ0eF39bveG3asfj49kK5A6yq4ffFi05EbAu6Zk3', NULL, 0, 1, '', 0, 2, '2019-11-21 15:15:36', '2019-11-21 15:15:36'),
(31, 'Hassan Gamal Hassan', '01272252217', 'hassan.alex52@yahoo.com', '$2y$10$RnA8B2WtfAnkWw/eM.QLAeUfm173RYPieXyeazoCcklLEJtPnUmcO', 'male', 'images/user/logo_avatar.png', 'm5igSqA0QChRqQweAGOfCCGvlaUv4nASco7zNdHvWE8D9XQc3QlLYQQxxZdR', NULL, 0, 1, '', 0, 2, '2019-12-18 10:10:16', '2019-11-21 19:35:41'),
(33, 'محسن محمد', '9661234567897', 'MohsenMohamed@User.com', '$2y$10$z2N9KjeYZJnYMOZVEImbY.a8m8.BDffw96OopJC4BP4n9Z7EUaRlm', 'male', 'images/user/logo_avatar.png', 'WFK6rM4iPryZZAwi41NzKj6EHtGPqfbVU4L5ZpPLCZiPeiWYSxefEz62r4IR', NULL, 0, 1, '', 0, 2, '2019-11-21 23:05:21', '2019-11-22 06:05:21'),
(34, 'Hassan Gamal Hassan', '01272252289', 'hassan.alex522@yahoo.com', '$2y$10$xmJYjDkkLbw4gx8sHt80s.XNn.24JXhSLeY5djOvNL7oDT6LMpkGW', 'male', 'images/user/logo_avatar.png', 'qmyQK3hgphuRPqCjvY4S71tb79tubwbglsiHdqEWn7o2j5TFMmzVsIQyKuWo', NULL, 0, 1, NULL, 0, 2, '2019-11-22 08:26:00', '2019-11-22 08:26:00'),
(36, 'نواف', '9660505817419', 'abozyiadalsaleh@gmail.com', '$2y$10$fGZFsIUr9H7aRCq93nNv8uEkQR3hvpEM3BT18.ePvi5OplDXgFigm', 'male', 'images/user/logo_avatar.png', 'aHtwbZlTMXegdDmkCm5snkEZE5YtSGHG9M407RbyIScxvHzBeKdU3bq8Th1g', NULL, 0, 1, NULL, 0, 2, '2019-11-22 19:59:42', '2019-11-22 19:59:42'),
(37, 'naif', '966563402788', 'naifalsaleh5@gmail.com', '$2y$10$JRlxKhTwhGP8Uv7V3lWrme/zjzWNN/sY8c386SYzlTfFA5Tir5BMy', 'male', 'images/user/logo_avatar.png', 'P4Y0bIrYWU8kYM2RHxeolMucsvKtpE3XIQbyvOZAcHLQBPjnjt8al2wZYy6x', NULL, 0, 0, NULL, 0, 2, '2019-11-24 22:08:15', '2019-11-22 20:01:43'),
(38, 'salah', '2001091445377', 'abosalahzakrallah@gmail.com', '$2y$10$QDULs/M3QaBG6GdZNSnzjOHa5QH8h74377Ks9NuKZujg7S5AZbJPC', 'male', 'images/user/logo_avatar.png', '1lC48s2MVOnl1NxTwPgoldiNVPoJlW65fr7EqMZfUynk9GMjNWCqsDf9t3c3', NULL, 0, 1, 'fGGSOh1PVfU:APA91bH5q0g8Uio8sjJxDnO7pL-SXP8-9b1hj8H_fWWE_HlIdYdAMJf1CjWtlf8PSmF8V8F_VXX-6wXpygd0nqcXZpobmvucp_BY3aYPSbMWk1pKyEYHkIZyHWpg5buPy88IrBLs-MKN', 0, 2, '2019-11-23 22:24:03', '2019-11-23 03:57:20'),
(39, 'مصطفى المهنا', '9660597303339', 'tmtom223322@gmail.com', '$2y$10$RHQYYM.JGziF6YemSas5quJrwAwt8R5//HVt1Ln9XlKd62LwjVuT2', 'male', 'images/user/logo_avatar.png', 'bRjIDHCrrP4hbGe5UFvSfwR0SiBYrzl0zxpRy0AGV1vxKH0dxOEGdLz3aZpm', NULL, 0, 1, 'cOzaxv2-uO8:APA91bFYMh8fZUJxaS8WjnbKD0oO6-fPFqUGjojZ7ynnPpLOH6p64MJGRk6S1oLSWfhG1RyiorNVZLEa-LU5UUnmopdgzKBFPUWRmNVVT_N6exfAO25jAPR9Sd9cFeDCz-I8QuXwgz1x', 0, 2, '2019-11-22 22:03:04', '2019-11-23 04:32:37'),
(40, 'muhmmed', '201552427342', 'midorock2009@hotmail.com', '$2y$10$.vRhB4XY5I9BOWX6VurIHelml7AgHfgQNDUxRGU06MKnp8BbHOyJq', 'male', 'images/user/logo_avatar.png', 'qC3f2Od0BwU5UhSr2Pukkaq7F9H6KntSjh0yqPci3rvQ6xsxIrTokiELuKVi', NULL, 0, 1, 'fM77uBAeEzI:APA91bFuMvt9RacGscD5lPb-TwyucnmFA1kAJjoX-NIKVDZ4KnxDFGWVlu5L_iAHWWU5zUBbqtaWMFRVyfsa_eECO6QmEy-C1KOxWwIRjPvPq4XdJKHBMkwgSbVwsV2LWzrxKW7QY890', 0, 2, '2019-11-23 23:12:13', '2019-11-24 06:12:13'),
(41, '1111111', '2012345678757', 'm@m.com', '$2y$10$aekOo4F3XEF.JL.2h0dgzuk.Q7UnYhaFSfk6AUqTBtTcGd07BLX5.', 'male', 'images/user/logo_avatar.png', 'R13BCzhqRu8IqeLUIFBj2t4zSHURtCQz1MjlevVkLzFykoEVcVpqc79akf0m', NULL, 0, 0, 'cglIjX8U46o:APA91bETS6W8iYpeJrZKKXkqcIphHkpIxrFfEUuuH5ydwjJUPiby_uApM1cHNHE6ibAKp6yQKksOtznSqUE9kROIu_yDfXADQOWiBwNC-3gRigljWd-gvsf5R5DgTQtf2iIhdn34xnUX', 0, 2, '2019-11-24 21:35:04', '2019-11-23 09:43:27'),
(42, 'Hassan Gamal Hassan', '01272251217', 'hassan.alex16@gmail.com', '$2y$10$5d3th9Km0quCK865ZCEWiOnUQDdQgNdS890Oq9kz9jSbgvPOoQQk.', 'male', 'images/user/logo_avatar.png', 'lu3nd8ZDZhSz8SofZh0gvCY7JHUugJMIcRc94U6xprKD5nteovf9KcGmriEL', NULL, 0, 1, NULL, 0, 2, '2019-11-27 20:59:30', '2019-11-27 20:59:30'),
(45, 'Hassan Gamal Hassan', '01278252217', 'hassaasn.alex52@yahoo.com', '$2y$10$xZgJr8GKehb.bmD0AhbuX.m3MDGVFX51bmCXJSzp8VO2VwugyARlK', 'male', 'images/user/logo_avatar.png', 'BC02mzmi3wjHBxGOkwKbarNDuuGaqrs2h2kgx0iKZNs9WQBa3KtUxFMf3Cim', NULL, 0, 1, NULL, 0, 2, '2019-12-11 18:18:31', '2019-12-11 18:18:31'),
(46, 'Hassan Gamal Hassan', '01278252297', 'hassaasaan.alex52@yahoo.com', '$2y$10$dasmbPWq9svq9Ym6fyG9Tehxs/dA4uEd7WvEX8U5.1XZXKdBta1bC', 'male', 'images/user/logo_avatar.png', 'QrkRXquLl8jTcX8Bm6Vr5Ty7vlZnzhQV4AzTJcie0X1l7NLp2zlEgIXkbb4W', NULL, 0, 1, NULL, 0, 2, '2019-12-11 18:18:49', '2019-12-11 18:18:49'),
(47, 'Hassan Gamal Hassan', '01238252297', 'hassAAaasaan.alex52@yahoo.com', '$2y$10$IsXoIR4fbt954yeN9sIYVOXkppTrBRIi62EnapzzSnh5CfaK8BkUi', 'male', 'images/user/logo_avatar.png', 'qkM94lh2tDsNmbUZWoiW1hEAimh6msGcEabTZIAfxtIbh0rRs1KxgGeGpnbs', NULL, 0, 1, NULL, 0, 2, '2019-12-11 18:19:02', '2019-12-11 18:19:02'),
(48, 'Hassan Gamal Hassan', '01238452297', 'hassAAaasAAAaan.alex52@yahoo.com', '$2y$10$3SAV9iaRxOaQV5hqyTCMU.OOLSGEM42weK1azpZenfnmtY/q7Er0.', 'male', 'images/user/logo_avatar.png', '6DrJcbBVC3RfY5M1GR7rt3BYiybba8OAcohZAjP5LeyUZmkony2MdEniizJN', NULL, 0, 1, NULL, 0, 2, '2019-12-11 18:20:34', '2019-12-11 18:20:34'),
(49, 'Hassan Gamal Hassan', '01238452497', 'hassAAaaAAsAAAaan.alex52@yahoo.com', '$2y$10$jOINjnrPXrIYgDp7ia5YJ.wOqfA4BScpyBtwB6gKPTfiuq5ZN.ozG', 'male', 'images/user/logo_avatar.png', '46sPlc1BI7EVtrvy31gVFVE7RjaAmkJIMP8wghWHbED4msujDK0OUQnfyEfM', NULL, 0, 1, NULL, 0, 2, '2019-12-11 18:20:42', '2019-12-11 18:20:42'),
(51, 'Hassan Gamal', '2001272252219', 'hassan.alex26@gmail.com', '$2y$10$Fh.fmdiV3jmVguN86aG1HeEwxwX6yge5GAiNmvV0PNOfFtmJEdx.W', 'male', 'images/user/logo_avatar.png', 'TJIvEbCtVwMBPWxiaX8l3bYVhdIocxSS4yxdZZfEeDjXgvzTSFy2E1Z7iSTd', '6481', 0, 1, '', 0, 2, '2019-12-17 13:00:53', '2019-12-16 19:01:16'),
(53, 'Hassan Gamal Hassan', '01272255217', 'hassan.aslex52@yahoo.com', '$2y$10$Xd0Il6b/UKgtBlCDG2b9CeB/jxCoJcsx/AHuq8bZLL8oZEcTSjwj.', 'male', 'images/user/logo_avatar.png', '8tSqdosXffq9KjXUrAnPD3Y8Ngn0COq1jc79E4dKJrsdgPZJyyeXSUeYKhOc', NULL, 0, 1, '', 0, 2, '2019-12-12 09:20:18', '2019-12-12 16:14:47'),
(54, 'Hassan Gamal Hassan', '01234567890', '01234567890@yahoo.com', '$2y$10$KoWdPh5/nFGWXBnUzAAn.O7sw8e3tCxzfVkmGnkndGBI.bO.oPhdu', 'male', 'images/user/pic_1576142401.jpg', 'cDkAcfT8HOchuNFNsNRY9xYWP65VBUBPQRMuAoxm45HBjMug24sGbK3BaTlu', NULL, 0, 1, 'euTdiBln1FQ:APA91bGL1yy9NN78ZfS6_nW1Uw4W-1TnBeYfZt2QBs-IkTcotlPaqc8QVrqI2yW6O0AJxS6-HmnQCaNMDw9MbDAngWcozkuF_BwkVZ5_6NyTkd9iP4ulz0GjfdceOz8fUqZlxzunRjM8', 0, 2, '2019-12-12 13:06:57', '2019-12-12 16:20:01'),
(66, 'Hassan Gamal Hassan', '01272452217', 'hassaa.alex52@yahoo.com', '$2y$10$AgYdq4WqI84UVUWWQRjmDezGXikDL/Njgmhxfmy1hdBztPiUptTBG', 'male', 'images/user/logo_avatar.png', 'xRh5UHRyGPbk1Uq3r1JT59l5gPVbn6lpNt6oT4GLhNG0GOfWpk74CuWljEg4', NULL, 0, 1, NULL, 0, 2, '2019-12-17 16:00:51', '2019-12-17 16:00:51'),
(70, 'Hassan Gamal', '2001272252211', 'hassangamalhassan0@gmail.com', '$2y$10$0fP0xQ2BMxcZKXSGbDrlJOu9saoI6dzzjb62zlKdfAvEjxRP5cC2O', 'female', 'images/user/logo_avatar.png', 'zRB2fZBntJsCs3tkKLVz1xikScC6lxBpiPlrVTAk979zsh6kJwDJmO0R0UZS', NULL, 0, 1, '', 0, 2, '2019-12-18 09:55:07', '2019-12-17 21:41:09'),
(76, 'irondot test', '974555555555', 'irondot4@xyz.com', '$2y$10$JeX1Pu7WNHYVj72/79OM.eVmLZ.vJYCvNIwGMuYX.VrEXezglP2ee', 'male', 'images/user/logo_avatar.png', 'ZsQM99WEIchKEKHqvXexEfB4h3IT9TAiXJqvtPCkduUX8yu1KgQ03Xxgp4qW', NULL, 0, 1, '', 0, 2, '2019-12-24 08:09:50', '2019-12-18 16:15:25'),
(77, 'Saifallak', '201129261199', 'do_not_delete@thisacc.com', '$2y$10$dKfhppwTA/4hz604PfhlkOHbVdIMWL.809j9Q2i1AdNf/.bgzxNE2', 'male', 'images/user/logo_avatar.png', 'JisJnvjw8KrLHllrHvNwwKkCChQ05gNoVjYLSBdGEk6S5FxSwPzJuGtFeZrb', NULL, 0, 1, '', 20, 2, '2019-12-24 10:53:23', '2019-12-23 15:30:30'),
(78, 'Don\'t', '2001066665555', 'do_not_delete_that@this.com', '$2y$10$/eCJv3KFki82s7RAYXke.OWLctK01SPj7/2deTry82PrnNrZJaqna', 'female', 'images/user/logo_avatar.png', 'agziOkzC4GHr4Ow3wSIyVtPIcei5CXMU6L7uejsOX6bKIb461LFJu6kaGId0', NULL, 0, 1, '', 0, 2, '2019-12-18 10:44:47', '2019-12-18 17:19:29'),
(79, 'DO_NOt', '2001223232323', 'do_not_delete_that@acc.com', '$2y$10$1Lu13HF8BdDz2Zi/MrqWHuHABhE2WenE8hadXv/lMnMXWOChWV9DC', 'female', 'images/user/logo_avatar.png', 'NpMXJlG2tFHfa0XprMj2Q7jpdpD4u8a9V5gpq0ztShIYnCBfOUYTJHFzlvSA', NULL, 0, 1, '', 0, 2, '2019-12-18 10:47:05', '2019-12-18 17:46:35'),
(80, 'gigijlb', '2001265656565', 'helloo@helloo_gh.com', '$2y$10$0GgGZF/u6uYNN3jHnW9xve8rAsk3Y7dh30scnBKOMgZnb7w9zOdHm', 'female', 'images/user/logo_avatar.png', 'SRiEKwXANm5GD2JrHR8bgUPnZKBKyuXX5i7XCs2JeqkFX8qarb7ZRvipYX0K', NULL, 0, 1, '', 0, 2, '2019-12-18 10:48:40', '2019-12-18 17:48:00'),
(84, 'SSSSS', '0000000000000', 'ssss@ssss.aaaa', '$2y$10$2L.PfJqB.V7ysFZBd050muAzGnQAH3E6M5zPFVfY5hIvDL4Fybl4u', 'male', 'images/user/logo_avatar.png', 'ChsKC7boOyfjs6CXqZTeEG0Kn4RZGpOeEJOgXdFPd9HOElSRaF2s24eiLddj', NULL, 0, 1, '', 20, 2, '2019-12-23 12:38:03', '2019-12-23 15:54:02'),
(85, 'asdasdsa', '123456789', 'asdsad@asdasd.asdasd', '$2y$10$/Ni71ATG6XqIDgDod/radOM/loiNJASPDqxGXUvQUtrlR0vaABtqO', 'male', 'images/user/logo_avatar.png', 'MMC5cCzFbYNYXSeeMVYFSqF2zZpVRdSHtm0n65koN3bLqxD2FLoygmog8zil', NULL, 0, 1, '', 966, 2, '2019-12-23 13:13:03', '2019-12-23 19:45:43'),
(86, 'team', '500576778', 'm@mm.com', '$2y$10$DA4c3sDrTh8n5HS841bigOLoks7Cs2BLdWdTXIFDZ5.EVZsrBIXUa', 'male', 'images/user/logo_avatar.png', 'gQlBOeJ1beMwEmQNONj8sg7btojDxsKz3Vw5YVbS5e4fWiOUCYGYl1mM3vDy', NULL, 0, 1, 'eiFrapIoQBs:APA91bEj3tCSRBWP_yjwSx7LmRiHjBGuvN72dhX2BK3xU4N-MM4nXWmr0cPoPAUgKBMoJwTLZdynWto29NQViyk0S3HtY081roCKBWUxuYfF0hsADjCrckoW5rpdpL3VYn9mikNR1sS_', 966, 2, '2019-12-23 19:55:41', '2019-12-23 19:55:41'),
(87, 'hh', '500576772', 'm@mmm.com', '$2y$10$UJ/OmKQjNCe8a0J1vroEkezSZZSjVBRdIYlMCqp9L6JNp9ggAHYXq', 'female', 'images/user/pic_1577346884.jpg', '8rogrxhDN8nFiSRsdSBm8osIIRGl2Mo5iRxwgpuecRNU2zEn32o4EZzWRtH5', NULL, 0, 1, '', 966, 2, '2019-12-29 09:02:10', '2019-12-26 14:54:44'),
(88, 'Hassan Gamal Hassan', '01272233217', 'hassan1lex52@yahoo.com', '$2y$10$/1OcmwmPqoKgCS0p4nldp.qBqlev7vNnO2UyAz.a9EFfC3appI/2i', 'female', 'images/user/logo_avatar.png', 'b3SJ38wM3P0ZZfdAbqvrt1kx62n093cpbs7C7yRyGPu7SPfqkztMWZN0JAUf', NULL, 0, 1, NULL, 123, 2, '2019-12-23 20:26:51', '2019-12-23 20:26:51'),
(89, 'farida nabil', '1010689123', 'farida.nabil.maksoud@gmail.com', '$2y$10$EL2Tshfv7QsFlTjaf02GQ.IcnsTORte4g6wVxoIj3MI8hJaMUY/H.', 'female', 'images/user/logo_avatar.png', 'JdltlEDndU5sQkxe0KKfxUTtybaUYmCzXps4QDOlIrlkEd4D8YpWptunDW5d', NULL, 0, 1, 'ePEKKtfbefg:APA91bHs1v2_WNYHoUZ96hpAUPJ-A6ZCJrE_dKZFqce9fby-8UI6TJfQcpmWdlGoJV5yl9-MhYlZCkeKXAoAAUj_tk5uGQOwdnLuAiLfl_mCjpR18E8AHUkxLUiY1htQschl3hbNlNqs', 20, 2, '2019-12-24 10:02:31', '2019-12-24 16:55:33'),
(90, 'Saifallak', '1129261192', 'saifallakxx@gmail.com', '$2y$10$VJuxVDXPjc9feMU.BXBxcOCON9RNXdI3NIuylnnw0s/Lb9nutFxAC', 'male', 'images/user/logo_avatar.png', 'VkqphVc73K1OwafyAbHD4iHc7jYpjigUpvkW7SI5NSLyFeptTNgHUWIWMrZV', NULL, 0, 1, '', 20, 2, '2020-02-03 13:36:38', '2019-12-24 19:10:22'),
(91, 'iron dot test', '58467289', 'admin@test.comg', '$2y$10$ugjAHKW073uOw1QpHOh7XO1WS.BSIeXjNFc2m8d0WULq2MtZNRw5S', 'female', 'images/user/G3xJ52WxoGnfvA3lCfNY0sBHCT9xg4p6PHV9XXWy.png', 'tc6xr9K9DProXFKaBLCLKxyaQTD6FciPfbLWqSyGhqAOjFnXhXQaaGl7YEB2', NULL, 0, 1, NULL, 966, 2, '2019-12-24 13:16:48', '2019-12-24 20:16:48'),
(92, 'Hassan Gamal Hassan M', '1124578986', 'hassan.alex266@yahoo.com', '$2y$10$S36YSaYP0FAgmaaPcI7YzezIPerlDKXFZE7DIqi..kk9sczwzIBmq', 'male', 'images/user/yfq4DXNRqKQiUFkKwIZB6q4TvjXD0a1LbP7xMj5q.jpeg', 'vwfVfEJ7N5ts8IiW1EzylTVh4Keq6SL5JCbTpJmnI4XZF7muSoUE9XiN78qV', NULL, 0, 1, NULL, 20, 2, '2019-12-25 11:28:23', NULL),
(93, 'مستخدم ايرون دوت', '5876428225', 'irondot@user.com', '$2y$10$2UcLMo0/TNOwoC8NmHvM7eaOPAdLVaShR6YljpXxCOBe8ROhiCOA6', 'female', 'images/user/ILeN5MBSE3CSvzKWoa3f01U6sZp79wbaX8U6zPMf.png', 'ElZ7Eww0WAwC3kf6JrjEuMw4HDPEre6CRzbhpht8igmuO3S9AxUAbNgjBI12', NULL, 0, 1, '', 20, 2, '2019-12-26 08:48:55', '2019-12-25 19:30:30'),
(94, 'Saif', '1129261195', 'saif@irondot.org', '$2y$10$c8d5a1fgr.L4Fu7sKmSNweQCofUKK2aK.0Ddvp0eM4TXn1pKaPxSO', 'male', 'images/user/logo_avatar.png', 'MGlzESLq5XZQXPrKx7Xxvb2jmUX2BJ0RIhxp6rCYmVXKChqe7NUtiJSMhgPD', NULL, 0, 1, 'cdOuluhXksE:APA91bHbqHcW1UFhl-JCJIk93A-qsqtM-UXHXGNu22UmDCf0omuROBOFYV5RGpL3wyD2kxHDIGYDSWrh0A-wslNZy-n5kDSulcqfO1rIdUws3H50x2I10ne4YbYUaKrTxY9q0KOxCoEH', 20, 1, '2020-01-16 11:19:28', '2019-12-30 17:37:31'),
(95, 'irondot test', '8846754848', 'irondot@test2.com', '$2y$10$oORAvzxtSkkvGYeHP9fQHe2kukpvNpvKoKiXppQpojelQnwzLOHz2', 'female', 'images/user/logo_avatar.png', 'BQXFJgCtAuIV3BArPP8ZsXVXQamxTlxMbadUyE6re8K1eYqnN1aKLoTldhqy', NULL, 0, 1, '', 20, 2, '2019-12-26 08:50:47', '2019-12-26 15:50:24'),
(96, 'irondottest', '15427855', 'irondot@testing3.com', '$2y$10$WiZ2ts39tt9G9nZH3UQix.bQNg4WenS3R1yxX046fUxB7uEQESJii', 'female', 'images/user/pic_1577350661.jpg', 'r4EkLpiQwZXnfC6wGdJXpB2Yvl0EupeypdwVoloX3eYprz9d85rOHugEiCTb', NULL, 0, 1, 'f_saqXQhqz4:APA91bHbQ2bjixa77jCiwuQ_plYJUDZ6hqK9YdzfBkuE67jV2AkcK8g4OA_w9Z-g2WmRUnrNLLuxgazHxzEO-FBD4QaxDpqPIpim_620qNtEpXk5X2SxyzRwswBlLrZoSvXkyhWeDBnt', 974, 2, '2019-12-26 09:40:51', '2019-12-26 16:27:33'),
(97, 'sayed', '1000922720', 'sayed@test.com', '$2y$10$T5280dZR4YcJMc1nAXB1WubngmdrjQVQ4jKdOdJwJpf9Aba1ArmYa', 'male', 'images/user/logo_avatar.png', 'BYgyQDrbcZ7OdCU9SzHBdwgDMLy8fxCizqZNozRQnHb0HH9YZ7r8bziAXz6f', NULL, 0, 1, 'fgImPBYlGcw:APA91bF3YrhDBTCQTMNZAfRljRKa_fz8buzAq9CLypmguueeWOxE3FBuTk4z80nYsMa7-0DK7s7XwZOyhHTsEyYi6ukHzqOCWHkDqW7X-aXeM5UCPZxgYawFb_f8C1PImGCTCz6FyFM1', 20, 2, '2019-12-27 18:50:05', '2019-12-27 18:50:05'),
(98, 'mmmm', '1062351616', 'mm@m.com', '$2y$10$qOK4rIQMfje3RyLIZbdXauxgYjJo8TtfdScEgjasO6S2YzuK13Kwi', 'male', 'images/user/logo_avatar.png', 'PlMb6VmLiwi2tCz1iBAhqupiWoxtMncNpB4Edl9UaDC9B3OhfQxe69378Pwl', NULL, 0, 1, '', 20, 2, '2020-01-06 13:20:48', '2019-12-29 16:03:00'),
(99, 'asdasdas', '1129261155', 'sadsad@asdasd.asd', '$2y$10$4MMhd2J4C8j5EbfJpG3KKuGt5gSxTOJjLQXqJB9uKzBVkm05wCoHq', 'male', 'images/user/logo_avatar.png', '2eLPi8qv6NCOSBRwZrTIktOUWs8lWpvWJFFzDKOtxBZS9dURZxgI2IrOIvGG', NULL, 0, 1, NULL, 20, 2, '2020-01-05 20:58:10', '2020-01-05 20:58:10'),
(100, 'gjfjgf', '1223333556', 'hgjgh@gjk.jjk', '$2y$10$mEsbWlLg6NJHpt8ie6yxce4Uo.iIdqVOTVVLnjJt1XrXcSQ7Bhw3C', 'male', 'images/user/logo_avatar.png', 'ksngWKewAN3sizC8x3Ak4uHv6BIHQDybUK1StBDMCMfY9soc4N3Fer0nhEsG', NULL, 0, 1, '', 20, 2, '2020-01-05 14:10:12', '2020-01-05 21:03:57'),
(104, 'نةمن نىنى', '1554452', 'dfsfdsf@ds.ew', '$2y$10$zQv6PYMCDbnmNW42TpAVcObL54zSCRQrlThFwQEKhBtmKLhM6vsxK', 'female', 'images/user/2jCHbFB8rEFDVJsaJ7k1yzgh7e7N2G0v8sQFSFP3.jpeg', 'OPoipjy0T7F5MHGZE1gRf5PrVRs57e31hkWiED91OR0HsKpc0LjcxulJ0wAU', NULL, 0, 1, NULL, 974, 2, '2020-01-06 13:00:06', NULL),
(105, 'hello reservation', '542187365', 'hello@irondot.com', '$2y$10$T43cGBy8m3jDp4YWK.OdDOPDh0OEIaT/7pVdFYfsczPxFjPjiGyV6', 'female', 'images/user/logo_avatar.png', 'P6PjIY2xQeeiHWONQMjOeACw9pu6QBK47W9KLlg3ofv0mBnpSjIz8E0jqMq0', NULL, 0, 1, '', 966, 2, '2020-01-08 09:13:53', '2020-01-06 20:03:28'),
(106, 'IRONDOT', '1552427312', 'info.irondot@gmail.com', '$2y$10$MLJCqlr58OYV8L5WwqzlFuLxS39/RbC93i4w9fQHfiPXkgUm8zfoW', 'male', 'images/user/pic_1582753494.jpg', '5jw6Ejdaz8wDjA9rduvt1hudPJOVO4Sy67ziBdwNw5tD6EC40LZC00EpEPrv', NULL, 0, 1, '', 20, 1, '2020-02-26 21:47:25', '2020-02-27 04:44:54'),
(107, 'ايرون دوت تال', '57558685', 'hreg@test.com', '$2y$10$KzrRjGYlMAoXhnfvQeBfVOjfgDHc4PKKkzG63tp.GjXdgNL2Zjd8S', 'female', 'images/user/logo_avatar.png', 'AfUxiWNLAgjextJmCC37DynaXj0ZBnVZB0cJ87ukrJJuZo8KD8b7r789388J', NULL, 0, 1, 'dAaJMFSiNMo:APA91bEvYMeZB4hhaYVx3An1m0CtgmlslHEijE2yxVhmpgVLBrOT7u3BF4zRzc2mFmNAFz4-Lx_GrwoEkRiBFKsqUXU8M1cIqCJKGKRU00KwBDMo2pr7rwZ1RTXTI87JrE3qRu6Wt1sp', 974, 1, '2020-01-08 11:51:36', '2020-01-08 18:51:36'),
(108, 'ايرون دوت', '555786988', 'irondotxt@iron.com', '$2y$10$UHa8It...nrViY5QnUmFlOaJj8joD3Wdoeawf/0SrElspNwFJvgRC', 'female', 'images/user/logo_avatar.png', 'cW6WAmQ9mSjfQW41rwmKwRL7UJnooAwsDOCNOkJviciXOt6Uto8slO2TZdWF', NULL, 0, 1, '', 966, 2, '2020-01-16 10:59:01', '2020-01-16 17:58:55'),
(109, 'amal new', '58467578', 'amalelrefaey@gmail.com', '$2y$10$88CKDvwdAFVPTBf2W1Dyqu0sBgzNahmpiOWToO5oCh0ZvePQmXFvi', 'female', 'images/user/logo_avatar.png', 'cN7STwNiVl7aSQdEHNBm2HIwoJy0eBNwMkg1IiFIi0DQnmVk9oOZFLOPXS3B', '9607', 1, 1, 'foxgpedw5rY:APA91bGaLzRFF-tURtoAJA7De6Bdr-kihOGyFgRNHro8CxJFAHd6ck0bxTJiRnTybCWEBeNaE2mzLeuh0Yn_hOkk3cEfs5wz7wGEqXaHxKwy7DIaJA3IIVWR1zbWtcRYxzBoryg2gVnm', 974, 2, '2020-01-16 14:04:19', '2020-01-16 18:16:20'),
(112, 'mashal', '560377047', 'mashal.alameer@hotmail.com', '$2y$10$Z9MqgzK2sQQme8dHaLJSeOtlHhxJtGkWKUqRSAkYRWQ7YKJbwj.Ta', 'female', 'images/user/logo_avatar.png', 'V0sZPdMpioPSST85LrJGu0X42LpzCiZ2nHdwRq2fYnBviGbYyIiqqCE2ic5x', NULL, 0, 1, 'eHYzffuFOsE:APA91bGqnLWvkhLNB1iSI4rpCly_FDFYsictumt2LOH-dSpiMPfWUaK9TzI2tsZomSZU53SXRIXDI5zTr7XgtrecYG-fJM2F7iXv9_wQo7hc0fvR3R64j9tMYl7ak-Hh4dH1tI-7YE2i', 966, 2, '2020-03-03 20:32:16', '2020-03-04 03:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_interest`
--

CREATE TABLE `user_interest` (
  `user_interest_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_interest`
--

INSERT INTO `user_interest` (`user_interest_id`, `interest_id`, `user_id`, `created_at`, `updated_at`) VALUES
(32, 3, 5, '2019-11-13 09:37:04', NULL),
(44, 3, 22, '2019-11-17 12:48:20', NULL),
(57, 1, 24, '2019-11-20 14:46:14', NULL),
(58, 3, 24, '2019-11-20 14:46:14', NULL),
(62, 1, 31, '2019-11-21 12:35:41', NULL),
(63, 2, 31, '2019-11-21 12:35:41', NULL),
(64, 1, 33, '2019-11-21 23:05:21', NULL),
(65, 2, 33, '2019-11-21 23:05:21', NULL),
(66, 3, 33, '2019-11-21 23:05:21', NULL),
(76, 1, 38, '2019-11-22 20:57:20', NULL),
(77, 1, 41, '2019-11-23 02:43:27', NULL),
(78, 2, 41, '2019-11-23 02:43:27', NULL),
(79, 3, 41, '2019-11-23 02:43:27', NULL),
(86, 3, 40, '2019-11-23 23:12:13', NULL),
(88, 2, 40, '2019-11-23 23:12:13', NULL),
(89, 1, 40, '2019-11-23 23:12:13', NULL),
(344, 3, 77, '2019-12-23 08:30:30', NULL),
(346, 1, 77, '2019-12-23 08:30:30', NULL),
(391, 3, 93, '2019-12-25 12:30:30', NULL),
(401, 1, 87, '2019-12-26 07:54:44', NULL),
(402, 3, 87, '2019-12-26 07:54:44', NULL),
(403, 2, 87, '2019-12-26 07:54:44', NULL),
(421, 1, 96, '2019-12-26 09:40:51', NULL),
(422, 3, 96, '2019-12-26 09:40:51', NULL),
(427, 1, 17, '2019-12-27 18:09:34', NULL),
(428, 1, 94, '2019-12-30 10:37:31', NULL),
(429, 2, 94, '2019-12-30 10:37:31', NULL),
(430, 3, 94, '2019-12-30 10:37:31', NULL),
(431, 1, 104, '2020-01-06 13:00:06', NULL),
(432, 3, 104, '2020-01-06 13:00:06', NULL),
(442, 1, 107, '2020-01-08 11:51:36', NULL),
(443, 36, 107, '2020-01-08 11:51:37', NULL),
(446, 1, 109, '2020-01-16 11:16:20', NULL),
(447, 3, 109, '2020-01-16 11:16:20', NULL),
(456, 1, 106, '2020-02-26 21:44:54', NULL),
(457, 2, 106, '2020-02-26 21:44:54', NULL),
(458, 3, 106, '2020-02-26 21:44:54', NULL),
(459, 36, 106, '2020-02-26 21:44:54', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`advertisement_id`),
  ADD KEY `advertisement_id` (`advertisement_id`,`interest_id`),
  ADD KEY `advertisements_ibfk_1` (`interest_id`);

--
-- Indexes for table `advertisement_description`
--
ALTER TABLE `advertisement_description`
  ADD PRIMARY KEY (`advertisement_description_id`),
  ADD KEY `advertisement_id` (`advertisement_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `apps_countries`
--
ALTER TABLE `apps_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catering`
--
ALTER TABLE `catering`
  ADD PRIMARY KEY (`catering_id`),
  ADD KEY `id` (`catering_id`),
  ADD KEY `city_id` (`city_id`,`country_id`);

--
-- Indexes for table `catering_description`
--
ALTER TABLE `catering_description`
  ADD PRIMARY KEY (`catering_description_id`),
  ADD KEY `catering_id` (`catering_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `city_description`
--
ALTER TABLE `city_description`
  ADD PRIMARY KEY (`city_description_id`),
  ADD KEY `city_id` (`city_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`clinic_id`),
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `clinic_description`
--
ALTER TABLE `clinic_description`
  ADD PRIMARY KEY (`clinic_description_id`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `clinic_doctor`
--
ALTER TABLE `clinic_doctor`
  ADD PRIMARY KEY (`clinic_doctor_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `clinic_id` (`clinic_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comments_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `country_description`
--
ALTER TABLE `country_description`
  ADD PRIMARY KEY (`country_description_id`),
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `country_description_ibfk_2` (`language_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctor_detail`
--
ALTER TABLE `doctor_detail`
  ADD PRIMARY KEY (`doctor_detail_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `doctor_id` (`doctor_id`) USING BTREE;

--
-- Indexes for table `history_status`
--
ALTER TABLE `history_status`
  ADD PRIMARY KEY (`history_status_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `reserve_id` (`reserve_id`) USING BTREE;

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`),
  ADD KEY `id` (`hospital_id`),
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `hospital_clinic`
--
ALTER TABLE `hospital_clinic`
  ADD PRIMARY KEY (`hospital_clinic_id`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `hospital_id` (`hospital_id`) USING BTREE;

--
-- Indexes for table `hospital_description`
--
ALTER TABLE `hospital_description`
  ADD PRIMARY KEY (`hospital_description_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `insurance_description`
--
ALTER TABLE `insurance_description`
  ADD PRIMARY KEY (`insurance_description_id`),
  ADD KEY `insurance_id` (`insurance_id`) USING BTREE,
  ADD KEY `insurance_description_ibfk_2` (`language_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`interest_id`);

--
-- Indexes for table `interest_description`
--
ALTER TABLE `interest_description`
  ADD PRIMARY KEY (`interest_description_id`),
  ADD KEY `user_id` (`language_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `notification_description`
--
ALTER TABLE `notification_description`
  ADD PRIMARY KEY (`notification_description_id`),
  ADD KEY `notification_id` (`notification_id`,`language_id`),
  ADD KEY `notification_description_ibfk_2` (`language_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `page_description`
--
ALTER TABLE `page_description`
  ADD PRIMARY KEY (`page_description_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `payment_description`
--
ALTER TABLE `payment_description`
  ADD PRIMARY KEY (`payment_description_id`),
  ADD KEY `payment_method_id` (`payment_method_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `price_plan`
--
ALTER TABLE `price_plan`
  ADD PRIMARY KEY (`price_plan_id`),
  ADD KEY `catering_id` (`catering_id`),
  ADD KEY `price_plan_id` (`price_plan_id`);

--
-- Indexes for table `price_plan_description`
--
ALTER TABLE `price_plan_description`
  ADD PRIMARY KEY (`price_plan_description_id`),
  ADD KEY `price_plan_id` (`price_plan_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reserve_catering`
--
ALTER TABLE `reserve_catering`
  ADD PRIMARY KEY (`reserve_catering_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `reserve_catering_payment_id` (`reserve_catering_payment_id`);

--
-- Indexes for table `reserve_clinic`
--
ALTER TABLE `reserve_clinic`
  ADD PRIMARY KEY (`reserve_clinic_id`),
  ADD KEY `reserve_clinic_payment_id` (`reserve_clinic_payment_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `reserve_hospital`
--
ALTER TABLE `reserve_hospital`
  ADD PRIMARY KEY (`reserve_hospital_id`),
  ADD KEY `reserve_hospital_payment_id` (`reserve_hospital_payment_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `reserve_restaurant`
--
ALTER TABLE `reserve_restaurant`
  ADD PRIMARY KEY (`reserve_restaurant_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `restaurant_description`
--
ALTER TABLE `restaurant_description`
  ADD PRIMARY KEY (`restaurant_description_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD KEY `setting_id` (`setting_id`);

--
-- Indexes for table `setting_description`
--
ALTER TABLE `setting_description`
  ADD PRIMARY KEY (`setting_description_id`),
  ADD KEY `setting_id` (`setting_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `status_description`
--
ALTER TABLE `status_description`
  ADD PRIMARY KEY (`status_description_id`),
  ADD KEY `status_id` (`status_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_interest`
--
ALTER TABLE `user_interest`
  ADD PRIMARY KEY (`user_interest_id`),
  ADD KEY `interest_id` (`interest_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administration`
--
ALTER TABLE `administration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `advertisement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `advertisement_description`
--
ALTER TABLE `advertisement_description`
  MODIFY `advertisement_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `apps_countries`
--
ALTER TABLE `apps_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `catering`
--
ALTER TABLE `catering`
  MODIFY `catering_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `catering_description`
--
ALTER TABLE `catering_description`
  MODIFY `catering_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `city_description`
--
ALTER TABLE `city_description`
  MODIFY `city_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `clinic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `clinic_description`
--
ALTER TABLE `clinic_description`
  MODIFY `clinic_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `clinic_doctor`
--
ALTER TABLE `clinic_doctor`
  MODIFY `clinic_doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comments_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `country_description`
--
ALTER TABLE `country_description`
  MODIFY `country_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `doctor_detail`
--
ALTER TABLE `doctor_detail`
  MODIFY `doctor_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `history_status`
--
ALTER TABLE `history_status`
  MODIFY `history_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=756;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hospital_clinic`
--
ALTER TABLE `hospital_clinic`
  MODIFY `hospital_clinic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hospital_description`
--
ALTER TABLE `hospital_description`
  MODIFY `hospital_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `insurance_description`
--
ALTER TABLE `insurance_description`
  MODIFY `insurance_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `interest_description`
--
ALTER TABLE `interest_description`
  MODIFY `interest_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=952;

--
-- AUTO_INCREMENT for table `notification_description`
--
ALTER TABLE `notification_description`
  MODIFY `notification_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=902;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_description`
--
ALTER TABLE `page_description`
  MODIFY `page_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_description`
--
ALTER TABLE `payment_description`
  MODIFY `payment_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `price_plan`
--
ALTER TABLE `price_plan`
  MODIFY `price_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `price_plan_description`
--
ALTER TABLE `price_plan_description`
  MODIFY `price_plan_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `reserve_catering`
--
ALTER TABLE `reserve_catering`
  MODIFY `reserve_catering_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `reserve_clinic`
--
ALTER TABLE `reserve_clinic`
  MODIFY `reserve_clinic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reserve_hospital`
--
ALTER TABLE `reserve_hospital`
  MODIFY `reserve_hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `reserve_restaurant`
--
ALTER TABLE `reserve_restaurant`
  MODIFY `reserve_restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `restaurant_description`
--
ALTER TABLE `restaurant_description`
  MODIFY `restaurant_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_description`
--
ALTER TABLE `setting_description`
  MODIFY `setting_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_description`
--
ALTER TABLE `status_description`
  MODIFY `status_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `user_interest`
--
ALTER TABLE `user_interest`
  MODIFY `user_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advertisement_description`
--
ALTER TABLE `advertisement_description`
  ADD CONSTRAINT `advertisement_description_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`advertisement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advertisement_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `catering_description`
--
ALTER TABLE `catering_description`
  ADD CONSTRAINT `catering_description_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `catering_description_ibfk_2` FOREIGN KEY (`catering_id`) REFERENCES `catering` (`catering_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city_description`
--
ALTER TABLE `city_description`
  ADD CONSTRAINT `city_description_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `city_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `clinics`
--
ALTER TABLE `clinics`
  ADD CONSTRAINT `clinics_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clinics_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clinic_description`
--
ALTER TABLE `clinic_description`
  ADD CONSTRAINT `clinic_description_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clinic_description_ibfk_2` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clinic_doctor`
--
ALTER TABLE `clinic_doctor`
  ADD CONSTRAINT `clinic_doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clinic_doctor_ibfk_2` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_description`
--
ALTER TABLE `country_description`
  ADD CONSTRAINT `country_description_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor_detail`
--
ALTER TABLE `doctor_detail`
  ADD CONSTRAINT `doctor_detail_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_detail_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `history_status`
--
ALTER TABLE `history_status`
  ADD CONSTRAINT `history_status_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hospital_clinic`
--
ALTER TABLE `hospital_clinic`
  ADD CONSTRAINT `hospital_clinic_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital_clinic_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospital_description`
--
ALTER TABLE `hospital_description`
  ADD CONSTRAINT `hospital_description_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hospital_description_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance_description`
--
ALTER TABLE `insurance_description`
  ADD CONSTRAINT `insurance_description_ibfk_1` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`insurance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `insurance_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `interest_description`
--
ALTER TABLE `interest_description`
  ADD CONSTRAINT `interest_description_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `interest_description_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_description`
--
ALTER TABLE `notification_description`
  ADD CONSTRAINT `notification_description_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `page_description`
--
ALTER TABLE `page_description`
  ADD CONSTRAINT `page_description_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `page_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment_description`
--
ALTER TABLE `payment_description`
  ADD CONSTRAINT `payment_description_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `price_plan`
--
ALTER TABLE `price_plan`
  ADD CONSTRAINT `price_plan_ibfk_1` FOREIGN KEY (`catering_id`) REFERENCES `catering` (`catering_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `price_plan_description`
--
ALTER TABLE `price_plan_description`
  ADD CONSTRAINT `price_plan_description_ibfk_1` FOREIGN KEY (`price_plan_id`) REFERENCES `price_plan` (`price_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `price_plan_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reserve_catering`
--
ALTER TABLE `reserve_catering`
  ADD CONSTRAINT `reserve_catering_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `reserve_catering_ibfk_5` FOREIGN KEY (`reserve_catering_payment_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reserve_clinic`
--
ALTER TABLE `reserve_clinic`
  ADD CONSTRAINT `reserve_clinic_ibfk_4` FOREIGN KEY (`reserve_clinic_payment_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reserve_clinic_ibfk_5` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reserve_hospital`
--
ALTER TABLE `reserve_hospital`
  ADD CONSTRAINT `reserve_hospital_ibfk_5` FOREIGN KEY (`reserve_hospital_payment_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reserve_hospital_ibfk_6` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reserve_restaurant`
--
ALTER TABLE `reserve_restaurant`
  ADD CONSTRAINT `reserve_restaurant_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `restaurants_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_description`
--
ALTER TABLE `restaurant_description`
  ADD CONSTRAINT `restaurant_description_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `restaurant_description_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setting_description`
--
ALTER TABLE `setting_description`
  ADD CONSTRAINT `setting_description_ibfk_1` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`setting_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `status_description`
--
ALTER TABLE `status_description`
  ADD CONSTRAINT `status_description_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `status_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_interest`
--
ALTER TABLE `user_interest`
  ADD CONSTRAINT `user_interest_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_interest_ibfk_3` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
