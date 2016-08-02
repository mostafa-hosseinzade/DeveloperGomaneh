-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2016 at 05:56 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `Content`
--

INSERT INTO `Content` (`id`, `content`, `created_at`, `meta`, `order_list`, `slug`, `title`, `updated_at`, `ContentCategory_id`, `User_id`) VALUES
(6, '<div style="direction: rtl; text-align: right;">\r\n<div style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">مقدمه ای بر دوره برنامه نویسی آموزش جاوا</div><p><span style="font-family: Arial, Verdana; font-size: 13.3333px;">جاوا (به انگلیسی: Java) یک زبان برنامه‌نویسیِ شیءگرا است که برای نخستین بار توسط جیمز گاسلینگ در شرکت سان مایکروسیستمز ایجاد گردید و در سال ۱۹۹۵ به عنوان بخشی از سکوی جاوا منتشر شد. زبان جاوا شبیه به ++C است اما مدل شیءگرایی آسان‌تری دارد و از قابلیت‌های سطح پایین کمتری پشتیبانی می‌کند. یکی از قابلیت‌های بنیادین جاوا این است که مدیریت حافظه را بطور خودکار انجام می‌دهد. ضریب اطمینان عملکرد برنامه‌های نوشته‌شده به این زبان نسبت به زبانهای نسل اول C بالا است و وابسته به سیستم‌عامل خاصی نیست. برنامه‌های جاوا به صورت بایت کد (کامپایل) می‌شوند که توسط واسط JVM به کدهای ماشین اجرا میشوند؛و در صورت وجود JVM مانند سایر زبانهای مبتنی بر آن به وابسته به سیستم‌عامل خاصی نیستند.</span></p><p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">بدون شک زبان برنامه نویسی جاوا یکی از قدرتمندترین زبان های برنامه نویسی در دنیا جاوا می باشد.از این زبان برنامه نویسی در بخش های مختلف از جمله برنامه های تجاری یا حرفه ای, بازی های اندروید,نرم افزار های اندرویدی , وب سایت برای موسسات بزرگ مثل بانک ها می باشد.</p><p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">یکی از زبان های اصلی برنامه نویسی سیستم عامل اندروید جاوا می باشد که می تواند امید بخش مالی برنامه نویسان باشد و آینده مالی آن ها را تضمین خواهد کرد.</p>\r\n</div>', '2016-07-24 10:04:27', 'مقدمه جاوا,آموزش برنامه نویسی جاوا,برنامه نویسی جاوا,کد جاوا', 1, 'مقدمه-جاوا', 'مقدمه ای بر آموزش برنامه نویسی جاوا', NULL, 15, NULL),
(7, '<div style="direction: rtl; text-align: right;">\r\n<h2 style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">تاریخچه</h2><div><div><span style="font-family: Arial, Verdana; font-size: 13.3333px;">در سال 1990 سان میکروسیستم در حال توسعه نرم‌افزاری برای استفاده ابزارهای الکترونیکی بود که مسئولیت تیم با جیمز کاسلینگ بود. در سال 1991 تیم تصمیم بر این گرفت که زبان جدید را OAK بنامند. در سال 1992 این تیم که به تیم پروژه گرین معروف بود زبان جدیدی را معرفی کرد که با ابزارهای خانگی مختلف و لمسی کار میکرد. در سال 1993 وب جهانی توسعه یافت و زبان جدید با معرفی اپلت که قابلیتهای زیادی به کامپیوترهای متصل به وب می افزود مشهور شد. در سال 1995 زبان OAK به JAVA تغیر نام پیدا کرد و توسط مایکروسافت و نت اسکیپ پشتیبانی شد. در سال 1996 دیگر java زبانی به صورت همه گیر چند منظوره شناخته شده بود. در سال 2007 زبانهایی با استاندارد JVM مانند groovy ایجاد شد در سال 2014 جاوا سعی کرد با معرفی نسخه 8 برخی از قابلیتهای زبانهای دیگر را اضافه نماید.</span></div><div><span style="font-family: Arial, Verdana; font-size: 13.3333px;"><br></span></div><div><span style="font-family: Arial, Verdana; font-size: 13.3333px;">جاوا یک زبان برنامه‌نویسی است که در آغاز توسط شرکت سان مایکروسیستمز ایجاد شده‌است و در سال ۱۹۹۵ به عنوان بخش اصلی سکوی جاوا منتشر شد. این زبان قسمت‌های بسیاری از گرامر خود را از C و ++C گرفته اما دارای مدل شی‌گرایی ساده‌ای است و امکانات سطح پایین کمی دارد. کاربرد جاوا در کامپایل به صورت بایت کد است که صرف نظر از معماری و خصوصیات آن کامپیوتر، قابلیت اجرا روی تمامی ماشین‌های شبیه‌سازی جاوا را داشته باشد. اجزای اصلی کامپایلرهای جاوا، ماشین‌های پیاده‌سازی و کتابخانه‌های آن توسط این شرکت از سال ۱۹۹۵ منتشر شد. در مه ۱۹۹۷ این شرکت، نرم‌افزار رایگان این زبان را فراهم کرد. دیگران هم کاربردهای دیگری از این زبان را منتشر کردند مثل کامپایلر GNU برای جاوا یا OPENJDK</span></div><div><span style="font-family: Arial, Verdana; font-size: 13.3333px;"><br></span></div><div><span style="font-family: Arial, Verdana; font-size: 13.3333px;">با پیدایش java2، نسخهٔ جدید توانست ترکیب‌های جدیدی را برای نوع‌های مختلف پلت فرم‌ها ایجاد کند. به عنوان مثال J2EE، باهدف کاربرد برای تشکیلات سازمانی، و نسخهٔ سکوی جاوا، نسخه میکرو برای تلفن همراه منتشر شد. در سال ۱۹۹۶ با هدف بازاریابی، این شرکت نسخهٔ جدید J2 را با نام‌های سکوی جاوا، نسخه سازمانی، سکوی جاوا، نسخه میکرو و سکوی جاوا، نسخه استاندارد منتشر کرد. در سال ۱۹۹۷ شرکت سان میکروسیستمز، ISO/IEC JTC1 standards body و Ecma International را به فرمول جاوا تغییر داد. شرکت Sun بسیاری از کاربردهای جاوایش را بدون هیچ هزینه‌ای فراهم آورد. شرکت Sun با فروش مجوز برای بعضی از کاربردهای خاصش مثل Java Enterprise System درآمدی را بدست آورد. در ۱۳ نوامبر ۱۹۹۶ شرکت Sun نرم‌افزار جاوا را به صورت رایگان و با مجوز عمومی برای همه منتشر کرد.</span></div></div>\r\n</div>', '2016-07-24 10:14:13', 'تاریخچه جاوا,تاریخچه زبان برنامه نویسی جاوا,زبان برنامه نویسی جاوا', 2, 'تاریخچه-جاوا', 'تاریخچه زبان برنامه نویسی جاوا', NULL, 15, NULL),
(8, '<div style="direction:rtl;text-align:right">\r\n<p>ابزار های برنامه نویسی جاوا&nbsp;</p><div class="row bodyTitle" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: -15px; margin-left: -15px; direction: rtl; font-size: 16px; font-family: IRANSansNums, IRANSans, Tahoma; padding: 0px;"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: right; width: 695px;"><h1 style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 5px; font-size: 16px; font-family: inherit; line-height: 1.1;">ابزارهای برنامه نویسی با زبان جاوا</h1></div></div><div class="row" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: -15px; margin-left: -15px; direction: rtl; font-size: 16px; font-family: IRANSansNums, IRANSans, Tahoma; padding: 0px 15px; line-height: 27px; text-align: justify;"><div class="tutorial" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-size: 15px; line-height: 30px;"><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">محیط های توسعه ی یکپارچه برنامه نویسی یا IDE های زیادی همچون&nbsp; Eclipse، IntelliJ IDEA و NetBeans هستند که به منظور نوشتن برنامه های جاوا و دیگر زبان های برنامه نویسی می توان از آن ها استفاده کرد. در این سری از آموزش ها از محیط برنامه نویسی قدرتمند Eclipse استفاده می کنیم که علاقمندان می توانند به صورت رایگان آن از سایت رسمی&nbsp;<a href="http://www.eclipse.org/downloads/" target="_blank" rel="nofollow" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; color: rgb(76, 175, 80); text-decoration: none; outline: none; background-color: transparent;">Eclipse</a>&nbsp;بسته به نوع سیستم عامل خود دانلود کنند. یکی از دلایلی که شروع برنامه نویسی جاوا را با محیط برنامه نویسی اکلیپس آغاز خواهیم کرد این است که چنانچه بخواهیم در آینده به برنامه نویسی اندروید بپردازیم با هیچ گونه مشکلی مواجه نخواهیم شد زیرا با توجه به این که این نرم افزار رایگان است، شرکت گوگل هم شرایط نصب SDK اندروید را روی این نرم افزار فراهم نموده و ما برای توسعه ی اپلیکیشن های اندروید با هیچ گونه مشکلی مواجه نخواهیم شد.</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">در واقع برنامه Eclipse نیازی به نصب نداشته و صرفا پس از خارج کردن فایل دانلود شده از حالت زیپ با کلیک کردن بر روی آیکان eclipse.exe می توانید آن را اجرا نمایید. به منظور آماده سازی محیط برنامه نویسی جاوا شما حتماً به JRE و JDK نیاز دارید که می توانید آخرین نسخه آن ها را از سایت شرکت&nbsp;<a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank" rel="nofollow" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; color: rgb(76, 175, 80); text-decoration: none; outline: none; background-color: transparent;">Oracle</a>&nbsp;دریافت نمایید. (لازم به ذکر است چنانچه شما نسخه JDK نصب نمایید دیگر نیازی به نصب JRE نخواهید داشت چرا که JDK در برگیرنده JRE نیز می باشد.)</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">پس از اجرای برنامه اکلیپس از شما درخواست می شود تا مسیری را مشخص نمایید تا پروژه های جاوایی که می نویسید را در آن ذخیره سازد. این مسیر به دلخواه شما می تواند هرجایی رو سیستم شما باشد. پس از مشخص کردن مسیر، گزینه OK را انتخاب نموده و این مرحله از کار به پایان می رسد. از آنجا که این اولین باری است که شما نرم افزار را اجرا می کنید، یک صفحه خوش آمد گویی یا Welcome Screen نمایان خواهد شد. پس از نگه داشتن نشانگر موس خود روی تک تک گزینه ها، گزینه مرتبط با Workbench یا صفحه اصلی نرم افزار را پیدا نموده و روی آن کلیک نمایید.</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">حال شما در محیط اصلی نرم افزار قرار دارید. از آنجا که ممکن است شما بیش از یک نسخه از زبان جاوا را روی سیستم خود نصب داشته باشید، نیاز است که در این مرحله برای اکلیپس مشخص کنید که از کدام نسخه جاوا برای اجرای برنامه ها استفاده کند. در منوی اصلی اکلیپس، با انتخاب گزینه Windows زیرشاخه Preferences را انتخاب نمایید. سپس در قسمت چپ پنجره، منوی Java را انتخاب نمایید. با کلیک کردن روی مثلث مشکی رنگ کنار واژه Java، قادر خواهید بود تا زیرشاخه های آن را نیز مشاهده کنید. از میان زیرشاخه ها، گزینه Installed JREs را انتخاب کنید. پس از انتخاب این زیرشاخه در منوی سمت راست، پنجره ای را مشاهده خواهید کرد که کلیه نسخه های JRE جاوا که بر روی سیستم شما نصب است را لیست کرده است. به طور مثال چنانچه نسخه JRE 7 بر روی سیستم عامل شما نصب باشد، این نسخه از جاوا را مشاهده خواهید کرد.</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">حال چنانچه نسخه JRE مد نظر شما در لیست موجود نباشد می توانید روی دکمه Add کلیک نموده و آن را به لیست فوق اضافه نمایید. در پنجره ای که باز خواهد شد روی گزینه Standard VM کلیک نمایید و سپس دکمه Next را کلیک نمایید. حال در بخش JER home مکانی که در آن جاوا را روی سیستم عامل خود نصب نموده اید را مشخص نمایید. نسخه های JRE که روی ویندوز نصب می شوند در مسیر دایرکتوری C &gt; Program Files &gt; Java قرار می گیرند. در صورتی که اکلیپس به صورت خودکار بخش JRE name را پر نکرد می توانید این کار را خود با نامی مرتبط با JRE مد نظر انجام دهید. حال می توانید گزینه Finish را انتخاب نمایید تا تغییرات شما اعمال شود و به صفحه ای بازگردید که در آن نسخه های نصب شده JRE سیستم شما قابل مشاهده هستند. نسخه نصب شده جدید خود را پیدا نموده و آن را انتخاب نمایید. در این مرحله کار شما به پایان رسیده است.</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">در ادامه، در همان منوی اصلی جاوا که از آن Installed JREs را انتخاب نمودید، زیرشاخه Compiler را پیدا نموده و به هیچ وجه آن را باز ننمایید بلکه فقط با کلیک کردن ماوس روی آن، آن را انتخاب نمایید. حال در منوی سمت راست مرتبط با زیرشاخه Complier از بخش Complier compliance level لیستی از نسخه های نصب شده JRE بر روی سیستم عامل را خواهید دید. به طور مثال برای جاوای نسخه 7 مورد 7.1 را از لیست انتخاب نمایید. اکنون می توانید دکمه OK صفحه Preferences را بزنید و به صفحه اصلی نرم افزار اکلیپس باز گردید. در این مرحله، کلیه ی ابزارهای مورد نیاز برای نوشتن اولین برنامه جاوای خود را به صورت رایگان در اختیار دارید.</p><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;"><strong style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">نصب جاوا روی سیستم عامل گنو/لینوکس&nbsp;</strong><br style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">روشی که در اینجا بدان اشاره می کنیم، ساده ترین روش نصب زبان جاوا روی سیستم عامل گنو/لینوکس به خصوص توزیع اوبونتو است. ابتدا ترمینال را باز کرده و دستور زیر را وارد کنید:</p><pre class="line-numbers  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; overflow: auto; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: 13px; padding: 1em 1em 1em 3.8em; margin-top: 0.5em; margin-bottom: 0.5em; line-height: 1.5; color: rgb(248, 248, 242); word-break: normal; word-wrap: break-word; border-radius: 0.3em; direction: ltr; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; text-align: left; word-spacing: normal; tab-size: 4; position: relative; counter-reset: linenumber 0; border: 0px !important; background: rgb(39, 40, 34);"><code class="  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: inherit; padding: 0px; border-radius: 0px; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; direction: ltr; word-spacing: normal; word-break: normal; line-height: 1.5; tab-size: 4; position: relative; background-color: transparent;">sudo apt<span class="token operator" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">-</span>get update<span class="line-numbers-rows" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; position: absolute; pointer-events: none; top: 0px; left: -3.8em; width: 3em; letter-spacing: -1px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(153, 153, 153); -webkit-user-select: none;"><span style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; pointer-events: none; display: block; counter-increment: linenumber 1;"></span></span></code></pre><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">سپس چک کنید ببینید که آیا زبان جاوا روی سیستم شما نصب است یا خیر. برای این منظور، دستور زیر را وارد ترمینال کنید:</p><pre class="line-numbers  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; overflow: auto; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: 13px; padding: 1em 1em 1em 3.8em; margin-top: 0.5em; margin-bottom: 0.5em; line-height: 1.5; color: rgb(248, 248, 242); word-break: normal; word-wrap: break-word; border-radius: 0.3em; direction: ltr; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; text-align: left; word-spacing: normal; tab-size: 4; position: relative; counter-reset: linenumber 0; border: 0px !important; background: rgb(39, 40, 34);"><code class="  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: inherit; padding: 0px; border-radius: 0px; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; direction: ltr; word-spacing: normal; word-break: normal; line-height: 1.5; tab-size: 4; position: relative; background-color: transparent;">java <span class="token operator" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">-</span>version<span class="line-numbers-rows" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; position: absolute; pointer-events: none; top: 0px; left: -3.8em; width: 3em; letter-spacing: -1px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(153, 153, 153); -webkit-user-select: none;"><span style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; pointer-events: none; display: block; counter-increment: linenumber 1;"></span></span></code></pre><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">اگر JRE نصب باشد که نسخه ی آن در معرض دید شما قرار خواهد گرفت و در غیر این صورت،‌ می بایست دستور زیر را وارد نمایید و اینتر کنید:</p><pre class="line-numbers  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; overflow: auto; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: 13px; padding: 1em 1em 1em 3.8em; margin-top: 0.5em; margin-bottom: 0.5em; line-height: 1.5; color: rgb(248, 248, 242); word-break: normal; word-wrap: break-word; border-radius: 0.3em; direction: ltr; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; text-align: left; word-spacing: normal; tab-size: 4; position: relative; counter-reset: linenumber 0; border: 0px !important; background: rgb(39, 40, 34);"><code class="  language-java" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-family: Consolas, Monaco, ''Andale Mono'', monospace; font-size: inherit; padding: 0px; border-radius: 0px; text-shadow: rgba(0, 0, 0, 0.298039) 0px 1px; direction: ltr; word-spacing: normal; word-break: normal; line-height: 1.5; tab-size: 4; position: relative; background-color: transparent;">sudo apt<span class="token operator" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">-</span>get install <span class="token keyword" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; color: rgb(102, 217, 239);">default</span><span class="token operator" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent;">-</span>jre<span class="line-numbers-rows" style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; position: absolute; pointer-events: none; top: 0px; left: -3.8em; width: 3em; letter-spacing: -1px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(153, 153, 153); -webkit-user-select: none;"><span style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; pointer-events: none; display: block; counter-increment: linenumber 1;"></span></span></code></pre><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">این دستور Java Runtime Environment یا همان JRE را روی سیستم شما نصب خواهد کرد. حال اگر نیاز به نصب Java Development Kit یا JDK داشته باشید که برای اجرای برنامه های نوشته شده با جاوا همچون اکلیپس نیاز است، می بایست دستور زیر را وارد کنید:</p><pre class="code-pre " style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; overflow: auto; font-family: Menlo, Monaco, Consolas, ''Courier New'', monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; direction: ltr; border: 0px !important; border-radius: 0px !important; background-color: rgb(245, 245, 245);"><code style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-family: Menlo, Monaco, Consolas, ''Courier New'', monospace; font-size: inherit; padding: 0px; color: inherit; border-radius: 0px; white-space: pre-wrap; background-color: transparent;">sudo apt-get install default-jdk</code></pre><p style="box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px;">در اینجا، مراحل نصب جاوا روی سیستم عامل گنو/لینوکس توزیع اوبونتو برای نوشتن و اجرای دستورات جاوا به پایان می رسد و می توانید برنامه نویسی با زبان جاوا را شروع کنید و از آن لذت ببرید.</p></div></div>\r\n</div>', '2016-07-25 09:25:06', 'نصب ابزارهای جاوا , برنامه نویسی جاوا,آموزش جاوا', 1, 'نصب-ابزارهای-جاوا', 'ابزارهای برنامه نویسی جاوا', NULL, 15, NULL),
(9, '<div style="direction:rtl;text-align:right">\r\n<p>آشنایی با ماشین مجازی جاوا(JVM)</p><p>به طور کلی ماشین مجازی جاوا مستقل از سیستم عامل عمل می کند به همین دلیل یکی از شعارهای جاوا, یکبار بنویس و همه جا اجرا کن می باشد.</p><p>روش کار ماشین مجازی جاوا :<br></p><p>ماشین مجازی جاوا بین سیستم عامل و کد های کامپایل شده جاوا قرار می گیرد و آن ها اجرا می کند به همین دلیل شما نیازی به نوشتن برنامه خود برای پلتفرم های مختلف نخواهید داشت.</p><p>در شکل زیر روش کار آن توضیح داده شده است:</p><p><br></p><p style="text-align: center;"><img src="http://img.viralpatel.net/2008/12/java-program-execution.png"></p><p style="text-align: right;">همانطور که در تصویر مشاهده می کنید می توان ماشین مجازی جاوا را به عنوان یک لایه بین سیستم عامل و کدهای جاوا در نظر گرفت.</p><p style="text-align: right;">کدهای جاوا پس از کامپایل شدن به بایت کد(ByteCode) تبدیل می شوند و این بایت کدها توسط ماشین مجازی جاوا اجرا می شود.</p>\r\n</div>', '2016-07-25 09:44:34', 'ماشین مجازی جاوا,JVM JAVA,دانلود جاوا,برنامه نویسی جاوا,آموزش برنامه نویسی', 4, 'ماشین-مجازی-جاوا', 'آشنایی با ماشین مجازی جاوا', NULL, 15, NULL),
(10, '<div style="direction: rtl; text-align: right;">\r\n<p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">آشنایی با بایت کد در زبان جاوا</p><p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">همانطور که قبلا گفتیم کدهای جاوا برای اجرا بر روی ماشین مجازی ابتدا باید کامپایل و به بایت کد(ByteCode) تبدیل شوند.در این آموزش روش کامپایل و اجرا یک کلاس جاوا را فرا خواهید گرفت :</p><p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;">ابتدا در یک notepad یا هر ادیتور متن دیگری که می خواهید یک فایل با نام HelloWorld.java ایجاد کنید سپس دستور زیر را در آن وارد کنید :</p><p style="font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;"><br></p>\r\n<div class="code">\r\n<p style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;">public class HelloWorld{</span></p><p style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;"><span class="Apple-tab-span" style="white-space:pre">	</span>public static void main(String[] args){</span></p><p style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;"><span class="Apple-tab-span" style="white-space:pre">		</span>System.out.println("Start The Name Off Gode");</span></p><p style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;"><span class="Apple-tab-span" style="white-space:pre">	</span>}</span></p><p style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;">}</span></p>\r\n</div>\r\n<p><span style="font-family: Arial, Verdana; font-size: 13.3333px;">دقت کنید که حروف کو چک و بزرگ کاملا در آن رعایت شده باشد.</span></p><p><span style="font-family: Arial, Verdana; font-size: 13.3333px;">حالا با cmd یا ترمینال در لینوکس وارد پوشه ای که فایل خود را ساخته ایم وارد شده و دستورات زیر را می نویسید:</span></p><p class="code" style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;">javac HelloWorld.java</span></p><p class="code" style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;">java HelloWorld.class</span></p><p class="code" style="text-align: left;"><span style="font-family: Arial, Verdana; font-size: 13.3333px;">Start The Name Off Gode &nbsp;// خروجی</span></p>\r\n<p><span style="font-family: Arial, Verdana; font-size: 13.3333px;">اگر تمام مراحل را بدرستی انجام داده باشید خروجی بالا را خواهید دید.</span></p>\r\n</div>\r\n<style>\r\n.code{\r\nbackground-color:#ccc;\r\npadding:5px;\r\ndirection:ltr !important;\r\n}\r\n</style>', '2016-07-25 10:10:08', 'بایت کد جاوا,آشنایی با بایت کد,', 5, 'بایت-کد-جاوا', 'آشنایی با بایت کد در زبان جاوا', NULL, 15, NULL),
(11, '<p>آشنایی با متغیرها در زبان جاوا</p>\r\n\r\n<p>به طور کلی در برنامه نویسی در هر زبانی ما احتیاج داریم که داده های خود را در مکانی قرار دهیم و از آن استفاده یا با&nbsp;داده های آن کار کنیم به این ظرف یا مکانی که داده ها در آن قرار می گیرد متغیر نام دارد . برای مکان داده ها در زبان های کامپایلری باید اندازه آن را مشخص نمائیم(حجم این ظرف را مشخص نمائیم).به طور مثال ما یک رشته داریم</p>\r\n\r\n<p>Hello World وقتی در خروجی این متن را می خواهیم نمایش دهیم باید آن را&nbsp;داخل مکانی نگهداری و سپس آن را در خروجی نمایش دهیم.در جاوا برای رشته ها می توان از نوع String استفاده نمود برای مثال :</p>\r\n\r\n<p dir="ltr">String str=&quot;Hello World&quot;;</p>\r\n\r\n<p dir="ltr">System.out.println(str);//خروجی Hello World</p>\r\n\r\n<p>دقت کنید که جاوا زبان حساس به حروف کوچک و بزرگ است(حرف اول String &nbsp;بزرگ می باشد زیرا String یک کلاس می باشد چون عملا ما جنس رشته نداریم جاوا این مشکل را با ساخت کلاس String &nbsp;حل کرده است در فصل های بعدی با انواع آن ها آشنا خواهیم شد).</p>\r\n\r\n<p>در خط دوم این متغیر را در خروجی نمایش می دهیم.اگر این برنامه را اجرا نمائید خروجی مورد نظر را مشاهده خواهید کرد.</p>\r\n', '2016-07-26 10:27:10', 'آموزش برنامه نویسی,کد جاوا,آشنایی با متغیرها در جاوا,متغیرها در جاوا', 6, 'متغیرها-در-جاوا', 'آشنایی با متغیرها در زبان جاوا', NULL, 15, NULL),
(12, '<p>آشنایی با کلید واژه ها</p>\r\n\r\n<p>در زبان های برنامه نویسی مفهومی به اسم کلید واژه ها وجود دارد که هر کدام دارای معنای خاصی می باشند و قابل فهم برای آن زبان می باشد.یه عنوان مثال واژه String در جاوا بیانگر کلاس رشته ها می باشد و تعیین کننده جنس رشته می باشد یا if دستور شرط می باشد.جاوا بیش از ۴۰۰۰ کلید واژه دارد که شما اتزم نیست تمام آن ها را حفظ کنید فقط بخشی که لازم است را یاد بگیرید و هر زمان که آن ها را فراموش کردید از منابع استفاده و یاد آوری کنید.</p>\r\n\r\n<p><canvas :netbeans_generated="true" height="400" id="netbeans_glasspane" style="position: fixed; top: 0px; left: 0px; z-index: 50000; pointer-events: none;" width="989"></canvas></p>\r\n', '2016-07-27 09:38:16', 'کلیدواژه ها در جاوا,آموزش جاوا,آموزش برنامه نویسی', 6, 'آموزش-کلیدواژه-ها-در-جاوا', 'آشنایی با کلید واژه ها در جاوا', NULL, 15, NULL),
(13, '<div class="code">\r\n<p>در زبان ها برنامه نویسی مفهومی به اسم متد داریم که در داخل کلاس ها یا بیرون از آن ها تعریف و می تواند تعدادی ورودی یا بدون ورودی باشد یا می تواند مقدار بازگشتی داشته یا نداشته باشد و فقط کار خاصی را انجام دهد به کد زیر توجه کنید :&nbsp;</p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">Class HelloWorld{</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">&nbsp; &nbsp; &nbsp; public String name(){</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return &quot;mostafa&quot;;</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">&nbsp; &nbsp; &nbsp; &nbsp;}</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">&nbsp; &nbsp; &nbsp; public void test(String test){</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;System.out.print(test);</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px; line-height:19.2px">&nbsp; &nbsp; &nbsp; &nbsp;}</span></p>\r\n\r\n<p dir="ltr"><span style="font-size:12px">}</span></p>\r\n\r\n<p>اولین واژه کلاس است که نشان می دهد در حال تعریف کلاس می باشیم دومین پرامتر نام کلاس و بعد از آن {} قرار میگیرد که بدنه کلاس ما داخل آن قرار می گیرد. بعد به تعریف متد می رسیم که &nbsp;</p>\r\n\r\n<ul>\r\n	<li>&nbsp;اولین پارامتر نوع دسترسی متد</li>\r\n	<li>دومین پارامتر تعیین می کند متد مقداری برمی گرداند یا نه</li>\r\n	<li>سومین پارامتر نام متد می باشد</li>\r\n	<li>داخل پرانتز ورودی های متد را تعیین می کند</li>\r\n</ul>\r\n\r\n<p>متد ها با {}&nbsp;بلوک آغاز و با آن پایان می یابد.&nbsp;</p>\r\n\r\n<p>در ادامه مباحث آموزشی از آن ها بیشتر استفاده خواهیم کرد و بیشتر با آن ها آشنا خواهید شد.</p>\r\n</div>\r\n', '2016-07-27 10:00:21', 'متدها در جاوا,آموزش جاوا,آموزش متد ها در جاوا', 7, 'آموزش-متدها-در-جاوا', 'آشنایی با مفهوم متد در جاوا', NULL, 15, NULL),
(14, '<p>شیء گرایی در زبان های برنامه نویسی&nbsp;</p>\r\n\r\n<p>زبان جاوا به طور کلی بر پایه شیءگرایی ساخته شده است شیءگرایی OOP مخفف( Object Oreinted Programing) می باشد که به ساخته اشیاء در برنامه نویسی &nbsp;اشاره میکند.</p>\r\n\r\n<p>با چند مثال شیءگرایی را توضیح می دهیم :</p>\r\n\r\n<p>به طور مثال شما یک میز را در نظر بگیرید یک میز دارای یک سری ویژگی ها مثل&nbsp;رنگ مشکی و دستگیره های سفید&nbsp;است. حال در جایی دیگر همین میز رنگش سفید و دستگیره های آن مشکی می باشد.ساختار و قالب آن ها یکی می باشد ولی با هم تفاوت دارند.در مفهوم شیء گرایی هم به همین صورت است شما یک مدل از روی میز می سازید به عنوان مثال (طول و عرض و ارتفاع و رنگ) حال از روی این مدل هزاران هزار میز با اندازه ها و رنگ های متفاوت می سازیم.حال اگر تغییری در شیءخواستیم انجام دهیم کافیست این تغییر را فقط درون مدل انجام دهیم و تمام شیءهایی که از روی مدل ما ساخته شده این تغییر بر روی آن ها اعمال می شود.این در حالی است که در گذشته و در زبان های غیر شیءگرا انجام این کار نیاز به تغییرات اساسی در کد داشت و با مشکلات زیادی مواجه می شدیم.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2016-07-27 10:34:16', 'مقدمه ای بر مفهوم شیء گرایی', 7, 'شیءگرایی-در-جاوا', 'مقدمه ای بر مفهوم شیء گرایی', NULL, 15, NULL),
(15, '<p>ارورهای جاوا</p>\r\n\r\n<p>در برنامه نویسی جاوا ارورها به چند دسته تقسیم می شوند :&nbsp;</p>\r\n\r\n<p>۱- compile time error : این ارورها در زمان اجرا مشخص می شوند به طور مثال زمانی که کلید واژه ها را به طور اشتباه وارد کرده باشیم مثلا به جای System حروف اول آن را کوچک وارد می کنیم در زمان اجرا با این ارور مواجه می شویم البته در بیشتر ادیتورها این ارورها را نمایش می دهند و می توانید آن ها را برطرف نمائید.</p>\r\n\r\n<p>۲-Unchecked Runtime Exception : در این ارورها برنامه&nbsp;به طور صحیح و کامل اجرا نمی شود به طور مثال شما در یک متغیر از جنس Integer مقدار ۱۰۰,۰۰ را وارد می کنید در زمان اجرا به شما ارور می دهد که مقدار وارد شده صحیح نمی باشد و باید از نوع عدد باشد حالا زمانی که مقدار 100000 را وارد کنیم برنامه به صورت صحیح اجرا می شود.</p>\r\n\r\n<p>۳-Logical یا منطقی : در&nbsp;این ارورها برنامه به صورت کامل اجرا می شود و کار هم می کند اما در آینده ممکن است با مشکلاتی زیادی مواجه شویم .رفع این ارورها ممکن است ساعت ها یا هفته ها طول بکشد.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>هشدارها در جاوا</p>\r\n\r\n<p>متغیرهایی که تعریف و از آن ها به هیچ وجه&nbsp;استفاده نشده به صورت هشدار نمایش داده می شوند</p>\r\n', '2016-08-02 10:03:03', 'بررسی ارورهای جاوا,برنامه جاوا ,برنامه نویسی جاوا ,آموزش جاوا', 8, 'ارورهای-جاوا', 'بررسی ارورهای جاوا', NULL, 15, NULL),
(16, '<p>کامنت ها در جاوا</p>\r\n\r\n<p>در برنامه نویسی ممکن پس از مدتی از تحویل پروژه بخواهیم بخشی از برنامه را ویرایش کنیم در اینصورت ممکن است فراموش کرده باشیم در مکان های مخنلف چه کاری انجام داده ایم. برای رفع این مشکل تز کامن گذاری استفاده می شود که توضیحاتی برای قسمت های مورد نیاز اضافه می کنیم.</p>\r\n\r\n<p>انواع کامنت ها</p>\r\n\r\n<p>1-توضیحات چند خطی : در هر جایی که خواستیم توضیحات طولانی در مورد بخشی از برنامه داشته باشیم از آن ها استفاده می کنیم که با */ شروع و با /* تمام می شود و خط های بین آنها کامپایل نمی شود.</p>\r\n\r\n<pre dir="ltr">\r\n<span style="color:rgb(102, 217, 239)">class</span> TestComment {\r\n    <span style="color:rgb(112, 128, 144)">/*\r\n    * This is a multi-line comment!\r\n    */</span>\r\n    <span style="color:rgb(102, 217, 239)">public</span> <span style="color:rgb(102, 217, 239)">static</span> <span style="color:rgb(102, 217, 239)">void</span> <span style="color:rgb(230, 219, 116)">main</span>(String[] args) {\r\n        String test =&quot;Hello Comment&quot;;\r\n&nbsp;       System.out.println(test);\r\n    }\r\n}</pre>\r\n\r\n<p>2-توضیحات تک خطی : این توضیحات در ادامه خط اضافه شده و بعد از // قرار می گیرند و توسط برنامه کامپایل نمی شوند</p>\r\n\r\n<pre dir="ltr">\r\n<span style="color:rgb(102, 217, 239)">class</span> TestComment {\r\n    <span style="color:rgb(102, 217, 239)">public</span> <span style="color:rgb(102, 217, 239)">static</span> <span style="color:rgb(102, 217, 239)">void</span> <span style="color:rgb(230, 219, 116)">main</span>(String[] args) {  <span style="color:rgb(112, 128, 144)">//This is a method</span>\r\n</pre>\r\n\r\n<pre dir="ltr">\r\n        String test =&quot;Hello Comment&quot;;\r\n&nbsp;       System.out.println(test);\r\n    }\r\n}</pre>\r\n\r\n<p style="text-align:justify">3-کامنت های javadoc : این کامنت ها به عنوان javadoc شناخته می شوند و هر زمانی که بخواهیم می توانیم از آن ها خروجی html گرفته و در اختیار دیگران قرار دهیم.</p>\r\n\r\n<pre dir="ltr">\r\n<span style="color:rgb(102, 217, 239)">class</span> TestJavaDoc {\r\n    <span style="color:rgb(112, 128, 144)">/**\r\n    * This is a javadoc comment for you!\r\n    */</span>\r\n    <span style="color:rgb(102, 217, 239)">public</span> <span style="color:rgb(102, 217, 239)">static</span> <span style="color:rgb(102, 217, 239)">void</span> <span style="color:rgb(230, 219, 116)">main</span>(String[] args) {\r\n        String test = <span style="color:rgb(166, 226, 46)">&quot;Hello World&quot;</span>;\r\n        System.out.<span style="color:rgb(230, 219, 116)">println</span>(test);\r\n    }\r\n}</pre>\r\n\r\n<p dir="ltr">&nbsp;</p>\r\n', '2016-08-02 10:28:44', 'کامنت ها در زبان جاوا,آموزش جاوا, برنامه نویسی جاوا', 9, 'کامنت-ها-در-جاوا', 'کامنت ها در زبان جاوا', NULL, 15, NULL);

