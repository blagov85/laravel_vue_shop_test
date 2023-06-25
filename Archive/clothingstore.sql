-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: db1.ho.ua
-- Время создания: Июн 25 2023 г., 17:56
-- Версия сервера: 8.0.32
-- Версия PHP: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `clothingstore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Asics', '2023-04-26 09:20:37', '2023-04-26 09:20:37'),
(2, 'Camel Active', '2023-04-26 09:20:52', '2023-04-26 09:20:52'),
(3, 'Columbia', '2023-04-26 09:21:04', '2023-04-26 09:21:04'),
(4, 'Fila', '2023-04-26 09:21:18', '2023-04-26 09:21:18'),
(5, 'Hi-Tec', '2023-04-26 09:21:30', '2023-04-26 09:21:30'),
(6, 'Iguana', '2023-04-26 09:21:40', '2023-04-26 09:21:40'),
(7, 'Jack Wolfskin', '2023-04-26 09:21:56', '2023-04-26 09:21:56'),
(8, 'Lego Wear', '2023-04-26 09:22:14', '2023-04-26 09:22:14'),
(9, 'New Balance', '2023-04-26 09:22:27', '2023-04-26 09:22:27'),
(10, 'Nike', '2023-04-26 09:22:37', '2023-04-26 09:22:37'),
(11, 'Northland', '2023-04-26 09:22:54', '2023-04-26 09:22:54'),
(12, 'Outventure', '2023-04-26 09:23:12', '2023-04-26 09:23:12'),
(13, 'Puma', '2023-04-26 09:23:25', '2023-04-26 09:23:25'),
(14, 'Regatta', '2023-04-26 09:23:36', '2023-04-26 09:23:36'),
(15, 'Under Armour', '2023-04-26 09:24:29', '2023-04-26 09:24:29'),
(16, 'Spyder', '2023-05-11 15:44:27', '2023-05-11 15:44:27');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Вітровка', '2023-04-26 09:02:00', '2023-04-26 09:02:00'),
(2, 'Жилет', '2023-04-26 09:02:13', '2023-04-26 09:02:13'),
(3, 'Куртка', '2023-04-26 09:02:25', '2023-04-26 09:02:25'),
(4, 'Пальто', '2023-04-26 09:02:35', '2023-04-26 09:02:35'),
(5, 'Плащ', '2023-04-26 09:02:52', '2023-04-26 09:02:52'),
(6, 'Пуховик', '2023-04-26 09:03:02', '2023-04-26 09:03:02'),
(7, 'Джемпер', '2023-04-26 09:03:13', '2023-04-26 09:03:13'),
(8, 'Светр', '2023-04-26 09:03:22', '2023-04-26 09:03:22'),
(9, 'Кардиган', '2023-04-26 09:04:05', '2023-04-26 09:04:05'),
(10, 'Толстовка', '2023-04-26 09:04:20', '2023-04-26 09:04:20'),
(11, 'Худі', '2023-04-26 09:04:30', '2023-04-26 09:04:30'),
(12, 'Бріджі', '2023-04-26 09:04:39', '2023-04-26 09:04:39'),
(13, 'Брюки', '2023-04-26 09:04:49', '2023-04-26 09:04:49'),
(14, 'Джинси', '2023-04-26 09:05:00', '2023-04-26 09:05:00'),
(15, 'Спортивні штани', '2023-04-26 09:05:13', '2023-04-26 09:05:13'),
(16, 'Шорти', '2023-04-26 09:05:23', '2023-04-26 09:05:23'),
(17, 'Майка', '2023-04-26 09:05:32', '2023-04-26 09:05:32'),
(18, 'Поло', '2023-04-26 09:05:41', '2023-04-26 09:05:41'),
(19, 'Топ', '2023-04-26 09:05:50', '2023-04-26 09:05:50'),
(20, 'Футболка', '2023-04-26 09:05:59', '2023-04-26 09:05:59'),
(21, 'Капелюх', '2023-04-26 09:06:10', '2023-04-26 09:06:10'),
(22, 'Кепка', '2023-04-26 09:06:18', '2023-04-26 09:06:18'),
(23, 'Панама', '2023-04-26 09:06:28', '2023-04-26 09:06:28'),
(24, 'Шапка', '2023-04-26 09:06:38', '2023-04-26 09:06:38'),
(25, 'Рукавички', '2023-04-26 09:40:02', '2023-04-26 09:40:02'),
(26, 'Рукавиці', '2023-04-26 09:40:13', '2023-04-26 09:40:13'),
(27, 'Шарфи', '2023-04-26 09:40:23', '2023-04-26 09:40:23'),
(28, 'Шкарпетки', '2023-04-26 09:40:37', '2023-04-26 09:40:37');

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `title`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Бежевий', 'dbc8b9', '2023-04-28 07:22:23', '2023-04-28 07:22:23'),
(2, 'Блакитний', '54acff', '2023-04-28 07:22:54', '2023-04-28 07:22:54'),
(3, 'Бордовий', '900020', '2023-04-28 07:23:20', '2023-04-28 07:23:20'),
(4, 'Білий', 'ffffff', '2023-04-28 07:23:52', '2023-04-28 07:23:52'),
(5, 'Бірюзовий', 'a1d8db', '2023-04-28 07:24:24', '2023-04-28 07:24:24'),
(6, 'Жовтий', 'ffff00', '2023-04-28 07:24:47', '2023-04-28 07:24:47'),
(7, 'Зелений', '008000', '2023-04-28 07:25:11', '2023-04-28 07:25:11'),
(8, 'Кораловий', 'fc8a8a', '2023-04-28 07:25:35', '2023-04-28 07:25:35'),
(9, 'Коричневий', 'ab6634', '2023-04-28 07:25:58', '2023-04-28 07:25:58'),
(10, 'Помаранчевий', 'ff8c00', '2023-04-28 07:26:27', '2023-04-28 07:26:27'),
(11, 'Рожевий', 'ffa8c2', '2023-04-28 07:26:51', '2023-04-28 07:26:51'),
(12, 'Синій', '0057ae', '2023-04-28 07:27:13', '2023-04-28 07:27:13'),
(13, 'Сірий', 'bebebe', '2023-04-28 07:27:36', '2023-04-28 07:27:36'),
(14, 'Фіолетовий', '9600c0', '2023-04-28 07:28:03', '2023-04-28 07:28:03'),
(15, 'Хакі', 'bcb676', '2023-04-28 07:28:27', '2023-04-28 07:28:27'),
(16, 'Червоний', 'ff0000', '2023-04-28 07:28:49', '2023-04-28 07:28:49'),
(17, 'Чорний', '000000', '2023-04-28 07:29:10', '2023-04-28 07:29:10');

-- --------------------------------------------------------

--
-- Структура таблицы `color_products`
--

CREATE TABLE `color_products` (
  `id` bigint UNSIGNED NOT NULL,
  `color_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `color_products`
--

