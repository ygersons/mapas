-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-04-2024 a las 17:47:51
-- Versión del servidor: 10.6.17-MariaDB
-- Versión de PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ixocakuy_mapas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_access_log`
--

CREATE TABLE `sml_access_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_access_log`
--

INSERT INTO `sml_access_log` (`id`, `id_map`, `date_time`) VALUES
(4, 1, '2023-10-03 20:22:19'),
(5, 1, '2023-10-03 20:25:39'),
(6, 2, '2023-10-03 20:34:21'),
(7, 1, '2023-10-03 21:16:22'),
(8, 1, '2023-10-03 21:16:57'),
(9, 1, '2023-10-03 21:17:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_assign_maps`
--

CREATE TABLE `sml_assign_maps` (
  `id_user` int(11) UNSIGNED DEFAULT NULL,
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `edit_map` tinyint(1) NOT NULL DEFAULT 1,
  `create_markers` tinyint(1) NOT NULL DEFAULT 1,
  `edit_markers` tinyint(1) NOT NULL DEFAULT 1,
  `delete_markers` tinyint(1) NOT NULL DEFAULT 0,
  `connections` tinyint(1) NOT NULL DEFAULT 1,
  `geometries` tinyint(1) NOT NULL DEFAULT 1,
  `story` tinyint(1) NOT NULL DEFAULT 1,
  `categories` tinyint(1) NOT NULL DEFAULT 1,
  `icons_library` tinyint(1) NOT NULL DEFAULT 1,
  `review` tinyint(1) NOT NULL DEFAULT 1,
  `publish` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_categories`
--

CREATE TABLE `sml_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `default_selected` tinyint(1) NOT NULL DEFAULT 0,
  `id_category_parent` bigint(20) UNSIGNED DEFAULT NULL,
  `markers_size` float NOT NULL DEFAULT 1.1,
  `markers_color_hex` varchar(20) NOT NULL DEFAULT '',
  `markers_icon_color_hex` varchar(20) NOT NULL DEFAULT '#ffffff',
  `markers_icon` varchar(50) DEFAULT NULL,
  `markers_id_icon_library` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_categories`
--

INSERT INTO `sml_categories` (`id`, `id_map`, `name`, `default_selected`, `id_category_parent`, `markers_size`, `markers_color_hex`, `markers_icon_color_hex`, `markers_icon`, `markers_id_icon_library`) VALUES
(6, 1, 'Municipalidades', 0, NULL, 1.1, '', '#ffffff', NULL, 0),
(7, 1, 'Iglesias', 0, NULL, 1.1, '', '#ffffff', NULL, 0),
(8, 1, 'Mercados', 0, NULL, 1.1, '', '#ffffff', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_icons`
--

CREATE TABLE `sml_icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_icons`
--

INSERT INTO `sml_icons` (`id`, `id_map`, `image`) VALUES
(2, 1, 'icon_1696381863307.png'),
(3, 1, 'icon_1696381904358.png'),
(4, 1, 'icon_1696381938115.jpg'),
(5, 1, 'icon_1696381981352.png'),
(6, 1, 'icon_1696381999066.png'),
(7, 1, 'icon_1696382031863.jpeg'),
(8, 1, 'icon_1696382050685.png'),
(9, 1, 'icon_1696382078004.jpeg'),
(10, 1, 'icon_1696382129451.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_images`
--

CREATE TABLE `sml_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_marker` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_maps`
--

CREATE TABLE `sml_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `date_created` date NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `main_color_hex` varchar(20) NOT NULL DEFAULT '#d15f00',
  `markers_size` float NOT NULL DEFAULT 1.1,
  `markers_color_hex` varchar(20) NOT NULL DEFAULT '',
  `markers_icon_color_hex` varchar(20) NOT NULL DEFAULT '#ffffff',
  `markers_icon` varchar(50) DEFAULT NULL,
  `markers_id_icon_library` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `map_style` varchar(50) NOT NULL DEFAULT 'osm_free',
  `maptiler_api` varchar(200) DEFAULT NULL,
  `ga_tracking_id` varchar(50) DEFAULT NULL,
  `friendly_url` varchar(200) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `enable_list` tinyint(1) NOT NULL DEFAULT 1,
  `enable_search` tinyint(1) NOT NULL DEFAULT 1,
  `enable_search_location` tinyint(1) NOT NULL DEFAULT 0,
  `enable_categories` tinyint(1) NOT NULL DEFAULT 1,
  `enable_story` tinyint(1) NOT NULL DEFAULT 1,
  `show_list` tinyint(1) NOT NULL DEFAULT 0,
  `default_zoom` int(11) NOT NULL DEFAULT 0,
  `selected_zoom` int(11) NOT NULL DEFAULT 18,
  `search_highlight` int(11) NOT NULL DEFAULT -1,
  `my_location_zoom` int(11) NOT NULL DEFAULT 0,
  `default_my_location` tinyint(1) NOT NULL DEFAULT 0,
  `density_color` tinyint(1) NOT NULL DEFAULT 0,
  `density_color_tolerance` int(11) NOT NULL DEFAULT 1,
  `password` varchar(200) DEFAULT NULL,
  `enable_reviews` tinyint(1) NOT NULL DEFAULT 1,
  `enable_directions` tinyint(1) NOT NULL DEFAULT 1,
  `enable_streetview` tinyint(1) NOT NULL DEFAULT 1,
  `enable_share` tinyint(1) NOT NULL DEFAULT 1,
  `language` varchar(10) DEFAULT NULL,
  `street_basemap` varchar(250) DEFAULT NULL,
  `street_attributions` varchar(500) DEFAULT NULL,
  `satellite_basemap` varchar(250) DEFAULT NULL,
  `satellite_attributions` varchar(500) DEFAULT NULL,
  `street_maxzoom` int(2) NOT NULL DEFAULT 20,
  `satellite_maxzoom` int(2) NOT NULL DEFAULT 20,
  `cluster_distance` int(11) NOT NULL DEFAULT 25,
  `cat_filter` tinyint(1) NOT NULL DEFAULT 0,
  `nav_markers` tinyint(1) NOT NULL DEFAULT 1,
  `enable_add_marker` tinyint(1) NOT NULL DEFAULT 0,
  `font_viewer` varchar(50) DEFAULT 'Roboto',
  `sheet_detail` tinyint(1) NOT NULL DEFAULT 1,
  `default_view` enum('street','satellite') DEFAULT 'street',
  `quality` enum('low','medium','high') DEFAULT 'medium',
  `order_by` enum('priority','name','city') DEFAULT 'priority',
  `show_in_first_page` tinyint(1) NOT NULL DEFAULT 0,
  `geoJSON` varchar(500) DEFAULT NULL,
  `weather` enum('celsius','fahrenheit','none') DEFAULT 'celsius',
  `cat_filter_type` enum('or','and') DEFAULT 'or',
  `enable_globe` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(50) DEFAULT NULL,
  `draw_geometries` longtext DEFAULT NULL,
  `enable_popup` tinyint(1) NOT NULL DEFAULT 1,
  `popup_image_height` int(11) NOT NULL DEFAULT 60,
  `popup_background` varchar(20) NOT NULL DEFAULT '#ffffff',
  `popup_color` varchar(20) NOT NULL DEFAULT '#000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_maps`
--

INSERT INTO `sml_maps` (`id`, `id_user`, `date_created`, `name`, `code`, `logo`, `main_color_hex`, `markers_size`, `markers_color_hex`, `markers_icon_color_hex`, `markers_icon`, `markers_id_icon_library`, `map_style`, `maptiler_api`, `ga_tracking_id`, `friendly_url`, `active`, `enable_list`, `enable_search`, `enable_search_location`, `enable_categories`, `enable_story`, `show_list`, `default_zoom`, `selected_zoom`, `search_highlight`, `my_location_zoom`, `default_my_location`, `density_color`, `density_color_tolerance`, `password`, `enable_reviews`, `enable_directions`, `enable_streetview`, `enable_share`, `language`, `street_basemap`, `street_attributions`, `satellite_basemap`, `satellite_attributions`, `street_maxzoom`, `satellite_maxzoom`, `cluster_distance`, `cat_filter`, `nav_markers`, `enable_add_marker`, `font_viewer`, `sheet_detail`, `default_view`, `quality`, `order_by`, `show_in_first_page`, `geoJSON`, `weather`, `cat_filter_type`, `enable_globe`, `meta_title`, `meta_description`, `meta_image`, `draw_geometries`, `enable_popup`, `popup_image_height`, `popup_background`, `popup_color`) VALUES
(1, 1, '2023-10-03', 'Municipalidad Provincial del Santa', '651caca333c09', '', '#d15f00', 1.1, '#d15f00', '#ffffff', '', 0, 'osm_free', '', '', 'mps', 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, '', '', '', '', '', 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'satellite', 'medium', 'priority', 0, '', 'celsius', 'or', 0, NULL, NULL, NULL, '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-78.594433360689,-9.074365538403313]},\"properties\":null},{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-78.59582999476574,-9.07569746139049]},\"properties\":null},{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-78.594433360689,-9.074365538403313]},\"properties\":null},{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-78.59438590229017,-9.074077735252402]},\"properties\":null},{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[-78.59582999476574,-9.07569746139049]},\"properties\":null}]}', 1, 60, '#ffffff', '#000000'),
(2, 1, '2023-10-03', 'MUNICIPALIDAD DISTRITAL DE COISHCO', '651cb13d7120a', 'logo_1696379335.png', '#93c47d', 1.1, '#d15f00', '#ffffff', '', 0, 'custom', '', '', NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, 'es_ES', '', '', '', '', 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, '', 'celsius', 'or', 1, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(3, 1, '2023-10-03', 'Urb. Los Pinos - Chimbote', '651cba0d24bea', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(4, 1, '2023-10-03', 'urb. bellamar - nuevo chimbote', '651cba1b02fcd', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(5, 1, '2023-10-03', 'PP.JJ. PPAO - NUEVO CHIMBOTE', '651cba34a7822', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(6, 1, '2023-10-03', 'PP.JJ. SAN PEDRO - CHIMBOTE', '651cba42ed3e4', '', '#d15f00', 1.1, '#d15f00', '#ffffff', '', 0, 'osm_free', '', '', NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, '', '', '', '', '', 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, '', 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(7, 1, '2023-10-03', 'CENTRO POBLADO CAMBIO PUENTE', '651cba5b5ae29', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(8, 1, '2023-10-03', 'CENTRO POBLADO SAN JACINTO', '651cba6634423', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000'),
(9, 1, '2023-10-03', 'CASERÍO VINZOS', '651cba745d269', NULL, '#d15f00', 1.1, '', '#ffffff', NULL, 0, 'osm_free', NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 0, 18, -1, 0, 0, 0, 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, 25, 0, 1, 0, 'Roboto', 1, 'street', 'medium', 'priority', 0, NULL, 'celsius', 'or', 0, NULL, NULL, NULL, NULL, 1, 60, '#ffffff', '#000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_markers`
--

CREATE TABLE `sml_markers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `website_caption` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `hours` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `extra_field_value_1` text DEFAULT NULL,
  `extra_field_icon_1` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_2` text DEFAULT NULL,
  `extra_field_icon_2` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_3` text DEFAULT NULL,
  `extra_field_icon_3` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_4` text DEFAULT NULL,
  `extra_field_icon_4` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_5` text DEFAULT NULL,
  `extra_field_icon_5` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_6` text DEFAULT NULL,
  `extra_field_icon_6` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_7` text DEFAULT NULL,
  `extra_field_icon_7` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_8` text DEFAULT NULL,
  `extra_field_icon_8` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_9` text DEFAULT NULL,
  `extra_field_icon_9` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_10` text DEFAULT NULL,
  `extra_field_icon_10` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_11` text DEFAULT NULL,
  `extra_field_icon_11` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_12` text DEFAULT NULL,
  `extra_field_icon_12` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_13` text DEFAULT NULL,
  `extra_field_icon_13` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_14` text DEFAULT NULL,
  `extra_field_icon_14` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_15` text DEFAULT NULL,
  `extra_field_icon_15` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_16` text DEFAULT NULL,
  `extra_field_icon_16` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_17` text DEFAULT NULL,
  `extra_field_icon_17` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_18` text DEFAULT NULL,
  `extra_field_icon_18` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_19` text DEFAULT NULL,
  `extra_field_icon_19` varchar(50) DEFAULT 'far fa-circle',
  `extra_field_value_20` text DEFAULT NULL,
  `extra_field_icon_20` varchar(50) DEFAULT 'far fa-circle',
  `extra_button_value_1` longtext DEFAULT NULL,
  `extra_button_icon_1` varchar(50) DEFAULT 'fas fa-info',
  `extra_button_title_1` varchar(50) DEFAULT '',
  `icon` varchar(50) DEFAULT NULL,
  `id_icon_library` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `to_validate` tinyint(1) NOT NULL DEFAULT 0,
  `view_directions` tinyint(1) NOT NULL DEFAULT 1,
  `view_review` tinyint(1) NOT NULL DEFAULT 1,
  `view_street_view` tinyint(1) NOT NULL DEFAULT 1,
  `view_share` tinyint(1) NOT NULL DEFAULT 1,
  `order` bigint(20) NOT NULL DEFAULT 0,
  `centered` tinyint(1) NOT NULL DEFAULT 0,
  `color_hex` varchar(20) NOT NULL DEFAULT '',
  `icon_color_hex` varchar(20) NOT NULL DEFAULT '#ffffff',
  `marker_size` float NOT NULL DEFAULT 0,
  `id_category` bigint(20) UNSIGNED DEFAULT NULL,
  `access_count` int(11) NOT NULL DEFAULT 0,
  `min_zoom_level` int(11) NOT NULL DEFAULT 0,
  `geofence_radius` int(11) NOT NULL DEFAULT 0,
  `geofence_color` varchar(50) NOT NULL DEFAULT 'rgba(0,0,255,0.1)',
  `open_sheet` tinyint(1) NOT NULL DEFAULT 1,
  `view_popup` tinyint(1) NOT NULL DEFAULT 1,
  `popup_image_height` int(11) NOT NULL DEFAULT 60,
  `popup_background` varchar(20) NOT NULL DEFAULT '#ffffff',
  `popup_color` varchar(20) NOT NULL DEFAULT '#000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_markers`
--

INSERT INTO `sml_markers` (`id`, `id_map`, `lat`, `lon`, `name`, `street`, `city`, `postal_code`, `country`, `website`, `website_caption`, `email`, `phone`, `whatsapp`, `hours`, `description`, `extra_field_value_1`, `extra_field_icon_1`, `extra_field_value_2`, `extra_field_icon_2`, `extra_field_value_3`, `extra_field_icon_3`, `extra_field_value_4`, `extra_field_icon_4`, `extra_field_value_5`, `extra_field_icon_5`, `extra_field_value_6`, `extra_field_icon_6`, `extra_field_value_7`, `extra_field_icon_7`, `extra_field_value_8`, `extra_field_icon_8`, `extra_field_value_9`, `extra_field_icon_9`, `extra_field_value_10`, `extra_field_icon_10`, `extra_field_value_11`, `extra_field_icon_11`, `extra_field_value_12`, `extra_field_icon_12`, `extra_field_value_13`, `extra_field_icon_13`, `extra_field_value_14`, `extra_field_icon_14`, `extra_field_value_15`, `extra_field_icon_15`, `extra_field_value_16`, `extra_field_icon_16`, `extra_field_value_17`, `extra_field_icon_17`, `extra_field_value_18`, `extra_field_icon_18`, `extra_field_value_19`, `extra_field_icon_19`, `extra_field_value_20`, `extra_field_icon_20`, `extra_button_value_1`, `extra_button_icon_1`, `extra_button_title_1`, `icon`, `id_icon_library`, `active`, `featured`, `to_validate`, `view_directions`, `view_review`, `view_street_view`, `view_share`, `order`, `centered`, `color_hex`, `icon_color_hex`, `marker_size`, `id_category`, `access_count`, `min_zoom_level`, `geofence_radius`, `geofence_color`, `open_sheet`, `view_popup`, `popup_image_height`, `popup_background`, `popup_color`) VALUES
(1, 1, '-9.074355', '-78.594418', 'MPS', 'Jirón Enrique Palacios 321, Chimbote', 'Chimbote', '02803', 'Perú', 'https://www.munisanta.gob.pe/transparencia.php', 'MPS - CHIMBOTE', 'mesadepartes@munisanta.gob.pe', '043-321331', '51994267116', '<p><br></p>', '<p><br></p>', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'fas fa-info', '', '', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, '#d15f00', '#ffffff', 0, NULL, 0, 3, 3, 'rgba(0, 0, 255, 0.1)', 1, 1, 60, '#ffffff', '#000000'),
(2, 2, '-9.023137', '-78.616125', 'Muni Coishco', 'Jr.Pacasmayo 102, Coishco - Ancash Perú', 'Coishco', '', 'Perú', 'http://www.municoishco.gob.pe/', 'Municipalidad Distrital de Coishco', 'mesadepartes@municoishco.gob.pe', '', '51930611366', '<p><br></p>', '<p><br></p>', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'far fa-circle', '', 'fas fa-info', '', '', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, '#38761d', '#ffffff', 0, NULL, 0, 8, 2, 'rgba(0, 0, 255, 0.1)', 1, 1, 60, '#ffffff', '#000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_markers_categories_assoc`
--

CREATE TABLE `sml_markers_categories_assoc` (
  `id_marker` bigint(20) UNSIGNED NOT NULL,
  `id_category` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_markers_categories_assoc`
--

INSERT INTO `sml_markers_categories_assoc` (`id_marker`, `id_category`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_markers_connects`
--

CREATE TABLE `sml_markers_connects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_marker_source` bigint(20) UNSIGNED NOT NULL,
  `id_marker_dest` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '#ff0000',
  `width` int(11) NOT NULL DEFAULT 2,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_markers_connects`
--

INSERT INTO `sml_markers_connects` (`id`, `id_marker_source`, `id_marker_dest`, `color`, `width`, `title`, `description`) VALUES
(3, 1, 1, '#ff0000', 2, 'URBANIZACIONES', ''),
(4, 2, 2, '#6aa84f', 2, '', ''),
(5, 1, 1, '#3d85c6', 4, 'Anexos', 'Marcadores para los anexos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_reviews`
--

CREATE TABLE `sml_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(250) DEFAULT NULL,
  `id_marker` bigint(20) UNSIGNED NOT NULL,
  `create_date` datetime NOT NULL,
  `email` varchar(250) DEFAULT '',
  `name` varchar(250) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_settings`
--

CREATE TABLE `sml_settings` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(200) DEFAULT 'Simple Map Locator',
  `theme_color` varchar(25) NOT NULL DEFAULT '#0b5394',
  `font_backend` varchar(50) DEFAULT 'Nunito',
  `logo` varchar(50) DEFAULT NULL,
  `background` varchar(50) DEFAULT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en_US',
  `language_domain` varchar(50) NOT NULL DEFAULT 'default',
  `help_url` varchar(250) DEFAULT NULL,
  `languages_enabled` text DEFAULT NULL,
  `welcome_msg` text DEFAULT NULL,
  `purchase_code` varchar(250) DEFAULT NULL,
  `license` varchar(250) DEFAULT NULL,
  `version` varchar(10) NOT NULL DEFAULT '',
  `footer_link_1` varchar(200) DEFAULT NULL,
  `footer_value_1` text DEFAULT NULL,
  `footer_link_2` varchar(200) DEFAULT NULL,
  `footer_value_2` text DEFAULT NULL,
  `footer_link_3` varchar(200) DEFAULT NULL,
  `footer_value_3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_settings`
--

INSERT INTO `sml_settings` (`id`, `name`, `theme_color`, `font_backend`, `logo`, `background`, `language`, `language_domain`, `help_url`, `languages_enabled`, `welcome_msg`, `purchase_code`, `license`, `version`, `footer_link_1`, `footer_value_1`, `footer_link_2`, `footer_value_2`, `footer_link_3`, `footer_value_3`) VALUES
(1, 'SISTEMA DE INFORMACIÓN GEOGRÁFICA', '#0b5394', 'Nunito', 'logo_1696377655.png', '', 'es_ES', 'default', NULL, '{\"ar_SA\":0,\"zh_CN\":0,\"zh_HK\":0,\"zh_TW\":0,\"cs_CZ\":0,\"nl_NL\":0,\"en_US\":0,\"fil_PH\":0,\"fr_FR\":0,\"de_DE\":0,\"hi_IN\":0,\"hu_HU\":0,\"rw_RW\":0,\"ko_KR\":0,\"id_ID\":0,\"it_IT\":0,\"ja_JP\":0,\"fa_IR\":0,\"pl_PL\":0,\"pt_BR\":0,\"pt_PT\":0,\"es_ES\":1,\"ro_RO\":0,\"ru_RU\":0,\"sv_SE\":0,\"tg_TJ\":0,\"th_TH\":0,\"tr_TR\":0,\"vi_VN\":0}', '<p><strong>Bienvenido al Sistema de Información Geográfica - MPS</strong></p>', '27679811', 'active', '', 'Municipalidad Provincial del Santa', '<p><br></p>', '', '<p><br></p>', '', '<p><br></p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_story`
--

CREATE TABLE `sml_story` (
  `id_map` bigint(20) UNSIGNED DEFAULT NULL,
  `id_marker` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `zoom` int(11) NOT NULL DEFAULT 10,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sml_users`
--

CREATE TABLE `sml_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` blob DEFAULT NULL,
  `role` varchar(50) DEFAULT 'customer',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `language` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sml_users`
--

INSERT INTO `sml_users` (`id`, `username`, `password`, `role`, `active`, `language`) VALUES
(1, 'admin', 0x2f996486b40129b17cdfea421c7f139b, 'administrator', 1, NULL),
(2, 'Geremías Velásquez Pera', 0x2f996486b40129b17cdfea421c7f139b, 'editor', 1, NULL),
(3, 'Nilton Hidalgo León', 0x2f996486b40129b17cdfea421c7f139b, 'administrator', 1, NULL),
(4, 'Juan Perez Torres', 0x2f996486b40129b17cdfea421c7f139b, 'customer', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sml_access_log`
--
ALTER TABLE `sml_access_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_map` (`id_map`);

--
-- Indices de la tabla `sml_assign_maps`
--
ALTER TABLE `sml_assign_maps`
  ADD UNIQUE KEY `id_user` (`id_user`,`id_map`),
  ADD KEY `id_map` (`id_map`);

--
-- Indices de la tabla `sml_categories`
--
ALTER TABLE `sml_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_map` (`id_map`),
  ADD KEY `id_category_parent` (`id_category_parent`);

--
-- Indices de la tabla `sml_icons`
--
ALTER TABLE `sml_icons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_map` (`id_map`);

--
-- Indices de la tabla `sml_images`
--
ALTER TABLE `sml_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marker` (`id_marker`);

--
-- Indices de la tabla `sml_maps`
--
ALTER TABLE `sml_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `sml_markers`
--
ALTER TABLE `sml_markers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lat_lon` (`id_map`,`lat`,`lon`,`name`),
  ADD KEY `id_map` (`id_map`),
  ADD KEY `id_category` (`id_category`);

--
-- Indices de la tabla `sml_markers_categories_assoc`
--
ALTER TABLE `sml_markers_categories_assoc`
  ADD UNIQUE KEY `id_marker_2` (`id_marker`,`id_category`),
  ADD KEY `id_marker` (`id_marker`),
  ADD KEY `id_category` (`id_category`);

--
-- Indices de la tabla `sml_markers_connects`
--
ALTER TABLE `sml_markers_connects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marker_source` (`id_marker_source`),
  ADD KEY `id_marker_dest` (`id_marker_dest`);

--
-- Indices de la tabla `sml_reviews`
--
ALTER TABLE `sml_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marker` (`id_marker`);

--
-- Indices de la tabla `sml_settings`
--
ALTER TABLE `sml_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sml_story`
--
ALTER TABLE `sml_story`
  ADD KEY `sml_story_sml_maps_id_fk` (`id_map`),
  ADD KEY `sml_story_sml_markers_id_fk` (`id_marker`);

--
-- Indices de la tabla `sml_users`
--
ALTER TABLE `sml_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sml_access_log`
--
ALTER TABLE `sml_access_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sml_categories`
--
ALTER TABLE `sml_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sml_icons`
--
ALTER TABLE `sml_icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sml_images`
--
ALTER TABLE `sml_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sml_maps`
--
ALTER TABLE `sml_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sml_markers`
--
ALTER TABLE `sml_markers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sml_markers_connects`
--
ALTER TABLE `sml_markers_connects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sml_reviews`
--
ALTER TABLE `sml_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sml_users`
--
ALTER TABLE `sml_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sml_access_log`
--
ALTER TABLE `sml_access_log`
  ADD CONSTRAINT `svt_access_log_ibfk_1` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_assign_maps`
--
ALTER TABLE `sml_assign_maps`
  ADD CONSTRAINT `sml_assign_maps_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `sml_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_assign_maps_ibfk_2` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_categories`
--
ALTER TABLE `sml_categories`
  ADD CONSTRAINT `sml_categories_ibfk_1` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_categories_ibfk_2` FOREIGN KEY (`id_category_parent`) REFERENCES `sml_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_icons`
--
ALTER TABLE `sml_icons`
  ADD CONSTRAINT `sml_icon_ibfk_1` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_images`
--
ALTER TABLE `sml_images`
  ADD CONSTRAINT `sml_images_ibfk_1` FOREIGN KEY (`id_marker`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_maps`
--
ALTER TABLE `sml_maps`
  ADD CONSTRAINT `sml_maps_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `sml_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_markers`
--
ALTER TABLE `sml_markers`
  ADD CONSTRAINT `sml_markers_ibfk_1` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_markers_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `sml_categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sml_markers_categories_assoc`
--
ALTER TABLE `sml_markers_categories_assoc`
  ADD CONSTRAINT `sml_markers_categories_assoc_ibfk_1` FOREIGN KEY (`id_marker`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_markers_categories_assoc_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `sml_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_markers_connects`
--
ALTER TABLE `sml_markers_connects`
  ADD CONSTRAINT `sml_markers_connects_ibfk_1` FOREIGN KEY (`id_marker_source`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_markers_connects_ibfk_2` FOREIGN KEY (`id_marker_dest`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_reviews`
--
ALTER TABLE `sml_reviews`
  ADD CONSTRAINT `sml_reviews_ibfk_1` FOREIGN KEY (`id_marker`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sml_story`
--
ALTER TABLE `sml_story`
  ADD CONSTRAINT `sml_story_sml_maps_id_fk` FOREIGN KEY (`id_map`) REFERENCES `sml_maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sml_story_sml_markers_id_fk` FOREIGN KEY (`id_marker`) REFERENCES `sml_markers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
