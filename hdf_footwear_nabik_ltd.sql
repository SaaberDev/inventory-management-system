-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2021 at 04:57 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hdf_footwear_nabik_ltd`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `phone`, `email`, `country`, `city`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Eden Moore', '+1 (618) 716-4793', 'mbernhard@hotmail.com', 'Lesotho', 'New Joaquinton', '6506 Armani Locks\nNew Georgettemouth, AR 53033', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(2, 'Mrs. Patricia Rau Sr.', '1-762-612-6256', 'jermaine66@yahoo.com', 'Tanzania', 'Stantonfurt', '37795 Kayley Isle\nEltonside, MS 79089-0914', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(3, 'Miss Eveline Vandervort IV', '972-515-4046', 'parisian.wilford@muller.com', 'Oman', 'North Omaberg', '16163 Marjolaine Valleys\nKunzefurt, FL 13720', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(4, 'Prof. Laverne Windler', '+1-973-952-0209', 'ythiel@farrell.com', 'Andorra', 'West Elmiraton', '293 Ayden Streets\nNew Alvertaberg, WA 06287-9910', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(5, 'Verla Kris', '346.345.2036', 'josinski@douglas.com', 'Armenia', 'Melodyborough', '457 Godfrey Ranch\nWaltertown, DC 36544-8508', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(6, 'Eliza Stokes', '+1 (949) 923-8982', 'ojacobi@yahoo.com', 'Sudan', 'Boristown', '4625 Bernier Forks\nNew Clementinefurt, LA 85637', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(7, 'Willow Larson', '678-457-7866', 'zjacobson@hermann.biz', 'Australia', 'Kuhicmouth', '82467 Swaniawski Mountain Suite 856\nBauchfort, WY 21383', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(8, 'Leanna Medhurst', '423-369-9630', 'marie.hammes@yahoo.com', 'Benin', 'West Omerview', '4996 Hackett Turnpike Suite 700\nGuidochester, TN 04327-1792', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(9, 'Christian Boyer DVM', '757-907-0771', 'constance.bosco@donnelly.com', 'Guam', 'New Amya', '269 Hahn Plaza Apt. 523\nGusikowskitown, SD 21200', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(10, 'Lamont Reilly Jr.', '984-359-1998', 'cwalter@streich.com', 'South Africa', 'Port Kamryn', '2240 Kiehn Squares Apt. 247\nSouth Scottybury, PA 09715-7715', '2021-11-01 20:32:39', '2021-11-01 20:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `damaged`
--

CREATE TABLE `damaged` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damaged_items`
--

CREATE TABLE `damaged_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `damage_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damaged_item_details`
--

CREATE TABLE `damaged_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `damaged_item_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_08_100000_create_telescope_entries_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_06_17_010535_create_permission_tables', 1),
(6, '2021_06_17_011822_create_media_table', 1),
(7, '2021_07_01_000026_create_notifications_table', 1),
(8, '2021_07_01_003040_create_jobs_table', 1),
(9, '2021_07_03_211519_create_warehouses_table', 1),
(10, '2021_07_03_211623_create_units_table', 1),
(11, '2021_07_03_211646_create_clients_table', 1),
(12, '2021_07_03_213024_create_suppliers_table', 1),
(13, '2021_07_03_223023_create_product_types_table', 1),
(14, '2021_07_03_223024_create_products_table', 1),
(15, '2021_07_04_234534_create_purchases_table', 1),
(16, '2021_07_07_140312_create_purchase_details_table', 1),
(17, '2021_08_15_005912_create_damaged_items_table', 1),
(18, '2021_08_15_005937_create_damaged_item_details_table', 1),
(19, '2021_08_15_010019_create_returned_items_table', 1),
(20, '2021_08_15_010117_create_returned_item_details_table', 1),
(21, '2021_08_15_012733_create_transfers_table', 1),
(22, '2021_08_15_012756_create_transfer_details_table', 1),
(23, '2021_08_15_013347_create_sales_table', 1),
(24, '2021_08_15_013419_create_sale_details_table', 1),
(25, '2021_08_15_173330_create_stock_table', 1),
(26, '2021_08_16_021855_create_damaged_table', 1),
(27, '2021_08_16_021942_create_used_table', 1),
(28, '2021_09_20_233348_create_released_products_table', 1),
(29, '2021_09_20_233439_create_released_product_details_table', 1),
(30, '2021_09_30_010500_create_expense_categories_table', 1),
(31, '2021_09_30_010622_create_expenses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `group_name`, `title`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.report.sale', 'dashboard', 'sale report', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(2, 'dashboard.report.expense', 'dashboard', 'expense report', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(3, 'dashboard.report.purchase', 'dashboard', 'purchase report', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(4, 'dashboard.report.damage', 'dashboard', 'damage report', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(5, 'product.index', 'product', 'view table', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(6, 'product.create', 'product', 'create product', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(7, 'product.store', 'product', 'store product', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(8, 'product.edit', 'product', 'edit product', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(9, 'product.update', 'product', 'update product', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(10, 'product.delete', 'product', 'delete product', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(11, 'product_type.index', 'product_type', 'view table', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(12, 'product_type.create', 'product_type', 'create product type', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(13, 'product_type.store', 'product_type', 'store product type', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(14, 'product_type.edit', 'product_type', 'edit product type', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(15, 'product_type.update', 'product_type', 'update product type', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(16, 'product_type.delete', 'product_type', 'delete product type', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(17, 'settings.administration.index', 'administration', 'view administration list', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(18, 'settings.administration.create', 'administration', 'create administration', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(19, 'settings.administration.show', 'administration', 'view administration', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(20, 'settings.administration.edit', 'administration', 'edit administration', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(21, 'settings.administration.update', 'administration', 'update administration', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(22, 'settings.administration.delete', 'administration', 'delete administration', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(23, 'settings.group_permission.index', 'group_permission', 'view role list', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(24, 'settings.group_permission.create', 'group_permission', 'create role', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(25, 'settings.group_permission.show', 'group_permission', 'view role', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(26, 'settings.group_permission.edit', 'group_permission', 'edit role', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(27, 'settings.group_permission.update', 'group_permission', 'update role', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(28, 'settings.group_permission.delete', 'group_permission', 'delete role', 'web', '2021-11-01 20:32:38', '2021-11-01 20:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `product_type_id` bigint(20) UNSIGNED NOT NULL,
  `stock_alert_limit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `unit_id`, `product_type_id`, `stock_alert_limit`, `created_at`, `updated_at`) VALUES
