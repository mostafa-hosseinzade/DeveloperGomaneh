-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2016 at 02:27 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DeveloperGomaneh`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN
select * from `Portfolio` where id=17;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test2`(IN i int)
begin
select * from `Portfolio`;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test3`(IN `t` INT)
    NO SQL
begin
select * from `Portfolio` where id=t;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Contact`
--

CREATE TABLE IF NOT EXISTS `Contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `Contact`
--

INSERT INTO `Contact` (`id`, `created_at`, `email`, `message`, `name`, `phone`, `section`) VALUES
(1, '2016-05-30 14:51:10', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(2, '2016-05-30 14:51:12', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(3, '2016-05-30 14:51:20', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(4, '2016-05-30 14:52:21', '123test', 'test 123', 'test123', 'test312', 'reeedddyyy'),
(5, '2016-05-30 14:57:08', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(6, '2016-05-30 14:58:13', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(7, '2016-05-30 14:58:58', 'test', 'test', 'test', 'est', 'reeedddyyy'),
(8, '2016-05-30 15:00:14', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(9, '2016-05-30 15:14:21', 'test', 'test', 'test', 'test', 'reeedddyyy'),
(10, '2016-05-30 15:18:41', 'test@test.com', 'test', 'test', '09373298343', 'reeedddyyy'),
(11, '2016-05-30 15:20:22', 'test@test.com', 'test', 'test', '09356589586', 'developer'),
(12, '2016-05-30 15:21:15', 'test@test.com', 'test add', 'test', '09685986456', 'Developer'),
(13, '2016-05-30 15:24:03', 'test@test.com', 'test', 'test', '09686598665', 'Developer'),
(14, '2016-05-30 15:25:06', 'test@test.com', 'test', 'test', '09685986555', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE IF NOT EXISTS `Contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Contacts`
--

INSERT INTO `Contacts` (`id`, `name`, `phone`, `section`, `email`, `message`, `created_at`) VALUES
(1, 'test', 'test', 'test', 'test', 'test', '2016-05-02 00:00:00'),
(2, 'test2', 'tesst2', 'test2', 'testt2', 'test2', '2016-05-24 00:00:00'),
(3, 'test', 'stes', 'test', 'test', 'st', '2016-05-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Content`
--