--
-- Triggers `Content`
--
DROP TRIGGER IF EXISTS `AddDeveloperBackup`;
DELIMITER //
CREATE TRIGGER `AddDeveloperBackup` AFTER INSERT ON `Content`
 FOR EACH ROW begin

INSERT INTO `DveloperBackup`.`Content`
(`id`, `content`, `created_at`, `meta`,
 `order_list`, `slug`, `title`, 
`updated_at`, `ContentCategory_id`, `User_id`)
VALUES (new.id,new.content,new.created_at,
        new.meta,new.order_list,
        new.slug,new.title,
        new.updated_at,new.ContentCategory_id,new.User_id);

end
//
DELIMITER ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

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
(15, '2016-07-24 09:40:03', 'آموزش برنامه نویسی جاوا در سایت گمانه', 1, 'برنامه نویسی جاوا ,دانلود جاوا,آموزش برنامه نویسی , کد جاوا', 'برنامه-نویسی-جاوا', 'برنامه نویسی جاوا', NULL, 1, 1);

--
-- Triggers `ContentCategory`
--
DROP TRIGGER IF EXISTS `AddBackupContentCategoryData`;
DELIMITER //
CREATE TRIGGER `AddBackupContentCategoryData` AFTER INSERT ON `ContentCategory`
 FOR EACH ROW begin