INSERT INTO `color_products` (`id`, `color_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 13, 2, NULL, NULL),
(2, 11, 3, NULL, NULL),
(8, 17, 7, NULL, NULL),
(20, 6, 5, NULL, NULL),
(21, 17, 19, NULL, NULL),
(22, 17, 20, NULL, NULL),
(23, 17, 22, NULL, NULL),
(24, 6, 23, NULL, NULL),
(25, 11, 24, NULL, NULL),
(26, 2, 25, NULL, NULL),
(27, 12, 26, NULL, NULL),
(28, 9, 27, NULL, NULL),
(29, 11, 28, NULL, NULL),
(30, 1, 29, NULL, NULL),
(31, 13, 30, NULL, NULL),
(32, 7, 31, NULL, NULL),
(33, 11, 32, NULL, NULL),
(34, 13, 33, NULL, NULL),
(35, 13, 34, NULL, NULL),
(36, 12, 35, NULL, NULL),
(37, 17, 36, NULL, NULL),
(39, 17, 38, NULL, NULL),
(40, 10, 39, NULL, NULL),
(41, 17, 39, NULL, NULL),
(42, 17, 40, NULL, NULL),
(43, 16, 41, NULL, NULL),
(44, 2, 42, NULL, NULL),
(45, 10, 43, NULL, NULL),
(46, 4, 44, NULL, NULL),
(47, 16, 44, NULL, NULL),
(48, 1, 45, NULL, NULL),
(49, 13, 46, NULL, NULL),
(50, 13, 47, NULL, NULL),
(51, 1, 48, NULL, NULL),
(52, 13, 49, NULL, NULL),
(53, 17, 50, NULL, NULL),
(54, 12, 51, NULL, NULL),
(55, 17, 52, NULL, NULL),
(56, 13, 52, NULL, NULL),
(57, 4, 52, NULL, NULL),
(58, 3, 53, NULL, NULL),
(59, 17, 54, NULL, NULL),
(60, 2, 55, NULL, NULL),
(61, 2, 56, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Австрія', '2023-04-25 09:13:26', '2023-04-25 09:13:26'),
(2, 'Бангладеш', '2023-04-25 09:13:54', '2023-04-25 09:13:54'),
(3, 'Болгарія', '2023-04-25 09:14:21', '2023-04-25 09:14:21'),
(4, 'Велика Британія', '2023-04-25 09:14:39', '2023-04-25 09:14:39'),
(5, 'В\'єтнам', '2023-04-25 09:14:51', '2023-04-25 09:14:51'),
(6, 'Греція', '2023-04-25 09:15:12', '2023-04-25 09:15:12'),
(7, 'Індія', '2023-04-25 09:15:38', '2023-04-25 09:15:38'),
(8, 'Індонезія', '2023-04-25 09:15:50', '2023-04-25 09:15:50'),
(9, 'Іспанія', '2023-04-25 09:16:07', '2023-04-25 09:16:07'),
(10, 'Італія', '2023-04-25 09:16:21', '2023-04-25 09:16:21'),
(11, 'Камбоджа', '2023-04-25 09:16:36', '2023-04-25 09:16:36'),
(12, 'Китай', '2023-04-25 09:16:53', '2023-04-25 09:16:53'),
(13, 'Німеччина', '2023-04-25 09:17:35', '2023-04-25 09:17:35'),
(14, 'Пакистан', '2023-04-25 09:17:51', '2023-04-25 09:17:51'),
(15, 'Польща', '2023-04-25 09:18:08', '2023-04-25 09:18:08'),
(16, 'Румунія', '2023-04-25 09:18:23', '2023-04-25 09:18:23'),
(17, 'Словаччина', '2023-04-25 09:18:44', '2023-04-25 09:18:44'),
(18, 'США', '2023-04-25 09:19:02', '2023-04-25 09:19:02'),
(19, 'Туреччина', '2023-04-25 09:19:18', '2023-04-25 09:19:18'),
(20, 'Україна', '2023-04-25 09:19:31', '2023-04-25 09:19:31'),
(21, 'Франція', '2023-04-25 09:19:49', '2023-04-25 09:19:49'),
(22, 'Чехія', '2023-04-25 09:20:04', '2023-04-25 09:20:04'),
(23, 'Швеція', '2023-04-25 09:20:16', '2023-04-25 09:20:16');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_companies`
--

CREATE TABLE `delivery_companies` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `delivery_companies`
--

INSERT INTO `delivery_companies` (`id`, `title`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Нова пошта', 100, '2023-04-25 08:56:23', '2023-04-25 08:56:23'),
(2, 'Укрпошта', 50, '2023-04-25 08:56:39', '2023-04-25 08:56:39'),
(3, 'Meest Express', 70, '2023-04-25 08:57:39', '2023-04-25 08:57:39'),
(4, 'Delivery', 40, '2023-04-25 08:57:51', '2023-04-25 08:57:51');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '2618e32c-fec9-4872-9b84-514eacb398a4', 'database', 'default', '{\"uuid\":\"2618e32c-fec9-4872-9b84-514eacb398a4\",\"displayName\":\"App\\\\Notifications\\\\MailResetPasswordNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:47:\\\"App\\\\Notifications\\\\MailResetPasswordNotification\\\":2:{s:5:\\\"token\\\";s:64:\\\"625fb3c3b2163ce35888a7520f17cb0883b2ac9082ee8720a717e507880c1887\\\";s:2:\\\"id\\\";s:36:\\\"e2445145-b470-4965-b96c-84fdaa68d337\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"smtp.mailtrap.io:2525\": stream_socket_client(): Unable to connect to smtp.mailtrap.io:2525 (Permission denied) in /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(253): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(192): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/AbstractTransport.php(68): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(136): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(285): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#9 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#10 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#11 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#12 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#13 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#14 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow()\n#15 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#16 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#20 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Pipeline\\Pipeline->then()\n#28 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#32 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#33 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(130): Illuminate\\Queue\\Worker->daemon()\n#34 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(114): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#40 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#41 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Command/Command.php(308): Illuminate\\Console\\Command->execute()\n#42 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(998): Illuminate\\Console\\Command->run()\n#44 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#46 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#47 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(194): Illuminate\\Console\\Application->run()\n#48 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(263): Illuminate\\Console\\Application->call()\n#49 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(337): Illuminate\\Foundation\\Console\\Kernel->call()\n#50 /virt/homes/clothingstore/htdocs/routes/web.php(23): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#51 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(237): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#52 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(207): Illuminate\\Routing\\Route->runCallable()\n#53 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(725): Illuminate\\Routing\\Route->run()\n#54 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#55 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#57 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#59 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#60 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#61 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#62 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#63 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#64 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#65 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#66 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#68 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(726): Illuminate\\Pipeline\\Pipeline->then()\n#70 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Routing\\Router->runRouteWithinStack()\n#71 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(667): Illuminate\\Routing\\Router->runRoute()\n#72 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(656): Illuminate\\Routing\\Router->dispatchToRoute()\n#73 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(167): Illuminate\\Routing\\Router->dispatch()\n#74 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#75 /virt/homes/clothingstore/htdocs/app/Http/Middleware/CheckEmployee.php(45): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#76 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): App\\Http\\Middleware\\CheckEmployee->handle()\n#77 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#78 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#79 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#80 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#81 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#82 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#83 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#84 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#85 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#86 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#87 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#88 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#89 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#90 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#91 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#92 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then()\n#93 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#94 /virt/homes/clothingstore/htdocs/public/index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#95 {main}', '2023-05-15 13:01:53'),
(2, '3febd5dc-356e-43c9-af51-cb6e6a311878', 'database', 'default', '{\"uuid\":\"3febd5dc-356e-43c9-af51-cb6e6a311878\",\"displayName\":\"App\\\\Notifications\\\\MailResetPasswordNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:47:\\\"App\\\\Notifications\\\\MailResetPasswordNotification\\\":2:{s:5:\\\"token\\\";s:64:\\\"f77cbb5cb72922b8172d9f3bd894b8f318d63150fab4bb8b47975eec6e960f41\\\";s:2:\\\"id\\\";s:36:\\\"b88e39a9-c644-4019-aa85-c826b7d4c7e1\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"smtp.mailtrap.io:2525\": stream_socket_client(): Unable to connect to smtp.mailtrap.io:2525 (Permission denied) in /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(253): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(192): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/AbstractTransport.php(68): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(136): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(285): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#9 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#10 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#11 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#12 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#13 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#14 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow()\n#15 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#16 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#20 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Pipeline\\Pipeline->then()\n#28 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#32 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#33 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(130): Illuminate\\Queue\\Worker->daemon()\n#34 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(114): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#40 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#41 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Command/Command.php(308): Illuminate\\Console\\Command->execute()\n#42 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(998): Illuminate\\Console\\Command->run()\n#44 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#46 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#47 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(194): Illuminate\\Console\\Application->run()\n#48 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(263): Illuminate\\Console\\Application->call()\n#49 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(337): Illuminate\\Foundation\\Console\\Kernel->call()\n#50 /virt/homes/clothingstore/htdocs/routes/web.php(23): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#51 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(237): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#52 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(207): Illuminate\\Routing\\Route->runCallable()\n#53 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(725): Illuminate\\Routing\\Route->run()\n#54 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#55 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#57 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#59 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#60 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#61 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#62 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#63 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#64 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#65 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#66 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#68 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(726): Illuminate\\Pipeline\\Pipeline->then()\n#70 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Routing\\Router->runRouteWithinStack()\n#71 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(667): Illuminate\\Routing\\Router->runRoute()\n#72 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(656): Illuminate\\Routing\\Router->dispatchToRoute()\n#73 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(167): Illuminate\\Routing\\Router->dispatch()\n#74 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#75 /virt/homes/clothingstore/htdocs/app/Http/Middleware/CheckEmployee.php(45): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#76 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): App\\Http\\Middleware\\CheckEmployee->handle()\n#77 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#78 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#79 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#80 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#81 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#82 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#83 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#84 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#85 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#86 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#87 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#88 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#89 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#90 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#91 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#92 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then()\n#93 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#94 /virt/homes/clothingstore/htdocs/public/index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#95 {main}', '2023-05-15 13:01:53');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(3, 'a54f8c5b-5109-401a-9088-8e66937d0fd1', 'database', 'default', '{\"uuid\":\"a54f8c5b-5109-401a-9088-8e66937d0fd1\",\"displayName\":\"App\\\\Notifications\\\\MailResetPasswordNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:47:\\\"App\\\\Notifications\\\\MailResetPasswordNotification\\\":2:{s:5:\\\"token\\\";s:64:\\\"3e5fee23edb065600c17a441abf5b1ed49e2e9320ab360b4e32d9c9a4361e143\\\";s:2:\\\"id\\\";s:36:\\\"0aa5d883-e4fb-4b2a-bfc1-6654edcba05c\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"smtp.mailtrap.io:2525\": stream_socket_client(): Unable to connect to smtp.mailtrap.io:2525 (Permission denied) in /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(253): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(192): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/AbstractTransport.php(68): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(136): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(285): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#9 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#10 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#11 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#12 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#13 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#14 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow()\n#15 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#16 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#20 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Pipeline\\Pipeline->then()\n#28 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#32 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#33 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(130): Illuminate\\Queue\\Worker->daemon()\n#34 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(114): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#40 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#41 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Command/Command.php(308): Illuminate\\Console\\Command->execute()\n#42 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(998): Illuminate\\Console\\Command->run()\n#44 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#46 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#47 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(194): Illuminate\\Console\\Application->run()\n#48 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(263): Illuminate\\Console\\Application->call()\n#49 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(337): Illuminate\\Foundation\\Console\\Kernel->call()\n#50 /virt/homes/clothingstore/htdocs/routes/web.php(23): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#51 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(237): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#52 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(207): Illuminate\\Routing\\Route->runCallable()\n#53 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(725): Illuminate\\Routing\\Route->run()\n#54 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#55 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#57 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#59 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#60 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#61 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#62 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#63 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#64 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#65 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#66 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#68 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(726): Illuminate\\Pipeline\\Pipeline->then()\n#70 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Routing\\Router->runRouteWithinStack()\n#71 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(667): Illuminate\\Routing\\Router->runRoute()\n#72 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(656): Illuminate\\Routing\\Router->dispatchToRoute()\n#73 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(167): Illuminate\\Routing\\Router->dispatch()\n#74 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#75 /virt/homes/clothingstore/htdocs/app/Http/Middleware/CheckEmployee.php(45): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#76 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): App\\Http\\Middleware\\CheckEmployee->handle()\n#77 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#78 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#79 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#80 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#81 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#82 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#83 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#84 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#85 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#86 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#87 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#88 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#89 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#90 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#91 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#92 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then()\n#93 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#94 /virt/homes/clothingstore/htdocs/public/index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#95 {main}', '2023-05-15 13:01:53'),
(4, '5edb9add-a55d-4ca2-8ad3-2d02aab13f55', 'database', 'default', '{\"uuid\":\"5edb9add-a55d-4ca2-8ad3-2d02aab13f55\",\"displayName\":\"App\\\\Notifications\\\\MailResetPasswordNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:47:\\\"App\\\\Notifications\\\\MailResetPasswordNotification\\\":2:{s:5:\\\"token\\\";s:64:\\\"b419c13e14c3be5a5494be0076107f7058fcdd96adca4ab3dc6520b21fb4079a\\\";s:2:\\\"id\\\";s:36:\\\"8f4bc22a-32c3-4c5c-84a6-3fd79b15fe8d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"smtp.mailtrap.io:2525\": stream_socket_client(): Unable to connect to smtp.mailtrap.io:2525 (Permission denied) in /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(253): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(192): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/AbstractTransport.php(68): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(136): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(285): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#9 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#10 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#11 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#12 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#13 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#14 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow()\n#15 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#16 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#20 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Pipeline\\Pipeline->then()\n#28 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#32 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#33 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(130): Illuminate\\Queue\\Worker->daemon()\n#34 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(114): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#40 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#41 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Command/Command.php(308): Illuminate\\Console\\Command->execute()\n#42 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(998): Illuminate\\Console\\Command->run()\n#44 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#46 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#47 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(194): Illuminate\\Console\\Application->run()\n#48 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(263): Illuminate\\Console\\Application->call()\n#49 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(337): Illuminate\\Foundation\\Console\\Kernel->call()\n#50 /virt/homes/clothingstore/htdocs/routes/web.php(23): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#51 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(237): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#52 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(207): Illuminate\\Routing\\Route->runCallable()\n#53 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(725): Illuminate\\Routing\\Route->run()\n#54 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#55 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#57 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#59 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#60 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#61 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#62 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#63 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#64 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#65 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#66 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#68 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(726): Illuminate\\Pipeline\\Pipeline->then()\n#70 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Routing\\Router->runRouteWithinStack()\n#71 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(667): Illuminate\\Routing\\Router->runRoute()\n#72 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(656): Illuminate\\Routing\\Router->dispatchToRoute()\n#73 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(167): Illuminate\\Routing\\Router->dispatch()\n#74 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#75 /virt/homes/clothingstore/htdocs/app/Http/Middleware/CheckEmployee.php(45): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#76 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): App\\Http\\Middleware\\CheckEmployee->handle()\n#77 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#78 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#79 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#80 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#81 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#82 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#83 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#84 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#85 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#86 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#87 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#88 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#89 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#90 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#91 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#92 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then()\n#93 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#94 /virt/homes/clothingstore/htdocs/public/index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#95 {main}', '2023-05-15 13:01:53');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(5, '204e1c2f-b479-46ea-8a84-90705e631003', 'database', 'default', '{\"uuid\":\"204e1c2f-b479-46ea-8a84-90705e631003\",\"displayName\":\"App\\\\Notifications\\\\MailResetPasswordNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:47:\\\"App\\\\Notifications\\\\MailResetPasswordNotification\\\":2:{s:5:\\\"token\\\";s:64:\\\"6165b2d0baa975c916a0547335567114c43f2dc9a86d4efa31ffe01e8c834c6a\\\";s:2:\\\"id\\\";s:36:\\\"6318189e-47f3-45e7-92ef-89eed734284e\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"smtp.mailtrap.io:2525\": stream_socket_client(): Unable to connect to smtp.mailtrap.io:2525 (Permission denied) in /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(253): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(192): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/AbstractTransport.php(68): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /virt/homes/clothingstore/htdocs/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(136): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(285): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#9 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#10 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#11 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#12 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#13 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#14 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow()\n#15 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#16 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#20 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Pipeline\\Pipeline->then()\n#28 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#32 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#33 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(130): Illuminate\\Queue\\Worker->daemon()\n#34 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(114): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Container/Container.php(651): Illuminate\\Container\\BoundMethod::call()\n#40 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#41 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Command/Command.php(308): Illuminate\\Console\\Command->execute()\n#42 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(998): Illuminate\\Console\\Command->run()\n#44 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /virt/homes/clothingstore/htdocs/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#46 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#47 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Console/Application.php(194): Illuminate\\Console\\Application->run()\n#48 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(263): Illuminate\\Console\\Application->call()\n#49 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(337): Illuminate\\Foundation\\Console\\Kernel->call()\n#50 /virt/homes/clothingstore/htdocs/routes/web.php(23): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#51 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(237): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#52 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Route.php(207): Illuminate\\Routing\\Route->runCallable()\n#53 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(725): Illuminate\\Routing\\Route->run()\n#54 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#55 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#57 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(78): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#59 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#60 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#61 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#62 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#63 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#64 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#65 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#66 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#68 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(726): Illuminate\\Pipeline\\Pipeline->then()\n#70 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(703): Illuminate\\Routing\\Router->runRouteWithinStack()\n#71 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(667): Illuminate\\Routing\\Router->runRoute()\n#72 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Routing/Router.php(656): Illuminate\\Routing\\Router->dispatchToRoute()\n#73 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(167): Illuminate\\Routing\\Router->dispatch()\n#74 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#75 /virt/homes/clothingstore/htdocs/app/Http/Middleware/CheckEmployee.php(45): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#76 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): App\\Http\\Middleware\\CheckEmployee->handle()\n#77 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#78 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#79 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#80 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#81 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#82 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#83 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#84 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#85 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#86 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#87 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#88 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#89 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#90 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#91 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#92 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(142): Illuminate\\Pipeline\\Pipeline->then()\n#93 /virt/homes/clothingstore/htdocs/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(111): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#94 /virt/homes/clothingstore/htdocs/public/index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#95 {main}', '2023-05-15 13:53:19');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` smallint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('new','active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `message`, `rating`, `product_id`, `user_id`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Улюблена футболка, дуже зручна', NULL, 2, 3, NULL, 'active', '2023-05-19 15:40:25', '2023-05-19 15:43:15'),
(2, 'Улюблена футболка, дуже зручна', 5, 2, 3, NULL, 'active', '2023-05-19 15:41:27', '2023-05-19 15:42:06'),
(3, 'Дякуємо за ваш відгук!', NULL, 2, 1, 2, 'active', '2023-05-19 15:42:55', '2023-05-19 15:43:15'),
(5, 'Куртка сподобалася. Колір, фасон, якість пошиття – все влаштувало. Ношу із задоволенням.', NULL, 5, 5, NULL, 'active', '2023-05-25 16:12:56', '2023-06-11 12:52:47'),
(7, 'Куртка добре сидить, розмір збігається. У сильний дощ воду не пропускає, у сильний дощ не потрапляв.', 5, 7, 8, NULL, 'active', '2023-06-18 14:33:54', '2023-06-24 08:56:05'),
(8, 'Якісні, але, гадаю, маломірять злегка', 4, 3, 9, NULL, 'active', '2023-06-18 14:45:09', '2023-06-24 08:58:28'),
(9, 'Виглядає здорово. Але липне до неї все, що може. Доводиться часто чистити роликом', 4, 7, 10, NULL, 'active', '2023-06-18 14:54:12', '2023-06-24 08:58:59'),
(10, 'Я в захваті від цієї желетки. Дуже зручна', 5, 19, 11, NULL, 'active', '2023-06-18 15:24:52', '2023-06-24 08:58:59'),
(11, 'Жилетка непогана, акуратно пошита, але дуже тонка, наповнювач не рівномірно розподілений, тільки на весну', 3, 19, 11, NULL, 'active', '2023-06-18 15:26:47', '2023-06-24 08:58:59'),
(12, 'Гарний пуховик!', NULL, 27, 1, NULL, 'new', '2023-06-22 13:39:48', '2023-06-22 13:39:48'),
(13, 'Дуже гарної якості та стильна', 5, 23, 12, NULL, 'active', '2023-06-24 08:47:24', '2023-06-24 08:58:59'),
(14, 'Велика', 3, 24, 12, NULL, 'active', '2023-06-24 08:47:41', '2023-06-24 08:58:28'),
(15, 'Хороша тепла куртка, якість відмінна', 5, 24, 13, NULL, 'active', '2023-06-24 08:53:36', '2023-06-24 08:56:05'),
(16, 'Дякуємо за ваш відгук. Ви можете оформити повернення товару. Будь-ласка, зв\'яжіться з нашим магазином за телефоном.', NULL, 24, 1, 14, 'active', '2023-06-24 09:01:39', '2023-06-24 09:01:57'),
(17, 'Якість сподобалося. Доставка швидка', 5, 25, 14, NULL, 'new', '2023-06-24 09:04:44', '2023-06-24 09:04:44'),
(18, 'Відмінне худи і за якістю, на вигляд, але мені не вистачило довжини.', 4, 28, 14, NULL, 'new', '2023-06-24 09:07:24', '2023-06-24 09:07:24'),
(19, 'Бренд як завжди радує', 5, 32, 14, NULL, 'new', '2023-06-24 09:08:01', '2023-06-24 09:08:01');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Пуховик FAIRMONT MEN', '2023-06-14 14:46:55', '2023-06-14 14:46:55'),
(2, 'Футболка T-Shirt 1/2Arm', '2023-06-14 15:39:10', '2023-06-14 15:39:10'),
(3, 'Вітровка DESERT WIND JACKET M', '2023-06-14 15:55:11', '2023-06-14 15:55:11'),
(4, 'Вітровка', '2023-06-14 16:15:41', '2023-06-14 16:15:41'),
(5, 'Жилет', '2023-06-14 16:18:10', '2023-06-14 16:18:10'),
(6, 'Напівпальто', '2023-06-14 16:22:01', '2023-06-14 16:22:01'),
(7, 'Джемпер', '2023-06-14 16:27:51', '2023-06-14 16:27:51'),
(8, 'Светр', '2023-06-14 16:31:38', '2023-06-14 16:31:38'),
(9, 'Брюки чоловічі', '2023-06-14 16:35:17', '2023-06-14 16:35:17'),
(10, 'Бриджі жіночі', '2023-06-15 15:41:06', '2023-06-15 15:41:06'),
(11, 'Аксесуари', '2023-06-15 15:42:41', '2023-06-15 15:42:41'),
(12, 'Топи', '2023-06-15 15:46:53', '2023-06-15 15:46:53');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Бавовна', '2023-04-26 09:32:20', '2023-04-26 09:32:20'),
(2, 'Бамбук', '2023-04-26 09:32:30', '2023-04-26 09:32:30'),
(3, 'Віскоза', '2023-04-26 09:32:39', '2023-04-26 09:32:39'),
(4, 'Вовна', '2023-04-26 09:32:48', '2023-04-26 09:32:48'),
(5, 'Еластан', '2023-04-26 09:33:06', '2023-04-26 09:33:06'),
(6, 'Кожа', '2023-04-26 09:33:19', '2023-04-26 09:33:19'),
(7, 'Конопля', '2023-04-26 09:33:51', '2023-04-26 09:33:51'),
(8, 'Ліоцелл', '2023-04-26 09:34:01', '2023-04-26 09:34:01'),
(9, 'Льон', '2023-04-26 09:34:13', '2023-04-26 09:34:13'),
(10, 'Нейлон', '2023-04-26 09:34:23', '2023-04-26 09:34:23'),
(11, 'Поліакріл', '2023-04-26 09:34:36', '2023-04-26 09:34:36'),
(12, 'Поліамід', '2023-04-26 09:34:47', '2023-04-26 09:34:47'),
(13, 'Поліестер', '2023-04-26 09:34:58', '2023-04-26 09:34:58'),
(14, 'Пух', '2023-04-26 09:35:12', '2023-04-26 09:35:12'),
(15, 'Синтетичні матеріали', '2023-04-26 09:35:28', '2023-04-26 09:35:28'),
(16, 'Спондекс', '2023-04-26 09:35:41', '2023-04-26 09:35:41'),
(17, 'Текстиль', '2023-04-26 09:35:51', '2023-04-26 09:35:51');

-- --------------------------------------------------------

--
-- Структура таблицы `material_products`
--

CREATE TABLE `material_products` (
  `id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percent` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `material_products`
--

INSERT INTO `material_products` (`id`, `material_id`, `product_id`, `created_at`, `updated_at`, `percent`) VALUES
(2, 1, 2, '2023-04-28 08:52:23', '2023-05-14 07:15:36', 100),
(3, 8, 3, '2023-04-28 09:26:28', '2023-05-14 07:15:05', 44),
(4, 13, 3, '2023-04-28 09:26:28', '2023-05-14 07:15:05', 50),
(5, 5, 3, '2023-04-28 09:26:28', '2023-05-14 07:15:05', 6),
(12, 13, 7, '2023-05-07 05:09:44', '2023-06-14 16:16:30', 100),
(24, 12, 5, '2023-05-07 12:29:40', '2023-06-14 16:20:37', 2),
(25, 13, 5, '2023-05-07 12:29:40', '2023-06-14 16:20:37', 24),
(26, 10, 19, '2023-05-07 12:42:05', '2023-06-14 16:19:19', 100),
(27, 13, 20, '2023-05-07 12:51:24', '2023-05-14 07:13:16', 100),
(28, 12, 22, '2023-05-07 15:23:30', '2023-05-14 07:12:38', 2),
(29, 13, 22, '2023-05-07 15:23:30', '2023-05-14 07:12:38', 98),
(30, 13, 23, '2023-05-07 15:29:15', '2023-06-14 16:24:18', 100),
(31, 13, 24, '2023-05-07 15:32:51', '2023-06-14 16:23:45', 100),
(32, 13, 25, '2023-05-07 15:36:21', '2023-05-14 07:11:13', 100),
(33, 13, 26, '2023-05-07 15:45:48', '2023-06-14 14:48:34', 50),
(34, 14, 26, '2023-05-07 15:45:48', '2023-06-14 14:48:34', 97),
(35, 13, 27, '2023-05-07 15:50:14', '2023-06-14 14:48:21', 40),
(36, 14, 27, '2023-05-07 15:50:14', '2023-06-14 14:48:21', 60),
(37, 13, 28, '2023-05-07 15:53:48', '2023-06-14 16:28:17', 80),
(38, 5, 28, '2023-05-07 15:53:48', '2023-06-14 16:28:17', 20),
(39, 1, 29, '2023-05-07 15:58:09', '2023-06-14 16:33:11', 70),
(40, 11, 29, '2023-05-07 15:58:09', '2023-06-14 16:33:11', 30),
(41, 1, 30, '2023-05-07 16:01:54', '2023-06-14 16:33:38', 70),
(42, 11, 30, '2023-05-07 16:01:54', '2023-06-14 16:33:38', 30),
(43, 1, 31, '2023-05-07 16:05:25', '2023-06-14 16:33:51', 80),
(44, 13, 31, '2023-05-07 16:05:25', '2023-06-14 16:33:51', 20),
(45, 1, 32, '2023-05-07 16:10:01', '2023-06-14 16:29:07', 68),
(46, 13, 32, '2023-05-07 16:10:01', '2023-06-14 16:29:07', 32),
(47, 12, 33, '2023-05-07 16:14:42', '2023-06-15 15:41:45', 60),
(48, 13, 33, '2023-05-07 16:14:42', '2023-06-15 15:41:45', 30),
(49, 5, 33, '2023-05-07 16:14:42', '2023-06-15 15:41:45', 30),
(50, 1, 34, '2023-05-07 16:19:36', '2023-06-15 15:38:30', 70),
(51, 12, 34, '2023-05-07 16:19:36', '2023-06-15 15:38:30', 30),
(52, 1, 35, '2023-05-07 16:25:11', '2023-06-15 15:38:53', 99),
(53, 5, 35, '2023-05-07 16:25:11', '2023-06-15 15:38:53', 1),
(54, 13, 36, '2023-05-07 16:32:33', '2023-06-15 15:39:10', 55),
(55, 5, 36, '2023-05-07 16:32:33', '2023-06-15 15:39:10', 45),
(57, 1, 38, '2023-05-11 14:43:12', '2023-05-14 07:03:26', 68),
(58, 13, 38, '2023-05-11 14:43:12', '2023-05-14 07:03:26', 32),
(59, 13, 39, '2023-05-11 14:47:58', '2023-06-15 15:41:55', 100),
(60, 13, 40, '2023-05-11 14:51:02', '2023-05-14 07:02:15', 100),
(61, 13, 41, '2023-05-11 14:55:41', '2023-06-15 15:47:21', 100),
(62, 1, 42, '2023-05-11 14:59:09', '2023-05-14 07:00:35', 100),
(63, 13, 43, '2023-05-11 15:24:42', '2023-06-15 15:47:38', 88),
(64, 5, 43, '2023-05-11 15:24:42', '2023-06-15 15:47:38', 12),
(65, 1, 44, '2023-05-11 15:28:00', '2023-05-14 06:53:31', 100),
(66, 12, 45, '2023-05-11 15:31:37', '2023-06-15 15:43:40', 100),
(67, 13, 46, '2023-05-11 15:33:57', '2023-06-15 15:44:16', 100),
(68, 1, 47, '2023-05-11 15:37:28', '2023-06-15 15:44:32', 100),
(69, 4, 48, '2023-05-11 15:40:13', '2023-06-15 15:44:44', 70),
(70, 13, 48, '2023-05-11 15:40:13', '2023-06-15 15:44:44', 30),
(71, 13, 49, '2023-05-11 15:42:54', '2023-06-15 15:45:40', 50),
(72, 4, 49, '2023-05-11 15:42:54', '2023-06-15 15:45:40', 30),
(73, 12, 49, '2023-05-11 15:42:54', '2023-06-15 15:45:40', 20),
(74, 13, 50, '2023-05-11 15:46:09', '2023-06-15 15:45:47', 100),
(75, 1, 51, '2023-05-11 15:48:03', '2023-06-15 15:45:27', 100),
(76, 1, 52, '2023-05-11 15:51:40', '2023-05-14 06:49:58', 70),
(77, 10, 52, '2023-05-11 15:51:40', '2023-05-14 06:49:58', 16),
(78, 13, 52, '2023-05-11 15:51:40', '2023-05-14 06:49:58', 11),
(79, 16, 52, '2023-05-11 15:51:40', '2023-05-14 06:49:58', 3),
(80, 14, 53, '2023-06-14 15:36:16', '2023-06-14 15:36:16', 60),
(81, 13, 53, '2023-06-14 15:36:16', '2023-06-14 15:36:16', 40),
(82, 1, 54, '2023-06-14 15:42:42', '2023-06-14 15:42:42', 100),
(83, 1, 55, '2023-06-14 15:47:45', '2023-06-14 15:47:45', 100),
(84, 13, 56, '2023-06-14 16:03:32', '2023-06-14 16:03:32', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_08_130645_create_categories_table', 1),
(6, '2022_06_09_062140_create_groups_table', 1),
(7, '2022_06_09_065721_create_tags_table', 1),
(8, '2022_06_09_065909_create_colors_table', 1),
(9, '2022_06_09_075910_add_surname_patronymic_age_address_gender_to_users_table', 1),
(10, '2022_06_10_061101_create_products_table', 1),
(11, '2022_06_10_064942_create_color_products_table', 1),
(12, '2022_06_10_065038_create_product_tags_table', 1),
(13, '2022_06_12_093533_add_column_soft_deletes_to_products', 1),
(14, '2022_06_17_131913_add_column_old_price_to_products_table', 1),
(15, '2022_06_18_061355_add_column_group_id_to_products_table', 1),
(16, '2022_06_19_081324_create_product_images_table', 1),
(17, '2022_07_02_055542_add_column_role_to_users_table', 1),
(18, '2022_07_07_062245_create_roles_table', 1),
(19, '2022_07_09_132230_create_product_sizes_table', 1),
(20, '2022_07_09_133901_create_sizes_table', 1),
(21, '2022_07_14_062917_create_orders_table', 1),
(22, '2022_08_06_100559_create_countries_table', 1),
(23, '2022_08_06_100900_create_brands_table', 1),
(24, '2022_08_06_101002_create_materials_table', 1),
(25, '2022_08_06_101209_create_seasons_table', 1),
(26, '2022_08_06_101604_create_material_products_table', 1),
(27, '2022_08_06_101741_create_product_seasons_table', 1),
(28, '2022_08_07_094259_create_sexes_table', 1),
(29, '2022_08_07_124709_add_column_brand_id_sex_id_country_id_to_products_table', 1),
(30, '2022_08_07_133710_add_column_percent_to_material_products_table', 1),
(31, '2022_08_19_072645_create_sortings_table', 1),
(32, '2022_08_19_075032_change_type_column_title_to_sortings_table', 1),
(33, '2022_09_07_162826_change_user_id_column_to_orders_table', 1),
(34, '2022_09_07_163855_change_column_age_to_users_table', 1),
(35, '2022_09_07_164122_change_type_column_birth_date_to_users_table', 1),
(36, '2022_09_07_164625_create_orders_table', 1),
(37, '2022_09_12_060602_create_product_user_likes_table', 1),
(38, '2022_09_17_095706_create_feedback_table', 1),
(39, '2022_09_17_115350_add_column_parent_id_to_feedback_table', 1),
(40, '2022_10_13_093053_create_regions_table', 1),
(41, '2022_10_14_090613_add_column_region_id_to_users_table', 1),
(42, '2022_10_14_103347_create_delivery_companies_table', 1),
(43, '2022_10_14_122044_create_order_statuses_table', 1),
(44, '2022_10_15_111941_create_payments_table', 1),
(45, '2022_10_15_115231_change_column_payment_status_to_orders_table', 1),
(46, '2022_10_15_115852_change_payment_status_title_to_orders_table', 1),
(47, '2022_10_15_120423_add_columns_to_orders_table', 1),
(48, '2022_10_15_122310_add_column_region_id_to_orders_table', 1),
(49, '2022_10_16_161507_add_column_to_orders_table', 1),
(50, '2022_10_25_154203_add_column_to_orders_table', 1),
(51, '2023_01_08_123255_create_jobs_table', 1),
(52, '2023_04_25_090645_create_product_sizes_table', 2),
(53, '2023_04_25_091523_change_type_payment_id_to_table_orders', 3),
(54, '2023_04_25_093829_add_column_payment_id_to_orders_table', 4),
(55, '2023_04_25_110410_drop_column_address_to_users_table', 5),
(56, '2023_04_25_111022_add_columns_to_users_table', 6),
(57, '2023_04_26_095535_drop_columns_to_orders_table', 7),
(58, '2023_04_26_100226_drop_columns_to_orders_table', 8),
(59, '2023_04_26_100835_add_columns_to_orders_table', 9),
(60, '2023_04_26_145732_change_column_to_colors_table', 10),
(61, '2023_04_26_145919_add_column_to_colors_table', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total_price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_DC` smallint UNSIGNED NOT NULL DEFAULT '1',
  `settlement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'settlement',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delivery_cost` int NOT NULL DEFAULT '0',
  `payment_id` bigint UNSIGNED NOT NULL,
  `delivery_company_id` bigint UNSIGNED NOT NULL,
  `region_id` bigint UNSIGNED NOT NULL,
  `status_id` bigint UNSIGNED NOT NULL
) ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `products`, `total_price`, `created_at`, `updated_at`, `department_DC`, `settlement`, `name`, `surname`, `email`, `phone`, `delivery_cost`, `payment_id`, `delivery_company_id`, `region_id`, `status_id`) VALUES
(1, 6, '[{\"id\":2,\"title\":\"\\u0424\\u0443\\u0442\\u0431\\u043e\\u043b\\u043a\\u0430 T-Shirt 1\\/2Arm\",\"price\":700,\"size_id\":5,\"size_title\":\"L\",\"qty\":2},{\"id\":3,\"title\":\"\\u0421\\u043f\\u043e\\u0440\\u0442\\u0438\\u0432\\u043d\\u0456 \\u0448\\u0442\\u0430\\u043d\\u0438 KASHI W\",\"price\":754,\"size_id\":4,\"size_title\":\"M\",\"qty\":3},{\"id\":3,\"title\":\"\\u0421\\u043f\\u043e\\u0440\\u0442\\u0438\\u0432\\u043d\\u0456 \\u0448\\u0442\\u0430\\u043d\\u0438 KASHI W\",\"price\":754,\"size_id\":1,\"size_title\":\"XXS\",\"qty\":2},{\"id\":23,\"title\":\"\\u041d\\u0430\\u043f\\u0456\\u0432\\u043f\\u0430\\u043b\\u044c\\u0442\\u043e COAT (310370-8R26-63) , \\u041a\\u043e\\u043b\\u0456\\u0440 - \\u0436\\u043e\\u0432\\u0442\\u0438\\u0439\",\"price\":7399,\"size_id\":5,\"size_title\":\"L\",\"qty\":4}]', 34766, '2023-06-13 04:50:58', '2023-06-13 04:50:58', 2, 'Стрий', 'Ігор', 'Ігоров', 'igor@gmail.com', '+380 (54) 545-34-53', 50, 1, 2, 13, 1),
(2, 10, '[{\"id\":7,\"title\":\"\\u0412\\u0456\\u0442\\u0440\\u043e\\u0432\\u043a\\u0430 DESERT WIND JACKET M (1306412_6000) , \\u041a\\u043e\\u043b\\u0456\\u0440 - \\u0447\\u043e\\u0440\\u043d\\u0438\\u0439\",\"price\":5999,\"size_id\":4,\"size_title\":\"M\",\"qty\":1}]', 5999, '2023-06-18 14:53:14', '2023-06-18 14:53:14', 1, 'Львів', 'Антон', 'Антонов', 'fsdfsdf@gmail.com', '+380 (06) 896-67-67', 100, 1, 1, 13, 1),
(3, 12, '[{\"id\":23,\"title\":\"\\u041d\\u0430\\u043f\\u0456\\u0432\\u043f\\u0430\\u043b\\u044c\\u0442\\u043e COAT (310370-8R26-63) , \\u041a\\u043e\\u043b\\u0456\\u0440 - \\u0436\\u043e\\u0432\\u0442\\u0438\\u0439\",\"price\":7399,\"size_id\":6,\"size_title\":\"XL\",\"qty\":1}]', 7399, '2023-06-24 08:52:05', '2023-06-24 08:52:05', 2, 'Львів', 'Марина', 'Шевченко', 'avaowhy@gmail.com', '+380 (68) 947-32-61', 100, 1, 1, 13, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Обробляється менеджером', NULL, NULL),
(2, 'Підтверджено. Очікує відправлення', NULL, NULL),
(3, 'Передано в службу доставки', NULL, NULL),
(4, 'Отримано', NULL, NULL),
(5, 'Відмінено', NULL, NULL),
(6, 'Відмова при отриманні', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('olena.blahov@gmail.com', '$2y$10$JVkrcmQaQQ8Kd60D3PwRRu/Uill4zQkfscu.aSeUFi6CSHFFQHCAi', '2023-06-12 13:14:12'),
('andrblag@gmail.com', '$2y$10$chOoYoA/c6YivfY/lIzCO.wJXw4Ah1INMCykW.w0PAGfF8b7MgPie', '2023-06-12 13:14:26');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Очікує оплати', NULL, NULL),
(2, 'Оплачено', NULL, NULL),
(3, 'Оплата після отримання', NULL, NULL),
(4, 'Кредит', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `old_price` int DEFAULT NULL,
  `count` int NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `sex_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `country_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `content`, `preview_image`, `price`, `old_price`, `count`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `group_id`, `brand_id`, `sex_id`, `country_id`) VALUES
(2, 'Футболка T-Shirt 1/2Arm', 'Футболка чоловіча сірого кольору', 'Футболка - редмет одягу, що закриває тулуб та зазвичай не має ґудзиків, коміра та кишень, з короткими рукавами. Футболки, як і будь-який інший одяг, бувають чоловічі і жіночі. Футболку одягають через голову. Її рукави зазвичай доходять до середини плеча.<br>', 'images/DYTDCARpC7SqcCH9OgZID7wIUbdCXwpIqdS6vtYr.jpg', 700, NULL, 1, 20, '2023-04-28 08:52:23', '2023-04-28 08:52:23', NULL, NULL, 2, 1, 2),
(3, 'Спортивні штани KASHI W', 'Колір світло-рожевий. Спортивні штани KASHI W виконані з якісних матеріалів, забезпечать зносостійкість, міцність.', '<p>Спортивні штани KASHI W виконані з якісних матеріалів, забезпечать зносостійкість, міцність. При дотриманні правил прання та догляду, тривалий час зберігають первісний вигляд. Тканина щільністю 260г/м, приємна до тіла, гіпоалергенна, легка. Виріб підходить для повсякденного носіння, активного відпочинку, занять спортом. Стильний дизайн, ніжно-рожевий колір доповнить гардероб. Передбачено три кишені для особистих речей.<br></p>', 'images/iT0iOHee32QcUtRmWYbJ6UFbTllZAp7Z7Ohqsf4j.jpg', 754, 993, 1, 15, '2023-04-28 09:26:28', '2023-04-28 09:28:57', NULL, NULL, 6, 2, 12),
(5, 'Вітровка LIGHTSOME WANDER JKT M (1307661_5156) , Колір - жовтий', 'Ідеально підходить для ваших походів, вітрівка LIGHTSOME WANDER JKT M від Jack Worfskin є правильним вибором для всіх видів активного відпочинку.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Ідеально підходить для ваших походів, вітрівка LIGHTSOME WANDER JKT M від Jack Worfskin є правильним вибором для всіх видів активного відпочинку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">З використанням вітронепроникної та дихаючої тканини TEXASHIELD PRO. Всередині швидковисихаючий TEXADRI відводить вологу від шкіри назовні, де вона може швидко випаруватися.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Ця екологічно чиста куртка виготовлена з переробленого матеріалу. Щоб відрегулювати капюшон відповідно до ваших потреб, просто скористайтеся шнурами.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Нагрудна кишеня, 4 кишені на стегнах, внутрішня кишеня</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Капюшон: фіксований, регульований</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- З перероблених матеріалів</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- TEXASHIELD PRO- вітрозахисний матеріал</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Матеріал TEXADRI швидко вбирає піт, відводячи його від шкіри</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Швидке висихання</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Регульована талія</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вага: 530 г (розмір M)</span><br></p>', 'images/Uq74gfDDuuFn3aDXf4f8Xqqr3b10fqt9ZVOSCTKF.jpg', 6999, NULL, 1, 1, '2023-05-06 16:42:52', '2023-06-14 16:20:37', NULL, 4, 7, 1, 11),
(7, 'Вітровка DESERT WIND JACKET M (1306412_6000) , Колір - чорний', 'DESERT WIND JACKET M від Jack Wolfskin- вітронепроникна куртка зі спортивним дизайном, яка ідеально підходить для повсякденного носіння та подорожей.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">DESERT WIND JACKET M від Jack Wolfskin- вітронепроникна куртка зі спортивним дизайном, яка ідеально підходить для повсякденного носіння та подорожей.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Міцна тканина STORMLOCK має приємну бавовняну текстуру, тягнеться під час руху та пропускає повітря, що робить DESERT WIND ідеальним для активного використання на природі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Для подорожей і повсякденного носіння</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вітрозахисна, водовідштовхувальна тканина TEXASHIELD</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікований bluesign</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Нагрудна кишеня, 2 кишені на стегнах, капюшон</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вага: 485 г (розмір M)</span><br></p>', 'images/awjPiQmUk5rO9kDoNnIdO240fa299BpG81uaQoYp.jpg', 5999, NULL, 1, 1, '2023-05-07 05:09:44', '2023-06-14 16:16:30', NULL, 4, 7, 1, 2),
(19, 'Жилет LADY SOLNIS (LADY SOLNIS-BLACK) , Колір - чорний', 'Жилетка LADY SOLNIS виготовлена з легкого матеріалу, який добре зберігає тепло та захищає від холоду.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Жилетка LADY SOLNIS виготовлена з легкого матеріалу, який добре зберігає тепло та захищає від холоду. У вітряну погоду можна накинути на голову капюшон, який утеплений і захищає від вітру , а якщо забудете рукавички, зігрійте руки в кишенях спереду.Простий спортивний крій і класичне забарвлення роблять модель жилетки гармонійною з будь-яким елементом жіночого гардеробу.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Високий комір-стійка для захисту від вітру</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Капюшон інтегрований з жилеткою - відмінно захищає голову від холоду</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Низ куртки на шнурку</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- 2 кишені на блискавках</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Має легкий утеплювач, який не сковує рухів 160 г / м2</span><br></p>', 'images/KmOsZuGBHEYAXIM3b4G35rSpDoLcET4XbhVfamX9.jpg', 3199, NULL, 1, 2, '2023-05-07 12:42:05', '2023-06-14 16:19:19', NULL, 5, 5, 2, 12),
(20, 'Жилет LADY SANO (LADY SANO-BLACK) , Колір - чорний', 'Жилет LADY SANO вдало доповнить ваш гардероб та неодмінно стане в пригоді під час перехідного сезону, коли з’являться перші похолодання.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Жилет LADY SANO вдало доповнить ваш гардероб та неодмінно стане в пригоді під час перехідного сезону, коли з’являться перші похолодання. Спеціальний спортивний крій не сковує рухів і дає повну свободу та прекрасну посадку. Синтетичний утеплювач (100% поліестер, 160 г/м2) підвищує тепловий комфорт, зберігаючи ваше тепло. Високий комірець захистить шию від вітру. А у просторих кишенях на застібку-блискавку ви зможете зігріти руки та зберігати всі важливі для вас речі.</span><br></p>', 'images/IbIyXpOnkkys3hlrb1xlZnh1jywF4FpdTyZitsbi.jpg', 2899, NULL, 1, 2, '2023-05-07 12:51:24', '2023-05-07 12:51:24', NULL, NULL, 1, 2, 12),
(22, 'Куртка утеплена JASPER INS JKT M (1114321_6000) , Колір - чорний', 'Утеплена куртка HEIDELSTEIN має трохи подовжений крій для кращого захисту від вітру та негоди.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Утеплена куртка HEIDELSTEIN має трохи подовжений крій для кращого захисту від вітру та негоди. Двостороння блискавка та шарнірні лікті забезпечують хорошу свободу рухів. Зовнішня тканина TEXAPORE CORE робить куртку водонепроникною, вітрозахисною та дуже дихаючою. Куртка наповнена теплим та вологостійким синтетичним утеплювачем із переробленого поліестеру. У трьох кишенях є місце для дрібниць.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний функціональний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Регульовані манжети</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Зручні кишені</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Мембранна надійна тканина TEXAPORE CORE</span><br></p>', 'images/Y2koVL8lTGzU3onvfxrN1uPcLjEfQXUaOBq9D1QK.jpg', 6299, NULL, 1, 3, '2023-05-07 15:23:30', '2023-05-07 15:23:30', NULL, NULL, 7, 1, 2),
(23, 'Напівпальто COAT (310370-8R26-63) , Колір - жовтий', 'Напівпальто COAT – це вибір яскравих жінок. Бадьорий та практичний дизайн неодмінно додаватиме барви у повсякденність.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Напівпальто COAT – це вибір яскравих жінок. Бадьорий та практичний дизайн неодмінно додаватиме барви у повсякденність.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Звичайний крій ідеально облягає фігуру. Чотири кишені розташовані по боках та застібаються на блискавку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виготовлене з переробленого поліестеру для підтримки екології. Підкладка чудово зберігає тепло та зігріває, не містить пуху.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Водовідштовхувальна обробка гарантує повну гідроізоляцію.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Добре захищає від вітру. Цей варіант зможе вразити красою будь-кого.</span><br></p>', 'images/15fooJ5tmw4UwWy8am98L80FUEfGDO5aH7BvkZwT.jpg', 7399, NULL, 1, 4, '2023-05-07 15:29:15', '2023-06-14 16:24:18', NULL, 6, 2, 2, 12),
(24, 'Напівпальто NORTH YORK COAT W (1205501_3068) , Колір - сіро-рожевий', 'Що б ви не запланували, можете бути впевнені в одному: пальто шорти NORTH YORK зігріє вас.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Що б ви не запланували, можете бути впевнені в одному: пальто шорти NORTH YORK зігріє вас. Основна тканина TEXASHIELD, виготовлена з переробленого матеріалу, захищає від пронизливого зимового вітру та дощу.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Пальто має дуже теплий, нечутливий до вологи синтетичний утеплювач TEXATHERM, виготовлений із переробленого поліестеру, та довгий тонкий крій, який зігріває вас від голови до стегон.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Капюшон регулюється шнурком, за потреби його можна відстебнути.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний практичний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Без ПФУ</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікований сертифікатом bluesign та Green Button</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Верхній водостійкий матеріал TEXASHIELD</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Дуже теплий синтетичний утеплювач TEXATHERM із переробленого синтетичного волокна</span><br></p>', 'images/5kS2e3VqedmSQ9XMBM9Xhd1JEtRZ8XOAz4bUI0cq.jpg', 4499, NULL, 1, 4, '2023-05-07 15:32:51', '2023-06-14 16:23:45', NULL, 6, 7, 2, 8),
(25, 'Плащ DAKAR PARKA W (1112502_1282) , Колір - блакитний', 'Плащ CAPE YORK PARADISE COAT W від Jack Wolfskin зовні виглядає класичним, всередині акцент виходить на перший план.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Плащ CAPE YORK PARADISE COAT W від Jack Wolfskin зовні виглядає класичним, всередині акцент виходить на перший план.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виробник повністю підбили куртку підкладкою з переробленої тафти з принтом. Якщо ви носите піджак закритий, квітковий візерунок лише визирає з-за капюшона- приємна деталь.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Такий образ робить пальто придатним як для відпочинку, так і для бізнесу. CAPE YORK PARADISE COAT також технологічне: зовнішній матеріал TEXAPORE ECOSPHERE дуже водонепроникний, вітронепроникний і перероблений. Дуже хороша повітропроникність забезпечує комфортну посадку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Для подорожей і повсякденного життя</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Водонепроникність, вітрозахист</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Повний принт всередині</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- З переробленими матеріалами</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Фіксований капюшон з регульованим полем огляду та об’ємом</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Світловідбиваючий логотип</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Основна тканина TEXAPORE ECOSPHERE: перероблений, водонепроникний, вітронепроникний і дихаючий зовнішній матеріал (номінальний рівень водяного стовпа: 20 000 мм*)</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- SOFTTOUCH TAFETTA ECOSPHERE DECOR: еластична тканина з принтом, виготовлена з переробленого поліестеру (підкладка)</span><br></p>', 'images/drm94nKROMEPVgghSa5oVKxbXFF8d9D51I2ADite.jpg', 8899, NULL, 1, 5, '2023-05-07 15:36:21', '2023-05-07 15:36:21', NULL, NULL, 7, 2, 2),
(26, 'Пуховик FAIRMONT MEN (1203591_1383) , Колір - синій', 'FAIRMONT — вітрозахисна та дуже тепла пухова куртка.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">FAIRMONT — вітрозахисна та дуже тепла пухова куртка. Тканина TEXASHIELD є водовідштовхувальною та дихаючою, а також захищає від невеликого дощу та снігопаду. При розробці цієї моделі основна увага приділялася мінімальній вазі та максимальній теплоізоляції, тому був обраний високоефективний наповнювач з качиного пуху, сертифікований RDS.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">FAIRMONT можна акуратно скласти в сумку, що додається, і носити в рюкзаку в якості теплої резервної куртки. Якщо вам не потрібен каптур, просто відстебніть його.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний практичний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Без ПФУ</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікований сертифікатом bluesign</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Верхній водостійкий матеріал TEXASHIELD</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Пуховий наповнювач</span><br></p>', 'images/2uH5n3m5sFyoEzGhrAn9pJvsKafD75MmvmsLtUb9.jpg', 6199, NULL, 1, 6, '2023-05-07 15:45:48', '2023-06-14 14:48:34', NULL, 1, 7, 1, 11),
(27, 'Пуховик FAIRMONT MEN (1203591_4610) , Колір - сіро-коричневий', 'FAIRMONT — вітрозахисна та дуже тепла пухова куртка.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">FAIRMONT — вітрозахисна та дуже тепла пухова куртка. Тканина TEXASHIELD є водовідштовхувальною та дихаючою, а також захищає від невеликого дощу та снігопаду. При розробці цієї моделі основна увага приділялася мінімальній вазі та максимальній теплоізоляції, тому був обраний високоефективний наповнювач з качиного пуху, сертифікований RDS.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">FAIRMONT можна акуратно скласти в сумку, що додається, і носити в рюкзаку в якості теплої резервної куртки. Якщо вам не потрібен каптур, просто відстебніть його.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний практичний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Без ПФУ</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікований сертифікатом bluesign</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Верхній водостійкий матеріал TEXASHIELD</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Пуховий наповнювач</span><br></p>', 'images/BXeUUFQSeMxmUMSgQb1I2HYqkj6gT4Gf8xQUuCh2.jpg', 6199, NULL, 1, 6, '2023-05-07 15:50:13', '2023-06-14 14:48:21', NULL, 1, 7, 1, 11),
(28, 'Джемпер KIANO W (KIANO W-SILVER PINK) , Колір - світло-рожевий', 'KIANO W - це жіноча толстовка в ніжно-рожевому кольорі, підкреслить смак і індивідуальність.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">KIANO W - це жіноча толстовка в ніжно-рожевому кольорі, підкреслить смак і індивідуальність.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Відмінно поєднується з джинсами та зі спортивними штанами.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Забезпечить комфортні та легкі рухи, зручну посадку завдяки прямому крою.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Високоякісний матеріал, поліестер, є одним з найміцніших, стійкий до зносу, приємний до тіла і має гарний зовнішній вигляд.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Додавання волокна Модал, який повністю виготовляється з деревної целюлози, здатний покращити характеристики тканини, вона стає м\'якшою, менше скочується, тривалий час зберігає інтенсивний колір.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Високоякісний матеріал</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Відведення вологи від тіла</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Збереження тепла</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Капюшон</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Еластичні манжети</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сучасний дизайн</span><br></p>', 'images/coxHo6bD4uSrH25gQPSb3HjQtBknji9OPreO7Fx6.jpg', 1599, NULL, 1, 7, '2023-05-07 15:53:48', '2023-06-14 16:28:17', NULL, 7, 6, 2, 12),
(29, 'Светр Knit 1/1 Troyer (409585-8K06-19) , Колір - сіро-бежевий', 'Светр Knit 1/1 Troyer – це комфорт, який так необхідний у холодну пору року.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Светр Knit 1/1 Troyer – це комфорт, який так необхідний у холодну пору року.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Стильний дизайн чудово пасує майже до будь-якого одягу.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Дихаюча суміш бавовни гарантує постійне відчуття зручності. Комір має високе горло і застібається на гладку блискавку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Також деякі ділянки на горловині, манжетах та внизу ребристі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Тканина має плямистий вигляд, а ліву верхню частину плеча прикрашає фірмовий логотип.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Це неймовірно якісний варіант для постійного використання.</span><br></p>', 'images/oci9pTuQ2Fn2HyhWwuST9gFdNVzTrS2YBX7McinO.jpg', 2599, NULL, 1, 8, '2023-05-07 15:58:09', '2023-06-14 16:33:11', NULL, 8, 2, 1, 2),
(30, 'Кардиган Knit 1/1 Jacket (409525-8K08-19) , Колір - сірий', 'Кардиган Knit 1/1 Jacket – це унікальне оновлення гардеробу. Стильний та сучасний дизайн доступний у різних кольорах, від світлих до темних.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Кардиган Knit 1/1 Jacket – це унікальне оновлення гардеробу. Стильний та сучасний дизайн доступний у різних кольорах, від світлих до темних.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Використання контрастної текстури у верхній частині грудей створює приємний візуальний ефект.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Стрічка на блискавці є ще однією візуальною родзинкою. Прямий, регулярний крій і комір у стилі бомбер підкреслюють спортивний вигляд.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виготовлений з комфортної суміші бавовни, яка неймовірно приємна на дотик. Цей варіант легко закохує у себе.</span><br></p>', 'images/wuQBsp0HYFewp7UAM7JIRu63WIsMBFoXko6tdEM8.jpg', 2699, NULL, 1, 9, '2023-05-07 16:01:54', '2023-06-14 16:33:38', NULL, 8, 2, 1, 2),
(31, 'Толстовка UA Rival Terry LC FZ-GRN (1370409-390) , Колір - оливковий', 'Under Armour UA Rival Terry LC FZ - це комфортна та зносостійка толстовка з м\'якої тканини, що забезпечує оптимальний рівень тепла та захисту в холодну погоду.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Under Armour UA Rival Terry LC FZ - це комфортна та зносостійка толстовка з м\'якої тканини, що забезпечує оптимальний рівень тепла та захисту в холодну погоду. Виконана в простому та стильному дизайні з блискавкою по всій довжині для зручного одягання та регулювання температури тіла.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Також толстовка має капюшон, і кишені для зберігання речей. Матеріал вирізняється міцністю та довговічністю і забезпечує вентиляцію та вологовідведення.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Таким чином, UA Rival Terry LC FZ є ідеальним вибором для повсякденного використання та занять спортом у холодну пору року, як біг, тренування в залі або на вулиці, а також для відпочинку та прогулянок на свіжому повітрі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Французька махра з гладким зовнішнім шаром і м\'яким внутрішнім</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Матеріал відводить вологу і швидко сохне</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Відкриті кишені для рук</span><br></p>', 'images/SciSMFfTo0SEaL99Ufv69b9t3c23uxXHdCGR3tEj.jpg', 2990, NULL, 1, 10, '2023-05-07 16:05:25', '2023-06-14 16:33:51', NULL, 8, 15, 1, 5),
(32, 'Худі ESS Elevated Hoodie (673788-66) , Колір - рожевий', 'Ідеальний супутник у прохолодні дні, це стильне та зручне худі ESS Elevated Hoodie.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Ідеальний супутник у прохолодні дні, це стильне та зручне худі ESS Elevated Hoodie. У ньому є все, що вам знадобиться: капюшон на зав\'язках, м\'яка махрова французька тканина, ребристий низ та манжети.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Ми знаємо, що це буде основним продуктом у цей та наступні сезони.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Класична посадка</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Капюшон на шнурках з підкладкою із трикотажу</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Кишеня кенгуру</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вишитий логотип PUMA спереду</span><br></p>', 'images/CGIIkQoWhlzDueibBzZubVQ5qJAUceTFrLvLvh2v.jpg', 2390, NULL, 1, 11, '2023-05-07 16:10:01', '2023-06-14 16:28:35', NULL, 7, 13, 2, 8),
(33, 'Бриджі SENEGAL PANTS W (1505831_6167) , Колір - сірий', 'Чи подорожуєте ви Марокко або вирушаєте на сафарі в Африку, звільніть місце у своїй сумці для штанів SENEGAL.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Чи подорожуєте ви Марокко або вирушаєте на сафарі в Африку, звільніть місце у своїй сумці для штанів SENEGAL. Ці надлегкі штани довжиною 7/8 з тонким візерунком «ялинка» та вільною повітряною посадкою дозволяють легше переносити спекотну погоду. Дихаюча та еластична тканина захищає навіть від ультрафіолетових променів. Еластичний пояс робить штани неймовірно зручними та забезпечує свободу рухів. Задня і передня кишені ідеально підходять для зберігання дрібних особистих речей. Цінні речі можна безпечно заховати в потайну кишеню.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний та лаконічний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- FLEX SHIELD HERRINGBONE UV - дихаюча та еластична тканина з візерунком «ялинка» з вітрозахисними та водовідштовхувальними властивостями та захистом від УФ-випромінювання (UPF 40+)</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Еластична талія</span><br></p>', 'images/15BOYWGr8YhcqYdMMxOYoiPb9lS83h879KTebYgG.jpg', 2099, NULL, 1, 12, '2023-05-07 16:14:42', '2023-06-15 15:41:45', NULL, 10, 7, 2, 2),
(34, 'Штани Delgado Trousers (RMJ231R-038) , Колір - сірий', 'Чоловічі штани Delgado Trousers знадобляться для активного відпочинку та прогулянок.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Чоловічі штани Delgado Trousers знадобляться для активного відпочинку та прогулянок. Вони виконані з тканини міцної до розриву, яка складається з суміші бавовни та поліаміду. Матеріал має відмінну повітропроникність, а також відводить зайве тепло від шкіри. Пояс частково еластичний, є кріплення для ременя. Передбачені кишені з боків і на штанині.</span><br></p>', 'images/QpM5FonoI5cyXfLBmlteHhOO07aL8oSbKxNeHE51.jpg', 2799, NULL, 1, 13, '2023-05-07 16:19:36', '2023-06-15 15:38:30', NULL, 9, 14, 1, 2),
(35, 'Джинси 5-Pkt Relaxed Fit (488895-8D62-46) , Колір - індіго', 'Джинси 5-Pkt Relaxed Fit – це те, що потрібно для максимального комфорту.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Джинси 5-Pkt Relaxed Fit – це те, що потрібно для максимального комфорту. Класичний стиль доволі органічно поєднується з сучасним.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Технологія fleXXXactive гарантує, що цей одяг буде слідувати вашим рухам, зберігаючи свою форму.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Бавовняна тканина дарує відчуття легкості та свободи, а також додає еластичності.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">П’ять кишень дають достатньо місця для зберігання речей.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Невимушений крій та стандартна талія неодмінно будуть надавати максимальний комфорт. Цей варіант дуже легко комбінувати з іншими предметами гардеробу.</span><br></p>', 'images/gY7kL49HwqThpcxcAzhZSi7I4Zg53QsmaleBpq7t.jpg', 2999, NULL, 1, 14, '2023-05-07 16:25:11', '2023-06-15 15:38:53', NULL, 9, 2, 1, 7),
(36, 'Штани спортивні KASHI (KASHI-BLACK) , Колір - чорний', 'Спортивні чоловічі штани KASHI виконані з якісних матеріалів, забезпечать зносостійкість, міцність.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Спортивні чоловічі штани KASHI виконані з якісних матеріалів, забезпечать зносостійкість, міцність. При дотриманні правил прання та догляду, тривалий час зберігають первісний вигляд. Тканина щільністю 260г/м?, приємна до тіла, гіпоалергенна, легка. Виріб підходить для повсякденного носіння, активного відпочинку, занять спортом. Стильний дизайн, класичний чорний колір підходить під задуманий образ, урізноманітнить та доповнить гардероб. Передбачено три кишені для особистих речей.</span><br></p>', 'images/s1Uc4ZR5USzkZawMUBeNhGhPUAqdhcAlKQxM2UX0.jpg', 2697, NULL, 1, 15, '2023-05-07 16:32:33', '2023-06-15 15:39:10', NULL, 9, 6, 1, 2),
(38, 'Шорти ESS Shorts (586709-51) , Колір - чорний', 'Спортивний стиль поєднується з найвищим комфортом у цих трикотажних шортах ESSENTIALS MEN\'S SHORTS із серії PUMA, виконаних із чистої бавовни з еластичною талією та внутрішньою шнурівкою для зручної регульованої посадки.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Спортивний стиль поєднується з найвищим комфортом у цих трикотажних шортах ESSENTIALS MEN\'S SHORTS із серії PUMA, виконаних із чистої бавовни з еластичною талією та внутрішньою шнурівкою для зручної регульованої посадки.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Звичайна посадка</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Бічні кишені для зручного зберігання речей</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Еластичний пояс із внутрішнім шнурком для індивідуального комфорту</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Гумовий логотип PUMA на лівій штанині</span><br></p>', 'images/jUbjprXOtim07pqy6fuoFDdhk2xxFSroNVKklAoR.jpg', 1290, NULL, 1, 16, '2023-05-11 14:43:12', '2023-05-11 14:43:12', NULL, NULL, 13, 1, 11),
(39, 'Шорти спортивні Play Up Shorts 3.0-BLK (1344552-049) , Колір - чорний', 'Жіночі шорти Play Up Shorts 3.0 є оновленою версією популярних спортивних шортів Play Up Shorts.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Жіночі шорти Play Up Shorts 3.0 є оновленою версією популярних спортивних шортів Play Up Shorts.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Вони виготовлені з легкої, дихаючої та швидкосохнучої тканини, яка забезпечує комфорт і свіжість протягом тренувань.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Шорти мають високу посадку та еластичний пояс, який не сковує рухів. У шортах також є дві бічні кишені, які додають зручності для зберігання необхідних речей під час тренувань.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- М\'яка, легка трикотажна конструкція для комфорту і повітропроникністі</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Матеріал відводить вологу і дуже швидко сохне</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Зручні бічні кишені для рук</span><br></p>', 'images/N7Gox0bwv3mU3qD1fIxQzXIzZHm0PUx03zcLXTfG.jpg', 1390, NULL, 1, 16, '2023-05-11 14:47:58', '2023-06-15 15:41:55', NULL, 10, 15, 2, 5),
(40, 'Майка спортивна IMOS (IMOS-BLACK) , Колір - чорний', 'Спортивна чоловіча майка IMOS для тих, хто цінить комфорт в кожному русі.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Спортивна чоловіча майка IMOS для тих, хто цінить комфорт в кожному русі. Виготовлена з 100% поліестеру, що надає виробу повітропрониктість та еластичність.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">За рахунок технологічності тканина швидко відводить вологу від тіла та висихає. Спереду та ззаду є невеликий рефлективний принт для додаткової безпеки під час тренувань в умовах поганої видимості.</span><br></p>', 'images/bc5YWFV8noi6OEeBiQvfvjjhKZDi1OboH7AN0qTT.jpg', 999, NULL, 1, 17, '2023-05-11 14:51:02', '2023-05-11 14:51:02', NULL, NULL, 8, 1, 12),
(41, 'Майка JWP TOP W (1807281-2058) , Колір - червоний', 'Жіноча майка JWP TOP W з капсульної колекції від бренду Jack Wolfskin. Універсальна і підійде для будь-чого.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Жіноча майка JWP TOP W з капсульної колекції від бренду Jack Wolfskin. Універсальна і підійде для будь-чого. Виконана з легкого швидковисихаючого з охолоджуючим ефектом. Прикрашена маленьким принтом з логотипом бренду.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- SINGLE JERSEY HEATHER Q.M.C. S.FRESH - легкий, міцний, швидковисихаючий і еластичний матеріал з ефектом прохолоди та антибактеріальними властивостями</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- У комплекті є невеликий чохол для майки</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікати підтверджують екологічність даного виробу Green Button і Bluesign PRODUCT</span><br></p>', 'images/5oXNfhKs2ln55byDZNDRtC4RoXRLPpQYZ4rsvb4M.jpg', 499, NULL, 1, 17, '2023-05-11 14:55:41', '2023-06-15 15:47:21', NULL, 12, 7, 2, 12),
(42, 'Поло ESSENTIAL POLO M (1809301_1282) , Колір - блакитний', 'Футболка поло ESSENTIAL забезпечує свободу рухів, яку вимагає активний спосіб життя.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Футболка поло ESSENTIAL забезпечує свободу рухів, яку вимагає активний спосіб життя.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Вона повністю виготовлена з екологічно чистої органічної бавовни. Для поло використано витривале до розриву натуральне волокно, було вплетено в міцну дихаючу тканину піке.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">З комфортним відчуттям і достатньою кількістю простору для руху, що може не сподобатися?</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Класична сорочка поло</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Органічна бавовна</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Груба текстура полотна</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Дихаюча тканина</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вага: 240 г (розмір M)</span><br></p>', 'images/1cTCp0nGXVlEKaPg6xEAWPweYUzeDrux5zPtK2NG.jpg', 2799, NULL, 1, 18, '2023-05-11 14:59:09', '2023-05-11 14:59:09', NULL, NULL, 7, 1, 19);
INSERT INTO `products` (`id`, `title`, `description`, `content`, `preview_image`, `price`, `old_price`, `count`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `group_id`, `brand_id`, `sex_id`, `country_id`) VALUES
(43, 'Топ UA Seamless Low Long Bra-ORG (1357719-868) , Колір - помаранчевий', 'Безшовний топ UA Seamless Low Long Bra — це різновид спортивного бюстгальтера, призначеного для жінок.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Безшовний топ UA Seamless Low Long Bra — це різновид спортивного бюстгальтера, призначеного для жінок.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Він має безшовну конструкцію, яка допомагає зменшити подразнення та натирання під час фізичної активності. Цей спортивний бюстгальтер виготовлений з еластичної та дихаючої тканини, яка відводить вологу, забезпечуючи вам сухість і комфорт.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Також він має компресійну посадку, яка допомагає зменшити відскок і підтримує бюст, що робить його ідеальним для жінок із великим розміром грудей. Має регульовані бретелі, які дозволяють адаптуватись до вашого тіла, і широку нижню стрічку, яка допомагає тримати його на місці під час руху.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Забезпечує стратегічну підтримку, розроблену для тих видів діяльності, як йога, пілатес</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- UA Seamless — це м’яка трикотажна тканина з інженерною вентиляцією</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- М\'які знімні чашки</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Широкий жаккардовий ремінець для еластичності та комфорту</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Матеріал відводить вологу і швидко сохне</span><br></p>', 'images/DCMOcTyeoSxEyRYPxiNzhWnRa1oLSa5lTnfwFhTB.jpg', 1449, NULL, 1, 19, '2023-05-11 15:24:42', '2023-06-15 15:47:38', NULL, 12, 15, 2, 8),
(44, 'Футболка Olwyn (RWT197-2EY) , Колір - червоний, білий', 'Жіноча футболка з коротким рукавом Olwyn знадобиться для прогулянок, активного відпочинку на природі, а також підійде на кожен день.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Жіноча футболка з коротким рукавом Olwyn знадобиться для прогулянок, активного відпочинку на природі, а також підійде на кожен день. Вона виконана з бавовняного трикотажного полотна в смужку, яке володіє відмінною повітропроникністю, гігроскопічністю та відводить зайве тепло від шкіри. Прикрашена модель графічною печаткою.</span><br></p>', 'images/8l6O7N3tQVnipA7ear3qv4nCfWDiVsyNng10Vsg7.jpg', 499, NULL, 1, 20, '2023-05-11 15:28:00', '2023-05-11 15:28:00', NULL, NULL, 14, 2, 2),
(45, 'Капелюх WINGTIP HAT W (1910452_5154) , Колір - бежевий', 'Коли ви весь день на вулиці, а тіні немає, WINGTIP HAT стане практичним рішенням.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Коли ви весь день на вулиці, а тіні немає, WINGTIP HAT стане практичним рішенням.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Завдяки широким полям капелюх захищає вашу голову та обличчя від шкідливого ультрафіолетового випромінювання. Виготовлений із нашої тканини TEXADRI з часткою перероблених матеріалів, цей капелюх від сонця приємно носити в жарку погоду.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Тканина вбирає піт і швидко його відводить, створюючи приємний охолоджуючий ефект. У вітряну погоду просто закріпіть капелюх під підборіддям за допомогою регульованого шнурка.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сонцезахисний капелюх</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Легка та дихаюча тканина</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Регулювання вологи</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Швидке висихання</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Регульований ремінь для підборіддя</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- УФ захист</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вага: 85 г (розмір M)</span><br></p>', 'images/4T9gzSD9xBAxLRP0vRhr7yiezpN9avQ9LM1LlAdi.jpg', 1649, NULL, 1, 21, '2023-05-11 15:31:37', '2023-06-15 15:43:40', NULL, 11, 7, 2, 12),
(46, 'Кепка Men\'s UA Blitzing-GRY (1376700-012) , Колір - сірий', 'Кепка Under Armour Men\'s UA Blitzing - це стильний та комфортний головний убір для активного способу життя.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Кепка Under Armour Men\'s UA Blitzing - це стильний та комфортний головний убір для активного способу життя.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виготовлена з високоякісних матеріалів, які забезпечують максимальний комфорт та вентиляцію під час тренувань та на вулиці. Має ергономічний дизайн, який ідеально підійде для будь-якого типу голови.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Завдяки регульованому ременю на задній частині, можна ідеально підібрати її під розмір та форму голови.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Дихаючий текстурований трикотаж надзвичайно м\'який</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вбудований еластичний пояс відводить вологу</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Регульований ремінь на задній частині кепки</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вишитий логотип</span><br></p>', 'images/pfJODU7RFj8TKqdfNy1OvwSrJGK7yANPikps97ux.jpg', 1190, NULL, 1, 22, '2023-05-11 15:33:57', '2023-06-15 15:44:16', NULL, 11, 15, 1, 5),
(47, 'Панама VILLE (VILLE-DARK GREY) , Колір - сірий', 'Літня панама Iguana VILLE - це стильний і зручний головний убір, який стане незамінним аксесуаром в жарку пору року.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Літня панама Iguana VILLE - це стильний і зручний головний убір, який стане незамінним аксесуаром в жарку пору року. Вона виготовлена з бавовни, що забезпечує додаткову вентиляцію і захист від сонячних променів.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Дизайн включає в себе простий класичний крій з м\'яко облягаючою формою. Панама може бути використана для різних цілей, від пікніка до прогулянок по місту чи відпочинку на пляжі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Вона легко підходить до будь-якого літнього образу і додає йому елегантності і стилю.</span><br></p>', 'images/Agq5zLCP7e0xCfm3fZbhHgDgnZZqxcG27nhyY1zM.jpg', 849, NULL, 1, 23, '2023-05-11 15:37:28', '2023-06-15 15:44:32', NULL, 11, 6, 1, 12),
(48, 'Шапка STORMLOCK POMPOM BEANIE (1905091_5045) , Колір - бежевий', 'STORMLOCK POMPOM BEANIE - стильна жіноча шапка, яка відмінно впорається з захистом від холодного вітру і мокрого снігу.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">STORMLOCK POMPOM BEANIE - стильна жіноча шапка, яка відмінно впорається з захистом від холодного вітру і мокрого снігу. Підійде для повсякденного носіння в місті, а також для зимового активного відпочинку за містом. Виконана шапка з комбінації вовни та акрилу, підкладка з STORMLOCK FLEECE. Зверху декорована красивим помпоном. Розмір універсальний.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Особливості:</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- STORMLOCK FLEECE - вітрозахисний, дуже теплий фліс, який також має прекрасні повітропроникні властивості</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- вага: 145 грам</span><br></p>', 'images/1b7M4DvZdtDGd01qTcN1RHGrOysQGAvZKvzY1oEn.jpg', 899, NULL, 1, 24, '2023-05-11 15:40:13', '2023-06-15 15:44:44', NULL, 11, 7, 2, 12),
(49, 'Рукавички STORMLOCK KNIT GLOVE (1900923_6350) , Колір - темно-сірий', 'Універсальні рукавички моделі STORMLOCK KNIT ідеальні для зимової та вітряної погоди – флісові рукавички від бренду Jack Wolfskin.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Універсальні рукавички моделі STORMLOCK KNIT ідеальні для зимової та вітряної погоди – флісові рукавички від бренду Jack Wolfskin.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Рукавички виготовлені із TEXASHIELD FLEECE. Вони мають поверхню трикотажну та м\'яку, зручну підкладку для додаткового тепла. Вони також дуже добре пропускають повітря, тому волога швидко випаровується назовні.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Долоні посилені для додаткової міцності.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний практичний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- З вовною у складі</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Спеціальні накладки для посилення міцності</span><br></p>', 'images/0LsQTtBw25DmURrxpVEav3J1xiYw8F91yYa7XpCH.jpg', 1249, NULL, 1, 25, '2023-05-11 15:42:54', '2023-06-15 15:45:40', NULL, 11, 7, 2, 5),
(50, 'Рукавиці гірськолижні INSPIRE (38197034-001) , Колір - чорний', 'Рукавиці гірськолижні INSPIRE – це саме те, що потрібно у холодну погоду. Стильний дизайн легко комбінується майже з будь-яким одягом.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Рукавиці гірськолижні INSPIRE – це саме те, що потрібно у холодну погоду. Стильний дизайн легко комбінується майже з будь-яким одягом.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виготовлені з переробленого поліестеру EXO SHIELD гладкого переплетення з ламінатом 10k і покриттям DWR.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Синтетичний утеплювач PrimaLoft Silver ECO Insulation неодмінно збереже руки у теплі навіть при самих низьких температурах. Повідці знімні. Зап\'ястя еластичні та гнучкі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Рукавички мають підкладку з флісу шерпа, щоб зберігати руки у теплі постійно. Цей варіант ідеально підходить активним людям.</span><br></p>', 'images/Zj97lVrukgJ07W70buyIxqFq2NBbqypW0Amuu5bd.jpg', 2499, NULL, 1, 26, '2023-05-11 15:46:09', '2023-06-15 15:45:47', NULL, 11, 16, 1, 5),
(51, 'Шарф Knitted scarf (407520-8V52-47) , Колір - темно-синій', 'Шарф Knitted scarf – це практичний варіант для будь-якого випадку.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Шарф Knitted scarf – це практичний варіант для будь-якого випадку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Дизайн легкий і приємний у носінні, тому його можна поєднувати з будь-яким одягом для відпочинку.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Він достатньо довгий, щоб обернути навколо шиї скільки завгодно разів.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Виготовлений із чистої бавовни, яка неймовірно приємна на дотик. Текстура з кожного боку різна.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Це доволі вдалий вибір для регулярного використання.</span><br></p>', 'images/KeneppDHD1Ie2NGkieADKVRNj85ikpP6zXIUZcfL.jpg', 999, NULL, 1, 27, '2023-05-11 15:48:03', '2023-06-15 15:45:27', NULL, 11, 2, 2, 12),
(52, 'Шкарпетки спортивні 3PPK PED (155206-0701) , Колір - різнокольоровий', 'Шкарпетки 3PPK PED з низькою посадкою створені з легкої трикотажної тканини, яка має амортизацію та підтримку там, де це необхідно.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Шкарпетки 3PPK PED з низькою посадкою створені з легкої трикотажної тканини, яка має амортизацію та підтримку там, де це необхідно. Підходять для занять різними видами спорту або для щоденного носіння. Плоскі шви які рятують ноги від натирань. Еластичні резинки які фіксують ногу. Фірмовий логотип Asics.</span><br></p>', 'images/Q9jf47pHedIhKai57Jco9VAsfOrvDQ9sw1erzQfH.jpg', 449, NULL, 1, 28, '2023-05-11 15:51:40', '2023-05-11 15:51:40', NULL, NULL, 1, 1, 5),
(53, 'Пуховик FAIRMONT MEN (1203591_2185) , Колір - бордовий', 'Якщо ви з тих хто, любить прогулюватися по засніженій набережній під крижаним вітром, FAIRMONT - це куртка створена спеціально для вас.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Якщо ви з тих хто, любить прогулюватися по засніженій набережній під крижаним вітром, FAIRMONT - це куртка створена спеціально для вас. Основна увага при її конструювання приділялася мінімальній вазі і максимальної теплоізоляції, тому в ній використовується наповнювач з качиного пуху з високими експлуатаційними характеристиками. Ви відчуєте тепло, як тільки надягнете її. Вітрозахисний, дихаюча зовнішня тканина покращує ізоляційні властивості. Куртку можна носити з капюшоном або без нього. Просто застебніть його, коли він вам не потрібен.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Стильний і практичний дизайн</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Зручні зовнішні і внутрішні кишені</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- STORMLOCK - дуже легкий, міцний і дихаючий, вітрозахисний матеріал і водостійким покриттям</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікат bluesign PRODUCT - система виключає шкідливі для навколишнього середовища і здоров\'я речовини на всіх етапах виробничого процесу</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Наповнювач з качиного пуху в співвідношенні 90/10</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- MICROGUARD ECOSPHERE - супер теплий утеплювач виконаний з переробленого поліестеру</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Знімний регульований капюшон</span><br></p>', 'images/Ba4yAJdR2lG1MrEllltwchJWpgK3lEuNn2Gb6mWk.jpg', 5999, NULL, 1, 6, '2023-06-14 15:36:16', '2023-06-14 15:36:16', NULL, 1, 7, 1, 11),
(54, 'Футболка T-Shirt 1/2Arm (409745-1T02-09) , Колір - чорний', 'Футболка чоловіча чорного кольору', '<p>Футболка чоловіча чорного кольору<br></p>', 'images/8IizO8xgCVPQUqulZowumMhsNBn3z9Z27CUfU0wj.jpg', 1399, NULL, 1, 20, '2023-06-14 15:42:42', '2023-06-14 15:42:42', NULL, 2, 2, 1, 2),
(55, 'Футболка T-Shirt 1/2Arm (409745-1T02-43) , Колір - блакитний', 'Чоловіча футболка блакитного кольору', '<p>Чоловіча футболка блакитного кольору<br></p>', 'images/mq4tBTtSxzMuOVFpHm0dZNEIrJK0bNyRi1oXJ9KL.jpg', 1399, NULL, 1, 20, '2023-06-14 15:47:45', '2023-06-14 15:47:45', NULL, 2, 2, 1, 2),
(56, 'Вітровка DESERT WIND JACKET M (1306412_1282) , Колір - блакитний', 'DESERT WIND JACKET M від Jack Wolfskin- вітронепроникна куртка зі спортивним дизайном, яка ідеально підходить для повсякденного носіння та подорожей.', '<p><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">DESERT WIND JACKET M від Jack Wolfskin- вітронепроникна куртка зі спортивним дизайном, яка ідеально підходить для повсякденного носіння та подорожей.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">Міцна тканина STORMLOCK має приємну бавовняну текстуру, тягнеться під час руху та пропускає повітря, що робить DESERT WIND ідеальним для активного використання на природі.</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Для подорожей і повсякденного носіння</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вітрозахисна, водовідштовхувальна тканина TEXASHIELD</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Сертифікований bluesign</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Нагрудна кишеня, 2 кишені на стегнах, капюшон</span><br style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(89, 97, 109); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px;\">- Вага: 485 г (розмір M)</span><br></p>', 'images/3jL4SL0DUpBVhpYHpPWdx50e8o8rYilwpognWyfe.jpg', 4499, NULL, 1, 1, '2023-06-14 16:03:32', '2023-06-14 16:03:32', NULL, 3, 7, 1, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_images`
--

INSERT INTO `product_images` (`id`, `file_path`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 'images/BGDIMiMfg1IFyV0GpZMCkKGRn8o7ipaPO3XK1y58.jpg', 2, '2023-04-28 08:52:23', '2023-04-28 08:52:23'),
(3, 'images/FSp9AAyngtpXlEkCPsdQO431TMl2ocvYfY5CTkJn.jpg', 2, '2023-04-28 08:52:23', '2023-04-28 08:52:23'),
(4, 'images/enJDnGPhYqwrPwKBaPgto0ohVylMXLgVq0KdrHN6.jpg', 3, '2023-04-28 09:26:28', '2023-04-28 09:26:28'),
(6, 'images/omXRJJI4dVjWdmbstpoi0tkdkEp7xrXj8eJvVOmi.jpg', 3, '2023-04-28 09:26:28', '2023-04-28 09:26:28'),
(11, 'images/oAcgolrO0DmN2lT5ZM9zQF1F199tsNzKRPxqN4Rz.jpg', 5, '2023-05-06 16:42:52', '2023-05-07 12:32:26'),
(12, 'images/qXpL2cv3tGK7uShJm0EHAcd5V4Th1YtYaQeGU6GV.jpg', 5, '2023-05-06 16:42:52', '2023-05-07 12:32:26'),
(18, 'images/vkA3fHvqHcnqHrmG1SdSHeQEcIRG6KalOUJEVQsJ.jpg', 7, '2023-05-07 12:22:04', '2023-05-07 12:34:16'),
(19, 'images/QAQ83Bjt4lbnkxgLQldNpOmmNpESy2d9Boqgts17.jpg', 7, '2023-05-07 12:22:04', '2023-05-07 12:34:16'),
(21, 'images/dc0XuCoKfVsYwlbQtpkC2whiBH9xfh0gGtuXswSx.jpg', 19, '2023-05-07 12:42:05', '2023-05-07 12:42:05'),
(22, 'images/jymrsBaE4u2zDxpA1Vyed3nocWNa2Hi8PVJSWk94.jpg', 19, '2023-05-07 12:42:05', '2023-05-07 12:42:05'),
(24, 'images/Cq7CYNgjcu53hTwVV3oxjiNWxBPIsXfnA2mghKQK.jpg', 20, '2023-05-07 12:51:24', '2023-05-07 12:51:24'),
(25, 'images/06aLmv0s52Y1GhAea5Te3pLeJ3RcxDVLsuSxHoXm.jpg', 20, '2023-05-07 12:51:24', '2023-05-07 12:51:24'),
(26, 'images/ATDll7PcmAyRIlv3brRtZbqo6KmVnLTvo7tUnCj4.jpg', 22, '2023-05-07 15:23:30', '2023-05-07 15:23:30'),
(27, 'images/4vxUnKKhHaceJ4ywxbe0B2a3gfYxblQQGhz13alJ.jpg', 23, '2023-05-07 15:29:15', '2023-05-07 15:29:15'),
(28, 'images/dlHiTnXiho13cX4LsS6QGIS5cszmneLsMm70Cfyn.jpg', 23, '2023-05-07 15:29:15', '2023-05-07 15:29:15'),
(29, 'images/hJs0bvtOsEvuEhq0YPMXH2IbhQgXNbJ3PfwlrQUb.jpg', 24, '2023-05-07 15:32:51', '2023-05-07 15:32:51'),
(31, 'images/xyaEkiWSO2HyEQb8e8QWEBq3lSM2MVNQTrURgyQS.jpg', 25, '2023-05-07 15:36:21', '2023-05-07 15:36:21'),
(32, 'images/pLQuyYpK40NxARD3FTyp0VVTi5OunFrePeTYgJ8k.jpg', 25, '2023-05-07 15:36:21', '2023-05-07 15:36:21'),
(33, 'images/B6qIzoRYzjTSYeBVk4kwXkJgGxv7IdvKvslQ6Rdr.jpg', 26, '2023-05-07 15:45:48', '2023-05-07 15:45:48'),
(34, 'images/1qSi46Q4mnzU2pnCvODcJY07PwcjXzlFooH4is1w.jpg', 28, '2023-05-07 15:53:48', '2023-05-07 15:53:48'),
(35, 'images/Ed6DpFU6x3MTmTeb3Db0WpjgPyIyyO0VYTvUAxZT.jpg', 28, '2023-05-07 15:53:48', '2023-05-07 15:53:48'),
(36, 'images/brJ6pE3o8cxCb4RW6KJiYVQnnInuJB2sYG4gQABH.jpg', 28, '2023-05-07 15:53:48', '2023-05-07 15:53:48'),
(37, 'images/YTP34BUXmgaEbXdPG6w2Vu3TCtO3kVoXQaxrhBiS.jpg', 29, '2023-05-07 15:58:09', '2023-05-07 15:58:09'),
(38, 'images/IdVv3rWb6cW5IughFth6Uo6Az2MkJ1W4mH62j14E.jpg', 29, '2023-05-07 15:58:09', '2023-05-07 15:58:09'),
(39, 'images/UCDgRBP8H8h40BCpTOtrHXMEjLY2IeIX4rvWINYW.jpg', 30, '2023-05-07 16:01:54', '2023-05-07 16:01:54'),
(40, 'images/8mNtIyZpbrWF87tYpELqnnZPjQsYuGz8zo8WBeCI.jpg', 30, '2023-05-07 16:01:54', '2023-05-07 16:01:54'),
(41, 'images/7eXxkHPoaMPIZUhBCwvcsb87hnUJBId9nCGcr7A5.jpg', 31, '2023-05-07 16:05:25', '2023-05-07 16:05:25'),
(42, 'images/jczLW3GumzGN1WnrLUybsQrTCsh5GZSDgyXdnYP5.jpg', 33, '2023-05-07 16:14:42', '2023-05-07 16:14:42'),
(43, 'images/z6oy04a5TzWe7B2DLonTQJw0QNAMOcHAjmWeC9Ib.jpg', 33, '2023-05-07 16:14:42', '2023-05-07 16:14:42'),
(44, 'images/3sRa7RDNWVFYBCtmqBfcdZllWc4YtQSfhD8Y7z6t.jpg', 33, '2023-05-07 16:14:42', '2023-05-07 16:14:42'),
(45, 'images/c9VGSGMpvs0rEgyapYg4zGsTkeTKdWKYXacRnOSS.jpg', 34, '2023-05-07 16:19:36', '2023-05-07 16:19:36'),
(46, 'images/02beBlJrkL6j93C9fYRmvzKCTphsuUQ0BUkWNus7.jpg', 34, '2023-05-07 16:19:36', '2023-05-07 16:19:36'),
(47, 'images/WfLN3Tuw6nlGfzJywHV7ddBceW3aN3bWlfJj3Sxk.jpg', 34, '2023-05-07 16:19:36', '2023-05-07 16:19:36'),
(48, 'images/Y9glLg2K0slKfKnZWfF6AX6IrxHmYSMBTVy2qcdK.jpg', 35, '2023-05-07 16:25:11', '2023-05-07 16:25:11'),
(49, 'images/wW4TOi7Po8nExdqwBRGwLrRge0jFEdTDJeCSrUqf.jpg', 35, '2023-05-07 16:25:11', '2023-05-07 16:25:11'),
(50, 'images/41x4ofIBg5ZJpzcmZiWLGjD4zdMJHEXTYw2SwBaP.jpg', 36, '2023-05-07 16:32:33', '2023-05-07 16:32:33'),
(51, 'images/QOAlDD7rKAE9DlBdX2gAh1VrOd2o8LhkiDyJOgJx.jpg', 36, '2023-05-07 16:32:33', '2023-05-07 16:32:33'),
(52, 'images/LAfhlHcpJp7h304gQweDKHFA5g7LHTYHOhHNja9h.jpg', 36, '2023-05-07 16:32:33', '2023-05-07 16:32:33'),
(56, 'images/qiPMwR9xFMfgb5Rq5WT9Sb1rMZaYKahIMv8g9Gdj.jpg', 38, '2023-05-11 14:43:12', '2023-05-11 14:43:12'),
(57, 'images/jQx9JIrKCWLBOqsxxjx4r6yZXr5Ci1RyjFn1fMjZ.jpg', 39, '2023-05-11 14:47:58', '2023-05-11 14:47:58'),
(58, 'images/ug9bkbZOCKmsFxwOuQua9NjtROZSNN8pcnB4xOeO.jpg', 39, '2023-05-11 14:47:58', '2023-05-11 14:47:58'),
(59, 'images/Xi1CWroP3c6Xvko9hTMwe7onzzNp2vxfNZaH2yXg.jpg', 39, '2023-05-11 14:47:58', '2023-05-11 14:47:58'),
(60, 'images/yVpNktJnCbbA9TWP61yi2fJTolUx62DBWbG4oITQ.jpg', 40, '2023-05-11 14:51:02', '2023-05-11 14:51:02'),
(61, 'images/YLZsXk0P7MihAAGiq10pZfG8YdXN2oKiTEt8AKT0.jpg', 40, '2023-05-11 14:51:02', '2023-05-11 14:51:02'),
(62, 'images/RIP4vOLM8d4dw95DzqS0g11f6X19j0AmfXVanTWE.jpg', 40, '2023-05-11 14:51:02', '2023-05-11 14:51:02'),
(63, 'images/9Ooq6O0UdsAZUdqWIN36iJducxgEJA4U0TMDM5x4.jpg', 41, '2023-05-11 14:55:41', '2023-05-11 14:55:41'),
(64, 'images/ALyUNqngW90iAJSSATfL61gJ71lXavNd80JMHqe1.jpg', 41, '2023-05-11 14:55:41', '2023-05-11 14:55:41'),
(65, 'images/X2nQJjcHQZ8HjWcJrLD6Xe7TYcdgA2evV1cHWUT4.jpg', 41, '2023-05-11 14:55:41', '2023-05-11 14:55:41'),
(66, 'images/h1HAjL7PaD4nYfK6qJzE4XkOTskQTrohGZBxhV0e.jpg', 42, '2023-05-11 14:59:09', '2023-05-11 14:59:09'),
(67, 'images/l6emYc0uo4XRJQBhxhZq30v9R9e4i16Xq0rmk00l.jpg', 42, '2023-05-11 14:59:09', '2023-05-11 14:59:09'),
(68, 'images/1BIaU930eZsrzc32IRcCaxYo5BKVfM212fuwZojI.jpg', 43, '2023-05-11 15:24:42', '2023-05-11 15:24:42'),
(69, 'images/JuiSifazs9k3sOdI7e7sFurWoyPei7e0IdUSS9Gh.jpg', 43, '2023-05-11 15:24:42', '2023-05-11 15:24:42'),
(70, 'images/gKPptWiXS46n4xVsvFCGuRTVTh2lCx5hPr6qKyVG.jpg', 43, '2023-05-11 15:24:42', '2023-05-11 15:24:42'),
(71, 'images/NARV2faFfACBY1tU4Ctlq5KIWGknfC3f0EJGSBKA.jpg', 44, '2023-05-11 15:28:00', '2023-05-11 15:28:00'),
(72, 'images/JW1qmGaUr0fCP7rLgd0zIqCD5NTwTGlCN9TRUjLd.jpg', 44, '2023-05-11 15:28:00', '2023-05-11 15:28:00'),
(73, 'images/T4uS7L3Xz90BIMRfyXniorDwyLqdtyQf79tJPB2B.jpg', 44, '2023-05-11 15:28:00', '2023-05-11 15:28:00'),
(74, 'images/OFVKB8mkRGCktDxMxijKQHLg7qYLb3COtEadvv3N.jpg', 45, '2023-05-11 15:31:37', '2023-05-11 15:31:37'),
(75, 'images/7l8IEFJ3LCu3PRtoO4LlB0cppLGDjMGWCwgIsW1B.jpg', 45, '2023-05-11 15:31:37', '2023-05-11 15:31:37'),
(76, 'images/YJe6GaGZ0ieNMkzizNr1u3mAMez42sKQKV739NYP.jpg', 46, '2023-05-11 15:33:57', '2023-05-11 15:33:57'),
(77, 'images/KW0DvQjLmFG13EceJNu386OFt9LvV6pDnVOgywJA.jpg', 46, '2023-05-11 15:33:57', '2023-05-11 15:33:57'),
(78, 'images/k04Kg6U6s61NQExsKTVeMg5ohaxZxBrxGdHhF3Y2.jpg', 47, '2023-05-11 15:37:28', '2023-05-11 15:37:28'),
(79, 'images/OzWUXVrAwZH7fiOVucvqw4kYN4A8ubSaC2ebUhZt.jpg', 47, '2023-05-11 15:37:28', '2023-05-11 15:37:28'),
(80, 'images/NVuVTvcNOF9b00QCpe3m4LPvnZwPCc5RNSv6HHBg.jpg', 50, '2023-05-11 15:46:09', '2023-05-11 15:46:09'),
(81, 'images/hBRFGVp8Aafp2I7jJ7HkaXNQh4sAHc5Fj1Ynfri8.jpg', 50, '2023-05-11 15:46:09', '2023-05-11 15:46:09'),
(82, 'images/OQP5u1P9FdgYnR2KDtbSt0ykCCyFMDbYvwtjjMYq.jpg', 52, '2023-05-11 15:51:40', '2023-05-11 15:51:40'),
(83, 'images/iUHN3VfmTnLZ8ODgPOOXDGvp4FbODSXYXfQ42XMq.jpg', 53, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(84, 'images/CEzLxkZ4UPWGDfBhTaPqaA7MzNRQbZGQxzOIVTcx.jpg', 53, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(85, 'images/eMMBQjK6HHY5J5nMWgVb6amb2WHuQh7GwOeVrFu7.jpg', 53, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(86, 'images/Sn1yvBtHZmZStFxbTgXglz5cMQAmM1xqloTbCS3n.jpg', 54, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(87, 'images/DJN3NxxRf7kADKLvaVgHB7iLxJ66wdJDDONdRjjn.jpg', 54, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(88, 'images/JtAAiE5dy3uL4HKTD72eo4FADoKcyOrwqJr0LjTR.jpg', 55, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(89, 'images/AqwbUiJY9vdlPb1V95YLHFiPyqmLTwn7Cex88BSe.jpg', 55, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(90, 'images/6yLbSu7PzFVMf1iHDwe9qhfmIVCxFjWxlGVsd4Ia.jpg', 56, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(91, 'images/8oqArCPcOeuRNTxtmRWoZ6gxX7XIXyOuzx9Xxw2W.jpg', 56, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(92, 'images/mcFSVtL2jzdkVqr3NKLO9EHrzmmLT35KsiqCg3I0.jpg', 56, '2023-06-14 16:03:32', '2023-06-14 16:03:32');

-- --------------------------------------------------------

--
-- Структура таблицы `product_seasons`
--

CREATE TABLE `product_seasons` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `season_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_seasons`
--

INSERT INTO `product_seasons` (`id`, `product_id`, `season_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 3, 4, NULL, NULL),
(3, 3, 1, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 5, 4, NULL, NULL),
(8, 7, 2, NULL, NULL),
(20, 19, 2, NULL, NULL),
(21, 19, 4, NULL, NULL),
(22, 20, 2, NULL, NULL),
(23, 20, 4, NULL, NULL),
(24, 22, 2, NULL, NULL),
(25, 22, 3, NULL, NULL),
(26, 23, 3, NULL, NULL),
(27, 24, 3, NULL, NULL),
(28, 25, 4, NULL, NULL),
(29, 25, 2, NULL, NULL),
(30, 26, 3, NULL, NULL),
(31, 27, 3, NULL, NULL),
(32, 28, 2, NULL, NULL),
(33, 28, 4, NULL, NULL),
(34, 29, 3, NULL, NULL),
(35, 30, 2, NULL, NULL),
(36, 30, 3, NULL, NULL),
(37, 31, 4, NULL, NULL),
(38, 31, 2, NULL, NULL),
(39, 32, 4, NULL, NULL),
(40, 33, 1, NULL, NULL),
(41, 34, 1, NULL, NULL),
(42, 35, 2, NULL, NULL),
(43, 35, 4, NULL, NULL),
(44, 36, 4, NULL, NULL),
(45, 36, 1, NULL, NULL),
(47, 38, 1, NULL, NULL),
(48, 39, 1, NULL, NULL),
(49, 40, 1, NULL, NULL),
(50, 41, 1, NULL, NULL),
(51, 42, 1, NULL, NULL),
(52, 43, 1, NULL, NULL),
(53, 44, 1, NULL, NULL),
(54, 45, 1, NULL, NULL),
(55, 46, 1, NULL, NULL),
(56, 47, 1, NULL, NULL),
(57, 48, 3, NULL, NULL),
(58, 49, 3, NULL, NULL),
(59, 50, 3, NULL, NULL),
(60, 51, 3, NULL, NULL),
(61, 52, 1, NULL, NULL),
(62, 52, 2, NULL, NULL),
(63, 52, 3, NULL, NULL),
(64, 52, 4, NULL, NULL),
(65, 53, 2, NULL, NULL),
(66, 53, 3, NULL, NULL),
(67, 54, 1, NULL, NULL),
(68, 55, 1, NULL, NULL),
(69, 56, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size_id` bigint UNSIGNED NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size_id`, `count`, `created_at`, `updated_at`) VALUES
(6, 2, 1, 20, '2023-04-28 08:52:23', '2023-05-14 07:15:36'),
(7, 2, 3, 15, '2023-04-28 08:52:23', '2023-05-14 07:15:36'),
(8, 2, 4, 15, '2023-04-28 08:52:23', '2023-05-14 07:15:36'),
(9, 2, 5, 41, '2023-04-28 08:52:23', '2023-06-13 04:50:58'),
(10, 2, 7, 8, '2023-04-28 08:52:23', '2023-05-14 07:15:36'),
(11, 3, 1, 21, '2023-04-28 09:26:28', '2023-06-13 04:50:58'),
(12, 3, 2, 14, '2023-04-28 09:26:28', '2023-05-14 07:15:05'),
(13, 3, 4, 54, '2023-04-28 09:26:28', '2023-05-14 07:15:05'),
(14, 3, 5, 23, '2023-04-28 09:26:28', '2023-05-14 07:15:05'),
(15, 3, 6, 12, '2023-04-28 09:26:28', '2023-05-14 07:15:05'),
(20, 5, 1, 3, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(21, 5, 2, 4, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(22, 5, 3, 5, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(23, 5, 4, 6, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(24, 5, 5, 7, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(25, 5, 6, 8, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(26, 5, 7, 9, '2023-05-06 16:42:52', '2023-06-14 16:20:37'),
(27, 7, 1, 1, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(28, 7, 2, 2, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(29, 7, 3, 3, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(30, 7, 4, 3, '2023-05-07 05:09:44', '2023-06-18 14:53:14'),
(31, 7, 5, 5, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(32, 7, 6, 6, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(33, 7, 7, 7, '2023-05-07 05:09:44', '2023-06-14 16:16:30'),
(56, 19, 3, 10, '2023-05-07 12:42:05', '2023-06-14 16:19:19'),
(57, 19, 4, 10, '2023-05-07 12:42:05', '2023-06-14 16:19:19'),
(58, 19, 5, 10, '2023-05-07 12:42:05', '2023-06-14 16:19:19'),
(59, 19, 6, 10, '2023-05-07 12:42:05', '2023-06-14 16:19:19'),
(60, 20, 3, 30, '2023-05-07 12:51:24', '2023-05-14 07:13:16'),
(61, 20, 4, 10, '2023-05-07 12:51:24', '2023-05-14 07:13:16'),
(62, 20, 5, 20, '2023-05-07 12:51:24', '2023-05-14 07:13:16'),
(63, 20, 6, 20, '2023-05-07 12:51:24', '2023-05-14 07:13:16'),
(64, 22, 3, 7, '2023-05-07 15:23:30', '2023-05-14 07:12:38'),
(65, 22, 4, 14, '2023-05-07 15:23:30', '2023-05-14 07:12:38'),
(66, 22, 5, 20, '2023-05-07 15:23:30', '2023-05-14 07:12:38'),
(67, 22, 6, 15, '2023-05-07 15:23:30', '2023-05-14 07:12:38'),
(68, 23, 3, 34, '2023-05-07 15:29:15', '2023-06-14 16:24:18'),
(69, 23, 4, 20, '2023-05-07 15:29:15', '2023-06-14 16:24:18'),
(70, 23, 5, 16, '2023-05-07 15:29:15', '2023-06-14 16:24:18'),
(71, 23, 6, 6, '2023-05-07 15:29:15', '2023-06-24 08:52:05'),
(72, 23, 7, 1, '2023-05-07 15:29:15', '2023-06-14 16:24:18'),
(73, 24, 2, 5, '2023-05-07 15:32:51', '2023-06-14 16:23:45'),
(74, 24, 3, 8, '2023-05-07 15:32:51', '2023-06-14 16:23:45'),
(75, 25, 2, 16, '2023-05-07 15:36:21', '2023-05-14 07:11:13'),
(76, 25, 3, 6, '2023-05-07 15:36:21', '2023-05-14 07:11:13'),
(77, 25, 4, 10, '2023-05-07 15:36:21', '2023-05-14 07:11:13'),
(78, 25, 5, 8, '2023-05-07 15:36:21', '2023-05-14 07:11:13'),
(79, 26, 4, 6, '2023-05-07 15:45:48', '2023-06-14 14:48:34'),
(80, 26, 5, 4, '2023-05-07 15:45:48', '2023-06-14 14:48:34'),
(81, 26, 6, 8, '2023-05-07 15:45:48', '2023-06-14 14:48:34'),
(82, 27, 3, 2, '2023-05-07 15:50:14', '2023-06-14 14:48:21'),
(83, 27, 4, 6, '2023-05-07 15:50:14', '2023-06-14 14:48:21'),
(84, 27, 5, 8, '2023-05-07 15:50:14', '2023-06-14 14:48:21'),
(85, 27, 6, 1, '2023-05-07 15:50:14', '2023-06-14 14:48:21'),
(86, 28, 3, 4, '2023-05-07 15:53:48', '2023-06-14 16:28:17'),
(87, 28, 4, 5, '2023-05-07 15:53:48', '2023-06-14 16:28:17'),
(88, 28, 5, 6, '2023-05-07 15:53:48', '2023-06-14 16:28:17'),
(89, 28, 6, 9, '2023-05-07 15:53:48', '2023-06-14 16:28:17'),
(90, 29, 7, 5, '2023-05-07 15:58:09', '2023-06-14 16:33:11'),
(91, 30, 7, 4, '2023-05-07 16:01:54', '2023-06-14 16:33:38'),
(92, 31, 3, 4, '2023-05-07 16:05:25', '2023-06-14 16:33:51'),
(93, 31, 4, 2, '2023-05-07 16:05:25', '2023-06-14 16:33:51'),
(94, 31, 5, 3, '2023-05-07 16:05:25', '2023-06-14 16:33:51'),
(95, 31, 6, 3, '2023-05-07 16:05:25', '2023-06-14 16:33:51'),
(96, 32, 4, 7, '2023-05-07 16:10:01', '2023-06-14 16:29:07'),
(97, 32, 5, 4, '2023-05-07 16:10:01', '2023-06-14 16:29:07'),
(98, 33, 2, 6, '2023-05-07 16:14:42', '2023-06-15 15:41:45'),
(99, 33, 3, 3, '2023-05-07 16:14:42', '2023-06-15 15:41:45'),
(100, 33, 4, 6, '2023-05-07 16:14:42', '2023-06-15 15:41:45'),
(101, 33, 5, 10, '2023-05-07 16:14:42', '2023-06-15 15:41:45'),
(102, 34, 2, 5, '2023-05-07 16:19:36', '2023-06-15 15:38:30'),
(103, 34, 3, 6, '2023-05-07 16:19:36', '2023-06-15 15:38:30'),
(104, 34, 4, 1, '2023-05-07 16:19:36', '2023-06-15 15:38:30'),
(105, 34, 5, 1, '2023-05-07 16:19:36', '2023-06-15 15:38:30'),
(106, 34, 6, 4, '2023-05-07 16:19:36', '2023-06-15 15:38:30'),
(107, 35, 2, 19, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(108, 35, 3, 15, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(109, 35, 4, 10, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(110, 35, 5, 6, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(111, 35, 6, 4, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(112, 35, 7, 10, '2023-05-07 16:25:11', '2023-06-15 15:38:53'),
(113, 36, 3, 16, '2023-05-07 16:32:33', '2023-06-15 15:39:10'),
(114, 36, 4, 5, '2023-05-07 16:32:33', '2023-06-15 15:39:10'),
(115, 36, 5, 6, '2023-05-07 16:32:33', '2023-06-15 15:39:10'),
(116, 36, 6, 8, '2023-05-07 16:32:33', '2023-06-15 15:39:10'),
(117, 36, 7, 2, '2023-05-07 16:32:33', '2023-06-15 15:39:10'),
(121, 38, 4, 10, '2023-05-11 14:43:12', '2023-05-14 07:03:26'),
(122, 38, 5, 10, '2023-05-11 14:43:12', '2023-05-14 07:03:26'),
(123, 38, 6, 11, '2023-05-11 14:43:12', '2023-05-14 07:03:26'),
(124, 39, 2, 10, '2023-05-11 14:47:58', '2023-06-15 15:41:54'),
(125, 39, 3, 7, '2023-05-11 14:47:58', '2023-06-15 15:41:54'),
(126, 39, 4, 2, '2023-05-11 14:47:58', '2023-06-15 15:41:54'),
(127, 40, 3, 6, '2023-05-11 14:51:02', '2023-05-14 07:02:15'),
(128, 40, 4, 15, '2023-05-11 14:51:02', '2023-05-14 07:02:15'),
(129, 40, 5, 14, '2023-05-11 14:51:02', '2023-05-14 07:02:15'),
(130, 40, 6, 8, '2023-05-11 14:51:02', '2023-05-14 07:02:15'),
(131, 41, 2, 9, '2023-05-11 14:55:41', '2023-06-15 15:47:21'),
(132, 41, 3, 10, '2023-05-11 14:55:41', '2023-06-15 15:47:21'),
(133, 41, 4, 14, '2023-05-11 14:55:41', '2023-06-15 15:47:21'),
(134, 41, 5, 7, '2023-05-11 14:55:41', '2023-06-15 15:47:21'),
(135, 42, 3, 20, '2023-05-11 14:59:09', '2023-05-14 07:00:35'),
(136, 42, 4, 16, '2023-05-11 14:59:09', '2023-05-14 07:00:35'),
(137, 42, 5, 21, '2023-05-11 14:59:09', '2023-05-14 07:00:35'),
(138, 42, 6, 17, '2023-05-11 14:59:09', '2023-05-14 07:00:35'),
(139, 42, 7, 8, '2023-05-11 14:59:09', '2023-05-14 07:00:35'),
(140, 43, 2, 6, '2023-05-11 15:24:42', '2023-06-15 15:47:38'),
(141, 43, 3, 10, '2023-05-11 15:24:42', '2023-06-15 15:47:38'),
(142, 43, 4, 15, '2023-05-11 15:24:42', '2023-06-15 15:47:38'),
(143, 43, 5, 14, '2023-05-11 15:24:42', '2023-06-15 15:47:38'),
(144, 44, 2, 10, '2023-05-11 15:28:00', '2023-05-14 06:53:31'),
(145, 44, 3, 10, '2023-05-11 15:28:00', '2023-05-14 06:53:31'),
(146, 44, 4, 6, '2023-05-11 15:28:00', '2023-05-14 06:53:31'),
(147, 44, 5, 14, '2023-05-11 15:28:00', '2023-05-14 06:53:31'),
(148, 44, 6, 20, '2023-05-11 15:28:00', '2023-05-14 06:53:31'),
(149, 45, 4, 40, '2023-05-11 15:31:37', '2023-06-15 15:43:40'),
(150, 46, 4, 10, '2023-05-11 15:33:57', '2023-06-15 15:44:16'),
(151, 46, 5, 10, '2023-05-11 15:33:57', '2023-06-15 15:44:16'),
(152, 47, 4, 20, '2023-05-11 15:37:28', '2023-06-15 15:44:32'),
(153, 48, 4, 10, '2023-05-11 15:40:13', '2023-06-15 15:44:44'),
(154, 49, 4, 10, '2023-05-11 15:42:54', '2023-06-15 15:45:40'),
(155, 49, 5, 14, '2023-05-11 15:42:54', '2023-06-15 15:45:40'),
(156, 49, 6, 16, '2023-05-11 15:42:54', '2023-06-15 15:45:40'),
(157, 50, 3, 6, '2023-05-11 15:46:09', '2023-06-15 15:45:47'),
(158, 50, 4, 12, '2023-05-11 15:46:09', '2023-06-15 15:45:47'),
(159, 51, 4, 40, '2023-05-11 15:48:03', '2023-06-15 15:45:27'),
(160, 52, 4, 10, '2023-05-11 15:51:40', '2023-05-14 06:49:58'),
(161, 52, 5, 17, '2023-05-11 15:51:40', '2023-05-14 06:49:58'),
(162, 52, 6, 8, '2023-05-11 15:51:40', '2023-05-14 06:49:58'),
(163, 53, 2, 7, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(164, 53, 3, 5, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(165, 53, 4, 10, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(166, 53, 5, 10, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(167, 53, 6, 8, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(168, 53, 7, 9, '2023-06-14 15:36:16', '2023-06-14 15:36:16'),
(169, 54, 4, 10, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(170, 54, 5, 7, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(171, 54, 6, 8, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(172, 54, 7, 9, '2023-06-14 15:42:42', '2023-06-14 15:42:42'),
(173, 55, 4, 10, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(174, 55, 5, 10, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(175, 55, 6, 10, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(176, 55, 7, 10, '2023-06-14 15:47:45', '2023-06-14 15:47:45'),
(177, 56, 3, 10, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(178, 56, 4, 10, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(179, 56, 5, 10, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(180, 56, 6, 7, '2023-06-14 16:03:32', '2023-06-14 16:03:32'),
(181, 56, 7, 7, '2023-06-14 16:03:32', '2023-06-14 16:03:32');

-- --------------------------------------------------------

--
-- Структура таблицы `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `tag_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 52, 2, NULL, NULL),
(2, 52, 16, NULL, NULL),
(3, 50, 2, NULL, NULL),
(4, 50, 11, NULL, NULL),
(5, 49, 1, NULL, NULL),
(6, 49, 11, NULL, NULL),
(7, 48, 1, NULL, NULL),
(8, 48, 12, NULL, NULL),
(9, 47, 2, NULL, NULL),
(10, 47, 12, NULL, NULL),
(11, 46, 2, NULL, NULL),
(12, 46, 12, NULL, NULL),
(13, 45, 1, NULL, NULL),
(14, 45, 12, NULL, NULL),
(15, 44, 1, NULL, NULL),
(16, 44, 3, NULL, NULL),
(17, 43, 1, NULL, NULL),
(18, 43, 17, NULL, NULL),
(19, 42, 2, NULL, NULL),
(20, 42, 4, NULL, NULL),
(21, 42, 7, NULL, NULL),
(22, 43, 8, NULL, NULL),
(23, 41, 1, NULL, NULL),
(24, 41, 18, NULL, NULL),
(25, 41, 8, NULL, NULL),
(26, 41, 7, NULL, NULL),
(27, 40, 2, NULL, NULL),
(28, 40, 18, NULL, NULL),
(29, 40, 8, NULL, NULL),
(30, 39, 1, NULL, NULL),
(31, 39, 10, NULL, NULL),
(32, 39, 8, NULL, NULL),
(33, 38, 2, NULL, NULL),
(34, 38, 10, NULL, NULL),
(35, 38, 8, NULL, NULL),
(36, 36, 2, NULL, NULL),
(37, 36, 9, NULL, NULL),
(38, 36, 8, NULL, NULL),
(39, 35, 2, NULL, NULL),
(40, 35, 9, NULL, NULL),
(41, 35, 7, NULL, NULL),
(42, 34, 2, NULL, NULL),
(43, 34, 9, NULL, NULL),
(44, 34, 8, NULL, NULL),
(45, 33, 1, NULL, NULL),
(46, 33, 10, NULL, NULL),
(47, 33, 9, NULL, NULL),
(48, 33, 7, NULL, NULL),
(49, 32, 1, NULL, NULL),
(50, 32, 13, NULL, NULL),
(51, 32, 14, NULL, NULL),
(52, 32, 7, NULL, NULL),
(53, 32, 8, NULL, NULL),
(54, 31, 2, NULL, NULL),
(55, 31, 13, NULL, NULL),
(56, 31, 14, NULL, NULL),
(57, 31, 7, NULL, NULL),
(58, 31, 8, NULL, NULL),
(59, 29, 2, NULL, NULL),
(60, 29, 13, NULL, NULL),
(61, 29, 14, NULL, NULL),
(62, 29, 7, NULL, NULL),
(63, 28, 1, NULL, NULL),
(64, 28, 13, NULL, NULL),
(65, 28, 14, NULL, NULL),
(66, 28, 8, NULL, NULL),
(67, 28, 7, NULL, NULL),
(68, 27, 2, NULL, NULL),
(69, 27, 5, NULL, NULL),
(70, 27, 19, NULL, NULL),
(71, 27, 7, NULL, NULL),
(72, 26, 2, NULL, NULL),
(73, 26, 5, NULL, NULL),
(74, 26, 19, NULL, NULL),
(75, 26, 7, NULL, NULL),
(76, 25, 1, NULL, NULL),
(77, 25, 5, NULL, NULL),
(78, 25, 7, NULL, NULL),
(79, 24, 1, NULL, NULL),
(80, 24, 5, NULL, NULL),
(81, 24, 19, NULL, NULL),
(82, 24, 7, NULL, NULL),
(83, 23, 1, NULL, NULL),
(84, 23, 5, NULL, NULL),
(85, 23, 19, NULL, NULL),
(86, 23, 7, NULL, NULL),
(87, 22, 2, NULL, NULL),
(88, 22, 5, NULL, NULL),
(89, 22, 7, NULL, NULL),
(90, 20, 2, NULL, NULL),
(91, 20, 6, NULL, NULL),
(92, 20, 7, NULL, NULL),
(93, 20, 8, NULL, NULL),
(94, 19, 1, NULL, NULL),
(95, 19, 6, NULL, NULL),
(96, 19, 7, NULL, NULL),
(97, 19, 8, NULL, NULL),
(98, 7, 2, NULL, NULL),
(99, 7, 5, NULL, NULL),
(100, 7, 7, NULL, NULL),
(101, 7, 8, NULL, NULL),
(102, 5, 2, NULL, NULL),
(103, 5, 5, NULL, NULL),
(104, 5, 7, NULL, NULL),
(105, 5, 8, NULL, NULL),
(106, 3, 1, NULL, NULL),
(107, 3, 9, NULL, NULL),
(108, 3, 8, NULL, NULL),
(109, 2, 2, NULL, NULL),
(110, 2, 3, NULL, NULL),
(111, 2, 7, NULL, NULL),
(112, 53, 5, NULL, NULL),
(113, 53, 2, NULL, NULL),
(114, 53, 19, NULL, NULL),
(115, 54, 2, NULL, NULL),
(116, 54, 3, NULL, NULL),
(117, 54, 7, NULL, NULL),
(118, 55, 2, NULL, NULL),
(119, 55, 3, NULL, NULL),
(120, 55, 7, NULL, NULL),
(121, 56, 2, NULL, NULL),
(122, 56, 5, NULL, NULL),
(123, 56, 7, NULL, NULL),
(124, 56, 8, NULL, NULL),
(125, 30, 2, NULL, NULL),
(126, 30, 13, NULL, NULL),
(127, 30, 14, NULL, NULL),
(128, 30, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_user_likes`
--

CREATE TABLE `product_user_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_user_likes`
--

INSERT INTO `product_user_likes` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 19, 1, NULL, NULL),
(15, 20, 1, NULL, NULL),
(24, 5, 1, NULL, NULL),
(25, 3, 1, NULL, NULL),
(26, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE `regions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `regions`
--

INSERT INTO `regions` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'АР Крим', NULL, NULL),
(2, 'Вінницька область', NULL, NULL),
(3, 'Волинська область', NULL, NULL),
(4, 'Дніпропетровська область', NULL, NULL),
(5, 'Донецька область', NULL, NULL),
(6, 'Житомирська область', NULL, NULL),
(7, 'Закарпатська область', NULL, NULL),
(8, 'Запорізька область', NULL, NULL),
(9, 'Івано-Франківська область', NULL, NULL),
(10, 'Київська область', NULL, NULL),
(11, 'Кіровоградська область', NULL, NULL),
(12, 'Луганська область', NULL, NULL),
(13, 'Львівська область', NULL, NULL),
(14, 'Миколаївська область', NULL, NULL),
(15, 'Одеська область', NULL, NULL),
(16, 'Полтавська область', NULL, NULL),
(17, 'Рівненська область', NULL, NULL),
(18, 'Сумська область', NULL, NULL),
(19, 'Тернопільська область', NULL, NULL),
(20, 'Харківська область', NULL, NULL),
(21, 'Херсонська область', NULL, NULL),
(22, 'Хмельницька область', NULL, NULL),
(23, 'Черкаська область', NULL, NULL),
(24, 'Чернівецька область', NULL, NULL),
(25, 'Чернігівська область', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-04-25 08:49:24', '2023-04-25 08:49:24'),
(2, 'Writer', '2023-04-25 08:49:58', '2023-04-25 08:49:58'),
(3, 'Guest', '2023-04-25 08:50:16', '2023-04-25 08:50:16'),
(4, 'Manager', '2023-04-25 08:50:25', '2023-04-25 08:50:25'),
(5, 'Customer', '2023-04-25 08:50:40', '2023-04-25 08:50:40'),
(6, 'SuperAdmin', '2023-06-14 12:51:32', '2023-06-14 12:51:32');

-- --------------------------------------------------------

--
-- Структура таблицы `seasons`
--

CREATE TABLE `seasons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seasons`
--

INSERT INTO `seasons` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Літо', '2023-04-25 08:52:56', '2023-04-25 08:52:56'),
(2, 'Осінь', '2023-04-25 08:53:06', '2023-04-25 08:53:06'),
(3, 'Зима', '2023-04-25 08:53:14', '2023-04-25 08:53:14'),
(4, 'Весна', '2023-04-25 08:53:23', '2023-04-25 08:53:23');

-- --------------------------------------------------------

--
-- Структура таблицы `sex`
--

CREATE TABLE `sex` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sex`
--

INSERT INTO `sex` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Чоловікам', '2023-04-25 08:55:08', '2023-04-25 08:55:08'),
(2, 'Жінкам', '2023-04-25 08:55:17', '2023-04-25 08:55:17'),
(3, 'Хлопцям', '2023-04-25 08:55:34', '2023-04-25 08:55:34'),
(4, 'Дівчатам', '2023-04-25 08:55:44', '2023-04-25 08:55:44'),
(5, 'Дітям', '2023-04-25 08:55:56', '2023-04-25 08:55:56');

-- --------------------------------------------------------

--
-- Структура таблицы `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sizes`
--

INSERT INTO `sizes` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'XXS', '2023-04-25 08:51:24', '2023-04-25 08:51:24'),
(2, 'XS', '2023-04-25 08:51:31', '2023-04-25 08:51:31'),
(3, 'S', '2023-04-25 08:51:41', '2023-04-25 08:51:41'),
(4, 'M', '2023-04-25 08:51:51', '2023-04-25 08:51:51'),
(5, 'L', '2023-04-25 08:52:01', '2023-04-25 08:52:01'),
(6, 'XL', '2023-04-25 08:52:15', '2023-04-25 08:52:15'),
(7, 'XXL', '2023-04-25 08:52:23', '2023-04-25 08:52:23');

-- --------------------------------------------------------

--
-- Структура таблицы `sortings`
--

CREATE TABLE `sortings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_sort` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sortings`
--

INSERT INTO `sortings` (`id`, `title`, `key_sort`, `created_at`, `updated_at`) VALUES
(1, 'За замовчуванням', 'DEFAULT_KEY', NULL, NULL),
(2, 'За ціною (зростання)', 'PRICE_ASC_KEY', NULL, NULL),
(3, 'За ціною (зменшення)', 'PRICE_DESC_KEY', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'жіночі', '2023-05-07 08:59:01', '2023-05-14 06:43:27'),
(2, 'чоловічі', '2023-05-14 06:43:53', '2023-05-14 06:43:53'),
(3, 'футболки', '2023-05-14 06:44:07', '2023-05-14 06:44:07'),
(4, 'поло', '2023-05-14 06:44:21', '2023-05-14 06:44:21'),
(5, 'куртка', '2023-05-14 06:45:09', '2023-05-14 06:45:09'),
(6, 'жилетка', '2023-05-14 06:45:16', '2023-05-14 06:45:16'),
(7, 'повсякденна', '2023-05-14 06:45:25', '2023-05-14 06:45:25'),
(8, 'спортивна', '2023-05-14 06:45:32', '2023-05-14 06:45:32'),
(9, 'брюки', '2023-05-14 06:46:04', '2023-05-14 06:46:04'),
(10, 'шорти', '2023-05-14 06:46:12', '2023-05-14 06:46:12'),
(11, 'рукавички', '2023-05-14 06:46:20', '2023-05-14 06:46:20'),
(12, 'головні убори', '2023-05-14 06:46:33', '2023-05-14 06:46:33'),
(13, 'джемпери', '2023-05-14 06:47:33', '2023-05-14 06:47:33'),
(14, 'светри', '2023-05-14 06:47:41', '2023-05-14 06:47:41'),
(15, 'фліси', '2023-05-14 06:47:49', '2023-05-14 06:47:49'),
(16, 'шкарпетки', '2023-05-14 06:49:41', '2023-05-14 06:49:41'),
(17, 'топи', '2023-05-14 06:53:44', '2023-05-14 07:00:17'),
(18, 'майка', '2023-05-14 07:01:18', '2023-05-14 07:01:18'),
(19, 'пуховик', '2023-05-14 07:09:13', '2023-05-14 07:09:13');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` smallint UNSIGNED DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `region_id` bigint UNSIGNED DEFAULT NULL,
  `settlement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `surname`, `patronymic`, `birth_date`, `gender`, `role_id`, `region_id`, `settlement`, `phone`) VALUES
(1, 'Андрій', 'andrblag@gmail.com', NULL, '$2y$10$InGZER9BzjPOn9YW4GTOA.1bhFPSjC0dzuKlOvgJbT08SfQGvBti2', NULL, '2023-04-25 08:45:14', '2023-06-25 11:39:31', NULL, 'Сергійович', '2023-08-12', 1, 6, 10, 'Бровари', NULL),
(2, 'Olena', 'olena.blahov@gmail.com', NULL, '$2y$10$PXpGK3BhuxYn/RsB4SyYqOeCHFIGWV5KMXgI0S1a7f7E.XSxt3wfG', NULL, '2023-05-06 10:54:20', '2023-05-06 10:54:20', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(3, 'Олександр', 'pokev52422@glumark.com', NULL, '$2y$10$tquPP4XoZ/TUMkWpOPOfrOC38QapB9lvDXjmOA8nkVur8pTlJpOjS', NULL, '2023-05-19 15:39:12', '2023-05-19 15:52:52', NULL, 'Олександрович', '1980-02-19', 1, 5, 8, NULL, '+380 (67) 392-72-89'),
(4, 'Олена', 'logiman459@goflipa.com', NULL, '$2y$10$vgOsQnSkZwMHRatQGTp6DuFr.zM0Vd5eeW7Qcubv62FY/HoJIPWAO', NULL, '2023-05-25 16:08:20', '2023-06-14 13:02:15', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(5, 'Іван', 'weyoker849@favilu.com', NULL, '$2y$10$s6d/rKclwVowa64byqlU7uXQ9.XFmNJbnrcXuhy.12ImyO.YhhpKC', NULL, '2023-05-25 16:11:16', '2023-05-25 16:11:16', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(6, 'Ігор', 'igor@gmail.com', NULL, '$2y$10$PL6o8OEZVhYP0SqcYGa0zeHCnWnpSrARnq5FJ0Jf13DjCbf8Jth4K', NULL, '2023-06-13 04:50:58', '2023-06-13 04:50:58', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(7, 'Store', 'clothingstore@gmail.com', NULL, '$2y$10$vY3EzH9ncPf7/LpGu/EIs.QfuO9sCr6dNq/g4S65E3lk.slNn4NVW', NULL, '2023-06-14 12:52:24', '2023-06-14 12:52:24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(8, 'Олександр', 'eegaphe@gmail.com', NULL, '$2y$10$3L2OqMfyhVoyuyd6zVYgRePSnmiFyq6ShPbA7Ew41G5kkD219Ispy', NULL, '2023-06-18 14:30:31', '2023-06-18 14:35:29', NULL, NULL, '1983-06-18', 1, 5, NULL, NULL, NULL),
(9, 'Ірина', 'dhasdas@gmail.com', NULL, '$2y$10$V.dOC1fb1uuAYOxVuJ80xOWy.S0jAQacSXZtA5tATHUg4S.Zz4D5.', NULL, '2023-06-18 14:44:53', '2023-06-18 14:44:53', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(10, 'Антон', 'fsdfsdf@gmail.com', NULL, '$2y$10$uBKZ9vfTa.SZ9V.vCczX9utjV.HcX7DFJLh7qoIhD.AaATkg8AII.', NULL, '2023-06-18 14:48:49', '2023-06-18 14:48:49', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(11, 'Ольга', 'assdff@gmail.com', NULL, '$2y$10$wGADwDMKT56wb4USd3WsJ.hjXb0V8uZybozOm2vJlXMrx0HTi/O.S', NULL, '2023-06-18 14:58:56', '2023-06-18 14:58:56', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(12, 'Марина', 'avaowhy@gmail.com', NULL, '$2y$10$4X0M.dBR0nz5/Za2B2zjwe2FOX55mj4PvbvtSSTg2fR6OfjEZyzO.', NULL, '2023-06-24 08:46:50', '2023-06-24 08:46:50', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(13, 'Катерина', 'fdsasad@gmail.com', NULL, '$2y$10$CECXKgN2Fx5NQDpyyNpspuE30Y5ig4lsx51eVkwOBznCaIwdfliPm', NULL, '2023-06-24 08:52:54', '2023-06-24 08:52:54', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(14, 'Іванна', 'fsdfdsf@gmail.com', NULL, '$2y$10$YXgVq.T..9mKnsYOjEpc7.u2A1VECwHXkxbAOZ9ihVrl7mAb8poNS', NULL, '2023-06-24 09:03:39', '2023-06-24 09:03:39', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `color_products`
--
ALTER TABLE `color_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_products_color_id_index` (`color_id`),
  ADD KEY `color_products_product_id_index` (`product_id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delivery_companies`
--
ALTER TABLE `delivery_companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_product_id_index` (`product_id`),
  ADD KEY `feedback_user_id_index` (`user_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `material_products`
--
ALTER TABLE `material_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_products_material_id_index` (`material_id`),
  ADD KEY `material_products_product_id_index` (`product_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_payment_id_index` (`payment_id`),
  ADD KEY `orders_delivery_company_id_index` (`delivery_company_id`),
  ADD KEY `orders_region_id_index` (`region_id`),
  ADD KEY `orders_status_id_index` (`status_id`);

--
-- Индексы таблицы `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_index` (`category_id`),
  ADD KEY `products_group_id_index` (`group_id`),
  ADD KEY `products_brand_id_index` (`brand_id`),
  ADD KEY `products_sex_id_index` (`sex_id`),
  ADD KEY `products_country_id_index` (`country_id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`);

--
-- Индексы таблицы `product_seasons`
--
ALTER TABLE `product_seasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_seasons_product_id_index` (`product_id`),
  ADD KEY `product_seasons_season_id_index` (`season_id`);

--
-- Индексы таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_index` (`product_id`),
  ADD KEY `product_sizes_size_id_index` (`size_id`);

--
-- Индексы таблицы `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_product_id_index` (`product_id`),
  ADD KEY `product_tags_tag_id_index` (`tag_id`);

--
-- Индексы таблицы `product_user_likes`
--
ALTER TABLE `product_user_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pul_product_idx` (`product_id`),
  ADD KEY `pul_user_idx` (`user_id`);

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sortings`
--
ALTER TABLE `sortings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_region_id_index` (`region_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `color_products`
--
ALTER TABLE `color_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `delivery_companies`
--
ALTER TABLE `delivery_companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `material_products`
--
ALTER TABLE `material_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT для таблицы `product_seasons`
--
ALTER TABLE `product_seasons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT для таблицы `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `product_user_likes`
--
ALTER TABLE `product_user_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sex`
--
ALTER TABLE `sex`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `sortings`
--
ALTER TABLE `sortings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `color_products`
--
ALTER TABLE `color_products`
  ADD CONSTRAINT `color_products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `color_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `material_products`
--
ALTER TABLE `material_products`
  ADD CONSTRAINT `material_products_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `material_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_company_id_foreign` FOREIGN KEY (`delivery_company_id`) REFERENCES `delivery_companies` (`id`),
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `products_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `products_sex_id_foreign` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_seasons`
--
ALTER TABLE `product_seasons`
  ADD CONSTRAINT `product_seasons_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_seasons_season_id_foreign` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_sizes_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_user_likes`
--
ALTER TABLE `product_user_likes`
  ADD CONSTRAINT `pul_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `pul_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