CREATE TABLE IF NOT EXISTS `Content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ContentCategory_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Content_User_id` (`User_id`),
  KEY `FK_Content_ContentCategory_id` (`ContentCategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `Content`
--

INSERT INTO `Content` (`id`, `content`, `created_at`, `meta`, `order_list`, `slug`, `title`, `updated_at`, `ContentCategory_id`, `User_id`) VALUES
(1, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(2, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(3, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(4, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(5, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(6, 'test', '2016-05-10 00:00:00', 'test', 1, 'test', 'test', '2016-05-18 00:00:00', 2, NULL),
(7, 'test', '2016-05-10 00:00:00', 'test', 1, 'test', 'test', '2016-05-18 00:00:00', 2, NULL),
(8, 'test', '2016-05-10 00:00:00', 'test', 1, 'test', 'test', '2016-05-18 00:00:00', 2, NULL),
(9, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(10, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(11, 'test', '2016-05-10 00:00:00', 'test', 1, 'test', 'test', '2016-05-18 00:00:00', 2, NULL),
(12, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(13, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(14, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(15, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 2, NULL),
(16, 'test', '2016-05-10 00:00:00', 'test', 1, 'test', 'test', '2016-05-18 00:00:00', 2, NULL),
(17, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 5, NULL),
(18, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 5, NULL),
(19, 'Test Link', '2016-05-03 00:00:00', 'طراحی سایت,آژانس های مسافرتی , آژانس', 2, 'طراحی سایت آژانس های مسافرتی', 'طراحی سایت ها ی آژانس های مسافرتی', '2016-05-11 00:00:00', 5, NULL),
(20, 'test', '2016-06-15 00:00:00', 'test', 1, 'test', 'test', '2016-06-28 00:00:00', 5, NULL),
(21, 'testsdfsdfasfdkjasf,bafjhasjhagfjasfjagsjasdgfjadgsfjgadsfjgadfsjagsdfhjadbvsjsdkasdghgdakhasdfdjhadfjhgfjhgfjhgfjgfsadfm,asvd;ljnkjlbcdskbchjbs', '2016-06-07 16:21:03', 'test', 1, 'test', 'test', NULL, 5, NULL),
(22, 'test test', '2016-06-08 10:51:23', 'test', 1, 'test-test', 'test', NULL, 1, NULL),
(23, 'test2', '2016-06-08 10:52:00', 'test2', 2, 'test-2-test-2', 'test2', NULL, 1, NULL),
(24, 'test', '2016-06-08 14:32:44', 'testt', 1, 'est', 'test', NULL, 5, NULL),
(25, 'test2', '2016-06-08 14:32:56', 'test2', 2, 'test2', 'test2', NULL, 6, NULL),
(26, 'طرز تهیه خوراک گوشت مجلسی مرحله به مرحله\r\n۱۰ام مهر ۱۳۹۴ نوشته Profile Photo اون نفر ۱۵ نظر\r\nتبلیغاتبا ما تبلیغ کنید!\r\n\r\nخیلی از غذاها هستن که تهیه اونها واقعا کار آسونیه. ینی در واقع فقط میذاری که بپزه! خوراک گوشت هم از این دست غذاهاست که فقط باید بذاری بپزه. ممکنه که هر کسی با یه ترفند های در طی مراحل پخت به لذیذ شدنش کمک کنه. ولی به طور کلی کار خاصی نداره. در این مطلب طرز تهیه خوراک گوشتی رو قرار میدم که بیشتر باب هست و البته که ترفند خیلی خاصی هم نداره. تنها نکته ای که میشه گفت مقدار مواد اولیه و حوصله به خرج دادنه که میتونه در پخت این غذای خوشمزه و مجلسی تاثیر گذار باشه.\r\n\r\nروش تهیه خوراک گوشت\r\nروش تهیه خوراک گوشت\r\n\r\nمواد لازم برای تهیه خوراک گوشت مجلسی\r\nگوشت گوسفند 200 گرم (از ماهیچه یا سردست گوسفند استفاده کنید خیلی لذیذ تره)\r\nپیاز یک عدد متوسط\r\nآب 5 لیوان\r\nرب گوجه دو قاشق\r\nروغن و نمک و فلفل و زردچوبه به مقداری که به نظرتون نیاز داره\r\nزعفران در صورت تمایل (طعم خوبی بهش میده)\r\nطرز تهیه خوراک گوشت مجلسی\r\nمثل همه خورشت هایی که با گوشت تهیه میشن ابتدا باید پیاز رو خرد کنیم و با مقداری زردچوبه تفت بدیم.\r\n\r\nپیاز رو تفت بدید\r\nپیاز رو تفت بدید\r\n\r\nخیلی ها پیاز رو کاملا سرخ میکنن ولی من معمولا کمی که رنگ پیاز عوض شد گوشت رو اضافه میکنم. به نظرم اینطوری باعث لعاب و غلظت خورشت میشه و طعم بهتری هم داره. در قیمه هم همین مساله صدق میکنه.\r\n\r\nگوشت رو به پیاز اضافه کنید\r\nگوشت رو به پیاز اضافه کنید\r\n\r\nبعد از اینکه گوشت رو با کمی فلفل تفت دادیم 5 لیوان آب سماور ولرم رو بهش اضافه میکنیم و درش رو میذاریم.\r\n\r\nمراحل تهیه خوراک گوشت\r\nمراحل تهیه خوراک گوشت\r\n\r\nمهمترین مساله برای پخت این خورشت صبوری کردنه. اگر مجبور نیستید توصیه میکنم از زودپز هم استفاده نکنید و بذارید گوشت روی حرارت ملایم و آروم آروم بپزه. من برای این یک تکه حدود 3 ساعت زمان دادم تا کاملا بپزه. البته مراقب باشید که اونقدر صبوری به خرج ندید که گوشت از هم وا بره و شکلش رو از دست بده.\r\n\r\nطرز تهیه خوراک گوشت\r\nطرز تهیه خوراک گوشت\r\n\r\nکم کم آب گوشت تغییر رنگ میده و کمی تیره میشه. در این مرحله نمک و زعفران رو ضافه کنید و باز بذارید روی حرارت ملایم به پختش ادامه بده. وقتی که گوشت کاملا پخت، دو قاشق رب رو در مقدار کمی روغن حدود دو سه دقیقه روی حرارت متوسط تفت بدید و بعد هم به خوراک اضافه کنید. موقع مخلوط کردن رب با خوراک هم مراقب باشید تکه گوشتتون از هم وا نره.\r\n\r\nخوراک گوشت مجلسی\r\nخوراک گوشت مجلسی\r\n\r\nبعد از اضافه کردن رب هم بذارید نیم ساعتیروی حرارت ملایم باشه. به همین سادگی خوراک گوشت بسیار لذیذی خواهید داشت.\r\n\r\nطرز تهیه خوراک گوشت مجلسی\r\nطرز تهیه خوراک گوشت مجلسی\r\n\r\nنکته هایی برای پخت خوراک گوشت\r\nاول اینکه پیاز رو بهتره همونقدری که اشاره کردم تفت بدید تا طعم و لعاب خوراک بهتر باشه.\r\nمقدار آب خورشت رو در حدی بریزید که تا روی گوشت رو کاملا بگیره. بعد از 3 ساعت مقدار آب خوراک حدود 1/5 مقدار اول خواهد بود.\r\nاین خورشت نباید آب زیاد و رقیق داشته باشه پس در ریختن آب زیاده روی نکنید.\r\nنمک رو حداقل یک ساعت بعد از پخت گوشت بهش اضافه کنید تا زمان پخت رو زیاد نکنه.\r\nحرارت زیاد و قل زدن هم برای پخت بهتر گوشت مناسب نیست و تاثیری در زودتر پخته شدن گوشت نداره. حرارت رو متوسط رو به ملایم بذارید و حوصله به خرج بدید تا کاملا بپزه.\r\nاز زعفران هم میتونید برای خوشرنگی و خوش عطری گوشت استفاده کنید.\r\nبرای سرو این خوراک با باقالی پلو یا سبزی پلو توصیه میکنم از رب استفاده نکنید و تنها از مقدار کمی زعفران برای رنگش کمک بگیرید که بسیار لذیذ و خوش طعم میشه.\r\nبرای چاشنی میتونید از مقداری آبلیمو یا آّب نارنج کمک بگیرید که البته بهتره تصمیمش رو بر عهده خورنده هاش بذارید.\r\nمقداری سب زمینی سرخ کرده و جعفری هم میتونه رنگ و لعاب بهتری به ظرف خوراکتون بده.\r\nخوراک گوشت مجلسی\r\n', '2016-06-13 11:24:24', 'test', 1, 'test', 'test', NULL, 5, NULL),
(27, 'me', '2016-07-11 10:40:23', 'me', 1, 'me', 'me', NULL, NULL, NULL),
(28, '<span class="title_info" style="font-size: 20px; color: rgb(245, 80, 24); font-family: Tahoma, Geneva, sans-serif; line-height: 22px; text-align: justify;">درباره ما</span><br style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;"><br style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;"><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">شركت صنایع الكترونیكی مگامداوم نماینده انحصاری شرکت فرانسوی&nbsp;</span><a href="http://www.informups.com/" target="_blank" style="color: rgb(0, 102, 153); text-decoration: none; font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;">Inform-Legrand</a><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">&nbsp;در ایران، در زمینه تأمین تجهیزات برق سالم (منابع تغذیه بدون وقفه از توان 400VA تا 400KVA)، استابلایزر ولتاژ، شارژر، باتری و... فعالیت می‌نماید. شركت مگامداوم همواره در راستای مشتری مداری متعهد به ارائه خدمات زیر بوده است:</span><ul style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;"><li>تولیدات با کیفیت مطلوب در سطح استانداردهای جهانی</li><li>طراحی و ارائه محصولات بر اساس خواسته و نیاز مشتری</li><li>پشتیبانی و ارائه خدمات پس از فروش در تمام نقاط کشور</li></ul><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">محصولات کارخانه&nbsp;</span><a href="http://www.informups.com/" target="_blank" style="color: rgb(0, 102, 153); text-decoration: none; font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;">inform</a><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">&nbsp;در حال حاضر به 75 كشور دنیا صادر می‌گردد و علاوه بر ایران در كشورهایی نظیر ترکیه، آلمان، روسیه و یونان نیز دارای دفتر مركزی می‌باشد. تولیدات ارائه شده دارای استانداردهای جهانی همچون CE ،ISO 9000 ،Gost و... می‌باشد که در صنایع مخابرات، بانک‌ها، بخش‌های بیمارستانی، آزمایشگاهی و تصویربرداری و... كاربرد قابل توجهی در كاهش خطاهای محاسباتی و عملیاتی در تجهیزات، افزایش طول عمر و كارآیی آنها دارند. با توجه به اینكه در بازار رقابتی حاكم یكی از وظایف بارز شركت‌های فعال معرفی صحیح و بجای محصولات متناسب با نیاز مشتریان می‌باشد، لذا شركت صنایع الكترونیكی مگامداوم جهت نیل به ارزش فوق اقدام به ارائه خدمات ذیل نموده است:</span><ul style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;"><li>كارشناسی، مشاوره و بارسنجی رایگان از مراكز</li><li>فراهم كردن زمینه جهت بازدید از توانمندی‌های اجرایی و خدماتی شركت و حتی كارخانه مادر (<a href="http://www.informups.com/" target="_blank" style="color: rgb(0, 102, 153); text-decoration: none;">inform</a>) در کشور ترکیه</li><li>نصب و راه اندازی آزمایشی محصولات</li></ul><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">هدف اصلی شرکت&nbsp;</span><a href="http://www.informups.com/" target="_blank" style="color: rgb(0, 102, 153); text-decoration: none; font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify;">inform</a><span style="color: rgb(51, 51, 51); font-family: Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 22px; text-align: justify; background-color: rgb(248, 248, 248);">&nbsp;این است که محصولات و خدمات خود را به بهترین نحو به مخاطبان خود عرضه نماید. همکاری با مجموعه شما در جهت ارائه محصولات و خدمات مطلوب افتخار ما خواهد بود و امید داریم با ارائه خدماتی مناسب علاوه برکیفیت جهانی محصولات، رضایت و خشنودی شما را نیز فراهم آوریم.</span>', '2016-07-12 09:20:29', 'Test', 1, 'Test', 'Mega', NULL, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ContentCategory`
--

CREATE TABLE IF NOT EXISTS `ContentCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '0',
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `subctg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subctg` (`subctg`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ContentCategory`
--

INSERT INTO `ContentCategory` (`id`, `created_at`, `describtion`, `enable`, `meta`, `slug`, `title`, `updated_at`, `visible`, `subctg`) VALUES
(1, '2016-06-15 00:00:00', 'مقاله در این بخش قرار میگیرند', 1, 'isi,مقاله', 'مقاله-های-سایت', 'مقاله', '2016-06-08 00:00:00', 1, NULL),
(2, '2016-05-24 00:00:00', '', 1, 'Service', 'Services', 'Service', '2016-05-26 00:00:00', 1, NULL),
(4, '2016-06-29 00:00:00', 'مقاله های آموزشی css در این بخش قرار میگیرند', 1, 'Css', 'css', 'Css', '2016-06-29 00:00:00', 1, 1),
(5, '2016-06-22 00:00:00', '', 1, '', 'Business', 'Business', '2016-06-29 00:00:00', 1, 1),
(6, '2016-06-08 12:19:49', 'Design', 1, 'Design', 'Design', 'Design', '2016-06-12 00:00:00', 1, 1),
(7, '2016-06-08 12:20:47', 'JavaScript Tutorial', 1, 'JavaScript', 'JavaScript', 'JavaScript', '2016-06-30 00:00:00', 1, 1),
(8, '2016-06-13 14:37:50', 'tet', 1, 'tes', 'test', 'test', NULL, 1, 4),
(9, '2016-07-10 16:16:04', 'test', 1, 'test', 'test', 'test', NULL, 1, 4),
(10, '2016-07-10 16:16:43', 'test', 1, 'test', 'test', 'test', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Factor`
--

CREATE TABLE IF NOT EXISTS `Factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ArrayFactorField` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Factor_User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `FactorField`
--

CREATE TABLE IF NOT EXISTS `FactorField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` longtext COLLATE utf8_unicode_ci,
  `price` double DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `SectionFactor_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `sub_feild` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FactorField_User_id` (`User_id`),
  KEY `FK_FactorField_SectionFactor_id` (`SectionFactor_id`),
  KEY `sub_feild` (`sub_feild`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `FactorField`
--

INSERT INTO `FactorField` (`id`, `created_at`, `describtion`, `price`, `title`, `updated_at`, `SectionFactor_id`, `User_id`, `sub_feild`) VALUES
(1, '2016-06-14 12:52:14', 'test', 1200, 'test', NULL, 1, NULL, NULL),
(2, '2016-06-14 12:59:31', 'test2', 21321, 'test2', NULL, 1, NULL, NULL),
(3, '2016-06-14 13:26:32', 'test', 123, 'test3', NULL, 3, NULL, 2),
(4, '2016-06-14 14:40:24', 'Business Site', 16900, 'Business', NULL, 1, NULL, NULL),
(5, '2016-06-14 14:41:01', 'سایت های اخبار', 12000, 'اخبار', NULL, 1, NULL, NULL),
(6, '2016-06-15 10:43:52', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">&nbsp;هر روز و هر ساعت می توانید آمار بازدیدکنندگان سایت خود را ببیند برای موفقیت سایت بسیار مهم می باشد</span></div>', 100000, 'آمار بازدیدکنندگان', NULL, 2, NULL, NULL),
(7, '2016-06-15 11:19:53', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">به اولین صفحه ای گفته می شود که کاربر بعد از وارد کردن آدرس وب سایت شما می تواند آنرا ببیند.</span></div>', 400000, 'طراحی صفحه اصلی', NULL, 2, NULL, NULL),
(8, '2016-06-15 11:20:38', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">نمایش نقشه سایت برای آگاه کردن کاربر از لینک های کاربردی استفاده شده در وب سایت می باشد.</span></div>', 150000, 'طراحی صفحه نقشه سایت', NULL, 2, NULL, NULL),
(9, '2016-06-15 12:36:52', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">داشتن سرویس عضویت در وب سایت باعث خواهد شد ایمیل کاربران را داشته باشید تا آنها را از جدیدترین محصولات یا وقایع وب سایت خود  آگاه نمایید.</span></div>', 300000, 'ارسال خبرنامه', NULL, 2, NULL, NULL),
(10, '2016-06-15 12:37:45', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">اسلاید شو در وب سایت میتواند محصولات و سرویس های شما را به درستی و راحتی به مخاطبان وب سایت شما ارائه نماید. در طراحی اسلاید شو از بهترین افکتها استفاده خواهیم نمود.</span></div>', 150000, 'SlideShow', '2016-06-28 14:28:45', 3, NULL, NULL),
(11, '2016-06-15 12:41:55', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">مخصوصا که پوشش کامل خبری در مطبوعات ایران داده شود. برای طراحی این صفحه وب همراه با دسته بندی کامل آن برنامه های متنوعی داریم که میتوانیم آنها را برای وب سایت خبری شما طراحی و پیاده سازی نماییم.</span></div>', 150000, 'مطبوعات ایران ', NULL, 4, NULL, 5),
(12, '2016-06-15 12:42:32', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">مطمئن باشید کاربران آنلاین وب سایت تمایل به پرینت و یا دانلود خبر دارند تا سر فرصت مانند مترو و ... آن را مطالعه نمایند. این سرویس را با بهترین کیفیت برای آنها طراحی خواهیم نمود. نشان دادن مطالب محتلف میتواند یکی از اهداف طراحی و اجرای این صفحه از وب سایت باشد.</span></div>', 250000, 'آرشیو خبرها', NULL, 4, NULL, 5),
(13, '2016-06-15 12:43:17', '<canvas id="netbeans_glasspane" :netbeans_generated="true" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="778" height="223"></canvas><div style="text-align: right;"><span style="font-size: 10pt;">همیشه زمانی که خبری بر روی خبرگزاری ها میرود همزمان یا مدتی بعد از آن تحلیل و تفسیر ها از سوی مردم عادی و یا کارشناسان آغاز میگردد. بنابراین با طراحی صفحه وبی در وب سایت میتوانیم تمامی این تفسیرها را پوشش داده و به صورت دسته بندی شده آنها را به رویت کاربران برسانیم.</span></div>', 265000, 'تحلیل و تفسیر ', NULL, 4, NULL, 5),
(14, '2016-06-28 14:29:11', 'test', 12, 'test', NULL, 3, NULL, NULL),
(15, '2016-07-02 14:52:44', 'test', 12, 'test', NULL, 5, NULL, NULL),
(16, '2016-07-02 14:52:56', 'test 23', 12, 'test 2', NULL, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FactorField_FactorField`
--

CREATE TABLE IF NOT EXISTS `FactorField_FactorField` (
  `FactorField_id` int(11) NOT NULL,
  `ChildFeildCollection_id` int(11) NOT NULL,
  PRIMARY KEY (`FactorField_id`,`ChildFeildCollection_id`),
  KEY `FK_FactorField_FactorField_ChildFeildCollection_id` (`ChildFeildCollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Faq`
--

CREATE TABLE IF NOT EXISTS `Faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '0',
  `faq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Faq_User_id` (`User_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Faq`
--

INSERT INTO `Faq` (`id`, `answer`, `created_at`, `enable`, `faq`, `meta`, `order_list`, `slug`, `updated_at`, `visible`, `User_id`) VALUES
(1, 'test', NULL, 1, 'test', 'test', 1, 'test', NULL, 1, NULL),
(2, 'test2', '2016-06-08 16:56:34', 1, 'test2', 'test2', 1, 'test2', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE IF NOT EXISTS `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personal` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `array_field` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `name`, `mobile`, `phone`, `desc`, `email`, `personal`, `created_at`, `array_field`) VALUES
(1, 'test', 'test', 'test', 'test', 'test', 1, '0000-00-00 00:00:00', NULL),
(2, 'test', 'test', 'test', 'test', 'test', 1, '2016-05-02 12:50:00', NULL),
(3, 'test', 'test', 'test', 'test', 'test', 0, '2016-07-03 13:53:27', NULL),
(4, 'test', 'test', 'test', 'test', 'test', 0, '2016-07-03 13:54:14', NULL),
(5, 'test', 'test', 'test', 'test', 'test@test.test', 1, '2016-07-03 14:20:59', '{5,10,12,16}'),
(6, 'resr', 'فثسف', 'فثسف', 'test', 'test@test.tes', 1, '2016-07-03 14:23:17', '5,10,14,12,16'),
(7, 'test sadsdf', NULL, 'test tes', 'sfgdfgdfgsdfglsjklg', 'test@test123.et', 1, '2016-07-03 15:00:58', '5,10,12,16'),
(8, 'test', '09373298343', '021556585', 'test', 'test@test.com', 1, '2016-07-03 15:14:12', '5,10,14,12,16');

-- --------------------------------------------------------

--
-- Table structure for table `Portfolio`
--

CREATE TABLE IF NOT EXISTS `Portfolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` int(11) DEFAULT NULL,
  `PortfolioCategory_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `Portfolio`
--

INSERT INTO `Portfolio` (`id`, `created_at`, `describtion`, `finished`, `img`, `percent`, `PortfolioCategory_id`, `title`, `updated_at`, `url`, `visit`) VALUES
(22, NULL, 'اصلی ترین نقطه قوت تابلوهای دیجیتال که در تبلیغات مورد استفاده قرار می گیرند،این‌است که می توانند پیام‌ها را به سرعت برحسب شرایط تغییر دهند و به عبارت بهتر، پیام‌ها را با شرایط فوری، انطباق دهند. هدف این وب سایت جذب مشتری از طریق اینترنت می باشد.\r\n ', '2017-01-10 00:00:00', '1_1468405845530.png;2_1468405845532.png;3_1468405845533.png;4_1468405845534.png;5_1468405845537.png;', 40, 2, 'دنیای LED', NULL, 'donyayeled.com', 1),
(23, '2016-07-13 15:37:31', 'هدف از طراحی این سایت معرفی محصولات شرکت Burnishing Tools  می باشد . ', '2015-12-12 00:00:00', '1_1468408051472.png;2_1468408051475.png;3_1468408051475.png;4_1468408051475.png;5_1468408051476.png;', 70, 1, 'ابزار Burnishing Tools', '2016-07-13 16:30:51', 'imexroll.com', 2),
(24, '2016-07-13 15:57:02', 'هدف از طراحی سایت انتشارات لوح برتر فروش کتاب ها از طریق اینترنت و انجام کارها از طریق وب ایت می باشد', '2016-02-11 00:00:00', '1_1468409222160.png;2_1468409222161.png;3_1468409222162.png;4_1468409222163.png;5_1468409222165.png;', 100, 2, 'انتشارات لوح برتر', '2016-07-13 16:31:20', 'lohebartar.ir', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PortfolioCategory`
--

CREATE TABLE IF NOT EXISTS `PortfolioCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `PortfolioCategory`
--

INSERT INTO `PortfolioCategory` (`id`, `created_at`, `describtion`, `meta`, `slug`, `title`, `updated_at`) VALUES
(1, '2016-07-13 00:00:00', 'به الگویی از تجارت الکترونیکی گویند, که طرفین معامله بنگاه‌ها هستند . ', 'B2B , ارتباط بنگاه به بنگاه', 'ارتباط بنگاه به بنگاه B2B', 'ارتباط بنگاه به بنگاه B2B', NULL),
(2, '2016-07-13 13:05:43', 'به الگویی از تجارت الکترونیک گویند که بسیار رایج بوده و ارتباط تجاری مستقیم بین شرکتها و مشتریان می‌باشد .', 'B2C , ارنباط بنگاه و مصرف کننده', 'ارتباط بنگاه و مصرف کننده', 'ارتباط بنگاه و مصرف کننده B2C', NULL),
(3, '2016-07-13 13:07:57', 'در این حالت اشخاص حقیقی به کمک اینترنت فراورده‌ها یا خدمات خود را به شرکتها میفروشند .', 'B2C,ارتباط مصرف کننده و شرکتها', 'ارتباط مصرف کننده و شرکتها', 'ارتباط مصرف کننده و شرکتها C2B', NULL),
(4, '2016-07-13 13:10:25', 'در این حالت ارتباط خرید و فروش بین مصرف‌کنندگان است .', 'C2C , ارتباط مصرف کننده و مصرف کننده', 'ارتباط مصرف کننده و مصرف کننده', 'ارتباط مصرف کننده و مصرف کننده ها C2C', NULL),
(5, '2016-07-13 13:12:32', 'که شامل تمام تعاملات تجاری بین شرکتها و سازمانهای دولتی می‌باشد . پرداخت مالیاتها و عوارض از این قبیل تعاملات محسوب می‌شوند .', 'B2A , ارتباط بین بنگاه و سازمان های دولتی', 'ارتباط بین بنگاه ها و سازمان های دولتی', 'ارتباط بین بنگاه ها و سازمان های دولتی B2A', NULL),
(6, '2016-07-13 13:25:20', 'الگویی بین دولت و توده مردم می‌باشد که شامل بنگاه‌های اقتصادی, موسسات دولتی و کلیه شهروندان می‌باشد . این الگو یکی از مولفه‌های دولت الکترونیک می‌باشد .', 'G2C,ارتباط بین دولت و شهروندان', 'ارتباط دولت و شهروندان', 'ارتباط دولت و شهروندان G2C', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ProtfolioImg`
--

CREATE TABLE IF NOT EXISTS `ProtfolioImg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Potfolio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProtfolioImg_Potfolio_id` (`Potfolio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SectionFactor`
--

CREATE TABLE IF NOT EXISTS `SectionFactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `SectionFactor`
--

INSERT INTO `SectionFactor` (`id`, `created_at`, `describtion`, `title`, `updated_at`) VALUES
(1, '2016-06-14 00:00:00', 'نوع وب سایت', 'نوع وب سایت', '2016-06-14 00:00:00'),
(2, '2016-06-14 00:00:00', 'امکانات پایه', 'امکانات پایه', '2016-06-14 00:00:00'),
(3, '2016-06-14 00:00:00', 'امکانات مشترک', 'امکانات مشترک', '2016-06-14 00:00:00'),
(4, '2016-06-14 00:00:00', 'امکانات تخصصی', 'امکانات تخصصی', '2016-06-14 00:00:00'),
(5, '2016-06-14 00:00:00', 'امکانات پیشنهادی', 'امکانات پیشنهادی', '2016-06-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Seo`
--

CREATE TABLE IF NOT EXISTS `Seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `describtion` longtext COLLATE utf8_unicode_ci,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Seo_User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Content`
--
ALTER TABLE `Content`
  ADD CONSTRAINT `FK_Content_ContentCategory_id` FOREIGN KEY (`ContentCategory_id`) REFERENCES `ContentCategory` (`id`),
  ADD CONSTRAINT `FK_Content_User_id` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `ContentCategory`
--
ALTER TABLE `ContentCategory`
  ADD CONSTRAINT `ContentCategory_ibfk_1` FOREIGN KEY (`subctg`) REFERENCES `ContentCategory` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_ContentCategory_subctg` FOREIGN KEY (`subctg`) REFERENCES `ContentCategory` (`id`);

--
-- Constraints for table `Factor`
--
ALTER TABLE `Factor`
  ADD CONSTRAINT `FK_Factor_User_id` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `FactorField`
--
ALTER TABLE `FactorField`
  ADD CONSTRAINT `FactorField_ibfk_1` FOREIGN KEY (`sub_feild`) REFERENCES `FactorField` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_FactorField_SectionFactor_id` FOREIGN KEY (`SectionFactor_id`) REFERENCES `SectionFactor` (`id`),
  ADD CONSTRAINT `FK_FactorField_sub_feild` FOREIGN KEY (`sub_feild`) REFERENCES `FactorField` (`id`),
  ADD CONSTRAINT `FK_FactorField_User_id` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `FactorField_FactorField`
--
ALTER TABLE `FactorField_FactorField`
  ADD CONSTRAINT `FK_FactorField_FactorField_ChildFeildCollection_id` FOREIGN KEY (`ChildFeildCollection_id`) REFERENCES `FactorField` (`id`),
  ADD CONSTRAINT `FK_FactorField_FactorField_FactorField_id` FOREIGN KEY (`FactorField_id`) REFERENCES `FactorField` (`id`);

--
-- Constraints for table `Faq`
--
ALTER TABLE `Faq`
  ADD CONSTRAINT `FK_Faq_User_id` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `ProtfolioImg`
--
ALTER TABLE `ProtfolioImg`
  ADD CONSTRAINT `FK_ProtfolioImg_Potfolio_id` FOREIGN KEY (`Potfolio_id`) REFERENCES `Portfolio` (`id`);

--
-- Constraints for table `Seo`
--
ALTER TABLE `Seo`
  ADD CONSTRAINT `FK_Seo_User_id` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