INSERT INTO `DveloperBackup`.`ContentCategory`
(`id`, `created_at`, `describtion`
, `enable`, `meta`, `slug`, `title`, `updated_at`,
 `visible`, `subctg`) VALUES
(new.id,new.created_at,new.describtion,
 new.enable,new.meta,new.slug,new.title,
 new.updated_at,new.visible,new.subctg);
end
//
DELIMITER ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `Portfolio`
--

INSERT INTO `Portfolio` (`id`, `created_at`, `describtion`, `finished`, `img`, `percent`, `PortfolioCategory_id`, `title`, `updated_at`, `url`, `visit`) VALUES
(22, NULL, 'اصلی ترین نقطه قوت تابلوهای دیجیتال که در تبلیغات مورد استفاده قرار می گیرند،این‌است که می توانند پیام‌ها را به سرعت برحسب شرایط تغییر دهند و به عبارت بهتر، پیام‌ها را با شرایط فوری، انطباق دهند. هدف این وب سایت جذب مشتری از طریق اینترنت می باشد.\r\n ', '2017-01-10 00:00:00', '1_1468405845530.png;2_1468405845532.png;3_1468405845533.png;4_1468405845534.png;5_1468405845537.png;', 40, 2, 'دنیای LED', NULL, 'donyayeled.com', 1),
(23, '2016-07-13 15:37:31', 'هدف از طراحی این سایت معرفی محصولات شرکت Burnishing Tools  می باشد . ', '2015-12-12 00:00:00', '1_1468408051472.png;2_1468408051475.png;3_1468408051475.png;4_1468408051475.png;5_1468408051476.png;', 70, 1, 'ابزار Burnishing Tools', '2016-07-13 16:30:51', 'imexroll.com', 2),
(24, '2016-07-13 15:57:02', 'هدف از طراحی سایت انتشارات لوح برتر فروش کتاب ها از طریق اینترنت و انجام کارها از طریق وب ایت می باشد', '2016-02-11 00:00:00', '1_1468409222160.png;2_1468409222161.png;3_1468409222162.png;4_1468409222163.png;5_1468409222165.png;', 100, 2, 'انتشارات لوح برتر', '2016-07-23 09:03:29', 'lohebartar.ir', 2),
(25, '2016-07-17 09:37:42', 'test', '2016-07-12 00:00:00', '1_1468732062586.jpg;2_1468732062588.png;', 0, 1, 'test', NULL, 'test.com', 0),
(26, '2016-07-17 09:38:18', 'test', '2016-07-27 00:00:00', '1_1468732098564.jpg;2_1468732098566.jpg;', 0, 1, 'test22', NULL, 'test.com', 0);

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