(1, 'c76c448e-2e0c-347f-9cd9-314aa8eec30e', 'Enid Harvey', 3, 1, '6', NULL, NULL),
(2, '0088cca2-7ea6-3278-8e71-81c5a31fdf0b', 'Dakota Stamm', 3, 1, '14', NULL, NULL),
(3, '62924bdb-bc76-3bed-92ae-c742ea23902b', 'Walker VonRueden', 3, 1, '9', NULL, NULL),
(4, '62f6f7ec-6f88-3fd3-be6b-eb15591e22fa', 'Augusta Koss MD', 2, 1, '5', NULL, NULL),
(5, 'e52d257b-0f30-3723-be0a-78277037e37b', 'Casper Bartell I', 1, 1, '13', NULL, NULL),
(6, 'e27201d6-d27b-31b5-97c3-6833df0abe0b', 'Evert Windler', 3, 1, '14', NULL, NULL),
(7, '67c735b1-8a2b-3c8d-ae15-99fa3d723e60', 'Catherine Treutel', 1, 1, '5', NULL, NULL),
(8, '39c4dd94-ca6c-3511-868b-34e11fb5d55d', 'Afton Carroll', 4, 1, '12', NULL, NULL),
(9, '2bad6cea-c8ea-3e12-98ee-2a532c3ba30e', 'Prof. Cullen Breitenberg', 2, 1, '14', NULL, NULL),
(10, '477fb37b-1bab-34e4-bb0a-0572ca851e64', 'Precious Williamson', 3, 1, '5', NULL, NULL),
(11, '8716a92b-b104-390c-bf7d-4bf2a9fc52bc', 'Cydney Schaden', 3, 1, '6', NULL, NULL),
(12, 'b48bfdbb-9d20-3530-a140-41aa36bd2218', 'Kallie Hudson', 3, 1, '12', NULL, NULL),
(13, '0f83fa24-7ef6-3395-8f04-c5a9922a0b88', 'Olga Roberts', 4, 1, '7', NULL, NULL),
(14, '687a2984-13fd-3354-813f-d7c99e05a759', 'Mauricio Goodwin', 2, 1, '8', NULL, NULL),
(15, '92c502a4-e55a-3e74-93cf-d2a7a3e409c4', 'Vesta Greenholt', 2, 1, '6', NULL, NULL),
(16, '42a28e47-c23b-37ce-b79c-04cd1eb734bd', 'Dorcas Gerlach', 1, 1, '11', NULL, NULL),
(17, 'd3f0758a-3236-3858-bede-e25be887037f', 'Casandra Kerluke', 1, 1, '14', NULL, NULL),
(18, 'b734ed15-b7f3-3e67-b69f-d651aa86cbae', 'Dr. Kenyon Gaylord DVM', 4, 1, '6', NULL, NULL),
(19, '222dae2c-8784-3ad3-812a-bb20b688c496', 'Ms. Adella McCullough Sr.', 2, 1, '12', NULL, NULL),
(20, 'f70cbd1c-70b2-3a7c-8404-867ea982416b', 'Triston Aufderhar Sr.', 4, 1, '5', NULL, NULL),
(21, '7f538c73-f10a-3f2f-aee5-bd45caea1a9b', 'Bettye Parisian', 2, 1, '13', NULL, NULL),
(22, '04689c0d-f709-3f6d-bd35-f91a8bf33f58', 'Darian Russel', 3, 1, '10', NULL, NULL),
(23, 'ecef6b7f-ef44-335b-a546-6f9f5fbdb8cc', 'Miss Jannie Lockman', 4, 1, '10', NULL, NULL),
(24, 'd54d1c06-9aae-3d1e-bac2-0fcc98bd4492', 'Dr. Zakary Hammes', 3, 1, '8', NULL, NULL),
(25, 'e6a2ae66-c978-3a34-838c-0b00606f4391', 'Prof. Giovanny Fadel', 3, 1, '7', NULL, NULL),
(26, 'cc1ab32b-f586-3d5c-a31b-92f15da8ae62', 'Aglae Ernser', 1, 1, '12', NULL, NULL),
(27, 'e2eb20ac-5757-362d-9185-8c2af0f19dc6', 'Camryn Lueilwitz', 4, 1, '10', NULL, NULL),
(28, '6b96da3c-b538-3597-b27e-8080ae9988ae', 'Gwen Gutmann', 3, 1, '13', NULL, NULL),
(29, '3a085817-38e2-3c1f-b9f0-38e4aa06e694', 'Arne Kling', 1, 1, '5', NULL, NULL),
(30, '8c0deb9f-d725-30a4-ae8a-fe39c5a419a8', 'Cleveland Hoppe', 3, 1, '5', NULL, NULL),
(31, '64daff96-15b2-367b-a36d-b1a69dd6c2e4', 'Shanna Schroeder Jr.', 2, 1, '11', NULL, NULL),
(32, '27851943-0d79-3a6a-b327-9053347411c2', 'Cierra Kuvalis', 1, 1, '9', NULL, NULL),
(33, '4e0f3f47-cb3c-3dbf-ab29-a822a29f874d', 'Dortha Paucek', 3, 1, '13', NULL, NULL),
(34, 'e5ec65b6-eaff-3fff-8736-1cb46e94f331', 'Osbaldo Dicki', 1, 1, '7', NULL, NULL),
(35, 'bfe7db80-b6bc-39ff-9d21-a9cd94ec65f5', 'Dr. Walker Huel V', 4, 1, '9', NULL, NULL),
(36, 'd3f5d4a5-4c5c-3761-850d-d411a13d3dd7', 'Ms. Lucile Zieme', 4, 1, '11', NULL, NULL),
(37, '396d4279-0288-33dc-828c-7d11d9a8ae5f', 'Fredrick Bednar', 2, 1, '10', NULL, NULL),
(38, 'e282ba65-20d8-3ae6-824f-d8700e09433f', 'Eloise Cruickshank', 1, 1, '8', NULL, NULL),
(39, '1bfbfe2a-5864-3646-a45e-1a0e996f2068', 'Prof. Ernest Mann DDS', 4, 1, '5', NULL, NULL),
(40, '933ab198-d080-3c77-a272-92e6b32cdb7b', 'Elena O\'Connell', 4, 1, '13', NULL, NULL),
(41, '748f97e3-86e4-34f3-8091-cc0f21c4196c', 'Ryley Luettgen', 2, 1, '14', NULL, NULL),
(42, 'df38c0eb-98ea-3968-87f6-0ae3fb144b62', 'Prof. Tyree Pacocha', 3, 1, '5', NULL, NULL),
(43, 'd50cbaf6-ae69-3985-a4a0-a8fcb13e1149', 'Sydni Ward', 3, 1, '14', NULL, NULL),
(44, '04ae392d-a643-3bff-a398-60225388da7c', 'Lorenza Ullrich MD', 4, 1, '6', NULL, NULL),
(45, '186a426c-7f23-3913-8576-1dfc83f904fc', 'Prof. Abe Graham', 4, 1, '5', NULL, NULL),
(46, '2219a510-46de-3801-9af7-6d84ee45041c', 'Joel Schulist', 1, 1, '13', NULL, NULL),
(47, 'a0cf7edb-2636-36fb-a31a-ced9c2ede3b9', 'Jade Haag', 1, 1, '13', NULL, NULL),
(48, '55897196-52e0-396b-a12e-2f8b6df8b4ba', 'Dr. Malinda Stokes', 1, 1, '5', NULL, NULL),
(49, 'cd58227d-d966-3714-93ba-af6849bf7404', 'Rocio Corkery', 4, 1, '8', NULL, NULL),
(50, 'a63e2291-1a73-347f-b8d9-ee0f8dc6cef6', 'Aliya Homenick III', 3, 1, '6', NULL, NULL),
(51, 'eeabc137-3bdb-39d8-bd24-2d9520c90e01', 'Cordelia Bernhard', 1, 1, '11', NULL, NULL),
(52, 'be19de55-ecc7-32f5-946f-c39cd06b2edc', 'Paxton Schultz', 1, 1, '9', NULL, NULL),
(53, 'bb3a69cd-ccc5-3acb-9576-8fb2f6d011eb', 'Ruthie Batz', 3, 1, '11', NULL, NULL),
(54, 'e42c5a55-21f5-3cde-887b-be02d01bf3f3', 'Josiane Roob', 1, 1, '9', NULL, NULL),
(55, '72ce2a12-ddee-3792-9e91-73c0f1f30bc6', 'Kendall Mertz', 1, 1, '13', NULL, NULL),
(56, 'feb23075-9dd0-3510-ba8c-dc74bdbf856b', 'Christa Baumbach', 1, 1, '12', NULL, NULL),
(57, '41f7a540-5b65-3c1b-acbd-b1b5ab36b608', 'Dr. Billy Watsica Jr.', 2, 1, '10', NULL, NULL),
(58, '23a78fe0-e640-3182-bd2b-830f3e80e2e5', 'Beverly Mertz', 4, 1, '14', NULL, NULL),
(59, '41f42343-1b4a-38be-b293-18ebd4b7178a', 'Jeffery Koelpin', 1, 1, '11', NULL, NULL),
(60, '63ef3371-61b8-3bd4-b021-e6f2d36f18f2', 'Mrs. Madelyn Veum', 2, 1, '12', NULL, NULL),
(61, 'cc758152-e56d-328d-9a39-522608ae2b53', 'Arielle Robel', 3, 1, '10', NULL, NULL),
(62, '07a57e4a-dc65-3718-8afa-0e8aff6ba8ea', 'Graham Rogahn', 3, 1, '6', NULL, NULL),
(63, '3c33480e-990f-36fc-be0d-230fe25343fe', 'Imelda Hills', 1, 1, '6', NULL, NULL),
(64, '3ad24cce-5f5f-306d-9c31-bc1c22ead8af', 'Lenora Heidenreich DVM', 4, 1, '9', NULL, NULL),
(65, '95e8df15-a840-3f0b-8d64-6d328abf9465', 'Mr. Lonnie Stark', 2, 1, '7', NULL, NULL),
(66, '7e8bca0c-efd7-34d2-8731-f57fca8cc6f9', 'Osbaldo Streich', 3, 1, '10', NULL, NULL),
(67, '5294429f-0529-36a4-8a81-058ec8685f61', 'Mrs. Camille Wuckert MD', 2, 1, '14', NULL, NULL),
(68, 'bdc95b8f-f73b-3d1b-a56e-156ffd93751c', 'Allen Beer', 3, 1, '11', NULL, NULL),
(69, '360efa6f-17d9-3455-bcd2-90dfa7ed5ce1', 'Ms. Fay Ortiz PhD', 4, 1, '11', NULL, NULL),
(70, 'aacfead8-d7f1-3f83-ab72-707b9c357a0d', 'Mr. Johann Swift V', 1, 1, '12', NULL, NULL),
(71, '92f40eed-1814-3f9f-9f45-a060ecea6f18', 'Marjorie Beier II', 2, 1, '6', NULL, NULL),
(72, '216383da-3976-3eaf-b852-1f1bef3fc89b', 'Buster Bashirian', 3, 1, '5', NULL, NULL),
(73, '392965b4-f401-3f37-ba8d-da69204ac3f3', 'Ms. Leda Koch IV', 3, 1, '9', NULL, NULL),
(74, '7afd1713-3d90-3111-98dc-2cfcd4b1612a', 'Veronica Stroman Jr.', 4, 1, '15', NULL, NULL),
(75, '20fa9eeb-da79-3ef6-84d7-157d05fae2b3', 'Dr. Mustafa Wisozk', 3, 1, '8', NULL, NULL),
(76, 'e1480af4-69e3-394a-ba3e-40479b5fa0c5', 'Kali Rogahn', 2, 1, '15', NULL, NULL),
(77, 'c53de8df-90bf-37a0-9a87-60f62f29fd6b', 'Jordyn Durgan IV', 2, 1, '5', NULL, NULL),
(78, 'cc1bbe1c-9b4d-3c4d-9610-3e95a222369c', 'Destinee Champlin', 2, 1, '9', NULL, NULL),
(79, '8f2d2a43-12ff-3e07-9150-bb613323c81d', 'Ms. Elisabeth Ondricka', 1, 1, '15', NULL, NULL),
(80, '6900bbc6-70e2-32c0-bfb5-8723bf28b550', 'Melyna Harber', 2, 1, '7', NULL, NULL),
(81, '7ed4c34f-9f1a-36b2-be9c-bde8709f6c3e', 'Eileen Gislason', 1, 1, '8', NULL, NULL),
(82, '8d7c27df-6fae-300f-a77b-fe0bce55d1a8', 'Dr. Nicolette Davis', 2, 1, '8', NULL, NULL),
(83, '37b06ff7-22f0-3f7e-9abd-a579a490a6e7', 'Trenton Feest', 1, 1, '6', NULL, NULL),
(84, 'f67b7471-2b7c-3306-ae94-e79500a486a2', 'Mrs. Nia Russel', 3, 1, '9', NULL, NULL),
(85, '2d9c18fe-500f-3ac3-90d1-e594b3648c61', 'Earnestine DuBuque', 4, 1, '12', NULL, NULL),
(86, '8eca8f33-03ac-35da-b565-ab7ad0a2764d', 'Lottie Okuneva', 4, 1, '14', NULL, NULL),
(87, 'f41c9ee5-f112-3fb5-8026-cc8089ffbb15', 'Nicholas Medhurst V', 2, 1, '14', NULL, NULL),
(88, 'da5316d4-f822-37d4-a999-c3b55f6d4378', 'Oren Bailey', 3, 1, '10', NULL, NULL),
(89, '09fa8455-2ba1-3534-aa35-a835811b7459', 'Dee Lindgren', 4, 1, '13', NULL, NULL),
(90, '66513be5-a6de-3578-9d79-74eb65bf8df3', 'Una Williamson IV', 4, 1, '12', NULL, NULL),
(91, '8297c62d-7f33-3f37-94c5-8a79afd9bc4b', 'Mavis Gerhold', 1, 1, '9', NULL, NULL),
(92, '0a8e779d-da53-30c1-bb72-d9862becc32a', 'Elmer Lueilwitz', 4, 1, '9', NULL, NULL),
(93, 'f1b01c8b-eb9b-3e6b-873b-abfb623c1cc2', 'Yasmine Stanton MD', 4, 1, '6', NULL, NULL),
(94, '4dacaaa5-3883-3c67-a773-92cc143f0dc5', 'Jermain Kirlin', 2, 1, '10', NULL, NULL),
(95, '44a0356e-4e50-308d-8020-b3720d3687f7', 'Jonathon Beahan', 4, 1, '11', NULL, NULL),
(96, 'd8dc9dd4-ee0c-399e-92da-2116141ac1c0', 'Dr. Amos Smitham', 4, 1, '7', NULL, NULL),
(97, '76161c25-7dd3-326f-b408-3134f0a9658b', 'Dr. Murphy Thiel', 2, 1, '11', NULL, NULL),
(98, '1c6febf3-e3d2-3f69-aec8-ae6e48831dbc', 'Adelle Watsica', 3, 1, '12', NULL, NULL),
(99, '8d3b94a8-dd50-3dfe-97aa-8b6d25ef4ea7', 'Prof. Fae Dooley Sr.', 1, 1, '11', NULL, NULL),
(100, '30763ca9-3f04-3424-b05e-999a8724d0f4', 'Loren Reilly V', 4, 1, '11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `shortcut`, `created_at`, `updated_at`) VALUES
(1, 'Raw Material', 'RAW', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(2, 'Released Product', 'REL', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(3, 'Finished Product', 'FIN', '2021-11-01 20:32:39', '2021-11-01 20:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_paid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_due` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `single_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `single_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `released_products`
--

CREATE TABLE `released_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `released_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_type_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `released_product_details`
--

CREATE TABLE `released_product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `released_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returned_items`
--

CREATE TABLE `returned_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `return_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returned_item_details`
--

CREATE TABLE `returned_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `returned_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(2, 'admin', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(3, 'manager', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(4, 'accountant', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(5, 'purchase', 'web', '2021-11-01 20:32:37', '2021-11-01 20:32:37'),
(6, 'manager_2', 'web', '2021-11-02 16:44:03', '2021-11-02 16:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(3, 6),
(4, 6),
(17, 6),
(18, 6),
(20, 6),
(21, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_paid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_due` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `single_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `single_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `qty`, `product_id`, `warehouse_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(2, 0, 1, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(3, 0, 1, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(4, 0, 1, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(5, 0, 1, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(6, 0, 1, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(7, 0, 2, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(8, 0, 2, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(9, 0, 2, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(10, 0, 2, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(11, 0, 2, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(12, 0, 2, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(13, 0, 3, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(14, 0, 3, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(15, 0, 3, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(16, 0, 3, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(17, 0, 3, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(18, 0, 3, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(19, 0, 4, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(20, 0, 4, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(21, 0, 4, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(22, 0, 4, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(23, 0, 4, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(24, 0, 4, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(25, 0, 5, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(26, 0, 5, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(27, 0, 5, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(28, 0, 5, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(29, 0, 5, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(30, 0, 5, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(31, 0, 6, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(32, 0, 6, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(33, 0, 6, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(34, 0, 6, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(35, 0, 6, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(36, 0, 6, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(37, 0, 7, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(38, 0, 7, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(39, 0, 7, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(40, 0, 7, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(41, 0, 7, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(42, 0, 7, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(43, 0, 8, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(44, 0, 8, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(45, 0, 8, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(46, 0, 8, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(47, 0, 8, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(48, 0, 8, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(49, 0, 9, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(50, 0, 9, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(51, 0, 9, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(52, 0, 9, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(53, 0, 9, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(54, 0, 9, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(55, 0, 10, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(56, 0, 10, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(57, 0, 10, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(58, 0, 10, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(59, 0, 10, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(60, 0, 10, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(61, 0, 11, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(62, 0, 11, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(63, 0, 11, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(64, 0, 11, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(65, 0, 11, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(66, 0, 11, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(67, 0, 12, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(68, 0, 12, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(69, 0, 12, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(70, 0, 12, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(71, 0, 12, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(72, 0, 12, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(73, 0, 13, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(74, 0, 13, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(75, 0, 13, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(76, 0, 13, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(77, 0, 13, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(78, 0, 13, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(79, 0, 14, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(80, 0, 14, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(81, 0, 14, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(82, 0, 14, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(83, 0, 14, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(84, 0, 14, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(85, 0, 15, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(86, 0, 15, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(87, 0, 15, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(88, 0, 15, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(89, 0, 15, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(90, 0, 15, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(91, 0, 16, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(92, 0, 16, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(93, 0, 16, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(94, 0, 16, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(95, 0, 16, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(96, 0, 16, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(97, 0, 17, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(98, 0, 17, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(99, 0, 17, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(100, 0, 17, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(101, 0, 17, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(102, 0, 17, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(103, 0, 18, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(104, 0, 18, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(105, 0, 18, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(106, 0, 18, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(107, 0, 18, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(108, 0, 18, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(109, 0, 19, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(110, 0, 19, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(111, 0, 19, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(112, 0, 19, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(113, 0, 19, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(114, 0, 19, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(115, 0, 20, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(116, 0, 20, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(117, 0, 20, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(118, 0, 20, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(119, 0, 20, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(120, 0, 20, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(121, 0, 21, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(122, 0, 21, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(123, 0, 21, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(124, 0, 21, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(125, 0, 21, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(126, 0, 21, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(127, 0, 22, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(128, 0, 22, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(129, 0, 22, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(130, 0, 22, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(131, 0, 22, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(132, 0, 22, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(133, 0, 23, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(134, 0, 23, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(135, 0, 23, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(136, 0, 23, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(137, 0, 23, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(138, 0, 23, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(139, 0, 24, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(140, 0, 24, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(141, 0, 24, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(142, 0, 24, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(143, 0, 24, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(144, 0, 24, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(145, 0, 25, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(146, 0, 25, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(147, 0, 25, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(148, 0, 25, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(149, 0, 25, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(150, 0, 25, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(151, 0, 26, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(152, 0, 26, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(153, 0, 26, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(154, 0, 26, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(155, 0, 26, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(156, 0, 26, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(157, 0, 27, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(158, 0, 27, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(159, 0, 27, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(160, 0, 27, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(161, 0, 27, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(162, 0, 27, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(163, 0, 28, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(164, 0, 28, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(165, 0, 28, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(166, 0, 28, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(167, 0, 28, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(168, 0, 28, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(169, 0, 29, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(170, 0, 29, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(171, 0, 29, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(172, 0, 29, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(173, 0, 29, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(174, 0, 29, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(175, 0, 30, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(176, 0, 30, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(177, 0, 30, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(178, 0, 30, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(179, 0, 30, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(180, 0, 30, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(181, 0, 31, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(182, 0, 31, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(183, 0, 31, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(184, 0, 31, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(185, 0, 31, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(186, 0, 31, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(187, 0, 32, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(188, 0, 32, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(189, 0, 32, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(190, 0, 32, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(191, 0, 32, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(192, 0, 32, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(193, 0, 33, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(194, 0, 33, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(195, 0, 33, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(196, 0, 33, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(197, 0, 33, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(198, 0, 33, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(199, 0, 34, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(200, 0, 34, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(201, 0, 34, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(202, 0, 34, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(203, 0, 34, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(204, 0, 34, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(205, 0, 35, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(206, 0, 35, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(207, 0, 35, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(208, 0, 35, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(209, 0, 35, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(210, 0, 35, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(211, 0, 36, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(212, 0, 36, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(213, 0, 36, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(214, 0, 36, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(215, 0, 36, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(216, 0, 36, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(217, 0, 37, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(218, 0, 37, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(219, 0, 37, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(220, 0, 37, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(221, 0, 37, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(222, 0, 37, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(223, 0, 38, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(224, 0, 38, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(225, 0, 38, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(226, 0, 38, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(227, 0, 38, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(228, 0, 38, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(229, 0, 39, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(230, 0, 39, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(231, 0, 39, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(232, 0, 39, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(233, 0, 39, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(234, 0, 39, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(235, 0, 40, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(236, 0, 40, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(237, 0, 40, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(238, 0, 40, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(239, 0, 40, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(240, 0, 40, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(241, 0, 41, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(242, 0, 41, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(243, 0, 41, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(244, 0, 41, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(245, 0, 41, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(246, 0, 41, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(247, 0, 42, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(248, 0, 42, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(249, 0, 42, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(250, 0, 42, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(251, 0, 42, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(252, 0, 42, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(253, 0, 43, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(254, 0, 43, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(255, 0, 43, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(256, 0, 43, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(257, 0, 43, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(258, 0, 43, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(259, 0, 44, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(260, 0, 44, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(261, 0, 44, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(262, 0, 44, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(263, 0, 44, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(264, 0, 44, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(265, 0, 45, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(266, 0, 45, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(267, 0, 45, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(268, 0, 45, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(269, 0, 45, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(270, 0, 45, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(271, 0, 46, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(272, 0, 46, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(273, 0, 46, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(274, 0, 46, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(275, 0, 46, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(276, 0, 46, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(277, 0, 47, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(278, 0, 47, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(279, 0, 47, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(280, 0, 47, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(281, 0, 47, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(282, 0, 47, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(283, 0, 48, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(284, 0, 48, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(285, 0, 48, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(286, 0, 48, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(287, 0, 48, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(288, 0, 48, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(289, 0, 49, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(290, 0, 49, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(291, 0, 49, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(292, 0, 49, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(293, 0, 49, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(294, 0, 49, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(295, 0, 50, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(296, 0, 50, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(297, 0, 50, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(298, 0, 50, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(299, 0, 50, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(300, 0, 50, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(301, 0, 51, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(302, 0, 51, 3, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(303, 0, 51, 2, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(304, 0, 51, 5, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(305, 0, 51, 1, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(306, 0, 51, 4, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(307, 0, 52, 6, '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(308, 0, 52, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(309, 0, 52, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(310, 0, 52, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(311, 0, 52, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(312, 0, 52, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(313, 0, 53, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(314, 0, 53, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(315, 0, 53, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(316, 0, 53, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(317, 0, 53, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(318, 0, 53, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(319, 0, 54, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(320, 0, 54, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(321, 0, 54, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(322, 0, 54, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(323, 0, 54, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(324, 0, 54, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(325, 0, 55, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(326, 0, 55, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(327, 0, 55, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(328, 0, 55, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(329, 0, 55, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(330, 0, 55, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(331, 0, 56, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(332, 0, 56, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(333, 0, 56, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(334, 0, 56, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(335, 0, 56, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(336, 0, 56, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(337, 0, 57, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(338, 0, 57, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(339, 0, 57, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(340, 0, 57, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(341, 0, 57, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(342, 0, 57, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(343, 0, 58, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(344, 0, 58, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(345, 0, 58, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(346, 0, 58, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(347, 0, 58, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(348, 0, 58, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(349, 0, 59, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(350, 0, 59, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(351, 0, 59, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(352, 0, 59, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(353, 0, 59, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(354, 0, 59, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(355, 0, 60, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(356, 0, 60, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(357, 0, 60, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(358, 0, 60, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(359, 0, 60, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(360, 0, 60, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(361, 0, 61, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(362, 0, 61, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(363, 0, 61, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(364, 0, 61, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(365, 0, 61, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(366, 0, 61, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(367, 0, 62, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(368, 0, 62, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(369, 0, 62, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(370, 0, 62, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(371, 0, 62, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(372, 0, 62, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(373, 0, 63, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(374, 0, 63, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(375, 0, 63, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(376, 0, 63, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(377, 0, 63, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(378, 0, 63, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(379, 0, 64, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(380, 0, 64, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(381, 0, 64, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(382, 0, 64, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(383, 0, 64, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(384, 0, 64, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(385, 0, 65, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(386, 0, 65, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(387, 0, 65, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(388, 0, 65, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(389, 0, 65, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(390, 0, 65, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(391, 0, 66, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(392, 0, 66, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(393, 0, 66, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(394, 0, 66, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(395, 0, 66, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(396, 0, 66, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(397, 0, 67, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(398, 0, 67, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(399, 0, 67, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(400, 0, 67, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(401, 0, 67, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(402, 0, 67, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(403, 0, 68, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(404, 0, 68, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(405, 0, 68, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(406, 0, 68, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(407, 0, 68, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(408, 0, 68, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(409, 0, 69, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(410, 0, 69, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(411, 0, 69, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(412, 0, 69, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(413, 0, 69, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(414, 0, 69, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(415, 0, 70, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(416, 0, 70, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(417, 0, 70, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(418, 0, 70, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(419, 0, 70, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(420, 0, 70, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(421, 0, 71, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(422, 0, 71, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(423, 0, 71, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(424, 0, 71, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(425, 0, 71, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(426, 0, 71, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(427, 0, 72, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(428, 0, 72, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(429, 0, 72, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(430, 0, 72, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(431, 0, 72, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(432, 0, 72, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(433, 0, 73, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(434, 0, 73, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(435, 0, 73, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(436, 0, 73, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(437, 0, 73, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(438, 0, 73, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(439, 0, 74, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(440, 0, 74, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(441, 0, 74, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(442, 0, 74, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(443, 0, 74, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(444, 0, 74, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(445, 0, 75, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(446, 0, 75, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(447, 0, 75, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(448, 0, 75, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(449, 0, 75, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(450, 0, 75, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(451, 0, 76, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(452, 0, 76, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(453, 0, 76, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(454, 0, 76, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(455, 0, 76, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(456, 0, 76, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(457, 0, 77, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(458, 0, 77, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(459, 0, 77, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(460, 0, 77, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(461, 0, 77, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(462, 0, 77, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(463, 0, 78, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(464, 0, 78, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(465, 0, 78, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(466, 0, 78, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(467, 0, 78, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(468, 0, 78, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(469, 0, 79, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(470, 0, 79, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(471, 0, 79, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(472, 0, 79, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(473, 0, 79, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(474, 0, 79, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(475, 0, 80, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(476, 0, 80, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(477, 0, 80, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(478, 0, 80, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(479, 0, 80, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(480, 0, 80, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(481, 0, 81, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(482, 0, 81, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(483, 0, 81, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(484, 0, 81, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(485, 0, 81, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(486, 0, 81, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(487, 0, 82, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(488, 0, 82, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(489, 0, 82, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(490, 0, 82, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(491, 0, 82, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(492, 0, 82, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(493, 0, 83, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(494, 0, 83, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(495, 0, 83, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(496, 0, 83, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(497, 0, 83, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(498, 0, 83, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(499, 0, 84, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(500, 0, 84, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(501, 0, 84, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(502, 0, 84, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(503, 0, 84, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(504, 0, 84, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(505, 0, 85, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(506, 0, 85, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(507, 0, 85, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(508, 0, 85, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(509, 0, 85, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(510, 0, 85, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(511, 0, 86, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(512, 0, 86, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(513, 0, 86, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(514, 0, 86, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(515, 0, 86, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(516, 0, 86, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(517, 0, 87, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(518, 0, 87, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(519, 0, 87, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(520, 0, 87, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(521, 0, 87, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(522, 0, 87, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(523, 0, 88, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(524, 0, 88, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(525, 0, 88, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(526, 0, 88, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(527, 0, 88, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(528, 0, 88, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(529, 0, 89, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(530, 0, 89, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(531, 0, 89, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(532, 0, 89, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(533, 0, 89, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(534, 0, 89, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(535, 0, 90, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(536, 0, 90, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(537, 0, 90, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(538, 0, 90, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(539, 0, 90, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(540, 0, 90, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(541, 0, 91, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(542, 0, 91, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(543, 0, 91, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(544, 0, 91, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(545, 0, 91, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(546, 0, 91, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(547, 0, 92, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(548, 0, 92, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(549, 0, 92, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(550, 0, 92, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(551, 0, 92, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(552, 0, 92, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(553, 0, 93, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(554, 0, 93, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(555, 0, 93, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(556, 0, 93, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(557, 0, 93, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(558, 0, 93, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(559, 0, 94, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(560, 0, 94, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(561, 0, 94, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(562, 0, 94, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(563, 0, 94, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(564, 0, 94, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(565, 0, 95, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(566, 0, 95, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(567, 0, 95, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(568, 0, 95, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(569, 0, 95, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(570, 0, 95, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(571, 0, 96, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(572, 0, 96, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(573, 0, 96, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(574, 0, 96, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(575, 0, 96, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(576, 0, 96, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(577, 0, 97, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(578, 0, 97, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(579, 0, 97, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(580, 0, 97, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(581, 0, 97, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(582, 0, 97, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(583, 0, 98, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(584, 0, 98, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(585, 0, 98, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(586, 0, 98, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(587, 0, 98, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(588, 0, 98, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(589, 0, 99, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(590, 0, 99, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(591, 0, 99, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(592, 0, 99, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(593, 0, 99, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(594, 0, 99, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(595, 0, 100, 6, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(596, 0, 100, 3, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(597, 0, 100, 2, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(598, 0, 100, 5, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(599, 0, 100, 1, '2021-11-01 20:32:40', '2021-11-01 20:32:40'),
(600, 0, 100, 4, '2021-11-01 20:32:40', '2021-11-01 20:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `country`, `city`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Tamara Bode III', '440-772-4742', 'kovacek.cesar@rodriguez.com', 'Czech Republic', 'East Daija', '8498 Schuster Drive\nNorth Dayneside, ND 50117', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(2, 'Lottie Ledner I', '1-239-522-3993', 'wolff.fletcher@padberg.com', 'Dominican Republic', 'Margueritetown', '2071 Macejkovic Trace\nWalterchester, AR 48053', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(3, 'Adelle Kemmer DDS', '(820) 343-8166', 'hahn.amaya@baumbach.com', 'Kazakhstan', 'Josephinehaven', '208 Kunze Well\nStuartbury, MA 67046-8297', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(4, 'Prof. Cyrus Beier Sr.', '+1 (720) 399-3411', 'wwalsh@gmail.com', 'Oman', 'Aliyahton', '651 Edyth Fall Apt. 172\nWest Agnes, AK 76723-4010', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(5, 'Mrs. Francisca Moen', '1-832-220-4409', 'kailee.beatty@hotmail.com', 'Norfolk Island', 'West Nikoberg', '53020 Tillman Villages\nCristburgh, AK 76949', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(6, 'Prof. Crawford Kohler', '1-636-642-1142', 'vhoeger@gmail.com', 'Saint Pierre and Miquelon', 'Rebekastad', '9785 Gerda Manor\nHudsonbury, TX 30404', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(7, 'Delia Green', '463.512.3649', 'simeon32@hotmail.com', 'French Guiana', 'Earlinefort', '709 Gerhold Hollow\nPort Sharon, WV 64354-4108', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(8, 'Rafael Schneider', '(878) 957-4901', 'dannie.klocko@hotmail.com', 'Malaysia', 'Ianborough', '39900 Maximilian Views\nStammberg, NJ 26710-6169', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(9, 'Alvah Torphy', '+1 (408) 640-5385', 'sandra.bernhard@schuster.com', 'British Virgin Islands', 'Torreychester', '12375 Littel Island\nPort King, CT 12962', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(10, 'Carey Kunde Sr.', '(678) 471-7227', 'xavier44@gmail.com', 'Anguilla', 'Nolaland', '819 Taurean Walk Apt. 080\nEast Elmore, WV 52383-0226', '2021-11-01 20:32:38', '2021-11-01 20:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '94c6686c-77e6-464c-8cac-ba67cb14a677', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"1.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:32:43'),
(2, '94c6686c-7cb1-47fd-9bbf-6fb16250123e', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:32:43'),
(3, '94c6686c-7f43-49c5-818b-36cc8d58024d', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(4, '94c6686c-85d4-4e20-aed4-962cb450efb2', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.17\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(5, '94c6686c-8908-46d1-b17f-10853bfe09a2', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(6, '94c6686c-8c74-47cc-bb07-83fee9b47fa2', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.00\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(7, '94c6686c-8ef1-47aa-823c-238d8bc96c32', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"2.91\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(8, '94c6686c-905e-4bc4-a1f6-dac00ea60975', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(9, '94c6686c-915d-4526-8b9d-05f2ebbbde31', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"1.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(10, '94c6686c-92a2-43f1-8f72-8dca82be31fd', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(11, '94c6686c-95bd-4cf2-a805-c50be59495fa', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(12, '94c6686c-964f-41b9-a701-cbca4597dcb5', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(13, '94c6686c-993a-4f0a-947a-f27d59d86579', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(14, '94c6686c-99bb-491d-9ddc-2cce90ff9bcb', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(15, '94c6686c-9ac5-49f4-8743-7627dd92cbd5', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(16, '94c6686c-9c9c-4719-9d29-094d6343a976', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(17, '94c6686c-9e5b-4812-b68c-0f00135d5fdc', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(18, '94c6686c-a02d-40c3-980d-77f026db64c9', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(19, '94c6686c-a16c-484d-9808-f1a8bb0f3dd7', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(20, '94c6686c-a1d7-4124-972e-2e8184802ae5', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(21, '94c6686c-a2e9-4a43-ae1e-2df042a2ec6b', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(22, '94c6686c-a35a-44d6-afc1-4c6c13f77ae4', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(23, '94c6686c-a3f2-40e3-8a27-7341d24057d2', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(24, '94c6686c-a512-40bb-83fc-793a4b2a2f97', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(25, '94c6686c-aab0-4fc4-9382-80a6930acdb3', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'debugbar', '{\"requestId\":\"X303c337ec1d8ea239746fe612164f22c\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:32:43'),
(26, '94c6686c-ae2d-4f8e-b260-c8328ea51565', '94c6686c-aec3-40a9-a920-9a4428c51435', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"pragma\":\"no-cache\",\"cache-control\":\"no-cache\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IjNFcTlkVlNqL2xzeFpRNFliQ3JSSVE9PSIsInZhbHVlIjoiZVB3SDE4RERSbWMwSkVrVHdqV0UyaTRwTld6eTFJeVVvdU1CVkZJbFZ3Mkl5d3p5L0NYZDZzOU05Smw0eE1qUXlDN0VtbitrVTl5U2NEMTJlQ0s3Yk1ncHRkbkZUdUtDeUd4WmVwMXl6Q3o0NEJ6WjNQTTdXWWlzMUp1OFVVaDciLCJtYWMiOiJjOTg3OTk5ZjlmNDQ3YzlhNjRiZDRjNGU3MjA4NjQ1NGEyZWYzY2FmODY5OWFhMmE0OTMwOWE3MTA3ZmM3MTc3IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjUxU0I5MG9VQWRCRUFoeWpINmZPZmc9PSIsInZhbHVlIjoiMFZHT00xUTA2MUY4T3o2WEdiZW4vUHREVzJ4NUJielIxMzdXeGFrNFB0OWlpUUdJbWd3VzdSMlRhUWJHMEhPRFlhb09BeWp0cEY5WUVzbmFvRERtRS9uTUVnMHlCUHl3bEIrZlgyWG5GdHRsZk9RdjdrTnBXMy9xYXhJSTRIbHIiLCJtYWMiOiJlMGUyNmE3MWQ1Y2U5NDNiNjcwZWViMmRiMjhjZjZmNGQ3ZTljN2VmMGIxYmYwMjE4YjYzZDhlYTBkM2ZiZjQ4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":462,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:32:43'),
(27, '94c668a7-4b04-4543-9995-c4beb08fc193', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"3.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:33:22'),
(28, '94c668a7-5048-48bf-ac6a-687507fd5255', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:33:22'),
(29, '94c668a7-535e-4249-b13e-590892455d0a', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.16\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(30, '94c668a7-567e-4bc0-b730-f6cca03aceb0', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 5 and `guard_name` = \'web\' limit 1\",\"time\":\"1.80\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(31, '94c668a7-580f-4b31-ad99-ee8330605813', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(32, '94c668a7-5922-43aa-be42-6a1e4aef717a', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(33, '94c668a7-5ba1-4e41-9bdd-bc8c2b3823dc', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.15\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(34, '94c668a7-5d2c-4c41-a368-d850018eccde', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":184,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(35, '94c668a7-5dc4-4759-8dac-5fe5f3b06581', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(36, '94c668a7-5fbf-4789-836b-ddb056f3dfdc', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(37, '94c668a7-639a-47ac-9ebb-93fa69957ee7', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(38, '94c668a7-725e-4613-ad39-cb78679e4065', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 5\",\"time\":\"2.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(39, '94c668a7-7498-47a2-bd77-1c793d3df7a1', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(40, '94c668a7-7787-4d1b-965f-8ecf69e26757', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(41, '94c668a7-7a25-4ce2-91a4-6267a99c8d70', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(42, '94c668a7-7d6b-4957-a08a-8d505da33f32', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(43, '94c668a7-7fbb-48cc-87d4-fc31faec137c', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(44, '94c668a7-81f1-426a-b8ad-02c36ba1360a', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(45, '94c668a7-853f-4434-99d6-314ce5b9d076', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(46, '94c668a7-863f-4379-a282-432221294f42', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(47, '94c668a7-880c-44f5-90ed-d6431609d559', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.71\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(48, '94c668a7-8a5e-4f7d-942b-bfe65ddd956e', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(49, '94c668a7-8e2b-478f-9b1a-428471cea9f5', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.69\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(50, '94c668a7-90df-417d-8cd4-c356bee33a98', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(51, '94c668a7-91b9-4377-bed8-8a8a8bfc675e', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(52, '94c668a7-93ff-46c8-93cd-031cb43f62dd', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(53, '94c668a7-9472-4cdf-a323-0661e3f10c71', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(54, '94c668a7-950e-4164-9e5f-27b50c70483a', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(55, '94c668a7-9656-4bc4-8b21-a9a7972ef17f', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(56, '94c668a7-9bce-4771-9ff5-8f04cdd0de84', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'debugbar', '{\"requestId\":\"X3dd9056025b1bd85375bf32b0b696d23\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:33:22'),
(57, '94c668a7-a0ac-43a1-b7c3-caa2d5b68a87', '94c668a7-a13b-420d-811e-a3e25a57b483', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Inc0bjl0WlI0MWpZOW5qOVV2TUs5T1E9PSIsInZhbHVlIjoiUnFLcHZXaUt2MklETllSYlYzaWk3SS9jQWhkaTc5S3JUUjd0Z1JRUmFpWDVZNEw4amVOcVJETndZNFB2YUJVV3lXZVZLWi9rdlV5RkozNzRkNE5Ub3d6TWdtTjhWbkZHMExuUVFFSEUzYUlZUGd6Tnd6UDI3REZNaGsvVVNZQXoiLCJtYWMiOiI5ZmMzYjE1OTk0N2M4NDA5OTI5OGJlNzg0ZDQyNzdiNjYzY2Y2M2YwNzQ5M2Y2ZWMzZmMzNmVjMmZlNjllY2FkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InhjVUQ4ZG5TNFo5ZUtOejExc21EWUE9PSIsInZhbHVlIjoiaFVla3hyanA2cHc2Mjd6bUpkOEhxNmx0NUJ6RUNaQjB6dExKL2NGZmVQaFNiZW1kWktheTZ3UmZ0c1VvTVdLK1lLWlV5UW5VemNrKzFDQWt3Y0hsaktMbEYyY0F2SWljN0UwNWQ3UXh5d0x4WURXbVN2bzdic0pqU3BNc0RGaHQiLCJtYWMiOiI0OTBkYjBiNzQ4OGQ4ZWM4M2QwZmQzZTllNDA0YWZlMmYzMzViNzI2NWZjMDZhMThiMDdiNmJmZmRkZDljODY0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:5\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]}}},\"duration\":532,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:33:22'),
(58, '94c66d5d-e61e-4296-b6b8-a7d236c9bd3f', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"4.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:46:33'),
(59, '94c66d5d-ed49-45ad-92a4-436168d76515', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:46:33'),
(60, '94c66d5d-f09d-48dc-a0e0-cf300904c5bd', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.83\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(61, '94c66d5d-f35d-4cb7-92e8-3b122b4ee090', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 5 and `guard_name` = \'web\' limit 1\",\"time\":\"2.01\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(62, '94c66d5d-f4c1-43e3-a8c1-1f91a17e4576', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(63, '94c66d5d-f5a3-4813-bb3b-bfdba0818959', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(64, '94c66d5d-f926-465a-ad8c-7a5a01d1b448', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(65, '94c66d5d-fb13-48a8-8e21-f4fa15979daa', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":196,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(66, '94c66d5d-fbb7-4c55-8750-8fa7ae22f55d', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(67, '94c66d5d-fe87-4d3a-aa4a-fde3fd5324cc', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(68, '94c66d5e-0049-40a7-a8c1-9ef631a26ce9', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":98,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(69, '94c66d5e-0204-4700-b253-e113cc036c53', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":99,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(70, '94c66d5e-0662-4b30-a5ce-7ef5bba05f5f', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(71, '94c66d5e-0eb4-4502-acc6-e319b6ff5de1', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 5\",\"time\":\"2.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(72, '94c66d5e-1197-4057-9baa-415ba7cb3955', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(73, '94c66d5e-1505-48e7-a962-e21b8265844f', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(74, '94c66d5e-187a-43d0-a557-65983b78d7db', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(75, '94c66d5e-1be0-4734-b513-7e8793d32616', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(76, '94c66d5e-1fa2-46a9-ac12-68e108d73514', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(77, '94c66d5e-22e6-4e01-a99d-c04aa52ea927', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(78, '94c66d5e-2766-466e-8825-765272e56cd3', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(79, '94c66d5e-2962-40c8-9947-60ffb5d54097', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(80, '94c66d5e-2cb1-4d31-888b-dc7008da04ca', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.31\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(81, '94c66d5e-2f1f-44f7-902b-49c496d6b85a', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(82, '94c66d5e-37ab-41e0-97a3-98cdb6dadfa6', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"7.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(83, '94c66d5e-3a11-4401-b2ab-d51317bfe15d', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(84, '94c66d5e-3b71-4599-8a85-21b0e7dbc71a', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(85, '94c66d5e-3f2a-4a99-a75c-87e951c9837a', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(86, '94c66d5e-3fca-45cc-8dbc-a047494087b9', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(87, '94c66d5e-40c0-4793-8193-af386080eb93', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(88, '94c66d5e-41b6-4e25-b2fc-73f8e4e96654', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(89, '94c66d5e-48a0-460b-8954-c127f1937014', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'debugbar', '{\"requestId\":\"Xe32bf7d91a35f8cb4952027c93417c24\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:46:33'),
(90, '94c66d5e-4e6c-45e8-b6d7-5e1d4863f322', '94c66d5e-4ef5-420f-ad67-fc7b59e4fe1f', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"pragma\":\"no-cache\",\"cache-control\":\"no-cache\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Iml5ODhYQ0VOWWxueG5xUTdQd3JUVEE9PSIsInZhbHVlIjoiTTVDNnMxU3NLUmtEM29hb25GVThEeWR3SW1RZGR6NWVLZUx3WUorLzZqdkJ6ekt1ZnVxY05IZUQxZllTUVF2b2Vnc284SHJGdEhWNzgzNTVUT0YzVklmdnNWVUFkQkdxeG1OSmt2ZCtmUm9wa1NWZlVMczNLS2hQNjdmRXVDQWEiLCJtYWMiOiI4ODViZjFlMWZiMGYwYjYzYjEzNDcwZjNmMmY0NzFlODZmNTZlYmE2NWE0NWMwNjRlMDU0ODE4OGIzZGE0ZWRiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Im90SUZzeUhqazlZMTB0a0dVVGgyM3c9PSIsInZhbHVlIjoiMmljWE5JdmIyMkhRS2tYVUdxbzY4YS9QUFRzdGU1Vys0MnQ2Um5FZmQ3WUJ1b2lTKzJXK2xReTRiMk1SODZZNDVhRTRqbDJMd0oxTmNKd21NTzRRQUpLalptR0NxbExmMlgvODNNVkdxUDlIK0ZuMC9SZHBhYVM1eTI1SHQrNVAiLCJtYWMiOiI0MzVjMzIzOWJhODk3YjI1ZTU2MTY4Yzg1YzcxMzQ4OGUzNDI1ZWYxNzNmNDQzZDgwOTA1MzAzNzM4NTg3MmU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:5\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":737,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:46:33'),
(91, '94c66d9a-f193-41e9-b016-9c5ae1f1c0a9', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"1.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:13'),
(92, '94c66d9a-f5d6-4d28-bdfd-01e547f61545', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:13'),
(93, '94c66d9a-f8a3-4fc1-a376-c5ac7e6c2d4c', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(94, '94c66d9a-fb09-4cda-9b48-3545ab4100d8', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 5 and `guard_name` = \'web\' limit 1\",\"time\":\"1.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":94,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(95, '94c66d9a-fc76-4382-aca2-dad8c1ac093a', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(96, '94c66d9a-fda8-48ac-8a68-a98e1cfa33cc', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(97, '94c66d9a-ffcc-499a-aab4-08c21594f6a3', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"1.72\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":95,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(98, '94c66d9b-0144-4d64-9a78-346f530657a6', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":196,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(99, '94c66d9b-01d6-4bc9-b885-30f5e95f8012', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(100, '94c66d9b-03c3-40ca-a66b-f85bd0e1d04e', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(101, '94c66d9b-0630-4a09-9514-02ea83b75009', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":98,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(102, '94c66d9b-080c-4a66-863b-a56a946225e7', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":99,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(103, '94c66d9b-0b4a-4a5e-a3fe-8e82ba799b22', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(104, '94c66d9b-11c0-4095-89ed-2e4325aadbb6', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 5\",\"time\":\"2.03\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(105, '94c66d9b-1390-4dfc-99ec-f67110057873', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(106, '94c66d9b-15cf-4b24-b3b3-2a355a2d4812', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(107, '94c66d9b-1849-4367-9213-56dd7b93ddca', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(108, '94c66d9b-1a91-420e-a739-97218baf6c66', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(109, '94c66d9b-1cfa-48ce-805b-622a873ed08c', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(110, '94c66d9b-1fa1-49ac-bf73-a6cc140c5b17', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(111, '94c66d9b-2264-4fa0-8172-8a9f1a7272cf', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(112, '94c66d9b-238b-4582-9bc2-4a8daa0973e2', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(113, '94c66d9b-2631-439f-b069-b0abfbae6dc0', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.94\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(114, '94c66d9b-27c0-4b99-91b7-f56b6e2e2472', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(115, '94c66d9b-2bc5-4831-ad30-bac8cd310530', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.25\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(116, '94c66d9b-2d50-47f3-9466-a36345d9c96c', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(117, '94c66d9b-2e2a-4a5e-a948-69d81001efde', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(118, '94c66d9b-3090-43db-8f4f-6cee1d17f698', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(119, '94c66d9b-3108-4e5a-a1b4-d7b58702e64e', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(120, '94c66d9b-321e-4b9f-aa16-0d33ce05c526', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(121, '94c66d9b-32f0-41e4-ac3f-f7f81bb89fd0', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(122, '94c66d9b-389f-4767-b76d-31f7c70279a1', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'debugbar', '{\"requestId\":\"X2ec125c40d950d14a963333b0eb8510a\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:13'),
(123, '94c66d9b-3ed8-4ed2-b85c-b335e1822fe6', '94c66d9b-3f67-42f7-bc84-445a5b3cec91', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"pragma\":\"no-cache\",\"cache-control\":\"no-cache\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImFUUUdWMm1jVVQyTkRzSmIzYi9TUlE9PSIsInZhbHVlIjoiK0l4eEVRUkdoUEp3WGJsdVRyU3NudHZaUWZ5aU0vdlBwMDB4WUtOQ2ZLOVZ4U3BzcHVYS3VpOXhZa0RseXpZamNYZkxEbHNGMDIrQmlJNExjTHQ4L2VPL1g5dkozRUFYeW5PSTZiQkVxMi9Fd1ZJaDRpV3Yxb2hoZGZhWFFNK3EiLCJtYWMiOiIwZjVlNTMyZGJhOTEyYmQ2ODg2OTExODhmMDQxN2UwZTc2NTA5ZjkwNjZlNzU2ZDIzMDNiYTQyMGRlMDlkNzViIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IllaVnhrbFRjanhxaFVuTUhyTVhSZXc9PSIsInZhbHVlIjoiM1hlbnZFaW5TOTdONmNIY0NUWmx4TVVJd0NuamZhZWpBZW5TOE1xQ1QyeW9vQUFNQzlEQ09GbDA0eHZsemZlNHIyamo4d05GclZod0dBUWJCdzE4N2hxemNPUFRTYjZYSW1YQkd3OUNMTUc0OTFkV2ppM2R1bGYzTVF4T01sQkwiLCJtYWMiOiJmNGZjZDk5YmE1NGQ5YjdlNGE5MWFiYTc2NjI1YjU5ZmNkN2FlYzc4MWI5YmNkYmIwMzE4ODViMmJlNDc5NGU4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:5\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":525,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:13'),
(124, '94c66dcb-d922-4969-85bb-e57292328d83', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"28.12\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:45'),
(125, '94c66dcb-de7a-4401-baaf-bfc0276abdbd', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:45'),
(126, '94c66dcb-e0f2-4d5c-ab72-95d26383bdac', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(127, '94c66dcb-ebb9-4531-b310-5331bdf67abf', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.12\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(128, '94c66dcb-eef0-4b7b-8bd5-f9395f921f28', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(129, '94c66dcb-f363-49c1-b04b-51304ed71eb4', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.27\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(130, '94c66dcb-f6f0-4b47-af08-31d2ee00939e', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"5.03\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(131, '94c66dcb-f896-4bab-a412-9db1a7ce10b7', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(132, '94c66dcb-f989-4788-9b39-ec58ea9379a3', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"1.10\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(133, '94c66dcb-fad7-457a-a62c-e0e85c9ca343', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(134, '94c66dcb-fe96-47d6-b938-03a147b7c456', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(135, '94c66dcb-ff3e-4f8b-9202-4cecd816d377', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(136, '94c66dcc-01e1-40f6-acb2-9103c147a569', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(137, '94c66dcc-0278-42d0-b4ef-c39a002169b7', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(138, '94c66dcc-0419-4c4c-8d6b-b103aad2de16', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(139, '94c66dcc-061d-41e0-80ef-d18b61d5b04b', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(140, '94c66dcc-07e4-407d-b7f3-94e73a195ec8', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(141, '94c66dcc-0a09-45b0-b39e-7fe5083e5024', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(142, '94c66dcc-0be4-4c30-99bd-4b9197c727d8', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(143, '94c66dcc-0c73-4c9a-9b86-1fe64bfed1fb', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(144, '94c66dcc-0d84-4304-a2c2-2d12dfa2bd52', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(145, '94c66dcc-0df6-4b63-ac78-2c9f7879a66f', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(146, '94c66dcc-0eee-4e34-9c7c-9353bdd3704d', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(147, '94c66dcc-0fe3-489a-967c-bb865e3fcb59', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(148, '94c66dcc-160f-46fe-b356-3a9694f11c1e', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'debugbar', '{\"requestId\":\"X9819af8ae91e2aa209c3ec6a38bfd3c1\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:45'),
(149, '94c66dcc-19b6-477b-ba57-239d5aaa7f8a', '94c66dcc-1a4d-4a03-8fc4-2ca02a3ef83a', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/5\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IlV5eHlhQjNQVnZYSzNxVm4yVXJhblE9PSIsInZhbHVlIjoiaHlzWXRrSGZBbXd5cGN3Y2VSeU1VSGVab0QwMkpCYVdmQUpUL05aUjlKMHR2Um4yeUl0VGd6THNHaE9UeWpjMFRhSUdOSVZRR0oyN1ljeGRYek9kNEF5OVNaWGdLd2JTaFZLaTBRWWdnUnRzQUdxSDBmMS9TdHdhZ0dRbzlFTlciLCJtYWMiOiIyYWQ4NDRmZGE5YzliM2ViNjA4ODA5ZDk3OWIzNjI2MTgwY2IyOTU3Mjc1ODdiNWY5YmI5ODgyYTE2YWQ0MDBhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkZlZ1FVR0lwa1R4TWdDaktjOGdUK2c9PSIsInZhbHVlIjoiYWo4c3Y1aE5SSEJaeExaeTdySXJGbHdaZW82R0ZGT3g3Ky9RZTdvV3RxYm5CS3ZKemxETVFoSXZMWCswR25DeWtuSDZqQmhmUFBkUHpEN1g0bDlFdzBtemhTeE9iVUx0Yk5Pc2IzRE1oanlpV1IrMnE2ZVZmUXBJU0ZpSWNnbFAiLCJtYWMiOiIzZmFhMmMzZmI1MDIxNjU5MzNjNTg3NTI4OGZhYzA4OTkzZjgwNWExOGE0NzY4MzFhNjEzNmZjZjg1MDcyZjViIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":531,\"memory\":8,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:45'),
(150, '94c66dcf-b697-47bd-aebc-09cb23463621', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"28.27\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:47'),
(151, '94c66dcf-b9b4-4d04-9037-fd36d4ad156a', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:47'),
(152, '94c66dcf-bc29-41d1-a75b-bf20d91f8dc0', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(153, '94c66dcf-bf3e-4177-b338-05f405b707c3', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(154, '94c66dcf-c110-49cc-9933-9db02e22397d', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":16,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(155, '94c66dcf-c1a5-4f4f-8e59-df5aeb9b5d65', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(156, '94c66dcf-c3b5-4a26-8e0c-3318f4b78e80', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(157, '94c66dcf-c664-4eac-a9db-daf1a645e029', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(158, '94c66dcf-ca53-42df-9f33-413db2963894', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(159, '94c66dcf-cb28-4ab0-8e59-16a7b20f446d', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(160, '94c66dcf-cd63-43d8-a471-a3e77a1f3e4a', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(161, '94c66dcf-cfa0-41e0-934c-6bbaccce78e8', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(162, '94c66dcf-d3ad-4740-bff8-97411fd91839', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(163, '94c66dcf-d5ee-4a0a-8153-006a1aab2f42', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(164, '94c66dcf-d712-4071-88ad-620857dcf7cf', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(165, '94c66dcf-da2b-4469-8c50-3c7a7966acc6', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(166, '94c66dcf-db0a-42da-8a9f-b5e7e7d863dd', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(167, '94c66dcf-dc4e-47d8-9123-a18c8e46d819', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(168, '94c66dcf-dd1c-43b0-b15d-cfe86f6ef88d', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(169, '94c66dcf-e25e-46ca-b688-c9badf7a56e7', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'debugbar', '{\"requestId\":\"X6e21b42b70f3949ec73a35673969949e\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 02:47:47'),
(170, '94c66dcf-e67b-4d04-9459-355c3ebd975e', '94c66dcf-e71b-466c-92db-7a83330d04ba', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IndQQnFzanZ4aUZvTGhmZVl5Z1kvQ1E9PSIsInZhbHVlIjoiK1QvSUdFRWUycW95Vzhpd3FPRnVqd2hLNnBBSGpZMVJLTFB0UW9pUnBPcG1aRCszRlhWNVFheGRUbWQ0QWtGT3doM0ZaVk1leGgxSENWdmN4TnZqUS9nUHp6S2k1cWtLSS8wb1BKTCtxdmFUVTVOMlozU0diUjNJbUR4ZExKQUwiLCJtYWMiOiIyZmIyMGEzOTUzNWJjNjE4YjU0NTY2ZWFkOWJkNzhjMjhmNDI0Y2M4MzZiNzdhNGNhYzZiNWJiMDYwZWE5NzAwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjRqNU8rQWhlemdtK1llYXZHSFRkVlE9PSIsInZhbHVlIjoiYmx0TzZtMVFvN0VBY0NyOE5TTFd3eUd5Zjg2MXJ0ZHdoQnhwSUtpdGR2TitrbHU3THNXL1lvNjBNdHFsY3haRzNxeTZURkYrYUh3TlhZY08vcVlRbzIrSEJlUVhiRlA1amdkS2NuTEtsSSsvUlR3R1JzTWc4Zi9pV1cxdmhtYVgiLCJtYWMiOiIxYjIxODk3YzE1MDJhZmJkNjI5NDVlNDViOTdkNWMwMzRlNTJlNmJlYTJmM2U2YzBjODc4NTlhN2RhZjljMzViIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]}}},\"duration\":466,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 02:47:47'),
(171, '94c67268-abe3-4d57-8114-a3d76d3e1d12', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 3 limit 1\",\"time\":\"4.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 03:00:38'),
(172, '94c67268-b049-4351-b0f3-20aad543412a', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 03:00:38'),
(173, '94c67268-b2ea-4583-a1f2-fe949b8bc377', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.13\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:38'),
(174, '94c67268-b5c8-46cd-b4d6-fc0b4dfefa6b', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"3.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(175, '94c67268-b78f-4fa3-ac00-9dbc2847dfba', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(176, '94c67268-b82b-450c-8103-c2e8266be652', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(177, '94c67268-ba07-4e29-b2a5-85766e8da6d5', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(178, '94c67268-bbf6-41c1-8173-cf08b23147a0', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(179, '94c67268-be04-4dd5-91dc-40c00b552506', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"1.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(180, '94c67268-c120-4d1e-874e-5d7f96a5b4dd', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(181, '94c67268-c5b0-4070-8163-7017c327322d', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(182, '94c67268-c67a-49b5-a807-000427cc1879', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(183, '94c67268-c919-4e94-8e2b-414ba39bbb10', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 3 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.65\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(184, '94c67268-cb0f-461b-ade7-b15794e9bde2', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(185, '94c67268-cf66-4142-ab79-7929c92d5eb7', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(186, '94c67268-d118-45f0-87f2-f29625df8f6a', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(187, '94c67268-d234-4766-8792-9417c00499c0', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(188, '94c67268-d497-4e77-ac61-2fb42a7e5c00', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(189, '94c67268-d50e-4f8d-b30c-404270cce386', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(190, '94c67268-d5ae-4f27-9a7c-6412e6767f71', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(191, '94c67268-d679-45e5-8b0b-452eef005b9c', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(192, '94c67268-dc31-441c-be17-9e9c5482a858', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'debugbar', '{\"requestId\":\"X8a83cdb9d24dede486ff929a6c5c10b9\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 03:00:39');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(193, '94c67268-e1d4-409b-bc51-3ae75bbb4fc3', '94c67268-e26d-491d-9e71-1eaf4b862f1e', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"pragma\":\"no-cache\",\"cache-control\":\"no-cache\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InBQb2h0WFhSUzlienBqU2VrZUZwT1E9PSIsInZhbHVlIjoiOUphQWErS3I1cXQrOVFoU0V1UkVBR2JkK3FNbUxyeEFJbHI2KzNQMktNdk9BVUE2cEhCQ1kyUWZ5S0psenhaTzZUZG1QRHBYbHd6Y2RHVkpYZ3FGUHFSSEc1ZmZGMFpTamZlT1gyQWtKV25LL2xsdUg0TWhCMEs5V1M4KzVIeGMiLCJtYWMiOiIxZmQzMDg4MmFmOTIxNmY4ODg2NzcxMjEyZDg0NDNkMDgwMzY1NTM4OTNmNzYyZjJiZmMwMDQ0NjczYjg2NjkwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlpOV2NmMkpGalNaNjdueFNvZWg1UXc9PSIsInZhbHVlIjoiQS8wV1M3Yk8zejE2d3NxenNUNFdjUFlWYWR6VlJEQ2tSNXp4cWgxY252ZTdrZ0x2eUdHeHlwbU9MU3FqRzMvYVJWaEVvRjBPQnpCNG9pUDdiSVVpZ0JId1BiWVpuM1BMQ0RQTkMyWDZkNnJzUFBGTVlXVWtnVXllTUZJN0tyWWUiLCJtYWMiOiI4NmY4NWY1NGM5Y2E3NDgxYmE2MGZiNjJiYzc0YzE3YmU4NDllY2M5Nzk3ODY2ZmNhMzRjNzRhMzYyMWI4ZmYyIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"xwUSW2hsvCox7inw3hnmgSDjylXHVBK66LC8IFMn\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":3,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":473,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":3,\"name\":\"Manager\",\"email\":\"manager@gmail.com\"}}', '2021-11-02 03:00:39'),
(194, '94c8177f-7729-4a2e-ad5e-69f5a0f434d3', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(195, '94c8177f-819f-4222-a296-f820c0f51531', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(196, '94c8177f-88a0-4a76-9f9b-863eacbc7688', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(197, '94c8177f-8c02-475d-ac56-82e5d11d1db2', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(198, '94c8177f-acbd-4218-996c-042e82d8fba5', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"25.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(199, '94c8177f-aea4-4dae-b5e3-f03c9c4b1f41', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(200, '94c8177f-b231-4e45-9b36-5f514f7ace26', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(201, '94c8177f-b916-4b91-a173-c61834978843', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(202, '94c8177f-b9f3-4d00-a571-a851bedb071f', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(203, '94c8177f-bb1b-4f56-9aa0-ce6c0ba4695c', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(204, '94c8177f-bcc5-4a58-b953-b4b4a4f82c5b', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(205, '94c8177f-c889-487f-91aa-961097a8119e', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'debugbar', '{\"requestId\":\"X11ab9597f05d05ab2eabcdb0973f909a\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(206, '94c8177f-cb45-4e46-8bf9-4fae93a36c13', '94c8177f-cbe2-49b7-a818-f3bfd8994cc7', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"hdf-footwear-nabik-ltd.test\",\"connection\":\"keep-alive\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"purpose\":\"prefetch\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"LenXlAMiGK0wLuVmYqITJ9JC9dfDIzfETTQkR3Uk\",\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":[]},\"duration\":1460,\"memory\":18,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:06'),
(207, '94c81781-12f6-4f1e-9def-d38ecf9b12ec', '94c81781-4ee2-4597-8f42-fa70b68d74da', NULL, 1, 'view', '{\"name\":\"errors::404\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/404.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(208, '94c81781-21d2-4473-b298-ed07adc95536', '94c81781-4ee2-4597-8f42-fa70b68d74da', NULL, 1, 'view', '{\"name\":\"errors::minimal\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Exceptions\\/views\\/minimal.blade.php\",\"data\":[\"exception\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(209, '94c81781-43dd-4382-8a15-956d2d225072', '94c81781-4ee2-4597-8f42-fa70b68d74da', NULL, 1, 'debugbar', '{\"requestId\":\"X2652aa35000cd7eb91a990166fd0a1ea\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(210, '94c81781-4d7c-4d57-bc32-cf8958ae8fb7', '94c81781-4ee2-4597-8f42-fa70b68d74da', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dist\\/img\\/default-150x150.png\",\"method\":\"GET\",\"controller_action\":null,\"middleware\":[],\"headers\":{\"host\":\"hdf-footwear-nabik-ltd.test\",\"connection\":\"keep-alive\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"dnt\":\"1\",\"accept\":\"application\\/signed-exchange;v=b3;q=0.7,*\\/*;q=0.8\",\"purpose\":\"prefetch\",\"referer\":\"http:\\/\\/hdf-footwear-nabik-ltd.test\\/dashboard\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImtQZWx5bFF4ZGpaZEdGVEJNaWc2QVE9PSIsInZhbHVlIjoidlBhb0NOU0pUSEdNY3ZCbjBSZkpCQTIzOG1pK3RKbjNKd2xRNHJxZ3h3aFY2NFlBelhrUzVIUGZnNzdsdXBQbkJiVXRPSHdJZCtKd0xjYXBuQlNObHFWUHdkQ2FqbEJCdGZUd29rQkxwYzc0Zys0eVVOb2RHQlc1NnJmZFRVQmMiLCJtYWMiOiI4NWM3Y2VkNTljODI1NTAyNzE3OTllODU2NDBlZDZkMzUxMzEwNGYwOThmNzkwOTFkM2IyZjI1ZTJjOGFjZjBiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImNZZENMQXRXcXJ5bXpLa0VvYnJrUEE9PSIsInZhbHVlIjoiSExlY1RzYlZLZy81bks3RVhubGR5d3JQNEp0NlMzQll2S2JOdzZmZWhuZVIrMUtsOERnK3VCSERxdC9nTS8yZFc3V2d0Z1NxOFg1aXhlN2FIRG5ydXNOWGFrMU9Ub1BiWXhPaHpBVktRMkViaElValZteFJjbEZ2eGlTaDcva04iLCJtYWMiOiIwODZmNjA3MTMwNDE5ZWEzZjE0OGI4ZGZiMzA0ZDIyNzhkMjc1NWYxNDQ2ZDMyZjJmMDQ3ODZmZWMyNjY1ZDcxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":[],\"response_status\":404,\"response\":\"HTML Response\",\"duration\":770,\"memory\":8,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(211, '94c81781-0733-486c-b093-65df4374fa22', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(212, '94c81781-0e8b-411d-9239-786342508055', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(213, '94c81781-1935-41df-be12-fc35d49e29c0', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(214, '94c81781-2105-47be-add5-dd27be2ed2f3', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(215, '94c81781-358d-425b-b597-de9b0d0695d3', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(216, '94c81781-38ee-43d0-bcfd-f2dbb3b7620b', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(217, '94c81781-3af2-4701-a422-67cb3d9eee5f', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(218, '94c81781-3f56-4f94-8097-8d5fb7d5f02e', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(219, '94c81781-400a-4dac-bf3f-8f4f57ec7cea', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(220, '94c81781-40f9-4fc0-82d7-0472fb870c1c', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(221, '94c81781-4241-450b-8dea-52c74e5f1b6b', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(222, '94c81781-4dea-4181-84d2-cb2547525097', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'debugbar', '{\"requestId\":\"Xe73c8bd5d2e4e4e71af4a8bc6abc2978\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(223, '94c81781-59e7-4f89-8027-f37cf04f0739', '94c81781-5c3e-4d48-85b3-b1fa5859b1f9', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController@index\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"hdf-footwear-nabik-ltd.test\",\"connection\":\"keep-alive\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"P0kTtVzHsOyA6dFAZpJbrlVY0r4Iyhp4dGO5RT31\",\"_previous\":{\"url\":\"http:\\/\\/hdf-footwear-nabik-ltd.test\\/dashboard\"},\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\hdf-footwear-nabik-ltd\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":[]},\"duration\":1015,\"memory\":18,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:07'),
(224, '94c81789-6cb2-4eca-b562-2efe8634e572', '94c81789-7b01-4cb7-bad2-269118b51b5c', NULL, 1, 'debugbar', '{\"requestId\":\"X0d47da8cf9adac297e5005da34e65b1a\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(225, '94c81789-7908-474a-8614-e9fcaa2d1086', '94c81789-7b01-4cb7-bad2-269118b51b5c', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"cmjurwogmwKKsmI9T4b5sU6wS9cOGYa6XWuvpl4V\",\"url\":{\"intended\":\"http:\\/\\/nabik.test\\/dashboard\"},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\"},\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":{\"X0d47da8cf9adac297e5005da34e65b1a\":null}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/nabik.test\\/admin\\/signin\",\"duration\":1178,\"memory\":8,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(226, '94c8178a-0203-441a-acdf-6b1c34dfc905', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'view', '{\"name\":\"auth.admin.pages.login\",\"path\":\"\\\\resources\\\\views\\/auth\\/admin\\/pages\\/login.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(227, '94c8178a-13ce-4b94-9ee1-ce8b24e76357', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'view', '{\"name\":\"livewire.auth.admin.login-component\",\"path\":\"\\\\resources\\\\views\\/livewire\\/auth\\/admin\\/login-component.blade.php\",\"data\":[\"_instance\",\"form\",\"remember\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(228, '94c8178a-181f-45da-838b-80c166bfc4cf', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'view', '{\"name\":\"layouts.admin-login\",\"path\":\"\\\\resources\\\\views\\/layouts\\/admin-login.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(229, '94c8178a-1b1c-4884-b461-db44a29e89f9', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(230, '94c8178a-2232-4f9c-9ea3-6e6cad0d26d6', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'debugbar', '{\"requestId\":\"X062e8e2746cd7a4853ffb83d3a0ed05c\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(231, '94c8178a-241b-4806-a4e9-a111d2176a91', '94c8178a-24a9-4d2c-87a5-fabdedf6c222', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/signin\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Auth\\\\AuthenticatedSessionController@create\",\"middleware\":[\"web\",\"guest\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Inh4QnlnSS9ZRWdmbnhIdjhid0hiRlE9PSIsInZhbHVlIjoiMURiVVJWNkloVG9PZHdRNDRKaGZTTWlqbGhQbFYrNmx1UkthK01pQWpmUjdkQUdLTS9BTHo4VUlTR3NvRE0zN2lJVDd1NkNQNSs3R2hPd1NDdjBJOHRTUk0vY0h2blQ3MVpqVUFGdk93Q3A4V3kwWHRnSGxsUkd5SjgweUNDaG4iLCJtYWMiOiI0YzQ0YjNmN2I2OTc0YjEzY2ExMWRiNGVlNGQxZDQzYTNmMmVhN2IyZTI2NzhlMDJjNDQ2NWNkNmIxNmVkZjRhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkV4SXc3aTViY1BCQ0l3aGlDcXdiK3c9PSIsInZhbHVlIjoiZ0RJMXQ1OWRFVWdWSGpjNEprS3VaeEJaTk1iVEtMS09Vd09sS0xzSVZQTHNYR2QxYnFCWk1DZGljd3NQV3NDYnUwejdJaFVuVGVCNmU1L2hXNXRCalhnTCtOa3NXRmRhRkdKQldad2dmNy82OWVLMGR5bUdrKzhFQWhFM241YkoiLCJtYWMiOiJmNThkZTE3YWJjZWYwY2JjYzQ2OTM3NDU2NzAzZTViMWQ3MWEzNTBhNjVhMzAyYmFlZWY0ZGE0NmNlY2I4MWI4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"cmjurwogmwKKsmI9T4b5sU6wS9cOGYa6XWuvpl4V\",\"url\":{\"intended\":\"http:\\/\\/nabik.test\\/dashboard\"},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/admin\\/signin\"},\"_flash\":{\"old\":[],\"new\":[]},\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/auth\\/admin\\/pages\\/login.blade.php\",\"data\":[]},\"duration\":410,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:38:12'),
(232, '94c817dc-f661-4192-846e-128e175b5741', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `users` where `email` = \'saaberdev@gmail.com\'\",\"time\":\"2.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Auth\\\\Admin\\\\LoginComponent.php\",\"line\":39,\"hash\":\"1895cb63909c7eb8e2529c4143a4c0bf\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(233, '94c817dc-fc72-4f5e-b471-bcf4de670d2c', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"saaberdev@gmail.com|127.0.0.1\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(234, '94c817dd-0e16-4c46-988d-d43b2b9614d7', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'saaberdev@gmail.com\' limit 1\",\"time\":\"0.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Auth\\\\Admin\\\\LoginComponent.php\",\"line\":69,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(235, '94c817dd-0fab-436a-95df-7ef7a590ef1b', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(236, '94c817dd-37db-4fb7-867f-f8a295a73b7c', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Auth\\\\Admin\\\\LoginComponent.php\",\"line\":44,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(237, '94c817dd-4083-428d-911b-54e3e232dd65', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, `model_has_roles`.`model_id` as `pivot_model_id`, `model_has_roles`.`role_id` as `pivot_role_id`, `model_has_roles`.`model_type` as `pivot_model_type` from `roles` inner join `model_has_roles` on `roles`.`id` = `model_has_roles`.`role_id` where `model_has_roles`.`model_id` = 1 and `model_has_roles`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"3.81\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Auth\\\\Admin\\\\LoginComponent.php\",\"line\":44,\"hash\":\"eb2635dbf27540ab6ab19dc9db8a2961\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(238, '94c817dd-4244-45a7-b480-b09b047397d5', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(239, '94c817dd-4b07-4ff1-8d9b-9e80485bcd08', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'debugbar', '{\"requestId\":\"Xf9dcbdba6bf757698cd8a4b3097175bd\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(240, '94c817dd-4c5d-4c2c-807d-fe155e428f8c', '94c817dd-4cf8-424a-9b8c-ce103b05ff0e', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/livewire\\/message\\/auth.admin.login-component\",\"method\":\"POST\",\"controller_action\":\"Livewire\\\\Controllers\\\\HttpConnectionHandler\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"content-length\":\"610\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"dnt\":\"1\",\"x-csrf-token\":\"cmjurwogmwKKsmI9T4b5sU6wS9cOGYa6XWuvpl4V\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"x-livewire\":\"true\",\"content-type\":\"application\\/json\",\"origin\":\"http:\\/\\/nabik.test\",\"referer\":\"http:\\/\\/nabik.test\\/admin\\/signin\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IldMcnFxamJOcWZsb2JmQ3NpVG1CbkE9PSIsInZhbHVlIjoiQWxoMnBkeVk0Y0xFc3llMzNOK0d2c3dXZmdEZHVWTVhFTzlDTzROSEh2NWlsUm5EdGwzU1dXU243MElYekd6VVl1WVRoZmRmd1lPaUR6NkZTUXBlVW54b1RtSng0elNqYklDUE9FR1g0Yjg3YitaMC9KRDlqNDdDR1VRSCtTQzMiLCJtYWMiOiI0YzZjM2UyMjA1Y2YyZTkxMmUzMzZmZTI3MjI3Yzk4NjAyZWFjZjFkYjE3YmM0NTRlNjk3NDBjY2Q2MzE0YTgwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjBMTk5Ud1ZkcTBnZUxTTCtJM1VBZFE9PSIsInZhbHVlIjoicmhSSHNsTzJrRVpPcVY4THBBdFhwNFcrZ2Y5WDUzelhRb04ySmpCVmgwZ2o5Q0RsSDJrZ0lnUThJM2lwc1hEZm5MdnJXVUlmZDZTaGphZDA1d09vUGQ5YllQVUp6NW5Bc2VDb1R3T01MSDVkczk5cjZVejVKUHRaLzhSZkdkTTAiLCJtYWMiOiJlMjEyNDljYWUyMjY5MWM5ZmNiZTI4YTA1YmZjZTkzNDQ1OTFkYWRiMDZhOTRlMTk2N2NlMDBhNThmMGQ3MzYyIiwidGFnIjoiIn0%3D\"},\"payload\":{\"fingerprint\":{\"id\":\"yLEX0rj4tg7wUie1wLYB\",\"name\":\"auth.admin.login-component\",\"locale\":\"en\",\"path\":\"admin\\/signin\",\"method\":\"GET\"},\"serverMemo\":{\"children\":[],\"errors\":[],\"htmlHash\":\"14034cb6\",\"data\":{\"form\":{\"email\":\"\",\"password\":\"\"},\"remember\":null},\"dataMeta\":[],\"checksum\":\"5807319134acaa08c44a84b140e52993fcbcdaf2ad083487f3436ee335b939e3\"},\"updates\":[{\"type\":\"syncInput\",\"payload\":{\"id\":\"p8j\",\"name\":\"form.password\",\"value\":\"1234\"}},{\"type\":\"syncInput\",\"payload\":{\"id\":\"ktzg\",\"name\":\"form.email\",\"value\":\"saaberdev@gmail.com\"}},{\"type\":\"callMethod\",\"payload\":{\"id\":\"oorc\",\"method\":\"store\",\"params\":[]}}]},\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":{\"intended\":true},\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/admin\\/signin\"},\"_flash\":{\"old\":[\"url.intended\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_status\":200,\"response\":{\"effects\":{\"html\":null,\"redirect\":\"http:\\/\\/nabik.test\\/dashboard\",\"dirty\":[]},\"serverMemo\":{\"htmlHash\":\"00000000\",\"data\":{\"form\":{\"email\":\"saaberdev@gmail.com\",\"password\":\"1234\"},\"remember\":null},\"checksum\":\"39da231506eddc2d84ef987750aa1531d7c0f3782f050707d4f02170a39a9d34\"}},\"duration\":630,\"memory\":22,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(241, '94c817dd-e6c4-455e-85d1-8c7c9b16a080', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(242, '94c817dd-eac3-45fb-b3a6-1287c1008d22', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:07'),
(243, '94c817dd-f8ef-4691-94f3-e77dee8752af', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `products`.*, `stock`.`qty`, `warehouses`.`name` as `w_name` from `products` left join `stock` on `stock`.`product_id` = `products`.`id` left join `warehouses` on `warehouses`.`id` = `stock`.`warehouse_id` where `products`.`product_type_id` = 1 and `stock`.`qty` > 0\",\"time\":\"8.27\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":30,\"hash\":\"1ef46d8a715be4a1a5cd898aa69c1e8e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(244, '94c817dd-fcae-45a7-af14-606a885a65e8', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `products`.*, `stock`.`qty`, `warehouses`.`name` as `w_name` from `products` left join `stock` on `stock`.`product_id` = `products`.`id` left join `warehouses` on `warehouses`.`id` = `stock`.`warehouse_id` where `products`.`product_type_id` = 2 and `stock`.`qty` > 0\",\"time\":\"0.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":36,\"hash\":\"1ef46d8a715be4a1a5cd898aa69c1e8e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(245, '94c817dd-ff27-4e3c-a7fd-c7e14e386df3', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `products`.*, `stock`.`qty`, `warehouses`.`name` as `w_name` from `products` left join `stock` on `stock`.`product_id` = `products`.`id` left join `warehouses` on `warehouses`.`id` = `stock`.`warehouse_id` where `products`.`product_type_id` = 3 and `stock`.`qty` > 0\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":42,\"hash\":\"1ef46d8a715be4a1a5cd898aa69c1e8e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(246, '94c817de-01fe-473b-b625-0be1e8fc0070', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select sum(`grand_total`) as aggregate from `sales`\",\"time\":\"1.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":43,\"hash\":\"a5228f666039b34132af8fb7e98d63b0\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(247, '94c817de-05da-495c-a9aa-5fa2cb3df2ba', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select sum(`grand_total`) as aggregate from `purchases`\",\"time\":\"2.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":44,\"hash\":\"b8b6960cffb4b287f17979e795600ad2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(248, '94c817de-08e8-4067-b0a0-b18c790154b7', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select sum(`cost`) as aggregate from `expenses`\",\"time\":\"2.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController.php\",\"line\":45,\"hash\":\"c01467ef36bd0af768dc18869ed68b2e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(249, '94c817de-0e7f-441d-8673-433c1f3fd724', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(250, '94c817de-1261-46fe-9874-08cbf797f92b', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:07'),
(251, '94c817de-14ea-488e-ae03-cb2012d5012a', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(252, '94c817de-1a6e-4b15-8cd2-44febf941ba1', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(253, '94c817de-1df6-4a0e-bfc5-356c96945e0f', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(254, '94c817de-21c7-40be-8eb2-1359241406a8', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(255, '94c817de-23c0-4e2a-8338-5af8ba2384db', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(256, '94c817de-24db-4c99-848a-55aea40ffae1', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(257, '94c817de-27b5-4259-89c7-74bccb79e6e8', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(258, '94c817de-28af-4209-82c9-69aeb78f6ff7', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(259, '94c817de-2a5e-4691-bf53-6f189a87889a', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(260, '94c817de-2ba5-4e4c-b400-ec421b038794', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"product_raw\",\"product_rele\",\"product_fin\",\"totalSale\",\"totalPurchase\",\"totalExpense\",\"lose\",\"pofid\",\"__currentLoopData\",\"loop\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(261, '94c817de-30c5-4f84-89b3-012293c0f7fa', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'debugbar', '{\"requestId\":\"X6ba81b3d59f18f7af886ef30a7994b34\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:08'),
(262, '94c817de-33aa-4e89-ab0b-307c99c06847', '94c817de-34cb-400c-9084-2e1d253d8217', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\DashboardController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/admin\\/signin\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ikk2cW9GYzVsTXg1S20rMVBwN3A0Mnc9PSIsInZhbHVlIjoiUWE1VFAxNFJWWG9Xam5oUXhRd1RnNjRvWHc5K1U1ZkEzRElhcTNVcldkUFl2TE1MMnNjU2NDcnFaMXgrYkJhUWhxRjVFbVpkMVFralEyckMxZEp2N1lpQVI1TWQ0WkZ1U2ZiUXlNaFVNNlM0d1VWemhUb0h1bHg3dVE4V1lPTHkiLCJtYWMiOiI3YTlkNTM3MTMzM2VjMjJjOGI3ZmMyYjc3MjkyZjFhYTBlZDRjODU1MGZmMzgzNjg5Y2Y1YjQ2OTRkNWUyNmZiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlFTeG5qY3N6T1I5M2JpRzNvclZwYmc9PSIsInZhbHVlIjoidDZnYWhWcmRhZEpwT0VTYTJ5NE1aZllGYjR0TTc0R0tvU3hXY0xsNVA3ckZ5dnlOQkVPVTd0Q04xbmhMNVlUV0JYWGZVS2gvT21SaTVKd0NBZ285QWJnV3R5a280T00vSVRwdmgzQWVEYyt1SjNOUTZWdGF0UjFWWlc0NVFOQlkiLCJtYWMiOiJkYjI1OGY2Zjk4YTNlMmZkOWE1MGY0ZGQyNjMxZGM1Y2JkZjNmZDNiNDgxYzg1MjdmNTg1YmIwYTAwZjk5YmI2IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/index.blade.php\",\"data\":{\"product_raw\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[]},\"product_rele\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[]},\"product_fin\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[]},\"totalSale\":0,\"totalPurchase\":0,\"totalExpense\":0,\"lose\":0,\"pofid\":0}},\"duration\":532,\"memory\":12,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:08'),
(263, '94c817f4-9633-43eb-94a8-7f695728328c', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:22'),
(264, '94c817f4-9c4b-47cd-8964-5f7523c9d86b', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:22'),
(265, '94c817f4-a033-4ff0-8f7c-aa9aec460ae3', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(266, '94c817f4-b1d7-47bb-b54d-1c9621491973', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(267, '94c817f4-b5d1-4e01-92a6-c4fe5a94dd45', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.17\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(268, '94c817f4-bc66-447d-ab07-025ad64e9699', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(269, '94c817f4-c0a7-4d4c-b450-1538e166c1e1', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"5.80\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(270, '94c817f4-c2e8-417d-8a76-6d0c3c5bf2e8', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(271, '94c817f4-c406-4758-8007-487a7ad97ece', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"1.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(272, '94c817f4-c667-49b8-a8fc-8f22f6193851', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(273, '94c817f4-ca49-419e-93d8-0087f6880eb5', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(274, '94c817f4-cbc9-45a2-b983-c41bdc672eed', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(275, '94c817f4-cfc3-4b3d-b3e5-0579b67e878b', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(276, '94c817f4-d0b0-47a6-b32c-8874804581f2', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(277, '94c817f4-d32e-46d8-920c-483cacbf1cc0', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(278, '94c817f4-d546-49a8-9676-de07b535fddc', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(279, '94c817f4-d706-4df0-b7c3-64f52a34a8f6', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(280, '94c817f4-d956-4585-a774-8ba7d28fe568', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"3.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(281, '94c817f4-db55-44d0-b290-1ddd78aee47e', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(282, '94c817f4-dbdb-412a-8680-7816367f2b10', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(283, '94c817f4-dd2d-4868-92c1-a4a831a4ae1c', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(284, '94c817f4-ddd6-468c-b23c-2338b650e3c4', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(285, '94c817f4-df17-40d5-ac83-3a453d0a9116', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(286, '94c817f4-e0a2-430b-8dd2-f06669870729', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(287, '94c817f4-e725-4a4e-a456-41d4c2ee7eb5', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'debugbar', '{\"requestId\":\"X920fa731c6864e3a6e5d6322126d021b\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:22'),
(288, '94c817f4-ef69-4cc4-9c39-9a4955167bd2', '94c817f4-f04d-4bfa-a4dc-08df315596f8', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InVuZnlrck9Jd3VBcGpheTFDSU1vNEE9PSIsInZhbHVlIjoiOHRzcDlWTVZtSW90K29GbDMxcjMveTFXREJjdno0QU5HUGlLUGlBVm5Zbyt4SjV5WHB5MDJ0ck9QbHQ1bkJwMTFmeG5xZnVvM2kwcHBQcUt3UzIxekJSVEJGOGNzUW04UWxjL2JXZisrTDEzSUpLYm9mbURoQVNtajFPMWRGWVoiLCJtYWMiOiJmNGViOTY0NGI1NWY3NjFkNGZiNWE0NTJmMzA0ZTUwYTc2NDFhMWMwNTdjNTJlY2JkMGFkN2UwMmFiY2QyY2VlIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjVxMUpRTm9xbDE0QllXM2FFOGRmc1E9PSIsInZhbHVlIjoiNDZGQjVFR244ZmNjOThnS1FDaW9wVCtNTWUxT0Z0TDZOOUNKNnRMeGRxRTd4Wmo3TGVwNFh6K0c4ZEwyZkNnV250QUNXQ3VaSy9BSlp6cTh2Y3B5cjBzbWd5L0RiTkVxay9ZdzE0eEFkOTE0UzUyL0VaWkE2NDFPMyt5VThMQlUiLCJtYWMiOiI5YjNkYzc4NDNiNzVmNTY4NTQ1NjJmODRmMGJkYzE4M2Q5MjhhYjdkODYxODM0M2QxZmJhNzQ2ZDhjMWM5YzU1IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":593,\"memory\":10,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:22'),
(289, '94c817fc-dfd3-4f8d-8dc1-75b3de5f1d51', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:28'),
(290, '94c817fc-e584-4bb0-8075-9fa96f6513c4', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:28'),
(291, '94c817fc-e8dd-42ed-a341-da4e641715fb', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"2.85\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(292, '94c817fc-eb89-4a62-8e66-56a667bdd4a4', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(293, '94c817fc-ed2d-40f6-a3ab-2f1aec1c176a', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(294, '94c817fc-edd2-4c6d-8277-40995100473d', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(295, '94c817fc-f16e-4c1a-9fdd-7a03c5ad149f', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(296, '94c817fc-f362-4655-bb61-5b4e46dfbc60', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(297, '94c817fc-f602-4705-a626-fa7c877d7174', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(298, '94c817fc-fa27-407d-af53-0f7a64e2748b', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(299, '94c817fd-017f-4dd8-9a3a-56b2f057154e', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(300, '94c817fd-039e-491f-81bb-2f6c673fc857', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(301, '94c817fd-0847-4b1d-8206-3ddbd45204ae', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(302, '94c817fd-0c13-44d9-b9d5-e2fe8488de6b', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(303, '94c817fd-12c4-4b61-8112-bd8889b1c05f', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.00\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(304, '94c817fd-143e-414a-a72e-1785f6c6afc1', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(305, '94c817fd-14ea-4fdd-b1d3-3b4a0d94c9e9', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(306, '94c817fd-1831-4af1-8a64-5e1eff3a0f68', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(307, '94c817fd-18b9-4450-b02f-63afe4d104c0', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(308, '94c817fd-1948-402b-92a4-2b1db4ae9575', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(309, '94c817fd-19f7-4078-a779-4ce0b59e1bf7', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(310, '94c817fd-1f8c-470d-9a23-bc8d7fd48b4f', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'debugbar', '{\"requestId\":\"Xf430e679651646e7a3fd355372e3446c\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:28'),
(311, '94c817fd-4ce8-4be4-9545-773a6a457aa3', '94c817fd-4d8c-478a-9ede-181608a39867', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IktkVDhCZkp3RHM2QXl2REIyakVkS3c9PSIsInZhbHVlIjoiVzQ0T0J0QlhwYVd3SEZqT3B2aDMrdTVOcHZzakZlZ1hVb3hTcEtFZWVGbk40T2d4aE9oZ2NtMFVaZ1kxOU9BeGY2eS9vY3RrcnNqcWVsSkFzYWxBNlY5UTVmQ1hkZXorZ0hKTlMxR0NuV0JTRWFBUWtQeUZPY05QcXRmbEFFYmEiLCJtYWMiOiJkMWRlM2EwYjNlNzUwNDg5MjI4ODMyYWU0MDEyOWJkYTU5YTBiYTZjNWY3MzZiMmIwZmViN2Q1Njg3OTlhMzIzIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Ikx5MFV5cGYxNHJkY0JrUG4vbUo4VEE9PSIsInZhbHVlIjoiUytycS9rZU1ablRRd0R0M3NRejZuL04yaDJrOWhrSWtHT2xmUnJrc3NjOUFudGJOcGxyTXd6eVdCU1pWbXBjWVJKeEZrd0lJVHJyWlkxRDROYTRKS1dQcXZValA4RzE3OEVmbE55eDFhMzNCWnRyVWdvb2dJcmtjSWhyTGRqZHkiLCJtYWMiOiJlY2U2YzBmM2JlZTMyY2IwMDE2NmU5YTdjOWE5NTEwYzZjMTBkNmY3NzFiMTY2MjIzNTY3N2Y3MDMxMmU5ZWFhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":653,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:28'),
(312, '94c81823-8b12-4f53-9b1e-8b44355ba6d0', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"5.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:53'),
(313, '94c81823-8e52-457e-bf76-800a4b0f7d32', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:53'),
(314, '94c81823-9178-4ded-b3dc-c1a311f736a4', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(315, '94c81823-98f5-46db-b0c1-973f637fb907', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.12\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(316, '94c81823-9c10-46e9-bdc4-cbab21bb8a97', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"2.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(317, '94c81823-a0a2-4315-82e8-622222ed2a36', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(318, '94c81823-a6b1-44c6-a65a-25c668cc8f14', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"7.85\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(319, '94c81823-a830-4e46-8fd7-087044b4aa19', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(320, '94c81823-aa6f-4f32-afa3-56599eb60d7a', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"2.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(321, '94c81823-abd4-453a-acad-f8cb633d8b2d', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(322, '94c81823-aec0-45a1-b4bb-0caa552fd989', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(323, '94c81823-aff0-4d64-b121-b0c4da6b659a', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(324, '94c81823-b27e-45cd-ad8e-6a605c2b1d3c', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(325, '94c81823-b303-4aee-8c39-ef34ccf59f24', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(326, '94c81823-b3d7-4675-9dfb-f5d0ceffbdf6', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(327, '94c81823-b698-49a0-9e67-3af2d158ecd9', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.95\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(328, '94c81823-b87a-49d1-83f8-45865a2e8d5f', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(329, '94c81823-b9fe-4fe7-b944-404e2df13c3b', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(330, '94c81823-bb6b-41c2-b358-c87e38b8fa5c', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(331, '94c81823-bbf6-4264-a9f1-22a9d0a33859', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(332, '94c81823-bd5b-4c5d-8a34-4baad13f61d4', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(333, '94c81823-bdd0-4bc9-8217-157cfa78b738', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(334, '94c81823-be7e-453a-afab-7f1741756578', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(335, '94c81823-bf37-4297-afe4-890ff4ac70b8', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(336, '94c81823-c568-44bd-adc2-4f6f9c9acdff', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'debugbar', '{\"requestId\":\"X9cbe0614ef26e5db1e1c7ef75393580c\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:53'),
(337, '94c81823-d52b-4505-b430-fedeccaecac7', '94c81823-d6bf-4062-ab7a-5cb18deb3bc4', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ii9UWmN0aEtoU21MNFJnOWVPK2N3blE9PSIsInZhbHVlIjoiaGk0cVdiVEg1bS9mNktMRTRtUVd5QzhscmF2U3JiV0VOQlUrNmkyTlFDblpwSGNjQXVIblVDaFo2cERTWUNvSUVKL3RVNStaWEkyZVBvaVVGeURhRlRma3NSM1pxZUNUZS9YeHhXbnVVbmpqRGR4TDc2SWlWNVFjWXoyTEdKeSsiLCJtYWMiOiI3YzIxN2NlZDA2Mjg0NTQ4NGYwZTE3MjA4NDk5OTAxYTA3MTZiMjYyOGRhMDJiN2M3ZTZmMTFmOTRmMzY5YTg1IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlhqcCtielZFNW5CUmFxbmRNamI1a3c9PSIsInZhbHVlIjoiRnp3cnFoMm53TTJRSTVVQ1AySXNBVXFCUXIxbk40VUg5anFROXVvOHNjencrQ3VEOUxoMlFTbU9RdGNud0RLVzBsMnVSVzI5YVc4L0xYa0JzOVFBSUZuQk1nR24yQUtMNElrU2g1cGQrNTc5NEdlT3Z3L3J6cnlaOGJIRTZTd0wiLCJtYWMiOiJmYTE1YjlmOTdlODEyOGY2NjUzMTcyODBjMGViOWY0ZDA5NWFhMzU1MWYwZDAzYzI0YTc2Nzg4OTRkMDEwZmVkIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":626,\"memory\":10,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:53'),
(338, '94c81827-ce5b-4929-ba2e-2ad0234d7ef2', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"14.84\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:56'),
(339, '94c81827-d272-4afa-80f9-a61aff96dce5', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:56'),
(340, '94c81827-d7cc-448c-9b75-b31f76780a3b', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"3.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(341, '94c81827-db2a-44a1-8780-c7dbe46f76d4', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 1 and `guard_name` = \'web\' limit 1\",\"time\":\"2.91\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(342, '94c81827-df81-4021-ba4e-9820f1863bf4', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(343, '94c81827-e17e-491c-9f5e-c8d943422c63', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"2.40\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(344, '94c81827-e4b7-45f3-9b8b-00ace3c2c80f', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(345, '94c81827-e74c-4804-8128-c73dbbee4107', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":224,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(346, '94c81827-e8d9-4ae9-bf25-9d4ac74f6e42', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"1.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":98,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(347, '94c81827-ec03-4535-978f-352b7bf7dc24', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.71\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":99,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(348, '94c81827-f17a-442d-aebc-476f4f8e2433', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"1.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":100,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(349, '94c81827-f58d-4403-8a87-65317ef27699', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.75\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":101,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(350, '94c81827-fc11-4356-b48d-639c96bfb25a', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(351, '94c81828-08bd-42ae-a1ae-db2665829d8e', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 1\",\"time\":\"3.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(352, '94c81828-0c94-43cb-aeb0-316d34dbc0ce', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(353, '94c81828-0fbd-47e5-8f4f-c8ed4f004011', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"1.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(354, '94c81828-12ad-4474-b560-73b5c9bcc10e', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(355, '94c81828-14e9-481a-8917-c390530df35f', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(356, '94c81828-1889-404c-8748-d0099f562720', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(357, '94c81828-1a97-4ad0-9ba0-761a32035927', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.35\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(358, '94c81828-2498-4ad9-a7cd-ff1ed2c378ea', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(359, '94c81828-25b7-4fc7-8134-59a8cad54efc', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(360, '94c81828-27ff-4ad6-a8f6-ed9d9500d637', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(361, '94c81828-2a9e-4871-aefd-04eacba4cdba', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(362, '94c81828-2e62-4489-9f96-8afdc9c28344', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(363, '94c81828-3046-4e82-a37b-181e13cc013b', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(364, '94c81828-312c-4eaa-a8a9-da4e4dff9685', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(365, '94c81828-33b8-4810-a895-fbb16ca32d1b', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(366, '94c81828-3421-48d8-ac17-353164f05113', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(367, '94c81828-34b9-4e41-8893-7284b34b479c', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(368, '94c81828-368d-492d-b97c-816d08dd0c56', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(369, '94c81828-3bd4-4339-9371-c471e790ea97', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'debugbar', '{\"requestId\":\"Xe98f1922be8a0f9bd591d60c26988653\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:39:56'),
(370, '94c81828-458a-4f1d-860b-1f28bf4e32c0', '94c81828-4692-4318-8028-a346ac6a4d88', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/1\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImVIT2xkaDRlVEdSZ2p2M0tvUnFCTEE9PSIsInZhbHVlIjoiNThjbEVRdmxPdU9oNG8za0FERmxiOG13MjlseW5qN1hUbytreUI1aEY1UVg1YW9uZzRDenhVbUYwYTdLYSswNlQ5YThFMWZNMThVNlFWaDZUYjR4TG5sV2x0MDhBY0M3K3hZazhadnpnM0l6U0pNb0tWWU1ubktWQVd4ZjF5MXAiLCJtYWMiOiIyYTVhNjJkNDJmZDYyOGFkNmIxODJhZDEzMTY4MmNmMzk3ZjAyZTllZDgzMzRiMWFhOWZkOGVjMzlkM2FlNWJhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InRWTGUzdFo3RnhXTW4zdERjc3lhUlE9PSIsInZhbHVlIjoiUnBhVXkzb21tZ3IxUnlnU0RuaGlBbjF6M0JES2dKekdaSmVyb2RuY2g4RjliV0tnVnIyUmV5RDdaUHBlVThsS0tDOXB4cTU2bExDL1dUS2kzMnJGMWRWZVZlYnpkQzQrVDNqZDNQbnJyQVRiUVJ1Q09lZnAySGZ2My83UzR1SW4iLCJtYWMiOiI0N2NmZjg5MmIyNThkMTUxOTZkMTcwNTlkZjBiOGMyODU4NzVjYjMzZTM1MDFhMWNlZTk1NGNmODAxOTFmMjFhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/1\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:1\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":679,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:39:56'),
(371, '94c818f1-d461-424e-bf84-5ffb0ca51796', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"16.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:08'),
(372, '94c818f1-d952-445e-a128-7fe75b1a4ccc', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:08'),
(373, '94c818f1-dc16-44a3-a320-534e309c6b82', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(374, '94c818f1-e732-4038-bd8e-39432a191481', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(375, '94c818f1-ec8e-4096-97fa-14c2b17230d0', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.93\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(376, '94c818f1-f090-4c24-8e39-f9a600ddd459', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"3.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(377, '94c818f1-f311-4f9c-af72-7ebcdf448c8f', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"2.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(378, '94c818f1-f47c-470b-9b1d-f30aae185d60', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(379, '94c818f1-f670-42f4-9425-6a194466c173', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"3.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(380, '94c818f1-f891-4843-9e9d-133a2330d301', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(381, '94c818f1-fbca-41a0-b11b-8c5fba112679', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(382, '94c818f1-fd3e-4a1e-ace8-4e8ec4895314', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(383, '94c818f1-fffa-42e5-8cfa-2c3027901f83', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(384, '94c818f2-0089-45b1-8467-7f6484de6a6b', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(385, '94c818f2-01d2-4081-abec-161fec09fbbd', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(386, '94c818f2-04b1-479f-886d-14b1d34eab1e', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(387, '94c818f2-063e-4f19-8d66-79613b18f63c', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(388, '94c818f2-07c8-42d1-a3bf-a84f9b6c0135', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(389, '94c818f2-09d4-480f-b0d3-b694148e48ec', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(390, '94c818f2-0afa-4479-b241-4c6cabe083b3', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(391, '94c818f2-0c2e-442a-9a05-885d055e4e3b', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(392, '94c818f2-0cc1-4e54-8eb0-93f024d1d0a1', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(393, '94c818f2-0d67-4baf-8563-6cbf28556931', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(394, '94c818f2-0e94-44f0-8527-999263ba479f', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(395, '94c818f2-14d6-4a6c-becb-63adb0e14c60', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'debugbar', '{\"requestId\":\"X184c8fda1965ef2eedd66e43a9def70f\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:08'),
(396, '94c818f2-194a-4a86-bc79-3b71ae6decc4', '94c818f2-19f6-46db-8c9e-fea0938c9de3', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/1\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Im5wcXFuUU1SZ3NFakg1aERIWEMxcGc9PSIsInZhbHVlIjoiSjdSU3NVNnVGbStERlUyRHExSVdmOFpjNlZlZnRtUDZHMmxSZ3RXUE8xR1lKZDFQYTUwYk03ZGdnNXhrRFBpOCs3cnBJcnF2c293S1NJSDZsckc5QmQxV2lEK3RwN3RiRUVqSGFneVdUbWI2U3ZYSHUrODZUV1o2S1pRZEZPem4iLCJtYWMiOiIyMjc4NTdiY2VjMWJiOGMxOTllN2NkOTE4OTNiM2FhMDAyNjY4N2FkMzI4OWMwODE3YzdjYjQ5MzRlOTljOTA4IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlBSbnJ4REpFQTMrTnVUczA3V3VKYkE9PSIsInZhbHVlIjoiYXRibWFqclZUbzU2dXo5TVJGT1lIUEZwaFJJZWg3M3Z3dUhId0xNRHprNkVINlBoVERtZjE2YUI5T29FZWZPMjVWK082OTA4UUwyMG9qa2F4eGpXcWtKTkV3TlNtcENEbnpjckdhUzJlK29wNno0dVBqNDYzd2tvZlFDb1hjSjIiLCJtYWMiOiJjZjFjM2M4NGY3MjQyMDBhZTU2N2ZjOGM0ZGY3Y2Y1Nzc3NTAzYTEzZThiNWRhNThiYWJlNjIyMjVmNDJjOGQwIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":678,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:08'),
(397, '94c818f6-a396-49f0-b2b5-3ed2f280491f', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:11'),
(398, '94c818f6-a770-410b-ab8b-0ff94fc6376d', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:11'),
(399, '94c818f6-aa04-4889-b3af-8c35198caee3', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(400, '94c818f6-ad34-4c17-a076-045fe53a11f9', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"1.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(401, '94c818f6-af24-430a-99ad-559a9687e774', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(402, '94c818f6-b015-4f25-a10e-d41afd710a0f', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(403, '94c818f6-b436-4d6c-ac20-761e039b3027', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(404, '94c818f6-b76b-48d9-b5df-493c970c2bd5', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"1.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(405, '94c818f6-ba3b-480e-ac8f-67945d9535f5', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(406, '94c818f6-bde7-4a3b-8efd-826ae06ff881', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(407, '94c818f6-c07e-4b45-aae6-346bdaf81100', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(408, '94c818f6-c187-4d9e-8b34-9075b3adba92', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(409, '94c818f6-c3bc-4ac1-bc3b-9c0320ecd059', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.27\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(410, '94c818f6-c626-4268-b23b-7b59481ef403', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(411, '94c818f6-ca35-4d6f-a400-5b01a5689f47', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.95\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(412, '94c818f6-cd8f-4a80-8b6e-58623823aec9', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(413, '94c818f6-cea3-4f9e-985e-c679bd4cd461', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(414, '94c818f6-d2b1-4db0-b7f6-10c47e10f9cf', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(415, '94c818f6-d3ac-4966-bd7b-554dd7f8d792', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(416, '94c818f6-d447-4201-96e5-ee8eaac99546', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(417, '94c818f6-d4e4-4b3d-bcc6-95fdd55bda6a', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:11'),
(418, '94c818f6-da1f-43ae-86a4-5c717b374f33', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'debugbar', '{\"requestId\":\"X3fe149fc2bbafa8e03d7703b3a522fd0\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:12'),
(419, '94c818f6-e131-4f4c-b339-1a9719c453d0', '94c818f6-e1cc-4cad-8b47-873564b55665', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Iko0R3cxcHVuMEFGQmV1ckdkcDlBVmc9PSIsInZhbHVlIjoiMmRlTU40K3RFdktDSmM1K0hsdURvb2Y3c25YZGs0bDAzTEJaelRGZHQ1WXplSUlpZWttbnNBRS8wVTg3Snd2cDlNU0kzd011Qk9jbk5PYlg3dEplaEoxNUM3NzlibzNZR3B6T2h3Ym02cDZFS0N0MEQ4WENDL09Valc0ek5oZmsiLCJtYWMiOiIxNjM3NzJkY2Y0NTk2ZDA5YTJhNWQ0NjNjYjkxOTFiN2JjM2E4ODYyZDgzNzk5Zjg3MDJmZTAyMzZkOTdhNzA4IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlArbkcvcFdTOC9teCtPZFBsQXg5bEE9PSIsInZhbHVlIjoidzMwN0l4RlZmc1lPMU5QY1laaDZ2NGV1Q1lSdXp5aTZzQ2ZGOE4rcllPa0trUW51V05DNjlGM09UQjdja2tWVVlubDRMcm1NemFUQ1lPbUs1aHVQM0lSUkdrSit4SFd2MXRLNXIwV0RTNG9SdU13cVYrTkQzS0NUV0NaSUZESkciLCJtYWMiOiI1YWE0ZDg2OTg5NjRlZTA1ZjQ1MzdhMWZjOWIyMjJjNGZjMzMwYTgzZTM3NGVlYzQyYzQwOWI5ZjY0ZmFjZDliIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":483,\"memory\":2,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:12'),
(420, '94c81913-1d82-4338-ad06-eed54689f871', '94c81913-7685-469d-ab92-5ca17d1c1537', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:30'),
(421, '94c81913-238c-46c9-b5cd-213cd0c0ade0', '94c81913-7685-469d-ab92-5ca17d1c1537', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:30'),
(422, '94c81913-6f02-4cf3-b46b-5ec80964e8f4', '94c81913-7685-469d-ab92-5ca17d1c1537', NULL, 1, 'debugbar', '{\"requestId\":\"X4b3e6354d4fdc10a9f838b45b9ea7b2c\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:30'),
(423, '94c81913-760b-423a-85d3-593ebd335517', '94c81913-7685-469d-ab92-5ca17d1c1537', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/store\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@store\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"content-length\":\"342\",\"cache-control\":\"max-age=0\",\"origin\":\"http:\\/\\/nabik.test\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IlhjNGwzM214aHFhNTF6TzE0RkVDM2c9PSIsInZhbHVlIjoiOERFWDVXZks1cHFMY0dRVVZENFN3ZFAzQXErTDVkengrZUNPbGJHYnhheExCbkN2bnVWTG83QlhlTUNiV3RHVEpWYWxLZlA2L3p1ZHp6M0JVNFVsTUJEL2x0ejBHcGE1Y3huZk8yRXhBZVBWd1VkdzZSblZ0Q2tzRk1HcmVrZlAiLCJtYWMiOiI2ZmM0OGI1N2Y1ZjU3NWFkMzJmYzExODU2NzJiYTE2ZDAzYjk5Mjk1MmM5NWE5ODcxODhlYzMzMjY2NDU5ZDMwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlllTi9uSUh5cjBGU1N3RzE2UkZSRnc9PSIsInZhbHVlIjoiUmxPYU4yQUQ2YlpDZ1BaYlNpME4ydWdmWmFMeGxubFo3L2VmdmdlMkQ3WWFyRTV2WC9Gd3pBdHk4V2UzN213Ky9odEkwbW9RalpHaEtHNVBNTXVVYTFGcEpOZUFabWoxdjJWSWV0QTc4ajU3TVBPNVdRMjQ2SlNiblRRU1k2V2ciLCJtYWMiOiI5ZmQzNjE5Mjk4Yzg3ZmE2ZWY2N2Q3ZDJkNWI3YTdmZGQ4M2IyN2Y0ZGZjYjRlZjk5OTk4ZmU0MjU4ODAxNzE5IiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"_method\":\"POST\",\"role_name\":\"Manager 2\",\"allProduct\":\"on\",\"product\":[\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"allProduct_type\":\"on\",\"product_type\":[\"11\",\"12\",\"13\",\"14\",\"15\",\"16\"]},\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[\"_old_input\",\"errors\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"_old_input\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"_method\":\"POST\",\"role_name\":\"Manager 2\",\"allProduct\":\"on\",\"product\":[\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"allProduct_type\":\"on\",\"product_type\":[\"11\",\"12\",\"13\",\"14\",\"15\",\"16\"]},\"errors\":{},\"PHPDEBUGBAR_STACK_DATA\":{\"X4b3e6354d4fdc10a9f838b45b9ea7b2c\":null}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"duration\":911,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:30'),
(424, '94c81914-1d78-437d-8763-5c638a2ed798', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.85\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:31'),
(425, '94c81914-2053-4fed-9633-6c7532666171', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:31'),
(426, '94c81914-22b1-42d0-877e-1c8d6f90b861', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.91\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(427, '94c81914-25e3-483e-bf95-e475943d2f12', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.11\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(428, '94c81914-2761-42d6-a3e2-fd44a117aa28', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(429, '94c81914-27e5-4c76-beeb-a42643354428', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(430, '94c81914-2ac0-406e-ba61-7fe25375625c', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(431, '94c81914-2cc0-46b2-a731-822098c5ae17', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(432, '94c81914-2e81-4b09-978c-f14f14031531', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(433, '94c81914-329c-49af-96e1-e03082788ac2', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(434, '94c81914-3499-41f3-b2ae-7f1f54f46451', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(435, '94c81914-35f2-4849-88af-bac2c77c5d29', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(436, '94c81914-393c-460d-8ba1-8cb72eb9074c', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(437, '94c81914-3c3a-483f-ab41-8b9c0ab1dc14', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(438, '94c81914-420f-405c-9575-5d1ee6157e93', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.03\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(439, '94c81914-43ed-4b78-9779-5a492606b9cd', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(440, '94c81914-44f2-4e59-bf77-e27744b1cdc1', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(441, '94c81914-47af-4906-9eb6-16ab4653fc2a', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(442, '94c81914-482f-4bfb-a45f-b7259d76c2ab', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(443, '94c81914-48e2-477c-af8a-1af8b740b6c9', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(444, '94c81914-49e5-4111-9a22-eaa521118291', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(445, '94c81914-5000-4be5-acdd-85fcceae1015', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'debugbar', '{\"requestId\":\"X64b2d2731f06c06062dce65395d47c1a\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:31');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(446, '94c81914-585a-425f-9599-ee3daecd367f', '94c81914-58fa-40e0-9eec-b9398709d597', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IlJaWE54Sjh0UVN5U2ozOUROczBQZVE9PSIsInZhbHVlIjoiVWptYWxIaWpBOGo1bzVORXp4L0lWaXNiZHBRcVcwTTdHdHN1SXlVaklaL3ZSclpob3BzNXJaS2swV0ZYSDAzUkNVYzZzdU8wNzNhYnZlb0x3YmpMdnZqUDM3UXRVNW9JU3R0WUxPVUYya3MrRk1acWZheU5YRW15RVovblRtQ3EiLCJtYWMiOiIwODIyYjFjNGM0NzZmNzg2NzI3NWJhYzhhOGU2ZWJkMjAzODY0OTkzNjE5NDFjYWFkYzQ0OTkwYzA2YTBjY2U0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InJ2R0hkODNqbEYrN1Bvd0RBWURlTmc9PSIsInZhbHVlIjoiT0pOV0RhVTRjSS9ncGpFS0ZYTzl6eFV2U1dvblpyS2ROd1U2cDRCMDRDZkdWcTZ3NFRmQy9aY0dZeDI3bjh3Y0F2QjkwYnQxYmZLcDNYTTJUcnBWMXVRTm45ZTdNQ2Q5WlM1a1A3UXI5Mnd4diszTWVzN1A3bHJyUWl0ZXJDNGMiLCJtYWMiOiJmOTBkMmUzYWRiZTYwMDhmZmI3NzZmMDY3NTg3YjZhZWY2MTRlZTk5NGNhZGJhMzg0MGM5NjM3ZGQ2M2ZkOTJhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":541,\"memory\":2,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:31'),
(447, '94c81924-d233-4a33-8d84-bf6ff16ebb22', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"2.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:42'),
(448, '94c81924-d641-45a9-837e-3326f6e35d4c', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:42'),
(449, '94c81924-d963-4296-bf05-a92873528c76', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(450, '94c81924-e081-4718-89c6-9ca12c88fefe', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.23\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(451, '94c81924-e34d-479b-a391-32dcffcfd8de', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.87\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(452, '94c81924-e830-40fa-8c37-a8498b3bea3f', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(453, '94c81924-eb53-4765-9723-8cc1b6261969', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"3.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(454, '94c81924-eda1-4c74-af85-e9fef3d569e0', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":5,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(455, '94c81924-ee98-456c-9f02-306fcbb45a79', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5)\",\"time\":\"1.00\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"2bf4bd20a576255b82f9c3d96282e23e\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(456, '94c81924-efee-4d47-9aeb-aa792f843065', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":66,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(457, '94c81924-f4a7-47f7-9496-a1bcd64c8806', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(458, '94c81924-f52e-47dc-a3ba-ec0fbccc4f07', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(459, '94c81924-f7a9-4aa1-9be3-a52bd697c6df', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(460, '94c81924-f89d-4cd4-8977-7805bff6b9db', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(461, '94c81924-fa72-4ffc-80c1-1f7791bd4d3c', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(462, '94c81924-fc9e-4402-b2f7-e3d30aaafaf1', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(463, '94c81924-ff20-43e7-8847-cbbc09c8fb74', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(464, '94c81925-0176-40e6-8f57-f050df610a41', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(465, '94c81925-02e4-4583-ac9b-9cd718dffe2b', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(466, '94c81925-0368-4868-bc82-cd35ba9df60c', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(467, '94c81925-04a3-4d48-a745-a463da149b3f', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(468, '94c81925-0567-4d5d-964e-fa8dd9484688', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(469, '94c81925-0686-40d0-bb32-411b76e46659', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(470, '94c81925-077c-4fc7-8097-322bd507b122', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(471, '94c81925-0e94-49ac-96d1-c72e40550a53', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'debugbar', '{\"requestId\":\"Xaec420da0a78662e965aa1336719dce9\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:42'),
(472, '94c81925-16f5-4469-b004-91452e4e7a68', '94c81925-1814-4d2a-bad3-29db401b1e8e', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImdvdUNmRU4zekVxSDBzRFRxLzdFRlE9PSIsInZhbHVlIjoiWDZCM0J4VDJTVFJvS0QrV1dDU09oQms1OHlFYUpXQ2JkYm40V05CWEVvMDBaZnZqUjZBS1QrVUVRNzBpRTdpRm9jZzY3RytwYkVLNGV5RGREdmdiK2NZWUVmOTFYSnZSSDlpQmc1N1owYkZXOWVtYkpnRTRjTjVKeDVsY0tEcG0iLCJtYWMiOiJhZTllMWI3NDZmNGZjZjJkNmZmNzlkNWZjNTBkNjRhODRmYzI4YTM2NGY3Zjg3MDFkYzIwNjE4NmU5ZDI4MTRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Imx6Z3hMSFE3VnRsSWhzVEVyQU5lTnc9PSIsInZhbHVlIjoiZFVNSnhVMG1hNTZad3JrbXVPOVNPQWdTa3RhbTBpWm9yd2Frb2dIcTZ1R1pzQjNXUWh3Y1hsMzFGRnBMaUhzeFQzYkQ0UnNKMERwenhZVnlHbWU5NkZiVjZOL2ZqM2xIbldQelc3OXFMc3N4aHJvc0xIQ0JoNDFUOWVjVEVqbm4iLCJtYWMiOiI2YTgxY2M0NmJmNzA2ZTJmODEwZDZiOTZiMmE1OTk3YWQyNzRkMDg5YzBjMjEzNjVmNzBiOGViYTQ3ZDYxNzc3IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":528,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:42'),
(473, '94c8192b-a3d8-45ac-a2b3-0f411b1b0ea8', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:46'),
(474, '94c8192b-a757-4af9-bc3f-bfd6756fe1a7', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:46'),
(475, '94c8192b-aaec-490d-b843-501d0f6278ef', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.20\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(476, '94c8192b-ad56-4298-962e-073c62bf9620', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"1.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(477, '94c8192b-afbc-43ee-8137-e96ca96362b0', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(478, '94c8192b-b065-414d-a1a4-27d3aff34160', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(479, '94c8192b-b260-4fff-8529-a9d9350947b2', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(480, '94c8192b-b464-4de1-beaf-67ba3a96ceb7', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(481, '94c8192b-b715-4332-9999-e9c186f2be77', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(482, '94c8192b-b9c6-414b-8252-336c23a2b801', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(483, '94c8192b-bc99-40c7-99df-9efbcbc8310b', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(484, '94c8192b-bd4b-449d-b92f-3e284f64ae87', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(485, '94c8192b-bf8f-4346-a3a4-f1c3a1a3b5ad', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"2.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(486, '94c8192b-c136-421e-8506-989528a1f41f', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(487, '94c8192b-c642-48c6-bf90-7bdf4003a907', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(488, '94c8192b-c784-4ecc-b310-725350f27cca', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(489, '94c8192b-c83d-4a8f-b5ff-43732c25b4ac', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(490, '94c8192b-cac4-4a26-9e4a-042b67689744', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(491, '94c8192b-cb2a-4096-9562-871c524adb43', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(492, '94c8192b-cc48-4c3e-b452-e9793fb54c35', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(493, '94c8192b-cd36-4d29-9f7a-99520c8f8d06', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(494, '94c8192b-d4cc-49bc-b8b6-52ed133dcf7f', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'debugbar', '{\"requestId\":\"X11a85588f9fe2a517c5ae325a6609271\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:42:46'),
(495, '94c8192b-dcbb-494d-9f37-42999108cb37', '94c8192b-ddb9-47a2-ad0a-9d11a97c9166', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IjZhL0pScmVtdXlyMTFMVDRjVU1FN2c9PSIsInZhbHVlIjoiL2tObmV4ZlJVWmg2QndLL0I1a3FadDNvQjdFclIrVWZUNjFUUisrNjR5MnpLbTV4N0JwSVBvZklZVkFQVmtoVHp3dUFVVzFxcmJqcGV0Z0kxTTA5SFhwc1FUQ2RZNmVyYjlueUQ3L2kzbUViQmlvQ3NYOHZtWTJ6KzZtTnlnL20iLCJtYWMiOiJiNTJjNTk2OWFkZDFlYTIzMjY4YzY2YWRmY2M0ZWVhZDFiMjI2ZGZiNmM3MGVmNDVlYjcxODdjNzZhM2IxM2JmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkVvZ0dlbm5VMWVkUStJYUdlYW41amc9PSIsInZhbHVlIjoiaTVsSU1aZlFQTXh2cU1RNFRaUHhuTHpsMVhsNkFOM1d1N1UzQXd5a0t3L0o2THRuWFo3NHpLa2lueG1RR2t2TmgxQjI4NzA2d1RVNXk3aDZCemRNWjd1TFFtMmt4S1dIckhVeStpR2ZWQmwrTFRlN0s0bmFZN1pVWkU5U2VRczciLCJtYWMiOiJmZjMwNGM5MzIwNmM0NDA3Yzc2NzZmMjUxN2EzOThlNDFlM2JkZWFhNzMwODhkZWRjYTFkYTViNTQ0YTcxNTNmIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":563,\"memory\":2,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:42:46'),
(496, '94c81980-2cd8-43c8-b25f-071beb2df4b8', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"3.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:43:42'),
(497, '94c81980-30a6-41a6-93a7-f6306b6514c2', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:43:42');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(498, '94c81980-32a3-4917-9210-ca098f11c25f', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(499, '94c81980-35b1-4b8f-800d-a59889901cbd', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"2.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(500, '94c81980-37bf-4849-96bc-930126af7cf4', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(501, '94c81980-386b-43bc-9e95-d86c877c81bf', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(502, '94c81980-3b51-4c16-9501-2ceb6ef7d2f3', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"1.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(503, '94c81980-3e8e-4f02-b6d0-6ca3f21e8b04', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(504, '94c81980-4076-4303-b23a-428b2b99b2d3', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(505, '94c81980-4424-4041-bc00-c7afcad8d8e1', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(506, '94c81980-494e-4a1c-825c-835b99a4dc10', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(507, '94c81980-4a45-4924-8caa-89e57909d40a', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(508, '94c81980-4c94-40e7-88f3-9108840ee100', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(509, '94c81980-4e5a-4084-8066-0d8a7c14863b', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(510, '94c81980-532d-4559-b90a-23b1839a6b01', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"2.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(511, '94c81980-54a8-4a7d-8543-c4de3c9efd02', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(512, '94c81980-55a0-4ea5-b300-3eb70421608c', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(513, '94c81980-586b-45dd-836e-c2f1e8305db1', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(514, '94c81980-591b-4c04-9471-66fed4923150', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(515, '94c81980-59ab-407e-ada3-4a834f4b4cef', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(516, '94c81980-5a66-48cd-91b1-6b5ba0b9152c', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(517, '94c81980-5f9d-469f-a026-6c44a80223f0', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'debugbar', '{\"requestId\":\"Xe35a8b0d39a3c6f8382c52fcc94cd0ae\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:43:42'),
(518, '94c81980-6506-4bd9-81a3-bb6854586287', '94c81980-659f-4bbe-8b0f-335d7eb014d2', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"pragma\":\"no-cache\",\"cache-control\":\"no-cache\",\"dnt\":\"1\",\"upgrade-insecure-requests\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImxaYU03azgxZ3pURytTY2ZzUmEycnc9PSIsInZhbHVlIjoibWc5UTBmL2NQb2NpeExXMm8vZzZOMmRrL0hpVDlzLzBZYy92V2E3NTZTYXd1ZTFaQkt0UURBQ3dWMUQ5L1h0dkhKQ1U5THBnQ0hDc1M4RzNONVcrV0M2c2doYm11ZXNlelQ4N3pnR1RuMHF1cnZ1K3RScGRkZ2kwM05oUVN4VU4iLCJtYWMiOiI2ZDNkNzdlMTViOTVhNmU0YzU4ZWNjMWI0ODVjZGE1MGI5NjlmYzFmOWUxYjJmNTBlZjRkNTI5YWQ5Y2ZkM2I4IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InpTYTJPQWdFM2hBUGVrSzFwUnBobWc9PSIsInZhbHVlIjoic3pHUnNpa0t5a1Q4cVNRZnRMa3V4b1dmVmkzUUVtU3BQU1hoYXFNWklYNldocCt4NmxtU3RyV3NXRmdNVmRUalhqbzR2TWU5ZG5NQzBzSEJhMTBzSUVZczVQQ1drU2RSc0FSY1pMdHg4K2lnMk1remhWQVc4NGxZc1lENXRiU1QiLCJtYWMiOiJhMTE4MDU1NDZmZDk3YWNiNDkyY2E5ODgxYjgzNTM4NDhlZWFmMjYzMDNiYTRhM2E2YTJlM2NkMzM2YTIyNzM4IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":445,\"memory\":2,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:43:42'),
(519, '94c819a0-7749-40f7-8d90-8b5931fb9f77', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:03'),
(520, '94c819a0-7e63-4272-bf32-09299b535dd7', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:03'),
(521, '94c819a0-9878-4510-b484-3c04d3179df9', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.01\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":68,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(522, '94c819a0-9a6b-4ebd-8993-da06245c8750', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'manager_2\' and `guard_name` = \'web\' limit 1\",\"time\":\"0.97\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":68,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(523, '94c819a0-9d9d-40ae-954b-051760b1734f', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'manager_2\', \'web\', \'2021-11-02 22:44:03\', \'2021-11-02 22:44:03\')\",\"time\":\"1.09\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":68,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(524, '94c819a0-a072-4e5d-9e9e-b02aafce1959', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role:6\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(525, '94c819a0-a2fc-403e-a350-9acfad676d47', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(526, '94c819a0-a595-4d2c-a0f2-2b560313acc0', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"spatie.permission.cache\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(527, '94c819a0-a6dd-43c7-980d-d123ea29bfe7', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id`, `id` as `i`, `name` as `n`, `guard_name` as `g` from `permissions`\",\"time\":\"2.07\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f00c448e1b2d5bd728c40af4e6c25bec\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(528, '94c819a0-a93c-44a6-9000-e155cb11250a', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":64,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(529, '94c819a0-ad0a-4c86-8010-423f177cf107', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.`id`, `roles`.`id` as `i`, `roles`.`name` as `n`, `roles`.`guard_name` as `g`, `role_has_permissions`.`permission_id` as `pivot_permission_id`, `role_has_permissions`.`role_id` as `pivot_role_id` from `roles` inner join `role_has_permissions` on `roles`.`id` = `role_has_permissions`.`role_id` where `role_has_permissions`.`permission_id` in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28)\",\"time\":\"2.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"df06e1a68738e18e21accbf39bc302c5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(530, '94c819a0-aeb2-4936-b229-d626fcad5cee', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":69,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(531, '94c819a0-bad2-4348-ab82-3de70cf3907e', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"spatie.permission.cache\",\"value\":[{\"i\":4,\"n\":\"dashboard.report.damage\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":2,\"n\":\"dashboard.report.expense\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":3,\"n\":\"dashboard.report.purchase\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":1,\"n\":\"dashboard.report.sale\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":12,\"n\":\"product_type.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":16,\"n\":\"product_type.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":14,\"n\":\"product_type.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":11,\"n\":\"product_type.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":13,\"n\":\"product_type.store\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":15,\"n\":\"product_type.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":6,\"n\":\"product.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":10,\"n\":\"product.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":8,\"n\":\"product.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":5,\"n\":\"product.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":7,\"n\":\"product.store\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":9,\"n\":\"product.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":18,\"n\":\"settings.administration.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":22,\"n\":\"settings.administration.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":20,\"n\":\"settings.administration.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":17,\"n\":\"settings.administration.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":19,\"n\":\"settings.administration.show\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":21,\"n\":\"settings.administration.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":24,\"n\":\"settings.group_permission.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":28,\"n\":\"settings.group_permission.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":26,\"n\":\"settings.group_permission.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":23,\"n\":\"settings.group_permission.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":25,\"n\":\"settings.group_permission.show\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":27,\"n\":\"settings.group_permission.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]}],\"expiration\":86400,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(532, '94c819a0-bdaa-456a-9365-6b5e623d22c5', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `role_has_permissions` where `role_has_permissions`.`role_id` = 6\",\"time\":\"0.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"390f45ddac0b5e4537b46aae9ace1bba\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(533, '94c819a0-bf3b-45e6-8ea5-924cb439b495', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (3, 6)\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(534, '94c819a0-c0eb-4896-955a-35605104dd5d', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (4, 6)\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(535, '94c819a0-c30d-4e6a-b863-57f622006d3d', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (17, 6)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(536, '94c819a0-c514-4665-8e6a-af2cc013aeda', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (18, 6)\",\"time\":\"0.40\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(537, '94c819a0-c6c8-4094-b9d6-9ef8401bf88d', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (19, 6)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(538, '94c819a0-cac1-44e9-977c-d7508403ee08', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (20, 6)\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(539, '94c819a0-cc74-46bd-bb01-99624574edde', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (21, 6)\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(540, '94c819a0-cf39-4a42-a4c6-a7880fd3200a', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (22, 6)\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(541, '94c819a0-d192-4081-9afd-0c08ca08becd', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (6)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":71,\"hash\":\"7d61940452bfb9ecf5b5b39087ca2cc0\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(542, '94c819a0-d426-4aa3-8f6d-69ec6667bf77', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'cache', '{\"type\":\"forget\",\"key\":\"spatie.permission.cache\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(543, '94c819a0-eba7-408d-8cbc-b799b7bbbe99', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'debugbar', '{\"requestId\":\"Xab83039fdc7768ce22c92db4b7d95f17\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:03'),
(544, '94c819a0-ee0a-483f-8a16-844ad72ec7fc', '94c819a0-eedf-4679-9b3c-cf70635a9487', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/store\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@store\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"content-length\":\"281\",\"cache-control\":\"max-age=0\",\"origin\":\"http:\\/\\/nabik.test\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkI0UjhZdE1ZTE9LaHQwSnNkVFJCcEE9PSIsInZhbHVlIjoiY2IybEd4TGF5UVlhTkFTc3AyaUVOOXd3WGlZSWliS3JPYVQ1MFRrZjd4bndNOXhhSUtKSFAyUmpZTnI2WXBSOE1TeGV5L3o0NGYyZFBGWjRWdlhnMjg2QnlqbERkRHh0V2Mzem8ycW5LTTFUS2p1ZFFlT2tLaUxJNW5tSmVTa0kiLCJtYWMiOiJiZDBlYTM2NzM0ZDQ2MTFjNzFjYzFjMTU0OWVlOGZjMWYzN2NkNWEyMTZhNDQ3MWE2N2YwZjEwMGY3YTYxMDE2IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImpUc3JhS2pjcENzZytrV3BRY25DR2c9PSIsInZhbHVlIjoiK28vYi9ZaGtyN1BIdmhLUFgwUFNrby8rcTlXbGpObGpuRHl6aU83R3BLUGpTeEVtNzZPUXZ3RnJpSFB3WFFKQmhGOGxwYmEzS2kwU3RHUlRSZVNYTHBoL081TExrR0RwM1B1aVhJZEU1dHhBNmJ1R1NrN2pYZVYxK2x5UXJtcjAiLCJtYWMiOiJkYjIzMzQ5NWMwOWRjYjljM2IyODA0MzY4YWY2ZWFhNWEyOGQzZTgwYzc5ZTI4NGEyZGYwOWI3ZWNkNTNjNDU2IiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"_method\":\"POST\",\"role_name\":\"manager_2\",\"dashboard\":[\"3\",\"4\"],\"allAdministration\":\"on\",\"administration\":[\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]},\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[\"alert-type\",\"message\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"alert-type\":\"success_toast\",\"message\":\"Role Created Successfully!\",\"PHPDEBUGBAR_STACK_DATA\":{\"Xab83039fdc7768ce22c92db4b7d95f17\":null}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"duration\":903,\"memory\":12,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(545, '94c819a1-8d9b-4e9c-a48c-cd358af52a90', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:03'),
(546, '94c819a1-9187-47d7-bdb3-a353b73155e6', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:03'),
(547, '94c819a1-947d-47ac-ae4a-54408fb1955a', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(548, '94c819a1-970c-43f8-bc95-6a3d5885a91c', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"1.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":40,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(549, '94c819a1-9906-4d11-bb51-e60511661fe1', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":28,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(550, '94c819a1-99d7-44eb-a4d2-f7833e8bd4db', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.65\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":41,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(551, '94c819a1-9c6a-4df4-adea-d7496a188604', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":42,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(552, '94c819a1-9e6a-4fe4-854e-f8b1848f9a29', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":43,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(553, '94c819a1-a075-4a9c-95a0-8c7cd0b53ead', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":44,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(554, '94c819a1-a3c8-40eb-8fe2-14ba59222f04', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.create\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(555, '94c819a1-a6b5-4f8c-888d-6f2bb762ecde', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(556, '94c819a1-a7ae-40f1-9e7a-e133bde4bf1d', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(557, '94c819a1-a98c-420f-a9f6-1c46ba4719a5', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"0.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(558, '94c819a1-ab8e-419f-83a4-878e1006be9e', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(559, '94c819a1-afef-4f48-a8c8-7eb876aadf30', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(560, '94c819a1-b157-4f57-90ba-2b6186e48e59', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(561, '94c819a1-b2af-4dda-a7dc-b30f2ecf6a52', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(562, '94c819a1-b5f6-4da2-9fdf-9f772ee55530', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(563, '94c819a1-b675-4376-9fc6-38dca85690cc', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(564, '94c819a1-b713-46b3-80cd-929b9ea62037', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(565, '94c819a1-b7fb-41d8-af4c-8f32df916e6c', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productTypePermissions\",\"productPermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:03'),
(566, '94c819a1-bedb-4a09-a56c-dce821e4e968', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'debugbar', '{\"requestId\":\"Xaad2810587d5895499584a0db7dab78f\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:04'),
(567, '94c819a1-c57e-48f4-8d61-68c200ce70f3', '94c819a1-c656-447e-9466-bfb50bfd7760', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@create\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InQxdXdUdUZIMUVTYWtLSjNlWGRzTVE9PSIsInZhbHVlIjoiTzFVOGlPQVU5dTZUK1h2YjI1T2h1UWhZS3QzZHpvNTBEcnBBMjhCUjQzZG1uQ3k4T3RIUVdJaGlWRE5qUExMdG9xL05wZUw2aDRTNkZLcFd4dlFld1RTYXo2M3BnVHNtZVVsck9ubzB1WUMyQndQY2xaQis4UTAxL3V6Tk5oZjQiLCJtYWMiOiJlMjQ5ZDcyYmJhMDU0MDI1ZjBiNDM5NzVlYTVlMTM0ZjNlMWNjNThjYjE5MzRlZDJjMTUzODRiMGIzNTEyN2JmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkRCbmdqZHFHRlRIMHhOWHdvNndSdkE9PSIsInZhbHVlIjoiTnd0ZzRJdkxMSjB2OU5WS2xRYmpscmRWWk51WVVVNUdadU5CaldRRUVNcXlvZFBkOVd5Qjd6VGFpMHpMZXVCdSs4MnJhU1YzSmVCWE54M3NXcHpUQ2xXaXFubm8yZFYvbGtwVFBTbGE3NVVDcE91NCttM1N4OWlpb2JQdkhHYVMiLCJtYWMiOiI2NzA1NmRkZmE5ZGNlY2RjZDI2MzVlMmYyMzllNjBiNGI5OTE2MjIxMjFhNjA3ZGNjMTE0NWQ3NGIyMDU2YTViIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/create.blade.php\",\"data\":{\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":520,\"memory\":8,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:04'),
(568, '94c819a7-b2e1-4820-bac8-1719144fc176', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"3.12\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:07'),
(569, '94c819a7-b70a-47ed-9b5f-34e29fbc56ce', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:07'),
(570, '94c819a7-b95a-4ba6-9582-1bef74beeeba', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(571, '94c819a7-c154-4e0a-856f-6803634596af', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"0.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(572, '94c819a7-c453-4cc5-9638-d6b45f03aad0', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(573, '94c819a7-c815-452c-8703-053aa433689b', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"2.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(574, '94c819a7-cb1b-470b-b3ac-865118da8e50', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"3.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(575, '94c819a7-cd3e-49f4-b780-5ffccf4e1872', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(576, '94c819a7-cecd-45ee-8a64-29ccf8ce908d', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5, 6)\",\"time\":\"1.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"3af7c1c24d725c53267c2a1e2420c6c3\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(577, '94c819a7-d02f-4d3c-b15b-bda66d81ae3c', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":74,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(578, '94c819a7-d3b4-4a79-806d-a4222d7408dc', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(579, '94c819a7-d46e-4cbe-a203-1631c8703003', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:07'),
(580, '94c819a7-d742-44f8-8d5d-8cb3f9614a24', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(581, '94c819a7-d7e8-4884-9e8a-f513416658da', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(582, '94c819a7-d8f0-40a4-a95f-c0775641f142', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(583, '94c819a7-db46-4969-85bb-f4b08ca4750e', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"1.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(584, '94c819a7-dcee-4bae-a91e-66d2ce941560', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(585, '94c819a7-de67-49aa-b6fd-9e8642abdbc2', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"1.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(586, '94c819a7-e021-4d79-b272-5995474bd84f', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(587, '94c819a7-e0c9-42c4-848c-91fb9d114e3a', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(588, '94c819a7-e208-4f9c-980d-a5d511c0b91a', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(589, '94c819a7-e28f-4786-9f8a-d9808df65c57', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(590, '94c819a7-e342-4cc0-bdaa-6c43accdb63b', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(591, '94c819a7-e3eb-4a6f-95a4-0d4d31c49480', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(592, '94c819a7-ea05-46fb-b621-a65f01ba9659', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'debugbar', '{\"requestId\":\"Xd1cb43a5d87d9fcda2c56fd1231bb291\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:08'),
(593, '94c819a7-ee1a-409b-9fa4-00ac41a81400', '94c819a7-eeb1-4571-ac8c-93ee4f90ecbb', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/add\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InFOMHBtNi8zdmtQMTJyYVl1STlTdFE9PSIsInZhbHVlIjoia2ZOQXRQNldqNUxobW9vU2tGSkZqQnExZGtGai95RFFBdy81ZGltcjNvR1NIUXh5WS9CVUFBR1owL2ZRc2V1SHQ2MHYydUVTbTNBRjBJR3pSNTJGK3RlQk40d1ZpaXB1RlNqS0hzVUtkTmphbU02RTZoQVowMkkvRjNkclJSZk4iLCJtYWMiOiI4ZGY5MDgzMTI2Yzg4MDNkNjAzMjJlM2U3ZjM5YWJmMzJjMGRkYjg0NWJjMTI3MjUxYjYzOTllZTBlNWE2MTEyIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkorMElRcDd4ZXpRVTZsd014ZDJkbGc9PSIsInZhbHVlIjoiaE9FaXBtT0IyOERNMDdjRytpT2o3bkdVRGNIZWVZY3AyM2J3b2dEQzFHcU0ra1A5K2RBV2tRRjJLb2o4eGltRTVrbW84MXRtZUx3UHZQaGk2Sy92L2xMUlppK2VITkpsaTZYajNtTEw0SmtEOFpqT0M5ZWhTVHM3RnFpdEE1STQiLCJtYWMiOiI0OTZkMWJkMTE1ODg5NmMxNDI2OTdlYzQxMzFlMWZjMjkzM2NkNmQzYmQ1NzQwMjMxNGY2ZGVlOGExMzRkZGJlIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":488,\"memory\":8,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:08'),
(594, '94c819b9-2011-49cc-99ff-59fa9c15ca60', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:19'),
(595, '94c819b9-29a6-4844-893f-29264de2ceed', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:19'),
(596, '94c819b9-2da5-4739-9eea-4710883272ff', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(597, '94c819b9-3006-4066-a4b1-227cd2b90567', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 6 and `guard_name` = \'web\' limit 1\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(598, '94c819b9-326f-42ab-aed7-33000cf7f0f9', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(599, '94c819b9-33cc-4e8c-81f1-e2cb4809de6e', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.27\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(600, '94c819b9-36dc-4fdf-b504-38f4e25cf8a2', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"0.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(601, '94c819b9-3943-4cc8-8cd4-54c8763138f9', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":204,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(602, '94c819b9-3a13-4b69-baaa-d6aa63a79ebc', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":98,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(603, '94c819b9-3d77-4df6-95a7-85873ecfdadf', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":99,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(604, '94c819b9-40eb-4b9a-8f38-b6e02c9be4f4', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":100,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(605, '94c819b9-43c7-4f75-9bb3-e6eb805d3d93', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":101,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(606, '94c819b9-49be-46b7-9fb7-3adf74b86f94', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(607, '94c819b9-51a5-4a73-8dec-c02422667d98', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 6\",\"time\":\"0.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(608, '94c819b9-560e-4664-87b7-768c33819b4d', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(609, '94c819b9-5a26-466a-a89b-4778256f4b3f', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(610, '94c819b9-5cf7-4f87-8ca8-6b0bf1ea1753', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(611, '94c819b9-615e-464f-8a4d-b07f02935206', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(612, '94c819b9-6472-4a5c-8d02-f675eae0c129', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(613, '94c819b9-67a4-42ae-8fe8-def6b719d566', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(614, '94c819b9-6dc3-4b91-bba8-fd066003915d', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(615, '94c819b9-6eaf-445d-91dd-18cc40ef0992', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(616, '94c819b9-7044-4b2d-b80d-d0bd8744fa9b', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(617, '94c819b9-742d-41c8-be81-59f17cc4575d', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(618, '94c819b9-7a58-4d4c-8660-33d2db3e5619', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(619, '94c819b9-7c0e-4231-898b-c39c23b7940f', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(620, '94c819b9-7ced-4208-aeec-6f8f301b3c2a', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(621, '94c819b9-8078-435e-bdf3-732769c03eec', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(622, '94c819b9-80ff-4ede-a90b-51bb6709ae06', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(623, '94c819b9-81d0-4964-988a-7444107b03ed', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(624, '94c819b9-82ac-4ed8-be8c-e563f3232e88', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(625, '94c819b9-8a0b-4c2a-b5a8-4f176f58be2f', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'debugbar', '{\"requestId\":\"X2b75bf62c28ab37cf27a7b615775cd5a\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:19'),
(626, '94c819b9-9dfc-40af-b7ed-69df3124d4a0', '94c819b9-9ebb-41e6-a216-c1d370561daf', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImhFZ0ZPcjJaUTZ1VDFqS3hGYjVyQmc9PSIsInZhbHVlIjoiN2s5dERlTFNiY2RHWTlOUlRzWUovOEZ4Wk55VEdJalpWQlZqMzl6UDdvd0FEZ0FwZ21kSCtrZWhxNWVJRkMwSjZyQjh5dVpYWHRuTEw0Q2prajRVWG5adk1ZOTZXWmlYc00yYjl0bEFSdVVjaDB6M0lPNFdhZGxadktUTHhNeGYiLCJtYWMiOiJlZTRlYTI4MWMyZjU1ZGQyN2YwYmMzNzgxYzU5YWZlODQwNWRiYTRiZjVhNWVmZGZmMzJjMDNlZWVmOGEwY2RiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImJwT3BOTlE4dEF0K0FiZFFQUHMwN1E9PSIsInZhbHVlIjoiWGw2Y0tEb1dEcFgyUXVPMVY4enllamFGamdEY3I4SlM0eENFYzljVHJka1hxWFl0aWU3L29MM2x1Yjl5bTZzZmlmZ2wxa0JGRTNFSmJNRTRYTVdsc3I4N29JUGVvYW9RMEthZ0szNjdIUlorTnRzQ2xkODkzTTRkU1V2elFWaXMiLCJtYWMiOiIwZDE0MWNmNjExMzRiMzQ2NDZhZGYxMDkyY2NiNzlhN2U5MWY3MWI1NjRmNDEyYWU4ODVhODRiYzY2NmViOTFhIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:6\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":700,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:19'),
(627, '94c819c2-3e8b-45c6-8d5e-014067600332', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:25'),
(628, '94c819c2-430c-41d9-a71a-933f93330e27', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:25'),
(629, '94c819c2-4c65-432a-8bcc-c1bd786ada44', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.16\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":117,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(630, '94c819c2-4f7b-4f78-9966-11e3e348d28e', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 6 and `guard_name` = \'web\' limit 1\",\"time\":\"2.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":117,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(631, '94c819c2-5148-4ad2-b2f7-1aa9e2a2ee03', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":70,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(632, '94c819c2-57e1-4ad0-a966-945f1d602023', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(633, '94c819c2-66af-4bb4-aee7-b757ecbf466a', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `role_has_permissions` where `role_has_permissions`.`role_id` = 6\",\"time\":\"24.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"8766f2d178fe13af72604c4a29807ba7\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(634, '94c819c2-6ab5-485a-ac11-979dd6c5fe77', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"spatie.permission.cache\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(635, '94c819c2-6c69-4158-943f-f0fe8f6d90bd', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id`, `id` as `i`, `name` as `n`, `guard_name` as `g` from `permissions`\",\"time\":\"1.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f00c448e1b2d5bd728c40af4e6c25bec\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(636, '94c819c2-6ed9-497d-b8c7-60371efa4ad8', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":62,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(637, '94c819c2-70c1-489f-bd12-e9e7980e8ccf', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.`id`, `roles`.`id` as `i`, `roles`.`name` as `n`, `roles`.`guard_name` as `g`, `role_has_permissions`.`permission_id` as `pivot_permission_id`, `role_has_permissions`.`role_id` as `pivot_role_id` from `roles` inner join `role_has_permissions` on `roles`.`id` = `role_has_permissions`.`role_id` where `role_has_permissions`.`permission_id` in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28)\",\"time\":\"0.85\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"df06e1a68738e18e21accbf39bc302c5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(638, '94c819c2-78e7-4805-99dc-6278ef2fb5a3', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'cache', '{\"type\":\"set\",\"key\":\"spatie.permission.cache\",\"value\":[{\"i\":4,\"n\":\"dashboard.report.damage\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":2,\"n\":\"dashboard.report.expense\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":3,\"n\":\"dashboard.report.purchase\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":1,\"n\":\"dashboard.report.sale\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":12,\"n\":\"product_type.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":16,\"n\":\"product_type.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":14,\"n\":\"product_type.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":11,\"n\":\"product_type.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":13,\"n\":\"product_type.store\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":15,\"n\":\"product_type.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":6,\"n\":\"product.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":10,\"n\":\"product.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":8,\"n\":\"product.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":5,\"n\":\"product.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":7,\"n\":\"product.store\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":9,\"n\":\"product.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":18,\"n\":\"settings.administration.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":22,\"n\":\"settings.administration.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":20,\"n\":\"settings.administration.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":17,\"n\":\"settings.administration.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":19,\"n\":\"settings.administration.show\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":21,\"n\":\"settings.administration.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":3,\"n\":\"manager\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":24,\"n\":\"settings.group_permission.create\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":28,\"n\":\"settings.group_permission.delete\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":26,\"n\":\"settings.group_permission.edit\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":23,\"n\":\"settings.group_permission.index\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":25,\"n\":\"settings.group_permission.show\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]},{\"i\":27,\"n\":\"settings.group_permission.update\",\"g\":\"web\",\"r\":[{\"i\":2,\"n\":\"admin\",\"g\":\"web\"},{\"i\":1,\"n\":\"super_admin\",\"g\":\"web\"}]}],\"expiration\":86400,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(639, '94c819c2-7c26-4acf-94c8-35175a483f6e', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `role_has_permissions` where `role_has_permissions`.`role_id` = 6\",\"time\":\"0.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"390f45ddac0b5e4537b46aae9ace1bba\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(640, '94c819c2-7efd-4c29-b125-fb02de823163', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (3, 6)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(641, '94c819c2-8200-4886-9791-3030aec5911e', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (4, 6)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(642, '94c819c2-84e0-4fb1-aa92-f1d9b6adcd04', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (17, 6)\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(643, '94c819c2-879c-4167-8d0d-ed00d505b360', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (18, 6)\",\"time\":\"0.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(644, '94c819c2-89f4-4c5a-9e41-4c2d271ff498', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (20, 6)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(645, '94c819c2-8bfb-491e-a9ed-7332c7de0332', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `role_has_permissions` (`permission_id`, `role_id`) values (21, 6)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"f3a5637a201e551009dea464949cab5c\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(646, '94c819c2-8e56-4186-a4e9-651872bc7b42', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (6)\",\"time\":\"0.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":129,\"hash\":\"7d61940452bfb9ecf5b5b39087ca2cc0\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(647, '94c819c2-9142-49a1-8794-18f8ecd5387f', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'cache', '{\"type\":\"forget\",\"key\":\"spatie.permission.cache\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(648, '94c819c2-b0e6-4b16-9662-cd9fced56d6f', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'debugbar', '{\"requestId\":\"X19e96b27d33935f3130637b39f0feccf\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:25'),
(649, '94c819c2-b2ca-4ed8-9110-3ccaebeb8d5d', '94c819c2-b3b0-4431-b10b-129d6d7d9531', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/update\\/6\",\"method\":\"PATCH\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@update\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"content-length\":\"213\",\"cache-control\":\"max-age=0\",\"origin\":\"http:\\/\\/nabik.test\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6IjJSUUNLRWZjYXBOVnlMWVQ5WXNwTnc9PSIsInZhbHVlIjoiWHJ5Z1MxWVhjbWNGdzk4VGN2OTV2UGVZMDhoYjIzZmEyVlVwdlZQazJrdlpHcSsyZGY0VDU1Zk45VGZEcjNqMlA4bWgxNHhwMUswSXRuOHNJWHlzYnd0bUlxdEtWUXhJNlFKRGp0TDNvNUwvOVhBVmV2MDZUeFJFZVZHR1VzVkgiLCJtYWMiOiI4OWJjM2Q1OWRmODY2ZDhhN2EwZDVkZTNmZjMxMmRlMDRlYTZlOWNhNDQxZDZjY2Q2OGZmZmNmOTNmN2VjOGVhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Ims2UjlFK0FDZFpDbHVyWHBRV1JCbVE9PSIsInZhbHVlIjoiZVAxRXltWFpyUHV2SzlxN3pPWXA1S1o5ZmtucUVJTTU2aHE4cjNPN1ZBODFGQ1pBbW5TL0J5dEgvdXNTZHNvcXBHOU5JdDRrR2VJWURVajZKc3pNNEprR0R4Q3U2NFBnRjljVHBaaiszenloT3crZDVoZWF1L2U0eTJWdHhqTGMiLCJtYWMiOiI2ODAyZjgwMWM4NzhlZDRmZGM4ZDU4M2IwNTRjMDIyZWZkNThiNjcxYWI1NjlhMTJlNTNiM2QzMDU1NGJhNzliIiwidGFnIjoiIn0%3D\"},\"payload\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"_method\":\"PATCH\",\"role_name\":\"manager_2\",\"dashboard\":[\"3\",\"4\"],\"administration\":[\"17\",\"18\",\"20\",\"21\"]},\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\"},\"_flash\":{\"old\":[\"alert-type\",\"message\"],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"alert-type\":\"success_toast\",\"message\":\"Role Created Successfully!\",\"PHPDEBUGBAR_STACK_DATA\":{\"X19e96b27d33935f3130637b39f0feccf\":null}},\"response_status\":302,\"response\":\"Redirected to http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"duration\":802,\"memory\":4,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:25'),
(650, '94c819c3-6c2d-4b89-b8da-d0c175ab0abe', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:26'),
(651, '94c819c3-72f6-4b3d-b436-045767610736', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:26'),
(652, '94c819c3-76b6-41a4-a000-f610c550cfcc', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"0.84\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(653, '94c819c3-7944-45ff-a0d3-270ae9ec996a', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `id` = 6 and `guard_name` = \'web\' limit 1\",\"time\":\"0.65\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":96,\"hash\":\"d3cf08cbbf64e40ee623a85fdd9f2014\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(654, '94c819c3-7b4c-4c7c-a472-0bd7f7e9e92b', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(655, '94c819c3-7c45-42b7-bec3-0af5cdeadb4b', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"0.84\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(656, '94c819c3-7e85-47e2-8dff-c41636b738a3', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'dashboard\'\",\"time\":\"0.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":97,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(657, '94c819c3-7ffd-41ab-b3f6-260535cab807', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":202,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(658, '94c819c3-8091-4c8f-9cdb-4debffbdbb38', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product\'\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":98,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(659, '94c819c3-8260-47ee-81d7-e2a731becf9b', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'product_type\'\",\"time\":\"0.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":99,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(660, '94c819c3-8489-4a7e-b05e-889553ef37e8', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'administration\'\",\"time\":\"0.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":100,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(661, '94c819c3-86bd-4e46-88b8-25a976d13198', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `group_name` = \'group_permission\'\",\"time\":\"0.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController.php\",\"line\":101,\"hash\":\"f790a24eddad008bfa8b190a0fdde4a2\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(662, '94c819c3-8a42-435e-970a-bda29aa15abb', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.edit\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(663, '94c819c3-90dc-44a5-8e3e-98a78e7dec02', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` = 6\",\"time\":\"0.88\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":32,\"hash\":\"eec147138b5334a7e593e2dd4252090d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(664, '94c819c3-94ff-4e2b-9cc3-85833b96a4f7', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(665, '94c819c3-9869-477e-98a1-d5039998cbd2', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(666, '94c819c3-9bb0-40b4-aa3f-6eb3cf96ea5f', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(667, '94c819c3-9ec2-4d90-bb5e-a3599fe32b17', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(668, '94c819c3-a0eb-46ad-9828-14af7ee103ab', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(669, '94c819c3-a349-4d3b-9bb3-25f17d9d3c56', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id` from `permissions`\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Helpers\\\\GroupPermissionHelper.php\",\"line\":35,\"hash\":\"180a2e991c40b271ed49fe37fed0d6b8\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(670, '94c819c3-a775-4344-b863-46cdb4671e28', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(671, '94c819c3-a878-47f7-a030-b13638e726e1', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(672, '94c819c3-a9df-45ec-a188-1c11cd3d8dd6', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"0.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(673, '94c819c3-abfc-47cd-a2f1-58d0c798caf1', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(674, '94c819c3-b02e-4429-9d8d-6d250aafdd09', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(675, '94c819c3-b1d9-4b1f-92a7-38faff3f004d', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(676, '94c819c3-b2c2-4f1d-9f33-3967fea8ecb9', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(677, '94c819c3-b594-40e8-8210-f2c99faaee7f', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(678, '94c819c3-b62a-40f3-8921-9fa4ed8534ce', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(679, '94c819c3-b6d5-4b5a-b4e6-9c19742668b5', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(680, '94c819c3-b7cf-46e7-9e0d-021506c4cf1f', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"role\",\"dashboardPermissions\",\"administrationPermissions\",\"groupPermissions\",\"productPermissions\",\"productTypePermissions\",\"__currentLoopData\",\"dashboardPermission\",\"loop\",\"productPermission\",\"productTypePermission\",\"administrationPermission\",\"groupPermission\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(681, '94c819c3-be18-41ae-b6c2-d8881feab87d', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'debugbar', '{\"requestId\":\"Xb6566d67456ba3c05a4a416edbcf2d85\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:26'),
(682, '94c819c3-c510-4611-8535-67032cfdb7a4', '94c819c3-c66b-4267-be45-33df6be00be9', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@edit\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"cache-control\":\"max-age=0\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ino4c3QwYlBybTU1cWNNUmdRNUNJd1E9PSIsInZhbHVlIjoiV2hXMU9Hck9YcXVZRFlPbHZNM243Mkh1ZHViUGJmelg5bTVIWkhKSmFwam5COFo3KzlMVGR0Q0QrdWhUcUMwOVYwZzgrc3N4VCs1aGFKNUZ0STk2N0JwVW5HS2ZpRzhuWWtZTnU2RDRkN0tFbmkzVzU5NFNSZk5jeEdhcnJYVFkiLCJtYWMiOiJiNjQ2NGU3MDUzMjJlYjdhYWJkZmEyMDY0NGQ0ODIwODJkNDlmNGQwNWZjMGIwOWE0N2U2Y2UxZGE4YzA2YTRiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Im1VNWlTYnNJKzNwd0tFcmhQNlA0V1E9PSIsInZhbHVlIjoibEJHMU0vYVlzS0dhSEJzSDJGc3I5Tzk0eDNBZ2dYTVVXY3oyNDhyK2pGdURIQU5FWVZjdGRxZW5zZlNmemoxTlZJNkRuMkJ0aWxxcWdqWmJOU2EzNkZ3cDMrU0NWajVub3dOUFpZYU5Ga2pCQkdoc0NnLzhVaDgvZnRBWkZJTXoiLCJtYWMiOiI2MDQzMmI4MjRkNGYyYWE0OGU3ODIyYzEyYzI4MTEwMDBkOGI3NDE2YTc5Njg3YmFlZGQ5NTQ3ZjEyNmFiYzdlIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/edit.blade.php\",\"data\":{\"role\":\"Spatie\\\\Permission\\\\Models\\\\Role:6\",\"dashboardPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":1,\"name\":\"dashboard.report.sale\",\"group_name\":\"dashboard\",\"title\":\"sale report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":2,\"name\":\"dashboard.report.expense\",\"group_name\":\"dashboard\",\"title\":\"expense report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":3,\"name\":\"dashboard.report.purchase\",\"group_name\":\"dashboard\",\"title\":\"purchase report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":4,\"name\":\"dashboard.report.damage\",\"group_name\":\"dashboard\",\"title\":\"damage report\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"administrationPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":17,\"name\":\"settings.administration.index\",\"group_name\":\"administration\",\"title\":\"view administration list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":18,\"name\":\"settings.administration.create\",\"group_name\":\"administration\",\"title\":\"create administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":19,\"name\":\"settings.administration.show\",\"group_name\":\"administration\",\"title\":\"view administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":20,\"name\":\"settings.administration.edit\",\"group_name\":\"administration\",\"title\":\"edit administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":21,\"name\":\"settings.administration.update\",\"group_name\":\"administration\",\"title\":\"update administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":22,\"name\":\"settings.administration.delete\",\"group_name\":\"administration\",\"title\":\"delete administration\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"groupPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":23,\"name\":\"settings.group_permission.index\",\"group_name\":\"group_permission\",\"title\":\"view role list\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":24,\"name\":\"settings.group_permission.create\",\"group_name\":\"group_permission\",\"title\":\"create role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":25,\"name\":\"settings.group_permission.show\",\"group_name\":\"group_permission\",\"title\":\"view role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":26,\"name\":\"settings.group_permission.edit\",\"group_name\":\"group_permission\",\"title\":\"edit role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":27,\"name\":\"settings.group_permission.update\",\"group_name\":\"group_permission\",\"title\":\"update role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"},{\"id\":28,\"name\":\"settings.group_permission.delete\",\"group_name\":\"group_permission\",\"title\":\"delete role\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:38.000000Z\",\"updated_at\":\"2021-11-01T20:32:38.000000Z\"}]},\"productPermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":5,\"name\":\"product.index\",\"group_name\":\"product\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":6,\"name\":\"product.create\",\"group_name\":\"product\",\"title\":\"create product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":7,\"name\":\"product.store\",\"group_name\":\"product\",\"title\":\"store product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":8,\"name\":\"product.edit\",\"group_name\":\"product\",\"title\":\"edit product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":9,\"name\":\"product.update\",\"group_name\":\"product\",\"title\":\"update product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":10,\"name\":\"product.delete\",\"group_name\":\"product\",\"title\":\"delete product\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]},\"productTypePermissions\":{\"class\":\"Illuminate\\\\Database\\\\Eloquent\\\\Collection\",\"properties\":[{\"id\":11,\"name\":\"product_type.index\",\"group_name\":\"product_type\",\"title\":\"view table\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":12,\"name\":\"product_type.create\",\"group_name\":\"product_type\",\"title\":\"create product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":13,\"name\":\"product_type.store\",\"group_name\":\"product_type\",\"title\":\"store product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":14,\"name\":\"product_type.edit\",\"group_name\":\"product_type\",\"title\":\"edit product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":15,\"name\":\"product_type.update\",\"group_name\":\"product_type\",\"title\":\"update product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"},{\"id\":16,\"name\":\"product_type.delete\",\"group_name\":\"product_type\",\"title\":\"delete product type\",\"guard_name\":\"web\",\"created_at\":\"2021-11-01T20:32:37.000000Z\",\"updated_at\":\"2021-11-01T20:32:37.000000Z\"}]}}},\"duration\":642,\"memory\":2,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:26'),
(683, '94c819d0-0425-4f61-91df-a34c9c66d837', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\public\\\\index.php\",\"line\":52,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:34'),
(684, '94c819d0-07e2-43e6-b6af-03823c541fcd', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:34'),
(685, '94c819d0-0a36-4eaf-8506-4060be9408e8', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.pages.settings.authorization.role.index\",\"path\":\"\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(686, '94c819d0-1259-4c0d-9a67-a4fecc4e220e', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'roles\'\",\"time\":\"1.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":49,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(687, '94c819d0-15b3-46b0-a12b-954608df2dd9', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'hdf_footwear_nabik_ltd\' and table_name = \'permissions\'\",\"time\":\"1.34\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":51,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(688, '94c819d0-19af-4907-a02e-8283fa18de30', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `roles`\",\"time\":\"0.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"14aa5e78b340d1eaaba892834c2870f5\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(689, '94c819d0-1d62-425c-a5c8-6263a7c7cd6f', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, (select count(*) from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `roles`.`id` = `role_has_permissions`.`role_id`) as `permissions_count` from `roles` order by `permissions_count` desc limit 15 offset 0\",\"time\":\"2.86\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"1683d5414fd8f44899bdd09674561909\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(690, '94c819d0-2083-4b76-b5bb-117a3dda1e87', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\CustomRole\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(691, '94c819d0-2309-41f9-a99c-249c1f1f9727', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `permissions`.*, `role_has_permissions`.`role_id` as `pivot_role_id`, `role_has_permissions`.`permission_id` as `pivot_permission_id` from `permissions` inner join `role_has_permissions` on `permissions`.`id` = `role_has_permissions`.`permission_id` where `role_has_permissions`.`role_id` in (1, 2, 3, 4, 5, 6)\",\"time\":\"1.97\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Settings\\\\PermissionTable.php\",\"line\":53,\"hash\":\"3af7c1c24d725c53267c2a1e2420c6c3\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(692, '94c819d0-2506-4e52-87c7-979db7c5dd9c', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"Spatie\\\\Permission\\\\Models\\\\Permission\",\"count\":72,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(693, '94c819d0-29ea-4a56-9968-9a3466bef415', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"livewire.admin.settings.permission-table\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/settings\\/permission-table.blade.php\",\"data\":[\"roles\",\"_instance\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(694, '94c819d0-2aa2-4882-94f3-f38fca409131', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.search\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/search.blade.php\",\"data\":[\"_instance\",\"roles\",\"search\",\"filterByStatus\",\"recordPerPage\",\"page\",\"paginators\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(695, '94c819d0-2d21-4b79-aacd-2d450a9112a9', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"alerts.admin.delete-confirmation\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/delete-confirmation.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(696, '94c819d0-2d99-4848-af62-9a881b92e312', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"layouts.app-admin\",\"path\":\"\\\\resources\\\\views\\/layouts\\/app-admin.blade.php\",\"data\":[\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(697, '94c819d0-2f72-43bf-8f92-f5f5c95d29a0', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.navbar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/navbar.blade.php\",\"data\":[\"_instance\",\"html\",\"user\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Navbar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(698, '94c819d0-31e5-4a63-83f2-5333c951535f', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`model_id` = 1 and `media`.`model_id` is not null and `media`.`model_type` = \'App\\\\Models\\\\User\'\",\"time\":\"0.88\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\storage\\\\framework\\\\views\\\\64c99e80815ff6cc1cad35886736babbd07c1be4.php\",\"line\":85,\"hash\":\"962af3f1ea8c8ac973143d119bd50eea\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(699, '94c819d0-33b5-4e13-b28c-8d966b96d3f6', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"_instance\",\"html\",\"warehouses\"],\"composers\":[{\"name\":\"App\\\\Http\\\\View\\\\Composers\\\\Sidebar@compose\",\"type\":\"composer\"},{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(700, '94c819d0-35e8-48b8-9a91-4ffd2409267d', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `warehouses` order by `position` asc limit 6\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\nabik\\\\app\\\\Http\\\\Livewire\\\\Admin\\\\Includes\\\\Sidebar.php\",\"line\":18,\"hash\":\"576ec7d90867ac1d38ac2a85b7784e2d\",\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(701, '94c819d0-3755-4286-b5c6-6e8503503b3c', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Warehouse\",\"count\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(702, '94c819d0-3823-408c-b8b7-e9eae3e7dbe5', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"livewire.admin.includes.sidebar\",\"path\":\"\\\\resources\\\\views\\/livewire\\/admin\\/includes\\/sidebar.blade.php\",\"data\":[\"warehouses\",\"_instance\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(703, '94c819d0-396b-40c1-88a0-cf855f095024', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.header\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/header.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(704, '94c819d0-39e3-40d7-b677-5778551fe90e', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.breadcrumb\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/breadcrumb.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(705, '94c819d0-3aaf-47bf-b907-54f72a2cc622', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"admin.includes.footer\",\"path\":\"\\\\resources\\\\views\\/admin\\/includes\\/footer.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(706, '94c819d0-3c47-4ca1-b4ed-720ee4d3ed86', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'view', '{\"name\":\"alerts.admin.toast-alert\",\"path\":\"\\\\resources\\\\views\\/alerts\\/admin\\/toast-alert.blade.php\",\"data\":[\"_instance\",\"html\"],\"composers\":[{\"name\":\"Closure at C:\\\\laragon\\\\www\\\\nabik\\\\vendor\\\\barryvdh\\\\laravel-debugbar\\\\src\\\\LaravelDebugbar.php[210:215]\",\"type\":\"composer\"}],\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34'),
(707, '94c819d0-431a-4b34-82f0-66d16d94de77', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'debugbar', '{\"requestId\":\"X7bb4ee5db37748c8d46555749d7fc441\",\"hostname\":\"DESKTOP-LMVVTMU\"}', '2021-11-02 22:44:34'),
(708, '94c819d0-479f-49de-9312-249d39854278', '94c819d0-4943-4dca-adfb-3e33d32fbb0c', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/dashboard\\/settings\\/authorization\\/group-permission\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Admin\\\\Settings\\\\Authorization\\\\RoleController@index\",\"middleware\":[\"web\",\"auth\"],\"headers\":{\"host\":\"nabik.test\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\",\"dnt\":\"1\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/95.0.4638.54 Safari\\/537.36\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"referer\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\\/edit\\/6\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImVzenpvenpvdy91VmpFcCtxSFh0NXc9PSIsInZhbHVlIjoidWRxQ1l0K1BaZVRzRUljRTExMW11UDBlQmtXQTFLVUZ0MUVKaGpIUkM1NWxvUUNYTUJwbmhJVU1WcmxOYS9Welc3QWVEdjk3bEUrdXQrdVNHVnd4dFFRMzd1blFieWVDelZrcWRrZUU1eWJ3K2ZqZ0Q5dFgybCtYQnkwUUxrb24iLCJtYWMiOiJkZDU3NjNlMDY0ZGU1MzczYzg3MWMyNzU5NjFhNmRiMDc4NThkODQwOGZhNGJjYzRjYTcxNTU2MTE2ZDQ5ZWJhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkVTRnhWZzJ3czZKT2Z5aXIyV08zb0E9PSIsInZhbHVlIjoiUGRXWXphVENQU0ZmSjhyTklLNjFvSGhZc2FnTG1HMEV0d01RRXpjRExhMUZaNC8vZW9XMHEwN3ZoL3YyOW9oNXpudllSQ2l4ZjQvRVFMNjQ3NERYZHNxQTFoV0gxQUQ0ZFVLSk1SSDlzR2NNODFrbWRVQlhQZXZCZXNqckF4bzUiLCJtYWMiOiI5YjJkZjJkNDA0MGI1NmE0ZTk0YzI2Y2YzODQ2Yjc1NDc0NTJhMWU2YmE4MjJhYjQ3ZmQxMTk3OTAwYzU3ZTk0IiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"eJrm7NSDu2jLYjSsYR1s4fZ7jhNLMSNNPkplQaBL\",\"url\":[],\"_previous\":{\"url\":\"http:\\/\\/nabik.test\\/dashboard\\/settings\\/authorization\\/group-permission\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1,\"PHPDEBUGBAR_STACK_DATA\":[]},\"response_status\":200,\"response\":{\"view\":\"C:\\\\laragon\\\\www\\\\nabik\\\\resources\\\\views\\/admin\\/pages\\/settings\\/authorization\\/role\\/index.blade.php\",\"data\":[]},\"duration\":513,\"memory\":6,\"hostname\":\"DESKTOP-LMVVTMU\",\"user\":{\"id\":1,\"name\":\"Mahfuzur Rahman Saber\",\"email\":\"saaberdev@gmail.com\"}}', '2021-11-02 22:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('94c6686c-7cb1-47fd-9bbf-6fb16250123e', 'App\\Models\\User'),
('94c6686c-7f43-49c5-818b-36cc8d58024d', 'Auth:3'),
('94c6686c-85d4-4e20-aed4-962cb450efb2', 'Auth:3'),
('94c6686c-8908-46d1-b17f-10853bfe09a2', 'Auth:3'),
('94c6686c-8c74-47cc-bb07-83fee9b47fa2', 'Auth:3'),
('94c6686c-8ef1-47aa-823c-238d8bc96c32', 'Auth:3'),
('94c6686c-905e-4bc4-a1f6-dac00ea60975', 'App\\Models\\CustomRole'),
('94c6686c-905e-4bc4-a1f6-dac00ea60975', 'Auth:3'),
('94c6686c-915d-4526-8b9d-05f2ebbbde31', 'Auth:3'),
('94c6686c-92a2-43f1-8f72-8dca82be31fd', 'Auth:3'),
('94c6686c-92a2-43f1-8f72-8dca82be31fd', 'Spatie\\Permission\\Models\\Permission'),
('94c6686c-95bd-4cf2-a805-c50be59495fa', 'Auth:3'),
('94c6686c-964f-41b9-a701-cbca4597dcb5', 'Auth:3'),
('94c6686c-993a-4f0a-947a-f27d59d86579', 'Auth:3'),
('94c6686c-99bb-491d-9ddc-2cce90ff9bcb', 'Auth:3'),
('94c6686c-9ac5-49f4-8743-7627dd92cbd5', 'Auth:3'),
('94c6686c-9c9c-4719-9d29-094d6343a976', 'Auth:3'),
('94c6686c-9e5b-4812-b68c-0f00135d5fdc', 'Auth:3'),
('94c6686c-a02d-40c3-980d-77f026db64c9', 'Auth:3'),
('94c6686c-a16c-484d-9808-f1a8bb0f3dd7', 'App\\Models\\Warehouse'),
('94c6686c-a16c-484d-9808-f1a8bb0f3dd7', 'Auth:3'),
('94c6686c-a1d7-4124-972e-2e8184802ae5', 'Auth:3'),
('94c6686c-a2e9-4a43-ae1e-2df042a2ec6b', 'Auth:3'),
('94c6686c-a35a-44d6-afc1-4c6c13f77ae4', 'Auth:3'),
('94c6686c-a3f2-40e3-8a27-7341d24057d2', 'Auth:3'),
('94c6686c-a512-40bb-83fc-793a4b2a2f97', 'Auth:3'),
('94c6686c-ae2d-4f8e-b260-c8328ea51565', 'Auth:3'),
('94c668a7-5048-48bf-ac6a-687507fd5255', 'App\\Models\\User'),
('94c668a7-535e-4249-b13e-590892455d0a', 'Auth:3'),
('94c668a7-567e-4bc0-b730-f6cca03aceb0', 'Auth:3'),
('94c668a7-580f-4b31-ad99-ee8330605813', 'Auth:3'),
('94c668a7-580f-4b31-ad99-ee8330605813', 'Spatie\\Permission\\Models\\Role'),
('94c668a7-5922-43aa-be42-6a1e4aef717a', 'Auth:3'),
('94c668a7-5ba1-4e41-9bdd-bc8c2b3823dc', 'Auth:3'),
('94c668a7-5d2c-4c41-a368-d850018eccde', 'Auth:3'),
('94c668a7-5d2c-4c41-a368-d850018eccde', 'Spatie\\Permission\\Models\\Permission'),
('94c668a7-5dc4-4759-8dac-5fe5f3b06581', 'Auth:3'),
('94c668a7-5fbf-4789-836b-ddb056f3dfdc', 'Auth:3'),
('94c668a7-639a-47ac-9ebb-93fa69957ee7', 'Auth:3'),
('94c668a7-725e-4613-ad39-cb78679e4065', 'Auth:3'),
('94c668a7-7498-47a2-bd77-1c793d3df7a1', 'Auth:3'),
('94c668a7-7787-4d1b-965f-8ecf69e26757', 'Auth:3'),
('94c668a7-7a25-4ce2-91a4-6267a99c8d70', 'Auth:3'),
('94c668a7-7d6b-4957-a08a-8d505da33f32', 'Auth:3'),
('94c668a7-7fbb-48cc-87d4-fc31faec137c', 'Auth:3'),
('94c668a7-81f1-426a-b8ad-02c36ba1360a', 'Auth:3'),
('94c668a7-853f-4434-99d6-314ce5b9d076', 'Auth:3'),
('94c668a7-863f-4379-a282-432221294f42', 'Auth:3'),
('94c668a7-880c-44f5-90ed-d6431609d559', 'Auth:3'),
('94c668a7-8a5e-4f7d-942b-bfe65ddd956e', 'Auth:3'),
('94c668a7-8e2b-478f-9b1a-428471cea9f5', 'Auth:3'),
('94c668a7-90df-417d-8cd4-c356bee33a98', 'App\\Models\\Warehouse'),
('94c668a7-90df-417d-8cd4-c356bee33a98', 'Auth:3'),
('94c668a7-91b9-4377-bed8-8a8a8bfc675e', 'Auth:3'),
('94c668a7-93ff-46c8-93cd-031cb43f62dd', 'Auth:3'),
('94c668a7-9472-4cdf-a323-0661e3f10c71', 'Auth:3'),
('94c668a7-950e-4164-9e5f-27b50c70483a', 'Auth:3'),
('94c668a7-9656-4bc4-8b21-a9a7972ef17f', 'Auth:3'),
('94c668a7-a0ac-43a1-b7c3-caa2d5b68a87', 'Auth:3'),
('94c66d5d-ed49-45ad-92a4-436168d76515', 'App\\Models\\User'),
('94c66d5d-f09d-48dc-a0e0-cf300904c5bd', 'Auth:3'),
('94c66d5d-f35d-4cb7-92e8-3b122b4ee090', 'Auth:3'),
('94c66d5d-f4c1-43e3-a8c1-1f91a17e4576', 'Auth:3'),
('94c66d5d-f4c1-43e3-a8c1-1f91a17e4576', 'Spatie\\Permission\\Models\\Role'),
('94c66d5d-f5a3-4813-bb3b-bfdba0818959', 'Auth:3'),
('94c66d5d-f926-465a-ad8c-7a5a01d1b448', 'Auth:3'),
('94c66d5d-fb13-48a8-8e21-f4fa15979daa', 'Auth:3'),
('94c66d5d-fb13-48a8-8e21-f4fa15979daa', 'Spatie\\Permission\\Models\\Permission'),
('94c66d5d-fbb7-4c55-8750-8fa7ae22f55d', 'Auth:3'),
('94c66d5d-fe87-4d3a-aa4a-fde3fd5324cc', 'Auth:3'),
('94c66d5e-0049-40a7-a8c1-9ef631a26ce9', 'Auth:3'),
('94c66d5e-0204-4700-b253-e113cc036c53', 'Auth:3'),
('94c66d5e-0662-4b30-a5ce-7ef5bba05f5f', 'Auth:3'),
('94c66d5e-0eb4-4502-acc6-e319b6ff5de1', 'Auth:3'),
('94c66d5e-1197-4057-9baa-415ba7cb3955', 'Auth:3'),
('94c66d5e-1505-48e7-a962-e21b8265844f', 'Auth:3'),
('94c66d5e-187a-43d0-a557-65983b78d7db', 'Auth:3'),
('94c66d5e-1be0-4734-b513-7e8793d32616', 'Auth:3'),
('94c66d5e-1fa2-46a9-ac12-68e108d73514', 'Auth:3'),
('94c66d5e-22e6-4e01-a99d-c04aa52ea927', 'Auth:3'),
('94c66d5e-2766-466e-8825-765272e56cd3', 'Auth:3'),
('94c66d5e-2962-40c8-9947-60ffb5d54097', 'Auth:3'),
('94c66d5e-2cb1-4d31-888b-dc7008da04ca', 'Auth:3'),
('94c66d5e-2f1f-44f7-902b-49c496d6b85a', 'Auth:3'),
('94c66d5e-37ab-41e0-97a3-98cdb6dadfa6', 'Auth:3'),
('94c66d5e-3a11-4401-b2ab-d51317bfe15d', 'App\\Models\\Warehouse'),
('94c66d5e-3a11-4401-b2ab-d51317bfe15d', 'Auth:3'),
('94c66d5e-3b71-4599-8a85-21b0e7dbc71a', 'Auth:3'),
('94c66d5e-3f2a-4a99-a75c-87e951c9837a', 'Auth:3'),
('94c66d5e-3fca-45cc-8dbc-a047494087b9', 'Auth:3'),
('94c66d5e-40c0-4793-8193-af386080eb93', 'Auth:3'),
('94c66d5e-41b6-4e25-b2fc-73f8e4e96654', 'Auth:3'),
('94c66d5e-4e6c-45e8-b6d7-5e1d4863f322', 'Auth:3'),
('94c66d9a-f5d6-4d28-bdfd-01e547f61545', 'App\\Models\\User'),
('94c66d9a-f8a3-4fc1-a376-c5ac7e6c2d4c', 'Auth:3'),
('94c66d9a-fb09-4cda-9b48-3545ab4100d8', 'Auth:3'),
('94c66d9a-fc76-4382-aca2-dad8c1ac093a', 'Auth:3'),
('94c66d9a-fc76-4382-aca2-dad8c1ac093a', 'Spatie\\Permission\\Models\\Role'),
('94c66d9a-fda8-48ac-8a68-a98e1cfa33cc', 'Auth:3'),
('94c66d9a-ffcc-499a-aab4-08c21594f6a3', 'Auth:3'),
('94c66d9b-0144-4d64-9a78-346f530657a6', 'Auth:3'),
('94c66d9b-0144-4d64-9a78-346f530657a6', 'Spatie\\Permission\\Models\\Permission'),
('94c66d9b-01d6-4bc9-b885-30f5e95f8012', 'Auth:3'),
('94c66d9b-03c3-40ca-a66b-f85bd0e1d04e', 'Auth:3'),
('94c66d9b-0630-4a09-9514-02ea83b75009', 'Auth:3'),
('94c66d9b-080c-4a66-863b-a56a946225e7', 'Auth:3'),
('94c66d9b-0b4a-4a5e-a3fe-8e82ba799b22', 'Auth:3'),
('94c66d9b-11c0-4095-89ed-2e4325aadbb6', 'Auth:3'),
('94c66d9b-1390-4dfc-99ec-f67110057873', 'Auth:3'),
('94c66d9b-15cf-4b24-b3b3-2a355a2d4812', 'Auth:3'),
('94c66d9b-1849-4367-9213-56dd7b93ddca', 'Auth:3'),
('94c66d9b-1a91-420e-a739-97218baf6c66', 'Auth:3'),
('94c66d9b-1cfa-48ce-805b-622a873ed08c', 'Auth:3'),
('94c66d9b-1fa1-49ac-bf73-a6cc140c5b17', 'Auth:3'),
('94c66d9b-2264-4fa0-8172-8a9f1a7272cf', 'Auth:3'),
('94c66d9b-238b-4582-9bc2-4a8daa0973e2', 'Auth:3'),
('94c66d9b-2631-439f-b069-b0abfbae6dc0', 'Auth:3'),
('94c66d9b-27c0-4b99-91b7-f56b6e2e2472', 'Auth:3'),
('94c66d9b-2bc5-4831-ad30-bac8cd310530', 'Auth:3'),
('94c66d9b-2d50-47f3-9466-a36345d9c96c', 'App\\Models\\Warehouse'),
('94c66d9b-2d50-47f3-9466-a36345d9c96c', 'Auth:3'),
('94c66d9b-2e2a-4a5e-a948-69d81001efde', 'Auth:3'),
('94c66d9b-3090-43db-8f4f-6cee1d17f698', 'Auth:3'),
('94c66d9b-3108-4e5a-a1b4-d7b58702e64e', 'Auth:3'),
('94c66d9b-321e-4b9f-aa16-0d33ce05c526', 'Auth:3'),
('94c66d9b-32f0-41e4-ac3f-f7f81bb89fd0', 'Auth:3'),
('94c66d9b-3ed8-4ed2-b85c-b335e1822fe6', 'Auth:3'),
('94c66dcb-de7a-4401-baaf-bfc0276abdbd', 'App\\Models\\User'),
('94c66dcb-e0f2-4d5c-ab72-95d26383bdac', 'Auth:3'),
('94c66dcb-ebb9-4531-b310-5331bdf67abf', 'Auth:3'),
('94c66dcb-eef0-4b7b-8bd5-f9395f921f28', 'Auth:3'),
('94c66dcb-f363-49c1-b04b-51304ed71eb4', 'Auth:3'),
('94c66dcb-f6f0-4b47-af08-31d2ee00939e', 'Auth:3'),
('94c66dcb-f896-4bab-a412-9db1a7ce10b7', 'App\\Models\\CustomRole'),
('94c66dcb-f896-4bab-a412-9db1a7ce10b7', 'Auth:3'),
('94c66dcb-f989-4788-9b39-ec58ea9379a3', 'Auth:3'),
('94c66dcb-fad7-457a-a62c-e0e85c9ca343', 'Auth:3'),
('94c66dcb-fad7-457a-a62c-e0e85c9ca343', 'Spatie\\Permission\\Models\\Permission'),
('94c66dcb-fe96-47d6-b938-03a147b7c456', 'Auth:3'),
('94c66dcb-ff3e-4f8b-9202-4cecd816d377', 'Auth:3'),
('94c66dcc-01e1-40f6-acb2-9103c147a569', 'Auth:3'),
('94c66dcc-0278-42d0-b4ef-c39a002169b7', 'Auth:3'),
('94c66dcc-0419-4c4c-8d6b-b103aad2de16', 'Auth:3'),
('94c66dcc-061d-41e0-80ef-d18b61d5b04b', 'Auth:3'),
('94c66dcc-07e4-407d-b7f3-94e73a195ec8', 'Auth:3'),
('94c66dcc-0a09-45b0-b39e-7fe5083e5024', 'Auth:3'),
('94c66dcc-0be4-4c30-99bd-4b9197c727d8', 'App\\Models\\Warehouse'),
('94c66dcc-0be4-4c30-99bd-4b9197c727d8', 'Auth:3'),
('94c66dcc-0c73-4c9a-9b86-1fe64bfed1fb', 'Auth:3'),
('94c66dcc-0d84-4304-a2c2-2d12dfa2bd52', 'Auth:3'),
('94c66dcc-0df6-4b63-ac78-2c9f7879a66f', 'Auth:3'),
('94c66dcc-0eee-4e34-9c7c-9353bdd3704d', 'Auth:3'),
('94c66dcc-0fe3-489a-967c-bb865e3fcb59', 'Auth:3'),
('94c66dcc-19b6-477b-ba57-239d5aaa7f8a', 'Auth:3'),
('94c66dcf-b9b4-4d04-9037-fd36d4ad156a', 'App\\Models\\User'),
('94c66dcf-bc29-41d1-a75b-bf20d91f8dc0', 'Auth:3'),
('94c66dcf-bf3e-4177-b338-05f405b707c3', 'Auth:3'),
('94c66dcf-c110-49cc-9933-9db02e22397d', 'Auth:3'),
('94c66dcf-c110-49cc-9933-9db02e22397d', 'Spatie\\Permission\\Models\\Permission'),
('94c66dcf-c1a5-4f4f-8e59-df5aeb9b5d65', 'Auth:3'),
('94c66dcf-c3b5-4a26-8e0c-3318f4b78e80', 'Auth:3'),
('94c66dcf-c664-4eac-a9db-daf1a645e029', 'Auth:3'),
('94c66dcf-ca53-42df-9f33-413db2963894', 'Auth:3'),
('94c66dcf-cb28-4ab0-8e59-16a7b20f446d', 'Auth:3'),
('94c66dcf-cd63-43d8-a471-a3e77a1f3e4a', 'Auth:3'),
('94c66dcf-cfa0-41e0-934c-6bbaccce78e8', 'Auth:3'),
('94c66dcf-d3ad-4740-bff8-97411fd91839', 'Auth:3'),
('94c66dcf-d5ee-4a0a-8153-006a1aab2f42', 'App\\Models\\Warehouse'),
('94c66dcf-d5ee-4a0a-8153-006a1aab2f42', 'Auth:3'),
('94c66dcf-d712-4071-88ad-620857dcf7cf', 'Auth:3'),
('94c66dcf-da2b-4469-8c50-3c7a7966acc6', 'Auth:3'),
('94c66dcf-db0a-42da-8a9f-b5e7e7d863dd', 'Auth:3'),
('94c66dcf-dc4e-47d8-9123-a18c8e46d819', 'Auth:3'),
('94c66dcf-dd1c-43b0-b15d-cfe86f6ef88d', 'Auth:3'),
('94c66dcf-e67b-4d04-9459-355c3ebd975e', 'Auth:3'),
('94c67268-b049-4351-b0f3-20aad543412a', 'App\\Models\\User'),
('94c67268-b2ea-4583-a1f2-fe949b8bc377', 'Auth:3'),
('94c67268-b5c8-46cd-b4d6-fc0b4dfefa6b', 'Auth:3'),
('94c67268-b78f-4fa3-ac00-9dbc2847dfba', 'Auth:3'),
('94c67268-b78f-4fa3-ac00-9dbc2847dfba', 'Spatie\\Permission\\Models\\Permission'),
('94c67268-b82b-450c-8103-c2e8266be652', 'Auth:3'),
('94c67268-ba07-4e29-b2a5-85766e8da6d5', 'Auth:3'),
('94c67268-bbf6-41c1-8173-cf08b23147a0', 'Auth:3'),
('94c67268-be04-4dd5-91dc-40c00b552506', 'Auth:3'),
('94c67268-c120-4d1e-874e-5d7f96a5b4dd', 'Auth:3'),
('94c67268-c5b0-4070-8163-7017c327322d', 'Auth:3'),
('94c67268-c67a-49b5-a807-000427cc1879', 'Auth:3'),
('94c67268-c919-4e94-8e2b-414ba39bbb10', 'Auth:3'),
('94c67268-cb0f-461b-ade7-b15794e9bde2', 'Auth:3'),
('94c67268-cf66-4142-ab79-7929c92d5eb7', 'Auth:3'),
('94c67268-d118-45f0-87f2-f29625df8f6a', 'App\\Models\\Warehouse'),
('94c67268-d118-45f0-87f2-f29625df8f6a', 'Auth:3'),
('94c67268-d234-4766-8792-9417c00499c0', 'Auth:3'),
('94c67268-d497-4e77-ac61-2fb42a7e5c00', 'Auth:3'),
('94c67268-d50e-4f8d-b30c-404270cce386', 'Auth:3'),
('94c67268-d5ae-4f27-9a7c-6412e6767f71', 'Auth:3'),
('94c67268-d679-45e5-8b0b-452eef005b9c', 'Auth:3'),
('94c67268-e1d4-409b-bc51-3ae75bbb4fc3', 'Auth:3'),
('94c8177f-aea4-4dae-b5e3-f03c9c4b1f41', 'App\\Models\\Warehouse'),
('94c81781-38ee-43d0-bcfd-f2dbb3b7620b', 'App\\Models\\Warehouse'),
('94c817dd-0fab-436a-95df-7ef7a590ef1b', 'App\\Models\\User'),
('94c817dd-37db-4fb7-867f-f8a295a73b7c', 'Auth:1'),
('94c817dd-4083-428d-911b-54e3e232dd65', 'Auth:1'),
('94c817dd-4244-45a7-b480-b09b047397d5', 'Auth:1'),
('94c817dd-4244-45a7-b480-b09b047397d5', 'Spatie\\Permission\\Models\\Role'),
('94c817dd-4c5d-4c2c-807d-fe155e428f8c', 'Auth:1'),
('94c817dd-eac3-45fb-b3a6-1287c1008d22', 'App\\Models\\User'),
('94c817dd-f8ef-4691-94f3-e77dee8752af', 'Auth:1'),
('94c817dd-fcae-45a7-af14-606a885a65e8', 'Auth:1'),
('94c817dd-ff27-4e3c-a7fd-c7e14e386df3', 'Auth:1'),
('94c817de-01fe-473b-b625-0be1e8fc0070', 'Auth:1'),
('94c817de-05da-495c-a9aa-5fa2cb3df2ba', 'Auth:1'),
('94c817de-08e8-4067-b0a0-b18c790154b7', 'Auth:1'),
('94c817de-0e7f-441d-8673-433c1f3fd724', 'Auth:1'),
('94c817de-1261-46fe-9874-08cbf797f92b', 'Auth:1'),
('94c817de-14ea-488e-ae03-cb2012d5012a', 'Auth:1'),
('94c817de-1a6e-4b15-8cd2-44febf941ba1', 'Auth:1'),
('94c817de-1df6-4a0e-bfc5-356c96945e0f', 'Auth:1'),
('94c817de-21c7-40be-8eb2-1359241406a8', 'Auth:1'),
('94c817de-23c0-4e2a-8338-5af8ba2384db', 'App\\Models\\Warehouse'),
('94c817de-23c0-4e2a-8338-5af8ba2384db', 'Auth:1'),
('94c817de-24db-4c99-848a-55aea40ffae1', 'Auth:1'),
('94c817de-27b5-4259-89c7-74bccb79e6e8', 'Auth:1'),
('94c817de-28af-4209-82c9-69aeb78f6ff7', 'Auth:1'),
('94c817de-2a5e-4691-bf53-6f189a87889a', 'Auth:1'),
('94c817de-2ba5-4e4c-b400-ec421b038794', 'Auth:1'),
('94c817de-33aa-4e89-ab0b-307c99c06847', 'Auth:1'),
('94c817f4-9c4b-47cd-8964-5f7523c9d86b', 'App\\Models\\User'),
('94c817f4-a033-4ff0-8f7c-aa9aec460ae3', 'Auth:1'),
('94c817f4-b1d7-47bb-b54d-1c9621491973', 'Auth:1'),
('94c817f4-b5d1-4e01-92a6-c4fe5a94dd45', 'Auth:1'),
('94c817f4-bc66-447d-ab07-025ad64e9699', 'Auth:1'),
('94c817f4-c0a7-4d4c-b450-1538e166c1e1', 'Auth:1'),
('94c817f4-c2e8-417d-8a76-6d0c3c5bf2e8', 'App\\Models\\CustomRole'),
('94c817f4-c2e8-417d-8a76-6d0c3c5bf2e8', 'Auth:1'),
('94c817f4-c406-4758-8007-487a7ad97ece', 'Auth:1'),
('94c817f4-c667-49b8-a8fc-8f22f6193851', 'Auth:1'),
('94c817f4-c667-49b8-a8fc-8f22f6193851', 'Spatie\\Permission\\Models\\Permission'),
('94c817f4-ca49-419e-93d8-0087f6880eb5', 'Auth:1'),
('94c817f4-cbc9-45a2-b983-c41bdc672eed', 'Auth:1'),
('94c817f4-cfc3-4b3d-b3e5-0579b67e878b', 'Auth:1'),
('94c817f4-d0b0-47a6-b32c-8874804581f2', 'Auth:1'),
('94c817f4-d32e-46d8-920c-483cacbf1cc0', 'Auth:1'),
('94c817f4-d546-49a8-9676-de07b535fddc', 'Auth:1'),
('94c817f4-d706-4df0-b7c3-64f52a34a8f6', 'Auth:1'),
('94c817f4-d956-4585-a774-8ba7d28fe568', 'Auth:1'),
('94c817f4-db55-44d0-b290-1ddd78aee47e', 'App\\Models\\Warehouse'),
('94c817f4-db55-44d0-b290-1ddd78aee47e', 'Auth:1'),
('94c817f4-dbdb-412a-8680-7816367f2b10', 'Auth:1'),
('94c817f4-dd2d-4868-92c1-a4a831a4ae1c', 'Auth:1'),
('94c817f4-ddd6-468c-b23c-2338b650e3c4', 'Auth:1'),
('94c817f4-df17-40d5-ac83-3a453d0a9116', 'Auth:1'),
('94c817f4-e0a2-430b-8dd2-f06669870729', 'Auth:1'),
('94c817f4-ef69-4cc4-9c39-9a4955167bd2', 'Auth:1'),
('94c817fc-e584-4bb0-8075-9fa96f6513c4', 'App\\Models\\User'),
('94c817fc-e8dd-42ed-a341-da4e641715fb', 'Auth:1'),
('94c817fc-eb89-4a62-8e66-56a667bdd4a4', 'Auth:1'),
('94c817fc-ed2d-40f6-a3ab-2f1aec1c176a', 'Auth:1'),
('94c817fc-ed2d-40f6-a3ab-2f1aec1c176a', 'Spatie\\Permission\\Models\\Permission'),
('94c817fc-edd2-4c6d-8277-40995100473d', 'Auth:1'),
('94c817fc-f16e-4c1a-9fdd-7a03c5ad149f', 'Auth:1'),
('94c817fc-f362-4655-bb61-5b4e46dfbc60', 'Auth:1'),
('94c817fc-f602-4705-a626-fa7c877d7174', 'Auth:1'),
('94c817fc-fa27-407d-af53-0f7a64e2748b', 'Auth:1'),
('94c817fd-017f-4dd8-9a3a-56b2f057154e', 'Auth:1'),
('94c817fd-039e-491f-81bb-2f6c673fc857', 'Auth:1'),
('94c817fd-0847-4b1d-8206-3ddbd45204ae', 'Auth:1'),
('94c817fd-0c13-44d9-b9d5-e2fe8488de6b', 'Auth:1'),
('94c817fd-12c4-4b61-8112-bd8889b1c05f', 'Auth:1'),
('94c817fd-143e-414a-a72e-1785f6c6afc1', 'App\\Models\\Warehouse'),
('94c817fd-143e-414a-a72e-1785f6c6afc1', 'Auth:1'),
('94c817fd-14ea-4fdd-b1d3-3b4a0d94c9e9', 'Auth:1'),
('94c817fd-1831-4af1-8a64-5e1eff3a0f68', 'Auth:1'),
('94c817fd-18b9-4450-b02f-63afe4d104c0', 'Auth:1'),
('94c817fd-1948-402b-92a4-2b1db4ae9575', 'Auth:1'),
('94c817fd-19f7-4078-a779-4ce0b59e1bf7', 'Auth:1'),
('94c817fd-4ce8-4be4-9545-773a6a457aa3', 'Auth:1'),
('94c81823-8e52-457e-bf76-800a4b0f7d32', 'App\\Models\\User'),
('94c81823-9178-4ded-b3dc-c1a311f736a4', 'Auth:1'),
('94c81823-98f5-46db-b0c1-973f637fb907', 'Auth:1'),
('94c81823-9c10-46e9-bdc4-cbab21bb8a97', 'Auth:1'),
('94c81823-a0a2-4315-82e8-622222ed2a36', 'Auth:1'),
('94c81823-a6b1-44c6-a65a-25c668cc8f14', 'Auth:1'),
('94c81823-a830-4e46-8fd7-087044b4aa19', 'App\\Models\\CustomRole'),
('94c81823-a830-4e46-8fd7-087044b4aa19', 'Auth:1'),
('94c81823-aa6f-4f32-afa3-56599eb60d7a', 'Auth:1'),
('94c81823-abd4-453a-acad-f8cb633d8b2d', 'Auth:1'),
('94c81823-abd4-453a-acad-f8cb633d8b2d', 'Spatie\\Permission\\Models\\Permission'),
('94c81823-aec0-45a1-b4bb-0caa552fd989', 'Auth:1'),
('94c81823-aff0-4d64-b121-b0c4da6b659a', 'Auth:1'),
('94c81823-b27e-45cd-ad8e-6a605c2b1d3c', 'Auth:1'),
('94c81823-b303-4aee-8c39-ef34ccf59f24', 'Auth:1'),
('94c81823-b3d7-4675-9dfb-f5d0ceffbdf6', 'Auth:1'),
('94c81823-b698-49a0-9e67-3af2d158ecd9', 'Auth:1'),
('94c81823-b87a-49d1-83f8-45865a2e8d5f', 'Auth:1'),
('94c81823-b9fe-4fe7-b944-404e2df13c3b', 'Auth:1'),
('94c81823-bb6b-41c2-b358-c87e38b8fa5c', 'App\\Models\\Warehouse'),
('94c81823-bb6b-41c2-b358-c87e38b8fa5c', 'Auth:1'),
('94c81823-bbf6-4264-a9f1-22a9d0a33859', 'Auth:1'),
('94c81823-bd5b-4c5d-8a34-4baad13f61d4', 'Auth:1'),
('94c81823-bdd0-4bc9-8217-157cfa78b738', 'Auth:1'),
('94c81823-be7e-453a-afab-7f1741756578', 'Auth:1'),
('94c81823-bf37-4297-afe4-890ff4ac70b8', 'Auth:1'),
('94c81823-d52b-4505-b430-fedeccaecac7', 'Auth:1'),
('94c81827-d272-4afa-80f9-a61aff96dce5', 'App\\Models\\User'),
('94c81827-d7cc-448c-9b75-b31f76780a3b', 'Auth:1'),
('94c81827-db2a-44a1-8780-c7dbe46f76d4', 'Auth:1'),
('94c81827-df81-4021-ba4e-9820f1863bf4', 'Auth:1'),
('94c81827-df81-4021-ba4e-9820f1863bf4', 'Spatie\\Permission\\Models\\Role'),
('94c81827-e17e-491c-9f5e-c8d943422c63', 'Auth:1'),
('94c81827-e4b7-45f3-9b8b-00ace3c2c80f', 'Auth:1'),
('94c81827-e74c-4804-8128-c73dbbee4107', 'Auth:1'),
('94c81827-e74c-4804-8128-c73dbbee4107', 'Spatie\\Permission\\Models\\Permission'),
('94c81827-e8d9-4ae9-bf25-9d4ac74f6e42', 'Auth:1'),
('94c81827-ec03-4535-978f-352b7bf7dc24', 'Auth:1'),
('94c81827-f17a-442d-aebc-476f4f8e2433', 'Auth:1'),
('94c81827-f58d-4403-8a87-65317ef27699', 'Auth:1'),
('94c81827-fc11-4356-b48d-639c96bfb25a', 'Auth:1'),
('94c81828-08bd-42ae-a1ae-db2665829d8e', 'Auth:1'),
('94c81828-0c94-43cb-aeb0-316d34dbc0ce', 'Auth:1'),
('94c81828-0fbd-47e5-8f4f-c8ed4f004011', 'Auth:1'),
('94c81828-12ad-4474-b560-73b5c9bcc10e', 'Auth:1'),
('94c81828-14e9-481a-8917-c390530df35f', 'Auth:1'),
('94c81828-1889-404c-8748-d0099f562720', 'Auth:1'),
('94c81828-1a97-4ad0-9ba0-761a32035927', 'Auth:1'),
('94c81828-2498-4ad9-a7cd-ff1ed2c378ea', 'Auth:1'),
('94c81828-25b7-4fc7-8134-59a8cad54efc', 'Auth:1'),
('94c81828-27ff-4ad6-a8f6-ed9d9500d637', 'Auth:1'),
('94c81828-2a9e-4871-aefd-04eacba4cdba', 'Auth:1'),
('94c81828-2e62-4489-9f96-8afdc9c28344', 'Auth:1'),
('94c81828-3046-4e82-a37b-181e13cc013b', 'App\\Models\\Warehouse'),
('94c81828-3046-4e82-a37b-181e13cc013b', 'Auth:1'),
('94c81828-312c-4eaa-a8a9-da4e4dff9685', 'Auth:1'),
('94c81828-33b8-4810-a895-fbb16ca32d1b', 'Auth:1'),
('94c81828-3421-48d8-ac17-353164f05113', 'Auth:1'),
('94c81828-34b9-4e41-8893-7284b34b479c', 'Auth:1'),
('94c81828-368d-492d-b97c-816d08dd0c56', 'Auth:1'),
('94c81828-458a-4f1d-860b-1f28bf4e32c0', 'Auth:1'),
('94c818f1-d952-445e-a128-7fe75b1a4ccc', 'App\\Models\\User'),
('94c818f1-dc16-44a3-a320-534e309c6b82', 'Auth:1'),
('94c818f1-e732-4038-bd8e-39432a191481', 'Auth:1'),
('94c818f1-ec8e-4096-97fa-14c2b17230d0', 'Auth:1'),
('94c818f1-f090-4c24-8e39-f9a600ddd459', 'Auth:1'),
('94c818f1-f311-4f9c-af72-7ebcdf448c8f', 'Auth:1'),
('94c818f1-f47c-470b-9b1d-f30aae185d60', 'App\\Models\\CustomRole'),
('94c818f1-f47c-470b-9b1d-f30aae185d60', 'Auth:1'),
('94c818f1-f670-42f4-9425-6a194466c173', 'Auth:1'),
('94c818f1-f891-4843-9e9d-133a2330d301', 'Auth:1'),
('94c818f1-f891-4843-9e9d-133a2330d301', 'Spatie\\Permission\\Models\\Permission'),
('94c818f1-fbca-41a0-b11b-8c5fba112679', 'Auth:1'),
('94c818f1-fd3e-4a1e-ace8-4e8ec4895314', 'Auth:1'),
('94c818f1-fffa-42e5-8cfa-2c3027901f83', 'Auth:1'),
('94c818f2-0089-45b1-8467-7f6484de6a6b', 'Auth:1'),
('94c818f2-01d2-4081-abec-161fec09fbbd', 'Auth:1'),
('94c818f2-04b1-479f-886d-14b1d34eab1e', 'Auth:1'),
('94c818f2-063e-4f19-8d66-79613b18f63c', 'Auth:1'),
('94c818f2-07c8-42d1-a3bf-a84f9b6c0135', 'Auth:1'),
('94c818f2-09d4-480f-b0d3-b694148e48ec', 'App\\Models\\Warehouse'),
('94c818f2-09d4-480f-b0d3-b694148e48ec', 'Auth:1'),
('94c818f2-0afa-4479-b241-4c6cabe083b3', 'Auth:1'),
('94c818f2-0c2e-442a-9a05-885d055e4e3b', 'Auth:1'),
('94c818f2-0cc1-4e54-8eb0-93f024d1d0a1', 'Auth:1'),
('94c818f2-0d67-4baf-8563-6cbf28556931', 'Auth:1'),
('94c818f2-0e94-44f0-8527-999263ba479f', 'Auth:1'),
('94c818f2-194a-4a86-bc79-3b71ae6decc4', 'Auth:1'),
('94c818f6-a770-410b-ab8b-0ff94fc6376d', 'App\\Models\\User'),
('94c818f6-aa04-4889-b3af-8c35198caee3', 'Auth:1'),
('94c818f6-ad34-4c17-a076-045fe53a11f9', 'Auth:1'),
('94c818f6-af24-430a-99ad-559a9687e774', 'Auth:1'),
('94c818f6-af24-430a-99ad-559a9687e774', 'Spatie\\Permission\\Models\\Permission'),
('94c818f6-b015-4f25-a10e-d41afd710a0f', 'Auth:1'),
('94c818f6-b436-4d6c-ac20-761e039b3027', 'Auth:1'),
('94c818f6-b76b-48d9-b5df-493c970c2bd5', 'Auth:1'),
('94c818f6-ba3b-480e-ac8f-67945d9535f5', 'Auth:1'),
('94c818f6-bde7-4a3b-8efd-826ae06ff881', 'Auth:1'),
('94c818f6-c07e-4b45-aae6-346bdaf81100', 'Auth:1'),
('94c818f6-c187-4d9e-8b34-9075b3adba92', 'Auth:1'),
('94c818f6-c3bc-4ac1-bc3b-9c0320ecd059', 'Auth:1'),
('94c818f6-c626-4268-b23b-7b59481ef403', 'Auth:1'),
('94c818f6-ca35-4d6f-a400-5b01a5689f47', 'Auth:1'),
('94c818f6-cd8f-4a80-8b6e-58623823aec9', 'App\\Models\\Warehouse'),
('94c818f6-cd8f-4a80-8b6e-58623823aec9', 'Auth:1'),
('94c818f6-cea3-4f9e-985e-c679bd4cd461', 'Auth:1'),
('94c818f6-d2b1-4db0-b7f6-10c47e10f9cf', 'Auth:1'),
('94c818f6-d3ac-4966-bd7b-554dd7f8d792', 'Auth:1'),
('94c818f6-d447-4201-96e5-ee8eaac99546', 'Auth:1'),
('94c818f6-d4e4-4b3d-bcc6-95fdd55bda6a', 'Auth:1'),
('94c818f6-e131-4f4c-b339-1a9719c453d0', 'Auth:1'),
('94c81913-238c-46c9-b5cd-213cd0c0ade0', 'App\\Models\\User'),
('94c81913-760b-423a-85d3-593ebd335517', 'Auth:1'),
('94c81914-2053-4fed-9633-6c7532666171', 'App\\Models\\User'),
('94c81914-22b1-42d0-877e-1c8d6f90b861', 'Auth:1'),
('94c81914-25e3-483e-bf95-e475943d2f12', 'Auth:1'),
('94c81914-2761-42d6-a3e2-fd44a117aa28', 'Auth:1'),
('94c81914-2761-42d6-a3e2-fd44a117aa28', 'Spatie\\Permission\\Models\\Permission'),
('94c81914-27e5-4c76-beeb-a42643354428', 'Auth:1'),
('94c81914-2ac0-406e-ba61-7fe25375625c', 'Auth:1'),
('94c81914-2cc0-46b2-a731-822098c5ae17', 'Auth:1'),
('94c81914-2e81-4b09-978c-f14f14031531', 'Auth:1'),
('94c81914-329c-49af-96e1-e03082788ac2', 'Auth:1'),
('94c81914-3499-41f3-b2ae-7f1f54f46451', 'Auth:1'),
('94c81914-35f2-4849-88af-bac2c77c5d29', 'Auth:1'),
('94c81914-393c-460d-8ba1-8cb72eb9074c', 'Auth:1'),
('94c81914-3c3a-483f-ab41-8b9c0ab1dc14', 'Auth:1'),
('94c81914-420f-405c-9575-5d1ee6157e93', 'Auth:1'),
('94c81914-43ed-4b78-9779-5a492606b9cd', 'App\\Models\\Warehouse'),
('94c81914-43ed-4b78-9779-5a492606b9cd', 'Auth:1'),
('94c81914-44f2-4e59-bf77-e27744b1cdc1', 'Auth:1'),
('94c81914-47af-4906-9eb6-16ab4653fc2a', 'Auth:1'),
('94c81914-482f-4bfb-a45f-b7259d76c2ab', 'Auth:1'),
('94c81914-48e2-477c-af8a-1af8b740b6c9', 'Auth:1'),
('94c81914-49e5-4111-9a22-eaa521118291', 'Auth:1'),
('94c81914-585a-425f-9599-ee3daecd367f', 'Auth:1'),
('94c81924-d641-45a9-837e-3326f6e35d4c', 'App\\Models\\User'),
('94c81924-d963-4296-bf05-a92873528c76', 'Auth:1'),
('94c81924-e081-4718-89c6-9ca12c88fefe', 'Auth:1'),
('94c81924-e34d-479b-a391-32dcffcfd8de', 'Auth:1'),
('94c81924-e830-40fa-8c37-a8498b3bea3f', 'Auth:1'),
('94c81924-eb53-4765-9723-8cc1b6261969', 'Auth:1'),
('94c81924-eda1-4c74-af85-e9fef3d569e0', 'App\\Models\\CustomRole'),
('94c81924-eda1-4c74-af85-e9fef3d569e0', 'Auth:1'),
('94c81924-ee98-456c-9f02-306fcbb45a79', 'Auth:1'),
('94c81924-efee-4d47-9aeb-aa792f843065', 'Auth:1'),
('94c81924-efee-4d47-9aeb-aa792f843065', 'Spatie\\Permission\\Models\\Permission'),
('94c81924-f4a7-47f7-9496-a1bcd64c8806', 'Auth:1'),
('94c81924-f52e-47dc-a3ba-ec0fbccc4f07', 'Auth:1'),
('94c81924-f7a9-4aa1-9be3-a52bd697c6df', 'Auth:1'),
('94c81924-f89d-4cd4-8977-7805bff6b9db', 'Auth:1'),
('94c81924-fa72-4ffc-80c1-1f7791bd4d3c', 'Auth:1'),
('94c81924-fc9e-4402-b2f7-e3d30aaafaf1', 'Auth:1'),
('94c81924-ff20-43e7-8847-cbbc09c8fb74', 'Auth:1'),
('94c81925-0176-40e6-8f57-f050df610a41', 'Auth:1'),
('94c81925-02e4-4583-ac9b-9cd718dffe2b', 'App\\Models\\Warehouse'),
('94c81925-02e4-4583-ac9b-9cd718dffe2b', 'Auth:1'),
('94c81925-0368-4868-bc82-cd35ba9df60c', 'Auth:1'),
('94c81925-04a3-4d48-a745-a463da149b3f', 'Auth:1'),
('94c81925-0567-4d5d-964e-fa8dd9484688', 'Auth:1'),
('94c81925-0686-40d0-bb32-411b76e46659', 'Auth:1'),
('94c81925-077c-4fc7-8097-322bd507b122', 'Auth:1'),
('94c81925-16f5-4469-b004-91452e4e7a68', 'Auth:1'),
('94c8192b-a757-4af9-bc3f-bfd6756fe1a7', 'App\\Models\\User'),
('94c8192b-aaec-490d-b843-501d0f6278ef', 'Auth:1'),
('94c8192b-ad56-4298-962e-073c62bf9620', 'Auth:1'),
('94c8192b-afbc-43ee-8137-e96ca96362b0', 'Auth:1'),
('94c8192b-afbc-43ee-8137-e96ca96362b0', 'Spatie\\Permission\\Models\\Permission'),
('94c8192b-b065-414d-a1a4-27d3aff34160', 'Auth:1'),
('94c8192b-b260-4fff-8529-a9d9350947b2', 'Auth:1'),
('94c8192b-b464-4de1-beaf-67ba3a96ceb7', 'Auth:1'),
('94c8192b-b715-4332-9999-e9c186f2be77', 'Auth:1'),
('94c8192b-b9c6-414b-8252-336c23a2b801', 'Auth:1'),
('94c8192b-bc99-40c7-99df-9efbcbc8310b', 'Auth:1'),
('94c8192b-bd4b-449d-b92f-3e284f64ae87', 'Auth:1'),
('94c8192b-bf8f-4346-a3a4-f1c3a1a3b5ad', 'Auth:1'),
('94c8192b-c136-421e-8506-989528a1f41f', 'Auth:1'),
('94c8192b-c642-48c6-bf90-7bdf4003a907', 'Auth:1'),
('94c8192b-c784-4ecc-b310-725350f27cca', 'App\\Models\\Warehouse'),
('94c8192b-c784-4ecc-b310-725350f27cca', 'Auth:1'),
('94c8192b-c83d-4a8f-b5ff-43732c25b4ac', 'Auth:1'),
('94c8192b-cac4-4a26-9e4a-042b67689744', 'Auth:1'),
('94c8192b-cb2a-4096-9562-871c524adb43', 'Auth:1'),
('94c8192b-cc48-4c3e-b452-e9793fb54c35', 'Auth:1'),
('94c8192b-cd36-4d29-9f7a-99520c8f8d06', 'Auth:1'),
('94c8192b-dcbb-494d-9f37-42999108cb37', 'Auth:1'),
('94c81980-30a6-41a6-93a7-f6306b6514c2', 'App\\Models\\User'),
('94c81980-32a3-4917-9210-ca098f11c25f', 'Auth:1'),
('94c81980-35b1-4b8f-800d-a59889901cbd', 'Auth:1'),
('94c81980-37bf-4849-96bc-930126af7cf4', 'Auth:1'),
('94c81980-37bf-4849-96bc-930126af7cf4', 'Spatie\\Permission\\Models\\Permission'),
('94c81980-386b-43bc-9e95-d86c877c81bf', 'Auth:1'),
('94c81980-3b51-4c16-9501-2ceb6ef7d2f3', 'Auth:1'),
('94c81980-3e8e-4f02-b6d0-6ca3f21e8b04', 'Auth:1'),
('94c81980-4076-4303-b23a-428b2b99b2d3', 'Auth:1'),
('94c81980-4424-4041-bc00-c7afcad8d8e1', 'Auth:1'),
('94c81980-494e-4a1c-825c-835b99a4dc10', 'Auth:1'),
('94c81980-4a45-4924-8caa-89e57909d40a', 'Auth:1'),
('94c81980-4c94-40e7-88f3-9108840ee100', 'Auth:1'),
('94c81980-4e5a-4084-8066-0d8a7c14863b', 'Auth:1'),
('94c81980-532d-4559-b90a-23b1839a6b01', 'Auth:1'),
('94c81980-54a8-4a7d-8543-c4de3c9efd02', 'App\\Models\\Warehouse'),
('94c81980-54a8-4a7d-8543-c4de3c9efd02', 'Auth:1'),
('94c81980-55a0-4ea5-b300-3eb70421608c', 'Auth:1'),
('94c81980-586b-45dd-836e-c2f1e8305db1', 'Auth:1'),
('94c81980-591b-4c04-9471-66fed4923150', 'Auth:1'),
('94c81980-59ab-407e-ada3-4a834f4b4cef', 'Auth:1'),
('94c81980-5a66-48cd-91b1-6b5ba0b9152c', 'Auth:1'),
('94c81980-6506-4bd9-81a3-bb6854586287', 'Auth:1'),
('94c819a0-7e63-4272-bf32-09299b535dd7', 'App\\Models\\User'),
('94c819a0-9878-4510-b484-3c04d3179df9', 'Auth:1'),
('94c819a0-9a6b-4ebd-8993-da06245c8750', 'Auth:1'),
('94c819a0-9d9d-40ae-954b-051760b1734f', 'Auth:1'),
('94c819a0-a072-4e5d-9e9e-b02aafce1959', 'Auth:1'),
('94c819a0-a072-4e5d-9e9e-b02aafce1959', 'Spatie\\Permission\\Models\\Role:6'),
('94c819a0-a2fc-403e-a350-9acfad676d47', 'Auth:1'),
('94c819a0-a595-4d2c-a0f2-2b560313acc0', 'Auth:1'),
('94c819a0-a6dd-43c7-980d-d123ea29bfe7', 'Auth:1'),
('94c819a0-a93c-44a6-9000-e155cb11250a', 'Auth:1'),
('94c819a0-a93c-44a6-9000-e155cb11250a', 'Spatie\\Permission\\Models\\Permission'),
('94c819a0-ad0a-4c86-8010-423f177cf107', 'Auth:1'),
('94c819a0-aeb2-4936-b229-d626fcad5cee', 'Auth:1'),
('94c819a0-aeb2-4936-b229-d626fcad5cee', 'Spatie\\Permission\\Models\\Role'),
('94c819a0-bad2-4348-ab82-3de70cf3907e', 'Auth:1'),
('94c819a0-bdaa-456a-9365-6b5e623d22c5', 'Auth:1'),
('94c819a0-bf3b-45e6-8ea5-924cb439b495', 'Auth:1'),
('94c819a0-c0eb-4896-955a-35605104dd5d', 'Auth:1'),
('94c819a0-c30d-4e6a-b863-57f622006d3d', 'Auth:1'),
('94c819a0-c514-4665-8e6a-af2cc013aeda', 'Auth:1'),
('94c819a0-c6c8-4094-b9d6-9ef8401bf88d', 'Auth:1'),
('94c819a0-cac1-44e9-977c-d7508403ee08', 'Auth:1'),
('94c819a0-cc74-46bd-bb01-99624574edde', 'Auth:1'),
('94c819a0-cf39-4a42-a4c6-a7880fd3200a', 'Auth:1'),
('94c819a0-d192-4081-9afd-0c08ca08becd', 'Auth:1'),
('94c819a0-d426-4aa3-8f6d-69ec6667bf77', 'Auth:1'),
('94c819a0-ee0a-483f-8a16-844ad72ec7fc', 'Auth:1'),
('94c819a1-9187-47d7-bdb3-a353b73155e6', 'App\\Models\\User'),
('94c819a1-947d-47ac-ae4a-54408fb1955a', 'Auth:1'),
('94c819a1-970c-43f8-bc95-6a3d5885a91c', 'Auth:1'),
('94c819a1-9906-4d11-bb51-e60511661fe1', 'Auth:1'),
('94c819a1-9906-4d11-bb51-e60511661fe1', 'Spatie\\Permission\\Models\\Permission'),
('94c819a1-99d7-44eb-a4d2-f7833e8bd4db', 'Auth:1'),
('94c819a1-9c6a-4df4-adea-d7496a188604', 'Auth:1'),
('94c819a1-9e6a-4fe4-854e-f8b1848f9a29', 'Auth:1'),
('94c819a1-a075-4a9c-95a0-8c7cd0b53ead', 'Auth:1'),
('94c819a1-a3c8-40eb-8fe2-14ba59222f04', 'Auth:1'),
('94c819a1-a6b5-4f8c-888d-6f2bb762ecde', 'Auth:1'),
('94c819a1-a7ae-40f1-9e7a-e133bde4bf1d', 'Auth:1'),
('94c819a1-a98c-420f-a9f6-1c46ba4719a5', 'Auth:1'),
('94c819a1-ab8e-419f-83a4-878e1006be9e', 'Auth:1'),
('94c819a1-afef-4f48-a8c8-7eb876aadf30', 'Auth:1'),
('94c819a1-b157-4f57-90ba-2b6186e48e59', 'App\\Models\\Warehouse'),
('94c819a1-b157-4f57-90ba-2b6186e48e59', 'Auth:1'),
('94c819a1-b2af-4dda-a7dc-b30f2ecf6a52', 'Auth:1'),
('94c819a1-b5f6-4da2-9fdf-9f772ee55530', 'Auth:1'),
('94c819a1-b675-4376-9fc6-38dca85690cc', 'Auth:1'),
('94c819a1-b713-46b3-80cd-929b9ea62037', 'Auth:1'),
('94c819a1-b7fb-41d8-af4c-8f32df916e6c', 'Auth:1'),
('94c819a1-c57e-48f4-8d61-68c200ce70f3', 'Auth:1'),
('94c819a7-b70a-47ed-9b5f-34e29fbc56ce', 'App\\Models\\User'),
('94c819a7-b95a-4ba6-9582-1bef74beeeba', 'Auth:1'),
('94c819a7-c154-4e0a-856f-6803634596af', 'Auth:1'),
('94c819a7-c453-4cc5-9638-d6b45f03aad0', 'Auth:1'),
('94c819a7-c815-452c-8703-053aa433689b', 'Auth:1'),
('94c819a7-cb1b-470b-b3ac-865118da8e50', 'Auth:1'),
('94c819a7-cd3e-49f4-b780-5ffccf4e1872', 'App\\Models\\CustomRole'),
('94c819a7-cd3e-49f4-b780-5ffccf4e1872', 'Auth:1'),
('94c819a7-cecd-45ee-8a64-29ccf8ce908d', 'Auth:1'),
('94c819a7-d02f-4d3c-b15b-bda66d81ae3c', 'Auth:1'),
('94c819a7-d02f-4d3c-b15b-bda66d81ae3c', 'Spatie\\Permission\\Models\\Permission'),
('94c819a7-d3b4-4a79-806d-a4222d7408dc', 'Auth:1'),
('94c819a7-d46e-4cbe-a203-1631c8703003', 'Auth:1'),
('94c819a7-d742-44f8-8d5d-8cb3f9614a24', 'Auth:1'),
('94c819a7-d7e8-4884-9e8a-f513416658da', 'Auth:1'),
('94c819a7-d8f0-40a4-a95f-c0775641f142', 'Auth:1'),
('94c819a7-db46-4969-85bb-f4b08ca4750e', 'Auth:1'),
('94c819a7-dcee-4bae-a91e-66d2ce941560', 'Auth:1'),
('94c819a7-de67-49aa-b6fd-9e8642abdbc2', 'Auth:1'),
('94c819a7-e021-4d79-b272-5995474bd84f', 'App\\Models\\Warehouse'),
('94c819a7-e021-4d79-b272-5995474bd84f', 'Auth:1'),
('94c819a7-e0c9-42c4-848c-91fb9d114e3a', 'Auth:1'),
('94c819a7-e208-4f9c-980d-a5d511c0b91a', 'Auth:1'),
('94c819a7-e28f-4786-9f8a-d9808df65c57', 'Auth:1'),
('94c819a7-e342-4cc0-bdaa-6c43accdb63b', 'Auth:1'),
('94c819a7-e3eb-4a6f-95a4-0d4d31c49480', 'Auth:1'),
('94c819a7-ee1a-409b-9fa4-00ac41a81400', 'Auth:1'),
('94c819b9-29a6-4844-893f-29264de2ceed', 'App\\Models\\User'),
('94c819b9-2da5-4739-9eea-4710883272ff', 'Auth:1'),
('94c819b9-3006-4066-a4b1-227cd2b90567', 'Auth:1'),
('94c819b9-326f-42ab-aed7-33000cf7f0f9', 'Auth:1'),
('94c819b9-326f-42ab-aed7-33000cf7f0f9', 'Spatie\\Permission\\Models\\Role'),
('94c819b9-33cc-4e8c-81f1-e2cb4809de6e', 'Auth:1'),
('94c819b9-36dc-4fdf-b504-38f4e25cf8a2', 'Auth:1'),
('94c819b9-3943-4cc8-8cd4-54c8763138f9', 'Auth:1'),
('94c819b9-3943-4cc8-8cd4-54c8763138f9', 'Spatie\\Permission\\Models\\Permission'),
('94c819b9-3a13-4b69-baaa-d6aa63a79ebc', 'Auth:1'),
('94c819b9-3d77-4df6-95a7-85873ecfdadf', 'Auth:1'),
('94c819b9-40eb-4b9a-8f38-b6e02c9be4f4', 'Auth:1'),
('94c819b9-43c7-4f75-9bb3-e6eb805d3d93', 'Auth:1'),
('94c819b9-49be-46b7-9fb7-3adf74b86f94', 'Auth:1'),
('94c819b9-51a5-4a73-8dec-c02422667d98', 'Auth:1'),
('94c819b9-560e-4664-87b7-768c33819b4d', 'Auth:1'),
('94c819b9-5a26-466a-a89b-4778256f4b3f', 'Auth:1'),
('94c819b9-5cf7-4f87-8ca8-6b0bf1ea1753', 'Auth:1'),
('94c819b9-615e-464f-8a4d-b07f02935206', 'Auth:1'),
('94c819b9-6472-4a5c-8d02-f675eae0c129', 'Auth:1'),
('94c819b9-67a4-42ae-8fe8-def6b719d566', 'Auth:1'),
('94c819b9-6dc3-4b91-bba8-fd066003915d', 'Auth:1'),
('94c819b9-6eaf-445d-91dd-18cc40ef0992', 'Auth:1'),
('94c819b9-7044-4b2d-b80d-d0bd8744fa9b', 'Auth:1'),
('94c819b9-742d-41c8-be81-59f17cc4575d', 'Auth:1'),
('94c819b9-7a58-4d4c-8660-33d2db3e5619', 'Auth:1'),
('94c819b9-7c0e-4231-898b-c39c23b7940f', 'App\\Models\\Warehouse'),
('94c819b9-7c0e-4231-898b-c39c23b7940f', 'Auth:1'),
('94c819b9-7ced-4208-aeec-6f8f301b3c2a', 'Auth:1'),
('94c819b9-8078-435e-bdf3-732769c03eec', 'Auth:1'),
('94c819b9-80ff-4ede-a90b-51bb6709ae06', 'Auth:1'),
('94c819b9-81d0-4964-988a-7444107b03ed', 'Auth:1'),
('94c819b9-82ac-4ed8-be8c-e563f3232e88', 'Auth:1'),
('94c819b9-9dfc-40af-b7ed-69df3124d4a0', 'Auth:1'),
('94c819c2-430c-41d9-a71a-933f93330e27', 'App\\Models\\User'),
('94c819c2-4c65-432a-8bcc-c1bd786ada44', 'Auth:1'),
('94c819c2-4f7b-4f78-9966-11e3e348d28e', 'Auth:1'),
('94c819c2-5148-4ad2-b2f7-1aa9e2a2ee03', 'Auth:1'),
('94c819c2-5148-4ad2-b2f7-1aa9e2a2ee03', 'Spatie\\Permission\\Models\\Role'),
('94c819c2-57e1-4ad0-a966-945f1d602023', 'Auth:1'),
('94c819c2-66af-4bb4-aee7-b757ecbf466a', 'Auth:1'),
('94c819c2-6ab5-485a-ac11-979dd6c5fe77', 'Auth:1'),
('94c819c2-6c69-4158-943f-f0fe8f6d90bd', 'Auth:1'),
('94c819c2-6ed9-497d-b8c7-60371efa4ad8', 'Auth:1'),
('94c819c2-6ed9-497d-b8c7-60371efa4ad8', 'Spatie\\Permission\\Models\\Permission'),
('94c819c2-70c1-489f-bd12-e9e7980e8ccf', 'Auth:1'),
('94c819c2-78e7-4805-99dc-6278ef2fb5a3', 'Auth:1'),
('94c819c2-7c26-4acf-94c8-35175a483f6e', 'Auth:1'),
('94c819c2-7efd-4c29-b125-fb02de823163', 'Auth:1'),
('94c819c2-8200-4886-9791-3030aec5911e', 'Auth:1'),
('94c819c2-84e0-4fb1-aa92-f1d9b6adcd04', 'Auth:1'),
('94c819c2-879c-4167-8d0d-ed00d505b360', 'Auth:1'),
('94c819c2-89f4-4c5a-9e41-4c2d271ff498', 'Auth:1'),
('94c819c2-8bfb-491e-a9ed-7332c7de0332', 'Auth:1'),
('94c819c2-8e56-4186-a4e9-651872bc7b42', 'Auth:1'),
('94c819c2-9142-49a1-8794-18f8ecd5387f', 'Auth:1'),
('94c819c2-b2ca-4ed8-9110-3ccaebeb8d5d', 'Auth:1'),
('94c819c3-72f6-4b3d-b436-045767610736', 'App\\Models\\User'),
('94c819c3-76b6-41a4-a000-f610c550cfcc', 'Auth:1'),
('94c819c3-7944-45ff-a0d3-270ae9ec996a', 'Auth:1'),
('94c819c3-7b4c-4c7c-a472-0bd7f7e9e92b', 'Auth:1'),
('94c819c3-7b4c-4c7c-a472-0bd7f7e9e92b', 'Spatie\\Permission\\Models\\Role'),
('94c819c3-7c45-42b7-bec3-0af5cdeadb4b', 'Auth:1'),
('94c819c3-7e85-47e2-8dff-c41636b738a3', 'Auth:1'),
('94c819c3-7ffd-41ab-b3f6-260535cab807', 'Auth:1'),
('94c819c3-7ffd-41ab-b3f6-260535cab807', 'Spatie\\Permission\\Models\\Permission'),
('94c819c3-8091-4c8f-9cdb-4debffbdbb38', 'Auth:1'),
('94c819c3-8260-47ee-81d7-e2a731becf9b', 'Auth:1'),
('94c819c3-8489-4a7e-b05e-889553ef37e8', 'Auth:1'),
('94c819c3-86bd-4e46-88b8-25a976d13198', 'Auth:1'),
('94c819c3-8a42-435e-970a-bda29aa15abb', 'Auth:1'),
('94c819c3-90dc-44a5-8e3e-98a78e7dec02', 'Auth:1'),
('94c819c3-94ff-4e2b-9cc3-85833b96a4f7', 'Auth:1'),
('94c819c3-9869-477e-98a1-d5039998cbd2', 'Auth:1'),
('94c819c3-9bb0-40b4-aa3f-6eb3cf96ea5f', 'Auth:1'),
('94c819c3-9ec2-4d90-bb5e-a3599fe32b17', 'Auth:1'),
('94c819c3-a0eb-46ad-9828-14af7ee103ab', 'Auth:1'),
('94c819c3-a349-4d3b-9bb3-25f17d9d3c56', 'Auth:1'),
('94c819c3-a775-4344-b863-46cdb4671e28', 'Auth:1'),
('94c819c3-a878-47f7-a030-b13638e726e1', 'Auth:1'),
('94c819c3-a9df-45ec-a188-1c11cd3d8dd6', 'Auth:1'),
('94c819c3-abfc-47cd-a2f1-58d0c798caf1', 'Auth:1'),
('94c819c3-b02e-4429-9d8d-6d250aafdd09', 'Auth:1'),
('94c819c3-b1d9-4b1f-92a7-38faff3f004d', 'App\\Models\\Warehouse'),
('94c819c3-b1d9-4b1f-92a7-38faff3f004d', 'Auth:1'),
('94c819c3-b2c2-4f1d-9f33-3967fea8ecb9', 'Auth:1'),
('94c819c3-b594-40e8-8210-f2c99faaee7f', 'Auth:1'),
('94c819c3-b62a-40f3-8921-9fa4ed8534ce', 'Auth:1'),
('94c819c3-b6d5-4b5a-b4e6-9c19742668b5', 'Auth:1'),
('94c819c3-b7cf-46e7-9e0d-021506c4cf1f', 'Auth:1'),
('94c819c3-c510-4611-8535-67032cfdb7a4', 'Auth:1'),
('94c819d0-07e2-43e6-b6af-03823c541fcd', 'App\\Models\\User'),
('94c819d0-0a36-4eaf-8506-4060be9408e8', 'Auth:1'),
('94c819d0-1259-4c0d-9a67-a4fecc4e220e', 'Auth:1'),
('94c819d0-15b3-46b0-a12b-954608df2dd9', 'Auth:1'),
('94c819d0-19af-4907-a02e-8283fa18de30', 'Auth:1'),
('94c819d0-1d62-425c-a5c8-6263a7c7cd6f', 'Auth:1'),
('94c819d0-2083-4b76-b5bb-117a3dda1e87', 'App\\Models\\CustomRole'),
('94c819d0-2083-4b76-b5bb-117a3dda1e87', 'Auth:1'),
('94c819d0-2309-41f9-a99c-249c1f1f9727', 'Auth:1'),
('94c819d0-2506-4e52-87c7-979db7c5dd9c', 'Auth:1'),
('94c819d0-2506-4e52-87c7-979db7c5dd9c', 'Spatie\\Permission\\Models\\Permission'),
('94c819d0-29ea-4a56-9968-9a3466bef415', 'Auth:1'),
('94c819d0-2aa2-4882-94f3-f38fca409131', 'Auth:1'),
('94c819d0-2d21-4b79-aacd-2d450a9112a9', 'Auth:1'),
('94c819d0-2d99-4848-af62-9a881b92e312', 'Auth:1'),
('94c819d0-2f72-43bf-8f92-f5f5c95d29a0', 'Auth:1'),
('94c819d0-31e5-4a63-83f2-5333c951535f', 'Auth:1'),
('94c819d0-33b5-4e13-b28c-8d966b96d3f6', 'Auth:1'),
('94c819d0-35e8-48b8-9a91-4ffd2409267d', 'Auth:1'),
('94c819d0-3755-4286-b5c6-6e8503503b3c', 'App\\Models\\Warehouse'),
('94c819d0-3755-4286-b5c6-6e8503503b3c', 'Auth:1'),
('94c819d0-3823-408c-b8b7-e9eae3e7dbe5', 'Auth:1'),
('94c819d0-396b-40c1-88a0-cf855f095024', 'Auth:1'),
('94c819d0-39e3-40d7-b677-5778551fe90e', 'Auth:1'),
('94c819d0-3aaf-47bf-b907-54f72a2cc622', 'Auth:1'),
('94c819d0-3c47-4ca1-b4ed-720ee4d3ed86', 'Auth:1'),
('94c819d0-479f-49de-9312-249d39854278', 'Auth:1');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `to_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_details`
--

CREATE TABLE `transfer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `shortcut`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'P', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(2, 'Kilogram', 'KG', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(3, 'Gram', 'G', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(4, 'Liter', 'L', '2021-11-01 20:32:38', '2021-11-01 20:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `used`
--

CREATE TABLE `used` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `designation`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mahfuzur Rahman Saber', 'Developer', 'saaberdev', 'saaberdev@gmail.com', '2021-11-01 20:32:38', '$2y$10$/iCaO9llAUuxUriDY7.t0ukeuuAHw9kIprZ1hF4NRs/3puCvFoscy', 'uSxM1FyNnvcIpGUD4fCaXMnkwPrfnn3DfhOiKQanMfOHMB9RGpDBMHmDRoh5zUqP', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(2, 'Admin', 'Admin', 'admin', 'admin@gmail.com', '2021-11-01 20:32:38', '$2y$10$nQITAPDXXMpIValwqAuv6eEl7mgVxTR1HZfpjKQ24wnqsDKLRLyGm', 'wULfi38eX01oDTivWvqimyVGoxFc1YJRC27RGP9WUrqnaF8wmkYcVqjvgqOchOye', '2021-11-01 20:32:38', '2021-11-01 20:32:38'),
(3, 'Manager', 'Manager', 'manager', 'manager@gmail.com', '2021-11-01 20:32:38', '$2y$10$mKxyw3Mhq5MUHyTJKvJ0Muvp1Yg0ZpvHvrjdLPmp3Ef27UoLT/my6', 'KJLYwauiP3rxCGaz67QrUER3q9z6FqgpepMEDtRN4i0bE8GsZwuJ8SgtPD0M49Sf', '2021-11-01 20:32:38', '2021-11-01 20:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `position`, `name`, `shortcut`, `icon`, `created_at`, `updated_at`) VALUES
(1, 1, 'Purchase', 'PUR', 'fas fa-truck-loading', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(2, 2, 'Finished Goods', 'S', 'fas fa-shopping-bag', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(3, 3, 'Cutting Unit', 'CU', 'fas fa-cut', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(4, 4, 'Sewing Unit', 'SW', 'fas fa-tools', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(5, 5, 'PU Unit', 'PU', 'fas fa-cubes', '2021-11-01 20:32:39', '2021-11-01 20:32:39'),
(6, 6, 'CDC', 'CDC', 'fas fa-people-carry', '2021-11-01 20:32:39', '2021-11-01 20:32:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`);

--
-- Indexes for table `damaged`
--
ALTER TABLE `damaged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damaged_product_id_foreign` (`product_id`),
  ADD KEY `damaged_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `damaged_items`
--
ALTER TABLE `damaged_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damaged_item_details`
--
ALTER TABLE `damaged_item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damaged_item_details_damaged_item_id_index` (`damaged_item_id`),
  ADD KEY `damaged_item_details_warehouse_id_index` (`warehouse_id`),
  ADD KEY `damaged_item_details_product_id_index` (`product_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_product_type_id_index` (`product_type_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_types_shortcut_unique` (`shortcut`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_code_unique` (`code`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_index` (`purchase_id`),
  ADD KEY `purchase_details_product_id_index` (`product_id`),
  ADD KEY `purchase_details_warehouse_id_index` (`warehouse_id`);

--
-- Indexes for table `released_products`
--
ALTER TABLE `released_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `released_products_code_unique` (`code`),
  ADD KEY `released_products_from_warehouse_id_index` (`from_warehouse_id`),
  ADD KEY `released_products_product_id_index` (`product_id`);

--
-- Indexes for table `released_product_details`
--
ALTER TABLE `released_product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `released_product_details_released_product_id_index` (`released_product_id`),
  ADD KEY `released_product_details_product_id_index` (`product_id`);

--
-- Indexes for table `returned_items`
--
ALTER TABLE `returned_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returned_items_supplier_id_index` (`supplier_id`),
  ADD KEY `returned_items_client_id_index` (`client_id`);

--
-- Indexes for table `returned_item_details`
--
ALTER TABLE `returned_item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returned_item_details_returned_item_id_index` (`returned_item_id`),
  ADD KEY `returned_item_details_warehouse_id_index` (`warehouse_id`),
  ADD KEY `returned_item_details_product_id_index` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_code_unique` (`code`),
  ADD KEY `sales_client_id_foreign` (`client_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_index` (`sale_id`),
  ADD KEY `sale_details_product_id_index` (`product_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_product_id_foreign` (`product_id`),
  ADD KEY `stock_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_code_unique` (`code`),
  ADD KEY `transfers_from_warehouse_id_index` (`from_warehouse_id`),
  ADD KEY `transfers_to_warehouse_id_index` (`to_warehouse_id`);

--
-- Indexes for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_details_transfer_id_index` (`transfer_id`),
  ADD KEY `transfer_details_product_id_index` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_shortcut_unique` (`shortcut`);

--
-- Indexes for table `used`
--
ALTER TABLE `used`
  ADD PRIMARY KEY (`id`),
  ADD KEY `used_product_id_foreign` (`product_id`),
  ADD KEY `used_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`),
  ADD UNIQUE KEY `warehouses_shortcut_unique` (`shortcut`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `damaged`
--
ALTER TABLE `damaged`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damaged_items`
--
ALTER TABLE `damaged_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damaged_item_details`
--
ALTER TABLE `damaged_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `released_products`
--
ALTER TABLE `released_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `released_product_details`
--
ALTER TABLE `released_product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returned_items`
--
ALTER TABLE `returned_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returned_item_details`
--
ALTER TABLE `returned_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_details`
--
ALTER TABLE `transfer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `used`
--
ALTER TABLE `used`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `damaged`
--
ALTER TABLE `damaged`
  ADD CONSTRAINT `damaged_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `damaged_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `damaged_item_details`
--
ALTER TABLE `damaged_item_details`
  ADD CONSTRAINT `damaged_item_details_damaged_item_id_foreign` FOREIGN KEY (`damaged_item_id`) REFERENCES `damaged_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `damaged_item_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `damaged_item_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_product_type_id_foreign` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `released_products`
--
ALTER TABLE `released_products`
  ADD CONSTRAINT `released_products_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `released_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `released_product_details`
--
ALTER TABLE `released_product_details`
  ADD CONSTRAINT `released_product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `released_product_details_released_product_id_foreign` FOREIGN KEY (`released_product_id`) REFERENCES `released_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `returned_items`
--
ALTER TABLE `returned_items`
  ADD CONSTRAINT `returned_items_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `returned_items_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `returned_item_details`
--
ALTER TABLE `returned_item_details`
  ADD CONSTRAINT `returned_item_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `returned_item_details_returned_item_id_foreign` FOREIGN KEY (`returned_item_id`) REFERENCES `returned_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `returned_item_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `transfers_to_warehouse_id_foreign` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD CONSTRAINT `transfer_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transfer_details_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `used`
--
ALTER TABLE `used`
  ADD CONSTRAINT `used_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `used_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
