-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.25 - MySQL Community Server - GPL
-- Операционная система:         Linux
-- HeidiSQL Версия:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных plandb
CREATE DATABASE IF NOT EXISTS `plandb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plandb`;

-- Дамп структуры для таблица plandb.components_metatheme_category_metathemes
CREATE TABLE IF NOT EXISTS `components_metatheme_category_metathemes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.components_metatheme_category_metathemes: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `components_metatheme_category_metathemes` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_metatheme_category_metathemes` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.core_store
CREATE TABLE IF NOT EXISTS `core_store` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.core_store: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
	(1, 'model_def_strapi::core-store', '{"uid":"strapi::core-store","collectionName":"core_store","info":{"name":"core_store","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}}', 'object', NULL, NULL),
	(2, 'model_def_application::location.location', '{"uid":"application::location.location","collectionName":"locations","kind":"collectionType","info":{"name":"location","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(3, 'model_def_application::servicelog.servicelog', '{"uid":"application::servicelog.servicelog","collectionName":"servicelogs","kind":"collectionType","info":{"name":"servicelog","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"contentType":{"type":"string"},"action":{"type":"string"},"author":{"type":"json"},"content":{"type":"json"},"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(4, 'model_def_application::tech-resource-status.tech-resource-status', '{"uid":"application::tech-resource-status.tech-resource-status","collectionName":"tech_resource_statuses","kind":"collectionType","info":{"name":"tech_resource_status","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(5, 'model_def_application::tech-resource.tech-resource', '{"uid":"application::tech-resource.tech-resource","collectionName":"tech_resources","kind":"collectionType","info":{"name":"tech_resource","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":false},"type":{"type":"string","required":false},"location":{"model":"location"},"status":{"model":"tech-resource-status"},"comment":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(6, 'model_def_strapi::webhooks', '{"uid":"strapi::webhooks","collectionName":"strapi_webhooks","info":{"name":"Strapi webhooks","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string"},"url":{"type":"text"},"headers":{"type":"json"},"events":{"type":"json"},"enabled":{"type":"boolean"}}}', 'object', NULL, NULL),
	(7, 'model_def_strapi::permission', '{"uid":"strapi::permission","collectionName":"strapi_permission","kind":"collectionType","info":{"name":"Permission","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"model":"role","plugin":"admin"}}}', 'object', NULL, NULL),
	(8, 'model_def_strapi::role', '{"uid":"strapi::role","collectionName":"strapi_role","kind":"collectionType","info":{"name":"Role","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"collection":"user","via":"roles","plugin":"admin","attribute":"user","column":"id","isVirtual":true},"permissions":{"configurable":false,"plugin":"admin","collection":"permission","via":"role","isVirtual":true}}}', 'object', NULL, NULL),
	(9, 'model_def_strapi::user', '{"uid":"strapi::user","collectionName":"strapi_administrator","kind":"collectionType","info":{"name":"User","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"collection":"role","collectionName":"strapi_users_roles","via":"users","dominant":true,"plugin":"admin","configurable":false,"private":true,"attribute":"role","column":"id","isVirtual":true},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}}}', 'object', NULL, NULL),
	(10, 'model_def_plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","collectionName":"users-permissions_permission","kind":"collectionType","info":{"name":"permission","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false}},"attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(11, 'model_def_plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","collectionName":"users-permissions_role","kind":"collectionType","info":{"name":"role","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(12, 'model_def_plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","collectionName":"users-permissions_user","kind":"collectionType","info":{"name":"user","description":""},"options":{"draftAndPublish":false,"timestamps":["created_at","updated_at"]},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(13, 'model_def_plugins::upload.file', '{"uid":"plugins::upload.file","collectionName":"upload_file","kind":"collectionType","info":{"name":"file","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(14, 'model_def_plugins::i18n.locale', '{"uid":"plugins::i18n.locale","collectionName":"i18n_locales","kind":"collectionType","info":{"name":"locale","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(15, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true}', 'object', 'development', ''),
	(16, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}', 'object', '', ''),
	(18, 'plugin_content_manager_configuration_content_types::application::location.location', '{"uid":"application::location.location","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(19, 'plugin_content_manager_configuration_content_types::application::tech-resource.tech-resource', '{"uid":"application::tech-resource.tech-resource","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"location":{"edit":{"label":"Location","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Location","searchable":true,"sortable":true}},"status":{"edit":{"label":"Status","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Status","searchable":true,"sortable":true}},"comment":{"edit":{"label":"Comment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comment","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6},{"name":"type","size":6}],[{"name":"comment","size":12}]],"editRelations":["location","status"],"list":["id","name","type","location"]}}', 'object', '', ''),
	(20, 'plugin_content_manager_configuration_content_types::strapi::permission', '{"uid":"strapi::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"Properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}', 'object', '', ''),
	(21, 'plugin_content_manager_configuration_content_types::application::tech-resource-status.tech-resource-status', '{"uid":"application::tech-resource-status.tech-resource-status","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(22, 'plugin_content_manager_configuration_content_types::strapi::user', '{"uid":"strapi::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"PreferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreferedLanguage","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}', 'object', '', ''),
	(23, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}', 'object', '', ''),
	(24, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', '', ''),
	(25, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":50,"mainField":"username","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4}]],"editRelations":["role"],"list":["id","username","email"]}}', 'object', '', ''),
	(26, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', '', ''),
	(27, 'plugin_content_manager_configuration_content_types::strapi::role', '{"uid":"strapi::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}', 'object', '', ''),
	(28, 'plugin_content_manager_configuration_content_types::plugins::i18n.locale', '{"uid":"plugins::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","created_at"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', '', ''),
	(29, 'plugin_i18n_default_locale', '"ru-RU"', 'string', '', ''),
	(30, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}', 'object', '', ''),
	(31, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', '', ''),
	(32, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null}}', 'object', '', ''),
	(33, 'model_def_application::syslog.syslog', '{"uid":"application::syslog.syslog","collectionName":"syslogs","kind":"collectionType","info":{"name":"syslog","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"contentType":{"type":"string"},"action":{"type":"string"},"content":{"type":"json"},"name":{"type":"text"},"author":{"type":"string"},"contentBefore":{"type":"json"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(34, 'plugin_content_manager_configuration_content_types::application::syslog.syslog', '{"uid":"application::syslog.syslog","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":100,"mainField":"contentType","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"ContentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ContentType","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"contentBefore":{"edit":{"label":"ContentBefore","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ContentBefore","searchable":false,"sortable":false}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"contentType","size":6},{"name":"action","size":6}],[{"name":"name","size":6},{"name":"author","size":6}],[{"name":"content","size":12}],[{"name":"contentBefore","size":12}]],"editRelations":[],"list":["id","contentType","action","name","author"]}}', 'object', '', ''),
	(35, 'model_def_metatheme-category.metatheme', '{"uid":"metatheme-category.metatheme","collectionName":"components_metatheme_category_metathemes","info":{"name":"metatheme","icon":"align-center"},"options":{"timestamps":false},"attributes":{"name":{"type":"string"}}}', 'object', NULL, NULL),
	(37, 'model_def_application::metatheme-section.metatheme-section', '{"uid":"application::metatheme-section.metatheme-section","collectionName":"metatheme_sections","kind":"collectionType","info":{"name":"metatheme-section"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"metathemes":{"via":"metatheme_section","collection":"metatheme","isVirtual":true},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(38, 'plugin_content_manager_configuration_content_types::application::metatheme-section.metatheme-section', '{"uid":"application::metatheme-section.metatheme-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":50,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"metathemes":{"edit":{"label":"Metathemes","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Metathemes","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","created_at","updated_at"],"edit":[[{"name":"name","size":6}]],"editRelations":["metathemes"]}}', 'object', '', ''),
	(39, 'model_def_application::metatheme-inclusion.metatheme-inclusion', '{"uid":"application::metatheme-inclusion.metatheme-inclusion","collectionName":"metatheme_inclusions","kind":"collectionType","info":{"name":"metathemeInclusion"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(40, 'plugin_content_manager_configuration_content_types::application::metatheme-inclusion.metatheme-inclusion', '{"uid":"application::metatheme-inclusion.metatheme-inclusion","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(41, 'model_def_application::metatheme-aether.metatheme-aether', '{"uid":"application::metatheme-aether.metatheme-aether","collectionName":"metatheme_aethers","kind":"collectionType","info":{"name":"metathemeAether"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(42, 'plugin_content_manager_configuration_content_types::application::metatheme-aether.metatheme-aether', '{"uid":"application::metatheme-aether.metatheme-aether","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(43, 'model_def_application::metatheme-aether-plan.metatheme-aether-plan', '{"uid":"application::metatheme-aether-plan.metatheme-aether-plan","collectionName":"metatheme_aether_plans","kind":"collectionType","info":{"name":"metathemeAetherPlan"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(44, 'plugin_content_manager_configuration_content_types::application::metatheme-aether-plan.metatheme-aether-plan', '{"uid":"application::metatheme-aether-plan.metatheme-aether-plan","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(45, 'model_def_application::employee.employee', '{"uid":"application::employee.employee","collectionName":"employees","kind":"collectionType","info":{"name":"employee","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"surname":{"type":"string"},"patronymic":{"type":"string"},"phone":{"type":"string"},"comment":{"type":"text"},"passport":{"type":"string"},"foreign_passport":{"type":"string"},"location":{"model":"location"},"employee_role":{"model":"employee-role"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(46, 'plugin_content_manager_configuration_content_types::application::employee.employee', '{"uid":"application::employee.employee","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":100,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"employee_role":{"edit":{"label":"Employee_role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Employee_role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"passport":{"edit":{"label":"Passport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Passport","searchable":true,"sortable":true}},"location":{"edit":{"label":"Location","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Location","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"surname":{"edit":{"label":"Surname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Surname","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"patronymic":{"edit":{"label":"Patronymic","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Patronymic","searchable":true,"sortable":true}},"foreign_passport":{"edit":{"label":"Foreign_passport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Foreign_passport","searchable":true,"sortable":true}},"comment":{"edit":{"label":"Comment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comment","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"surname","size":6},{"name":"name","size":6}],[{"name":"patronymic","size":6},{"name":"phone","size":6}],[{"name":"comment","size":6},{"name":"passport","size":6}],[{"name":"foreign_passport","size":6}]],"editRelations":["location","employee_role"],"list":["id","surname","name","patronymic","location","employee_role"]}}', 'object', '', ''),
	(47, 'model_def_application::employee-role.employee-role', '{"uid":"application::employee-role.employee-role","collectionName":"employee_roles","kind":"collectionType","info":{"name":"employeeRole"},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(48, 'plugin_content_manager_configuration_content_types::application::employee-role.employee-role', '{"uid":"application::employee-role.employee-role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6}]],"editRelations":[],"list":["id","name","created_at","updated_at"]}}', 'object', '', ''),
	(49, 'model_def_application::metatheme.metatheme', '{"uid":"application::metatheme.metatheme","collectionName":"metathemes","kind":"collectionType","info":{"name":"metatheme","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"text","required":true},"date_start":{"type":"datetime","required":false},"date_end":{"type":"datetime","required":false},"short_description":{"type":"richtext"},"description":{"type":"richtext"},"address":{"type":"text"},"comment_inclusions":{"type":"richtext"},"comment_aether_plans":{"type":"richtext"},"metatheme_section":{"model":"metatheme-section","via":"metathemes"},"metatheme_inclusions":{"collection":"metatheme-inclusion","attribute":"metatheme-inclusion","column":"id","isVirtual":true},"metatheme_aethers":{"collection":"metatheme-aether","attribute":"metatheme-aether","column":"id","isVirtual":true},"metatheme_aether_plans":{"collection":"metatheme-aether-plan","attribute":"metatheme-aether-plan","column":"id","isVirtual":true},"status_coord":{"type":"enumeration","enum":["new","coord","done"],"default":"new"},"status_log":{"type":"boolean","default":true},"expand_row":{"type":"boolean","default":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}', 'object', NULL, NULL),
	(50, 'plugin_content_manager_configuration_content_types::application::metatheme.metatheme', '{"uid":"application::metatheme.metatheme","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":50,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"date_start":{"edit":{"label":"Date_start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Date_start","searchable":true,"sortable":true}},"date_end":{"edit":{"label":"Date_end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Date_end","searchable":true,"sortable":true}},"short_description":{"edit":{"label":"Short_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Short_description","searchable":false,"sortable":false}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"address":{"edit":{"label":"Address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Address","searchable":true,"sortable":true}},"comment_inclusions":{"edit":{"label":"Comment_inclusions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comment_inclusions","searchable":false,"sortable":false}},"comment_aether_plans":{"edit":{"label":"Comment_aether_plans","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comment_aether_plans","searchable":false,"sortable":false}},"metatheme_section":{"edit":{"label":"Metatheme_section","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Metatheme_section","searchable":true,"sortable":true}},"metatheme_inclusions":{"edit":{"label":"Metatheme_inclusions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Metatheme_inclusions","searchable":false,"sortable":false}},"metatheme_aethers":{"edit":{"label":"Metatheme_aethers","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Metatheme_aethers","searchable":false,"sortable":false}},"metatheme_aether_plans":{"edit":{"label":"Metatheme_aether_plans","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Metatheme_aether_plans","searchable":false,"sortable":false}},"status_coord":{"edit":{"label":"Status_coord","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Status_coord","searchable":true,"sortable":true}},"status_log":{"edit":{"label":"Status_log","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Status_log","searchable":true,"sortable":true}},"expand_row":{"edit":{"label":"Expand_row","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Expand_row","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","date_start","date_end"],"edit":[[{"name":"name","size":6},{"name":"date_start","size":6}],[{"name":"date_end","size":6}],[{"name":"short_description","size":12}],[{"name":"description","size":12}],[{"name":"address","size":6}],[{"name":"comment_inclusions","size":12}],[{"name":"comment_aether_plans","size":12}],[{"name":"status_coord","size":6},{"name":"status_log","size":4}],[{"name":"expand_row","size":4}]],"editRelations":["metatheme_section","metatheme_inclusions","metatheme_aethers","metatheme_aether_plans"]}}', 'object', '', '');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comment` longtext,
  `passport` varchar(255) DEFAULT NULL,
  `foreign_passport` varchar(255) DEFAULT NULL,
  `location` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_role` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.employees: ~139 rows (приблизительно)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `name`, `surname`, `patronymic`, `phone`, `comment`, `passport`, `foreign_passport`, `location`, `created_by`, `updated_by`, `created_at`, `updated_at`, `employee_role`) VALUES
	(1, 'Олег', 'Барышев', 'Олегович', '+7 915 259-02-90', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:38:47', '2021-06-23 12:38:47', 4),
	(2, 'Дмитрий', 'Вахницкий', 'Борисович', '+7 985 480-58-20', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:40:03', '2021-06-23 12:40:03', 4),
	(3, 'Анна', 'Воропай', 'Владимировна', '+7 916 963-76-54', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:40:40', '2021-06-23 12:40:40', 4),
	(4, 'Георгий', 'Гривенный', 'Леонидович', '+7 916 040-11-53', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:41:18', '2021-06-23 12:41:18', 4),
	(5, 'Надежда', 'Алешкина', 'Сергеевна', '+7 903 148-51-98', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:41:50', '2021-06-23 12:41:50', 4),
	(6, 'Игнат', 'Бугаев', 'Витальевич', '+7 926 101-77-45', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:42:28', '2021-06-23 12:42:28', 5),
	(7, 'Александр', 'Малышев', 'Александрович', '+7 916 489-87-42', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:43:00', '2021-06-23 12:43:00', 5),
	(8, 'Максим', 'Алейников', 'Петрович', '+7 903 773-45-79', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:43:44', '2021-06-23 12:43:44', 1),
	(9, 'Алексей', 'Аносов', 'Николаевич', '+7 968 668-88-48', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:44:18', '2021-06-23 12:44:18', 5),
	(10, 'Федор', 'Болдырев', 'Сергеевич', '+7 916 943-90-99', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:44:55', '2021-06-23 12:44:55', 5),
	(11, 'Станислав', 'Борисов', 'Михайлович', '+7 906 719-94-48', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:45:29', '2021-06-23 12:45:29', 5),
	(12, 'Андрей', 'Брыков', 'Михайлович', '+7 916 066-12-18, +7 903 164-95-75', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:46:06', '2021-06-23 12:46:06', 5),
	(13, 'Артём', 'Вицинский', 'Викторович', '+7 915 294-02-38', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:46:36', '2021-06-23 12:46:36', 5),
	(14, 'Никита', 'Глебов', 'Евгеньевич', '+7 985 688-56-52, +7 926 157-37-57', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:47:08', '2021-06-23 12:47:08', 5),
	(15, 'Никита', 'Дмитров', 'Вадимович', '+7 916 100-76-04', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:47:45', '2021-06-23 12:47:45', 1),
	(16, 'Олег', 'Деркач', 'Иванович', '+7 916 417-65-56', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:48:14', '2021-06-23 12:48:14', 5),
	(17, 'Артем', 'Афанасьев', 'Алексеевич', '+7 917 574-82-54', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:48:49', '2021-06-23 12:48:49', 1),
	(18, 'Ираклий', 'Джеджелава', 'Зурабович', '+7 966 122-74-42, +7 977 819-01-82', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:49:24', '2021-06-23 12:49:24', 5),
	(19, 'Сергей', 'Домнышев', 'Михайлович', '+7 916 233-62-89-82', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:49:51', '2021-06-23 12:49:51', 5),
	(20, 'Алексей', 'Егоров', 'Георгиевич', '+7 965 352-41-88', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:50:28', '2021-06-23 12:50:28', 5),
	(21, 'Алексей', 'Евдоков', 'Валерьевич', '+7 977 263-85-34', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:50:58', '2021-06-23 12:50:58', 1),
	(22, 'Станислав', 'Григорьев', 'Игоревич', '+7 915 229-13-59', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:51:30', '2021-06-23 12:51:30', 4),
	(23, 'Дмитрий', 'Зименкин', 'Сергеевич', '+7 931 391 0073', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:52:05', '2021-06-23 12:52:05', 4),
	(24, 'Николай', 'Иванов', 'Лаврентьевич', '+7 925 122-45-79', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:52:37', '2021-06-23 12:52:37', 4),
	(25, 'Леонид', 'Китрарь', 'Юрьевич', '+7 916 679-91-58', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:53:11', '2021-06-23 12:53:11', 4),
	(26, 'Денис', 'Кулага', 'Николаевич', '+7 985 071-90-71', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:53:45', '2021-06-23 12:53:45', 4),
	(27, 'Наталья', 'Кирилова', 'Николаевна', '+7 915 232-76-33', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:54:14', '2021-06-23 12:54:14', 4),
	(28, 'Александр', 'Мостославский', 'Маркович', '+7 915 293-46-02', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:54:42', '2021-06-23 12:54:42', 4),
	(29, 'Семен', 'Еремин', 'Николаевич', '+7-919-760-37-40', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:55:11', '2021-06-23 12:55:11', 4),
	(30, 'Кирилл', 'Ольков', 'Алексеевич', '8-919-771-95-51', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:55:36', '2021-06-23 12:55:36', 4),
	(31, 'Вячеслав', 'Николаев', 'Юрьевич', '+7-915-293-12-70', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:56:05', '2021-06-23 12:56:05', 4),
	(32, 'Кирилл', 'Поляков', 'Вячеславович', '+7-985-857-88-91', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:56:33', '2021-06-23 12:56:33', 4),
	(33, 'Дмитрий', 'Помельников', 'Борисович', '+7-917-581-97-01', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:57:05', '2021-06-23 12:57:05', 7),
	(34, 'Николай', 'Никулин', 'Львович', '+7-905-552-34-58', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:57:39', '2021-06-23 12:57:39', 4),
	(35, 'Максим', 'Прихода', 'Вячеславович', '+7 -916-211-14-06', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:58:07', '2021-06-23 12:58:07', 4),
	(36, 'Виктор', 'Синеок', 'Сергеевич', '+7-916-401-72-30', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:58:37', '2021-06-23 12:58:37', 4),
	(37, 'Руслан', 'Смыков', 'Дулатович', '+7-966-300-84-77', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:59:00', '2021-06-23 12:59:00', 4),
	(38, 'Валентин', 'Трушнин', 'Александрович', '+7-915-281-77-46', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 12:59:28', '2021-06-23 12:59:28', 4),
	(39, 'Елена', 'Хмура', 'Сергеевна', '+7 903 717-38-38', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:00:17', '2021-06-23 13:00:17', 4),
	(40, 'Мери', 'Бадунц', 'Ваграмовна', '+7 989 832-29-20', NULL, NULL, NULL, 3, 1, 1, '2021-06-23 13:00:47', '2021-06-23 13:00:47', 4),
	(41, 'Дмитрий', 'Жуков', 'Викторович', '+7 926 388-95-84', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:01:12', '2021-06-23 13:01:12', 1),
	(42, 'Михаил', 'Жгулев', 'Алексеевич', '+7 925 862-49-59', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:01:42', '2021-06-23 13:01:42', 1),
	(43, 'Андрей', 'Зыков', 'Борисович', '+7 916 617-24-27', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:02:13', '2021-06-23 13:02:13', 5),
	(44, 'Николай', 'Заболотский', 'Дмитриевич', '+7 926 091-12-19', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:02:42', '2021-06-23 13:02:42', 5),
	(45, 'Сергей', 'Забелинский', 'Александрович', '+7 926 865-98-69', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:03:15', '2021-06-23 13:03:15', 5),
	(46, 'Николай', 'Иевлев', 'Вячеславович', '+7 916 329-61-41', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:03:50', '2021-06-23 13:03:50', 5),
	(47, 'Сергей', 'Кезин', 'Анатольевич', '+7 903 191-42-08', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:04:17', '2021-06-23 13:04:17', 5),
	(48, 'Михаил', 'Комиссаров', 'Александрович', '+7 905 711-55-08', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:09:38', '2021-06-23 13:09:38', 5),
	(49, 'Петр', 'Коваленко', 'Константинович', '+7 916 632-64-32', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:10:12', '2021-06-23 13:10:12', 5),
	(50, 'Евгений', 'Киркаленко', 'Андреевич', '+7 962 926-10-31', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:10:40', '2021-06-23 13:10:40', 5),
	(51, 'Евгений', 'Кузнецов', 'Игоревич', '+7 977 654-29-49', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:11:13', '2021-06-23 13:11:13', 1),
	(52, 'Михаил', 'Курчевнев', 'Юрьевич', '+7 977 654-29-49', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:11:37', '2021-06-23 13:11:37', 5),
	(53, 'Александр', 'Козлов', 'Сергеевич', '+7 929 671-14-19', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:12:01', '2021-06-23 13:12:01', 1),
	(54, 'Валерий', 'Лутовинов', 'Васильевич', '+7 910 480-45-34, +7 916 798-32-84', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:12:31', '2021-06-23 13:12:31', 5),
	(55, 'Дмитрий', 'Михайлов', 'Александрович', '+7 926 688-52-94', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:13:03', '2021-06-23 13:13:03', 5),
	(56, 'Андрей', 'Марков', 'Евгеньевич', '+7 925 126-94-08', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:13:34', '2021-06-23 13:13:34', 1),
	(57, 'Виктор', 'Музалевский', 'Иванович', '+7 903 168-81-27', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:14:26', '2021-06-23 13:14:26', 5),
	(58, 'Валерия', 'Миланская', 'Сергеевна', '+7 915 208-17-11', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:14:57', '2021-06-23 13:14:57', 5),
	(59, 'Андрей', 'Минченко', 'Викторович', '+7 926 151-41-11', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:15:24', '2021-06-23 13:15:24', 1),
	(60, 'Андрей', 'Макаренко', 'Юрьевич', '+7 926 633-30-33', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:15:48', '2021-06-23 13:15:49', 5),
	(61, 'Дмитрий', 'Нефедов', 'Валерьевич', '+7 903 718-46-85', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:16:14', '2021-06-23 13:16:14', 5),
	(62, 'Шуан Абдул', 'Нури', 'Кадырович', '+7 906 099-09-04', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:17:01', '2021-06-23 13:17:01', 5),
	(63, 'Артем', 'Невский', 'Денисович', '+7 985 442-72-45', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:17:29', '2021-06-23 13:17:29', 1),
	(64, 'Илья', 'Омельченко', 'Викторович', '+7 916 682-55-62', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:18:01', '2021-06-23 13:18:01', 5),
	(65, 'Альфред', 'Оя', 'Викторович', '+7 909 975-76-94', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:18:28', '2021-06-23 13:18:28', 5),
	(66, 'Олег', 'Орлов', 'Алексеевич', '+7 977 439-54-88', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:18:53', '2021-06-23 13:18:53', 1),
	(67, 'Николай', 'Посадский', 'Сергеевич', '+7 963 711-01-34', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:19:19', '2021-06-23 13:19:19', 1),
	(68, 'Кирилл', 'Пикторинский', 'Павлович', '+7 909 961-04-99', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:19:46', '2021-06-23 13:19:46', 5),
	(69, 'Тимофей', 'Проймин', 'Владимирович', '+7 915 226-25-98', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:20:09', '2021-06-23 13:20:09', 5),
	(70, 'Сергей', 'Резниченко', 'Сергеевич', '+7 926 262-58-36', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:20:39', '2021-06-23 13:20:39', 5),
	(71, 'Дмитрий', 'Родионов', 'Викторович', '+7 985 281-70-96', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:21:08', '2021-06-23 13:21:08', 5),
	(72, 'Сергей', 'Сидоренко', 'Николаевич', '+7 985 663-16-31', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:21:39', '2021-06-23 13:21:39', 5),
	(73, 'Владимир', 'Силантьев', 'Алексеевич', '+7 926 460-13-08', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:22:04', '2021-06-23 13:22:04', 5),
	(74, 'Олег', 'Серебряков', 'Евгеньевич', '+7 920 625-62-00', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:22:32', '2021-06-23 13:22:32', 5),
	(75, 'Владимир', 'Сотников', 'Борисович', '+7 915 130-08-48', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:23:00', '2021-06-23 13:23:00', 5),
	(76, 'Вадим', 'Степченко', 'Анатольевич', '+7 926 836-18-01', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:23:32', '2021-06-23 13:23:32', 5),
	(77, 'Юрий', 'Тюнев', 'Петрович', '+7 916 616-83-48', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:23:58', '2021-06-23 13:23:58', 5),
	(78, 'Антон', 'Таланов', 'Павлович', '+7 905 539-45-33', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:24:26', '2021-06-23 13:24:26', 5),
	(79, 'Алексей', 'Фоминцов', 'Николаевич', '+7 926 331-10-31', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:24:55', '2021-06-23 13:24:55', 5),
	(80, 'Артем', 'Ходалев', 'Сергеевич', '+7 925 275-00-18', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:25:25', '2021-06-23 13:25:25', 5),
	(81, 'Виктор', 'Цховребов', 'Джумберович', '+7 985 111-01-91', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:26:05', '2021-06-23 13:26:05', 5),
	(82, 'Константин', 'Чистяков', 'Николаевич', '+7 916 330-33-84', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:26:41', '2021-06-23 13:26:41', 5),
	(83, 'Константин', 'Черкасов', 'Александрович', '+7 916 423-63-06', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:27:06', '2021-06-23 13:27:06', 1),
	(84, 'Иван', 'Чеботарев', 'Петрович', '+7 962 924-03-23', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:27:30', '2021-06-23 13:27:30', 5),
	(85, 'Игорь', 'Чигарев', 'Юрьевич', '+7 910 469-43-50', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:27:55', '2021-06-23 13:27:55', 5),
	(86, 'Дмитрий', 'Шиков', 'Валерьевич', '+7 916 705-74-79', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:28:22', '2021-06-23 13:28:22', 5),
	(87, 'Максим', 'Шипулин', 'Олегович', '+7 967 068-07-21', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:28:48', '2021-06-23 13:28:48', 1),
	(88, 'Николай', 'Шевнин', 'Константинович', '+7 903 757-05-86', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:29:16', '2021-06-23 13:29:16', 5),
	(89, 'Алексей', 'Якубович', 'Андреевич', '+7 905 525-33-28', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:29:43', '2021-06-23 13:29:43', 5),
	(90, 'Наталья', 'Калышева', 'Викторовна', '+7 909 934-54-99', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:30:07', '2021-06-23 13:30:07', 5),
	(91, 'Екатерина', 'Ягутян', 'Александровна', '+7 916 277-26-49', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:30:31', '2021-06-23 13:30:31', 5),
	(92, 'Максим', 'Гаврилец', 'Александрович', '+7 917 217-79-47', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:30:54', '2021-06-23 13:30:54', 5),
	(93, 'Данила', 'Головатенко', 'Андреевич', '+7 977 423-41-91', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:31:18', '2021-06-23 13:31:18', 5),
	(94, 'Алексей', 'Двоенкин', 'Эдуардович', '+7 926 797-11-92', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:31:45', '2021-06-23 13:31:46', 5),
	(95, 'Андрей', 'Иванов', 'Цветанов', '+7 985 422-76-38', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:32:25', '2021-06-23 13:32:25', 5),
	(96, 'Олег', 'Климин', 'Васильевич', '+7 926 663-03-81', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:32:55', '2021-06-23 13:32:55', 5),
	(97, 'Дмитрий', 'Климинченко', 'Викторович', '+7 926 663-03-81', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:33:22', '2021-06-23 13:33:22', 5),
	(98, 'Борис', 'Маричев', 'Александрович', '+7 909 998-77-94', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:33:51', '2021-06-23 13:33:51', 5),
	(99, 'Максим', 'Сыровегин', 'Сергеевич', '+7 925 848-87-98', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:34:17', '2021-06-23 13:34:17', 5),
	(100, 'Евгений', 'Чегис', 'Александрович', '+7 967 225-22-76', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:34:41', '2021-06-23 13:34:48', 5),
	(101, 'Андрей', 'Рачеев', 'Александрович', '+7 964 501-33-08', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:35:18', '2021-06-23 13:35:18', 5),
	(102, 'Сергей', 'Лямытских', 'Геннадиевич', '+7 914 076-38-26', NULL, NULL, NULL, 3, 1, 1, '2021-06-23 13:35:49', '2021-06-23 13:35:49', 5),
	(103, 'Алексей', 'Корниенко', 'Витальевич', '+7 928 449-13-73', NULL, NULL, NULL, 3, 1, 1, '2021-06-23 13:36:24', '2021-06-23 13:36:24', 5),
	(104, 'Рамазан', 'Рашидов', 'Рашидович', '+7 903 499-92-33', NULL, NULL, NULL, 3, 1, 1, '2021-06-23 13:36:55', '2021-06-23 13:36:55', 5),
	(105, 'Виталий', 'Ханин', 'Олегович', '+ 7 915 345 40 16', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:37:21', '2021-06-23 13:37:21', 4),
	(106, 'Иван', 'Солилов', 'Сергеевич', '+7 926 375-87-95', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:37:46', '2021-06-23 13:37:46', 1),
	(107, 'Ксения', 'Солдатова', 'Владимировна', '+7-917-510-21-95', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 13:38:16', '2021-06-23 13:38:16', 4),
	(108, 'Александр', 'Басов', 'Александрович', '89856044779', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:23:37', '2021-06-23 16:23:37', 2),
	(109, 'Денис', 'Молоканов', 'Алексеевич', '89164533647', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:24:09', '2021-06-23 16:24:09', 2),
	(110, 'Александр', 'Каримов', 'Анатольевич', '89774986282', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:24:46', '2021-06-23 16:24:46', 2),
	(111, 'Владимир', 'Марисов', 'Викторович', '89779279092', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:25:46', '2021-06-23 16:25:46', 2),
	(112, 'Николай', 'Шаварин', 'Александрович', '89670463682', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:26:19', '2021-06-23 16:26:19', 2),
	(113, 'Сергей', 'Хрисанов', 'Владимирович', '89168615815', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:27:01', '2021-06-23 16:27:01', 2),
	(114, 'Василий', 'Матрос', 'Владимирович', '89104847050', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:27:29', '2021-06-23 16:27:29', 2),
	(115, 'Алексей', 'Болотов', 'Юрьевич', '89269177408', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:27:53', '2021-06-23 16:27:53', 2),
	(116, 'Виктор', 'Швачко', 'Анатольевич', '89998018100', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:28:22', '2021-06-23 16:28:22', 2),
	(117, 'Александр', 'Дудка', 'Анатольевич', '89057606666', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:28:50', '2021-06-23 16:28:50', 2),
	(118, 'Виталий', 'Шипилов', 'Николаевич', '89160573266', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:29:17', '2021-06-23 16:29:17', 2),
	(119, 'Валерий', 'Назаренко', 'Анатольевич', '89163373758', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:29:47', '2021-06-23 16:29:47', 2),
	(120, 'Владимир', 'Рожков', 'Александрович', '89265522792', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:30:10', '2021-06-23 16:30:10', 2),
	(121, 'Сергей', 'Бартеньев', 'Владимирович', '89197659474', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:30:36', '2021-06-23 16:30:36', 2),
	(122, 'Игорь', 'Жернов', 'Юрьевич', '89031752828', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:31:01', '2021-06-23 16:31:01', 2),
	(123, 'Роман', 'Бочков', 'Викторович', '89264960039', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:31:24', '2021-06-23 16:31:24', 2),
	(124, 'Александр', 'Сафонов', 'Владимирович', '89169557220', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:31:52', '2021-06-23 16:31:52', 2),
	(125, 'Георгий', 'Осипов', 'Валерьевич', '89263813673', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:32:21', '2021-06-23 16:32:21', 2),
	(126, 'Михаил', 'Киселев', 'Владимирович', '89031367542', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:32:45', '2021-06-23 16:32:45', 2),
	(127, 'Евгений', 'Босканов', 'Алексеевич', '89154037033', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:33:11', '2021-06-23 16:33:11', 2),
	(128, 'Антон', 'Золотницкий', 'Владимирович', '+7 910 405-65-66', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:33:37', '2021-06-23 16:33:37', 7),
	(129, 'Иван', 'Бурняшев', 'Иванович', '+7 925 726-20-42', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:34:00', '2021-06-23 16:34:00', 7),
	(130, 'Артем', 'Кузнецов', 'Александрович', '+7 963 767-11-09', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:34:29', '2021-06-23 16:34:29', 7),
	(131, 'Андрей', 'Казаков', 'Андреевич', '+7 968 947-95-77', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:34:56', '2021-06-23 16:34:56', 7),
	(132, 'Иван', 'Литомин', 'Анатольевич', '+7 963 638-89-18', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:35:28', '2021-06-23 16:35:28', 4),
	(133, 'Валерия', 'Нодельман', NULL, '+7 915 184-48-35; +7 915 184-48-35', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:36:08', '2021-06-23 16:36:08', 3),
	(134, 'Алина', 'Скачкова', 'Михайловна', '8 915 738 70 50', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:36:42', '2021-06-23 16:36:42', 7),
	(135, 'Вероника', 'Пичугина', 'Александровна', '8 960 536 05 18', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:37:08', '2021-06-23 16:37:08', 7),
	(136, 'Егор', 'Кильдибеков', 'Владимирович', '8 925 729 17 27', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:37:35', '2021-06-23 16:37:35', 4),
	(137, 'Даниил', 'Левин', 'Игоревич', '8 915 059 88 58', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:38:03', '2021-06-23 16:38:03', 4),
	(138, 'Владимир', 'Седов', 'Владимирович', '89263790214', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:38:35', '2021-06-23 16:38:35', 4),
	(139, 'Александра', 'Чальцева', 'Дмитриевна', '89652445534', NULL, NULL, NULL, 1, 1, 1, '2021-06-23 16:39:02', '2021-06-23 16:39:02', 4);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.employee_roles
CREATE TABLE IF NOT EXISTS `employee_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.employee_roles: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Ассистент', 1, 1, '2021-06-23 12:31:39', '2021-06-23 12:31:39'),
	(2, 'Водитель', 1, 1, '2021-06-23 12:31:53', '2021-06-23 12:31:53'),
	(3, 'Газета(корр)', 1, 1, '2021-06-23 12:32:13', '2021-06-23 12:32:13'),
	(4, 'Корреспондент', 1, 1, '2021-06-23 12:32:26', '2021-06-23 12:32:26'),
	(5, 'Оператор', 1, 1, '2021-06-23 12:32:39', '2021-06-23 12:32:39'),
	(6, 'Продюсер', 1, 1, '2021-06-23 12:32:53', '2021-06-23 12:32:53'),
	(7, 'Продюсер(сним)', 1, 1, '2021-06-23 12:33:09', '2021-06-23 12:33:09'),
	(8, 'Стажер', 1, 1, '2021-06-23 12:33:23', '2021-06-23 12:33:23'),
	(9, 'Ведущий', 1, 1, '2021-06-23 12:33:45', '2021-06-23 12:33:45'),
	(10, 'Газета(фото)', 1, 1, '2021-06-23 12:34:02', '2021-06-23 12:34:02'),
	(11, 'Инженер', 1, 1, '2021-06-23 12:34:26', '2021-06-23 12:34:26');
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.i18n_locales
CREATE TABLE IF NOT EXISTS `i18n_locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i18n_locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.i18n_locales: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `i18n_locales` DISABLE KEYS */;
INSERT INTO `i18n_locales` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'English (en)', 'en', NULL, NULL, '2021-06-01 07:58:38', '2021-06-01 07:58:38'),
	(2, 'Russian (Russia) (ru-RU)', 'ru-RU', 1, 1, '2021-06-09 10:39:09', '2021-06-09 10:39:09');
/*!40000 ALTER TABLE `i18n_locales` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.locations: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Москва', 1, 1, '2021-06-01 08:14:50', '2021-06-01 08:14:50'),
	(2, 'Санкт-Петербург', 1, 1, '2021-06-01 08:14:56', '2021-06-01 08:14:56'),
	(3, 'Регионы', 1, 1, '2021-06-01 08:15:01', '2021-06-01 08:15:01'),
	(4, 'Мир', 1, 1, '2021-06-01 08:15:08', '2021-06-01 08:15:08');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metathemes
CREATE TABLE IF NOT EXISTS `metathemes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `short_description` longtext,
  `description` longtext,
  `address` longtext,
  `comment_inclusions` longtext,
  `comment_aether_plans` longtext,
  `metatheme_section` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_coord` varchar(255) DEFAULT NULL,
  `status_log` tinyint(1) DEFAULT NULL,
  `expand_row` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metathemes: ~32 rows (приблизительно)
/*!40000 ALTER TABLE `metathemes` DISABLE KEYS */;
INSERT INTO `metathemes` (`id`, `name`, `date_start`, `date_end`, `short_description`, `description`, `address`, `comment_inclusions`, `comment_aether_plans`, `metatheme_section`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status_coord`, `status_log`, `expand_row`) VALUES
	(1, 'Первые лица, События Тест 1', '2021-06-22 09:00:00', '2021-06-22 12:00:00', 'Краткое описание Первые лица, События Тест 1', 'Полное описание Первые лица, События Тест 1', 'Адрес Первые лица, События Тест 1', 'Комментарий', 'Комментарий', 1, 1, 1, '2021-06-25 09:31:52', '2021-07-02 10:40:28', 'coord', 1, 0),
	(2, 'Первые лица, События Тест 2', '2021-06-23 12:00:00', '2021-06-23 14:00:00', 'Краткое описание Первые лица, События Тест 2', 'Полное описание Первые лица, События Тест 2', 'Адрес Первые лица, События Тест 2', 'Комментарий', 'Комментарий', 1, 1, 1, '2021-06-25 09:32:24', '2021-07-02 10:40:39', 'coord', 1, 0),
	(3, 'Москва Тест 1', '2021-06-24 09:00:00', '2021-06-24 10:00:00', 'Краткое описание Москва Тест 1', 'Полное описание Москва Тест 1', 'Адрес Москва Тест 1', 'Комментарий', 'Комментарий', 2, 1, 1, '2021-06-25 09:33:26', '2021-07-02 10:40:57', 'coord', 1, 0),
	(4, 'Москва Тест 2', '2021-06-25 10:30:00', '2021-06-25 11:30:00', 'Краткое описание Москва Тест 2', 'Полное описание Москва Тест 2', 'Адрес Москва Тест 2', 'Комментарий', 'Комментарий', 2, 1, 1, '2021-06-25 09:33:48', '2021-07-02 09:35:57', 'coord', 1, 0),
	(5, 'Остальное М Тест 1', '2021-06-28 09:00:00', '2021-06-28 10:00:00', 'Краткое описание Остальное М Тест 1', 'Полное описание Остальное М Тест 1', 'Адрес Остальное М Тест 1', 'Комментарий', 'Комментарий', 3, 1, 1, '2021-06-25 09:34:31', '2021-07-02 10:41:20', 'coord', 1, 0),
	(6, 'Остальное М Тест 2', '2021-06-29 10:30:00', '2021-06-29 11:00:00', 'Краткое описание Остальное М Тест 2', 'Полное описание Остальное М Тест 2', 'Адрес Остальное М Тест 2', 'Комментарий', 'Комментарий', 3, 1, 1, '2021-06-25 09:34:50', '2021-07-02 10:41:29', 'coord', 1, 0),
	(7, 'Повестка СПб Тест 1', '2021-06-30 09:00:00', '2021-06-30 09:30:00', 'Краткое описание Повестка СПб Тест 1', 'Полное описание Повестка СПб Тест 1', 'Адрес Повестка СПб Тест 1', 'Комментарий', 'Комментарий', 4, 1, 1, '2021-06-25 09:35:32', '2021-07-02 10:43:13', 'coord', 1, 0),
	(8, 'Повестка СПб Тест 2', '2021-07-01 10:00:00', '2021-07-01 10:30:00', 'Краткое описание Повестка СПб Тест 2', 'Полное описание Повестка СПб Тест 2', 'Адрес Повестка СПб Тест 2', 'Комментарий', 'Комментарий', 4, 1, 1, '2021-06-25 09:35:53', '2021-07-02 10:43:28', 'coord', 1, 0),
	(9, 'Остальное СПб Тест 1', '2021-07-02 09:00:00', '2021-07-02 09:30:00', 'Краткое описание Остальное СПб Тест 1', 'Полное описание Остальное СПб Тест 1', 'Адрес Остальное СПб Тест 1', 'Комментарий', 'Комментарий', 5, 1, 1, '2021-06-25 09:38:10', '2021-07-02 10:43:57', 'coord', 1, 0),
	(10, 'Остальное СПб Тест 2', '2021-06-25 10:00:00', '2021-06-25 10:30:00', 'Краткое описание Остальное СПб Тест 2', 'Полное описание Остальное СПб Тест 2', 'Адрес Остальное СПб Тест 2', 'Комментарий', 'Комментарий', 5, 1, 1, '2021-06-25 09:38:29', '2021-07-02 09:36:48', 'coord', 1, 0),
	(11, 'Эфир Рег Тест 1', '2021-06-22 09:00:00', '2021-06-22 09:30:00', 'Краткое описание Эфир Рег Тест 1', 'Полное описание Эфир Рег Тест 1', 'Адрес Эфир Рег Тест 1', 'Комментарий', 'Комментарий', 6, 1, 1, '2021-06-25 09:39:27', '2021-07-02 10:45:23', 'coord', 1, 0),
	(12, 'Эфир Рег Тест 2', '2021-06-23 10:00:00', '2021-06-23 10:30:00', 'Краткое описание Эфир Рег Тест 2', 'Полное описание Эфир Рег Тест 2', 'Адрес Эфир Рег Тест 2', 'Комментарий', 'Комментарий', 6, 1, 1, '2021-06-25 09:39:50', '2021-07-02 10:45:31', 'coord', 1, 0),
	(13, 'Планы Рег Тест 1', '2021-06-24 09:00:00', '2021-06-24 09:30:00', 'Краткое описание Планы Рег Тест 1', 'Полное описание Планы Рег Тест 1', 'Адрес Планы Рег Тест 1', 'Комментарий', 'Комментарий', 7, 1, 1, '2021-06-25 09:40:50', '2021-07-02 10:45:44', 'coord', 1, 0),
	(14, 'Планы Рег Тест 2', '2021-06-25 10:00:00', '2021-06-25 10:30:00', 'Краткое описание Планы Рег Тест 2', 'Полное описание Планы Рег Тест 2', 'Адрес Планы Рег Тест 2', 'Комментарий', 'Комментарий', 7, 1, 1, '2021-06-25 09:41:09', '2021-07-02 09:37:17', 'coord', 1, 0),
	(15, 'Разработка Рег Тест 1', '2021-06-28 09:00:00', '2021-06-28 09:30:00', 'Краткое описание Разработка Рег Тест 1', 'Полное описание Разработка Рег Тест 1', 'Адрес Разработка Рег Тест 1', 'Комментарий', 'Комментарий', 8, 1, 1, '2021-06-25 09:41:34', '2021-07-02 10:46:11', 'coord', 1, 0),
	(16, 'Разработка Рег Тест 2', '2021-06-29 10:00:00', '2021-06-29 10:30:00', 'Краткое описание Разработка Рег Тест 2', 'Полное описание Разработка Рег Тест 2', 'Адрес Разработка Рег Тест 2', 'Комментарий', 'Комментарий', 8, 1, 1, '2021-06-25 09:42:03', '2021-07-02 10:46:20', 'coord', 1, 0),
	(17, 'Консервы Рег Тест 1', '2021-06-30 09:00:00', '2021-06-30 09:30:00', 'Краткое описание Консервы Рег Тест 1', 'Полное описание Консервы Рег Тест 1', 'Адрес Консервы Рег Тест 1', 'Комментарий', 'Комментарий', 9, 1, 1, '2021-06-25 09:43:28', '2021-07-02 10:46:33', 'coord', 1, 0),
	(18, 'Консервы Рег Тест 2', '2021-07-01 10:00:00', '2021-07-01 10:30:00', 'Краткое описание Консервы Рег Тест 2', 'Полное описание Консервы Рег Тест 2', 'Адрес Консервы Рег Тест 2', 'Комментарий', 'Комментарий', 9, 1, 1, '2021-06-25 09:44:12', '2021-07-02 10:46:48', 'coord', 1, 0),
	(19, 'Эфир ЗР Тест 1', '2021-07-02 09:00:00', '2021-07-02 09:30:00', 'Краткое описание Эфир ЗР Тест 1', 'Полное описание Эфир ЗР Тест 1', 'Адрес Эфир ЗР Тест 1', 'Комментарий', 'Комментарий', 10, 1, 1, '2021-06-25 09:44:47', '2021-07-02 10:47:02', 'coord', 1, 0),
	(20, 'Эфир ЗР Тест 2', '2021-06-22 10:00:00', '2021-06-22 10:30:00', 'Краткое описание Эфир ЗР Тест 2', 'Полное описание Эфир ЗР Тест 2', 'Адрес Эфир ЗР Тест 2', 'Комментарий', 'Комментарий', 10, 1, 1, '2021-06-25 09:45:04', '2021-07-02 10:47:14', 'coord', 1, 0),
	(21, 'Повестка ЗР Тест 1', '2021-06-23 09:00:00', '2021-06-23 09:30:00', 'Краткое описание Повестка ЗР Тест 1', 'Полное описание Повестка ЗР Тест 1', 'Адрес Повестка ЗР Тест 1', 'Комментарий', 'Комментарий', 11, 1, 1, '2021-06-25 09:45:39', '2021-07-02 10:47:24', 'coord', 1, 0),
	(22, 'Повестка ЗР Тест 2', '2021-06-24 10:00:00', '2021-06-24 10:30:00', 'Краткое описание Повестка ЗР Тест 2', 'Полное описание Повестка ЗР Тест 2', 'Адрес Повестка ЗР Тест 2', 'Комментарий', 'Комментарий', 11, 1, 1, '2021-06-25 09:46:06', '2021-07-02 10:47:44', 'coord', 1, 0),
	(23, 'Разработка ЗР Тест 1', '2021-06-25 09:00:00', '2021-06-25 09:30:00', 'Краткое описание Разработка ЗР Тест 1', 'Полное описание Разработка ЗР Тест 1', 'Адрес Разработка ЗР Тест 1', 'Комментарий', 'Комментарий', 12, 1, 1, '2021-06-25 09:47:25', '2021-07-02 09:38:38', 'coord', 1, 0),
	(24, 'Разработка ЗР Тест 2', '2021-06-28 10:00:00', '2021-06-28 10:30:00', 'Краткое описание Разработка ЗР Тест 2', 'Полное описание Разработка ЗР Тест 2', 'Адрес Разработка ЗР Тест 2', 'Комментарий', 'Комментарий', 12, 1, 1, '2021-06-25 09:47:43', '2021-07-02 10:48:06', 'coord', 1, 0),
	(25, 'Съемки Прод Тест 1', '2021-06-29 09:00:00', '2021-06-29 09:30:00', 'Краткое описание Съемки Прод Тест 1', 'Полное описание Съемки Прод Тест 1', 'Адрес Съемки Прод Тест 1', 'Комментарий', 'Комментарий', 13, 1, 1, '2021-06-25 09:48:15', '2021-07-02 10:48:17', 'coord', 1, 0),
	(26, 'Съемки Прод Тест 2', '2021-06-30 10:00:00', '2021-06-30 10:30:00', 'Краткое описание Съемки Прод Тест 2', 'Полное описание Съемки Прод Тест 2', 'Адрес Съемки Прод Тест 2', 'Комментарий', 'Комментарий', 13, 1, 1, '2021-06-25 09:48:34', '2021-07-02 10:48:32', 'coord', 1, 0),
	(27, 'Консервы Прод Тест 1', '2021-07-01 09:00:00', '2021-07-01 09:30:00', 'Краткое описание Консервы Прод Тест 1', 'Полное описание Консервы Прод Тест 1', 'Адрес Консервы Прод Тест 1', 'Комментарий', 'Комментарий', 14, 1, 1, '2021-06-25 09:49:24', '2021-07-02 10:48:45', 'coord', 1, 0),
	(28, 'Консервы Прод Тест 2', '2021-07-02 10:00:00', '2021-07-02 10:30:00', 'Краткое описание Консервы Прод Тест 2', 'Полное описание Консервы Прод Тест 2', 'Адрес Консервы Прод Тест 2', 'Комментарий', 'Комментарий', 14, 1, 1, '2021-06-25 09:49:43', '2021-07-02 10:49:10', 'coord', 1, 0),
	(29, 'Эфир IZ.TV Тест 1', '2021-06-22 09:00:00', '2021-06-22 09:30:00', 'Краткое описание Эфир IZ.TV Тест 1', 'Полное описание Эфир IZ.TV Тест 1', 'Адрес Эфир IZ.TV Тест 1', 'Комментарий', 'Комментарий', 15, 1, 1, '2021-06-25 09:50:24', '2021-07-02 10:49:25', 'coord', 1, 0),
	(30, 'Эфир IZ.TV Тест 2', '2021-06-23 10:00:00', '2021-06-23 10:30:00', 'Краткое описание Эфир IZ.TV Тест 2', 'Полное описание Эфир IZ.TV Тест 2', 'Адрес Эфир IZ.TV Тест 2', 'Комментарий', 'Комментарий', 15, 1, 1, '2021-06-25 09:50:44', '2021-07-02 10:49:35', 'coord', 1, 0),
	(31, 'Остальное IZ.TV Тест 1', '2021-06-24 09:00:00', '2021-06-24 09:30:00', 'Краткое описание Остальное IZ.TV Тест 1', 'Полное описание Остальное IZ.TV Тест 1', 'Адрес Остальное IZ.TV Тест 1', 'Комментарий', 'Комментарий', 16, 1, 1, '2021-06-25 09:51:37', '2021-07-02 10:49:46', 'coord', 1, 0),
	(32, 'Остальное IZ.TV Тест 2', '2021-06-25 10:00:00', '2021-06-25 10:30:00', 'Краткое описание Остальное IZ.TV Тест 2', 'Полное описание Остальное IZ.TV Тест 2', 'Адрес Остальное IZ.TV Тест 2', 'Комментарий', 'Комментарий', 16, 1, 1, '2021-06-25 09:51:56', '2021-07-02 09:39:47', 'coord', 1, 0);
/*!40000 ALTER TABLE `metathemes` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metathemes__metatheme_aethers
CREATE TABLE IF NOT EXISTS `metathemes__metatheme_aethers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `metatheme_id` int DEFAULT NULL,
  `metatheme-aether_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metathemes__metatheme_aethers: ~64 rows (приблизительно)
/*!40000 ALTER TABLE `metathemes__metatheme_aethers` DISABLE KEYS */;
INSERT INTO `metathemes__metatheme_aethers` (`id`, `metatheme_id`, `metatheme-aether_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 2, 4),
	(5, 3, 5),
	(6, 3, 6),
	(7, 4, 7),
	(8, 4, 8),
	(9, 5, 9),
	(10, 5, 12),
	(11, 6, 18),
	(12, 6, 2),
	(13, 7, 10),
	(14, 7, 15),
	(15, 8, 5),
	(16, 8, 11),
	(17, 9, 8),
	(18, 9, 16),
	(19, 10, 6),
	(20, 10, 14),
	(21, 11, 7),
	(22, 11, 9),
	(23, 12, 7),
	(24, 12, 15),
	(25, 13, 2),
	(26, 13, 9),
	(27, 14, 2),
	(28, 14, 7),
	(29, 15, 5),
	(30, 15, 9),
	(31, 16, 6),
	(32, 16, 8),
	(33, 17, 11),
	(34, 17, 12),
	(35, 18, 7),
	(36, 18, 15),
	(37, 19, 3),
	(38, 19, 8),
	(39, 20, 3),
	(40, 20, 10),
	(41, 21, 1),
	(42, 21, 3),
	(43, 24, 8),
	(44, 24, 12),
	(45, 22, 9),
	(46, 22, 13),
	(47, 23, 5),
	(48, 23, 8),
	(49, 25, 8),
	(50, 25, 16),
	(51, 26, 9),
	(52, 26, 13),
	(53, 27, 2),
	(54, 27, 14),
	(55, 28, 9),
	(56, 28, 12),
	(57, 29, 19),
	(58, 29, 16),
	(59, 30, 6),
	(60, 30, 15),
	(61, 31, 7),
	(62, 31, 8),
	(63, 32, 10),
	(64, 32, 14);
/*!40000 ALTER TABLE `metathemes__metatheme_aethers` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metathemes__metatheme_aether_plans
CREATE TABLE IF NOT EXISTS `metathemes__metatheme_aether_plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `metatheme_id` int DEFAULT NULL,
  `metatheme-aether-plan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metathemes__metatheme_aether_plans: ~64 rows (приблизительно)
/*!40000 ALTER TABLE `metathemes__metatheme_aether_plans` DISABLE KEYS */;
INSERT INTO `metathemes__metatheme_aether_plans` (`id`, `metatheme_id`, `metatheme-aether-plan_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 2, 4),
	(5, 3, 4),
	(6, 3, 5),
	(7, 4, 5),
	(8, 4, 6),
	(9, 5, 11),
	(10, 5, 9),
	(11, 6, 12),
	(12, 6, 11),
	(13, 7, 10),
	(14, 7, 12),
	(15, 8, 2),
	(16, 8, 7),
	(17, 9, 1),
	(18, 9, 6),
	(19, 10, 4),
	(20, 10, 8),
	(21, 11, 2),
	(22, 11, 7),
	(23, 12, 10),
	(24, 12, 12),
	(25, 13, 1),
	(26, 13, 3),
	(27, 14, 4),
	(28, 14, 8),
	(29, 15, 5),
	(30, 15, 8),
	(31, 16, 1),
	(32, 16, 8),
	(33, 17, 4),
	(34, 17, 6),
	(35, 18, 1),
	(36, 18, 8),
	(37, 19, 5),
	(38, 19, 10),
	(39, 20, 5),
	(40, 20, 11),
	(41, 21, 2),
	(42, 21, 3),
	(43, 24, 6),
	(44, 24, 11),
	(45, 22, 5),
	(46, 22, 6),
	(47, 23, 6),
	(48, 23, 11),
	(49, 25, 9),
	(50, 25, 10),
	(51, 26, 5),
	(52, 26, 12),
	(53, 27, 5),
	(54, 27, 9),
	(55, 28, 3),
	(56, 28, 4),
	(57, 29, 12),
	(58, 29, 1),
	(59, 30, 3),
	(60, 30, 10),
	(61, 31, 5),
	(62, 31, 8),
	(63, 32, 3),
	(64, 32, 12);
/*!40000 ALTER TABLE `metathemes__metatheme_aether_plans` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metathemes__metatheme_inclusions
CREATE TABLE IF NOT EXISTS `metathemes__metatheme_inclusions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `metatheme_id` int DEFAULT NULL,
  `metatheme-inclusion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metathemes__metatheme_inclusions: ~64 rows (приблизительно)
/*!40000 ALTER TABLE `metathemes__metatheme_inclusions` DISABLE KEYS */;
INSERT INTO `metathemes__metatheme_inclusions` (`id`, `metatheme_id`, `metatheme-inclusion_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 2, 4),
	(5, 3, 5),
	(6, 3, 6),
	(7, 4, 5),
	(8, 4, 6),
	(9, 5, 2),
	(10, 5, 5),
	(11, 6, 6),
	(12, 6, 2),
	(13, 7, 1),
	(14, 7, 4),
	(15, 8, 2),
	(16, 8, 5),
	(17, 9, 1),
	(18, 9, 5),
	(19, 10, 3),
	(20, 10, 5),
	(21, 11, 2),
	(22, 11, 3),
	(23, 12, 5),
	(24, 12, 6),
	(25, 13, 5),
	(26, 13, 6),
	(27, 14, 1),
	(28, 14, 3),
	(29, 15, 1),
	(30, 15, 3),
	(31, 16, 4),
	(32, 16, 6),
	(33, 17, 2),
	(34, 17, 4),
	(35, 18, 3),
	(36, 18, 5),
	(37, 19, 5),
	(38, 19, 6),
	(39, 20, 5),
	(40, 20, 2),
	(41, 21, 1),
	(42, 21, 2),
	(43, 24, 2),
	(44, 24, 3),
	(45, 22, 3),
	(46, 22, 4),
	(47, 23, 4),
	(48, 23, 5),
	(49, 25, 4),
	(50, 25, 5),
	(51, 26, 5),
	(52, 26, 6),
	(53, 27, 1),
	(54, 27, 6),
	(55, 28, 2),
	(56, 28, 5),
	(57, 29, 3),
	(58, 29, 4),
	(59, 30, 3),
	(60, 30, 6),
	(61, 31, 5),
	(62, 31, 4),
	(63, 32, 4),
	(64, 32, 6);
/*!40000 ALTER TABLE `metathemes__metatheme_inclusions` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metatheme_aethers
CREATE TABLE IF NOT EXISTS `metatheme_aethers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metatheme_aethers: ~19 rows (приблизительно)
/*!40000 ALTER TABLE `metatheme_aethers` DISABLE KEYS */;
INSERT INTO `metatheme_aethers` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, '5 Канал 05:00', 1, 1, '2021-06-23 11:51:05', '2021-06-23 11:51:05'),
	(2, '5 Канал 09:00', 1, 1, '2021-06-23 11:51:32', '2021-06-23 11:51:32'),
	(3, '5 Канал 13:00', 1, 1, '2021-06-23 11:51:44', '2021-06-23 11:51:44'),
	(4, '5 Канал 17:30', 1, 1, '2021-06-23 11:52:10', '2021-06-23 11:52:10'),
	(5, '5 Канал 20:00', 1, 1, '2021-06-23 11:52:22', '2021-06-23 11:52:22'),
	(6, '5 Канал 00:00', 1, 1, '2021-06-23 11:52:37', '2021-06-23 11:52:37'),
	(7, 'Итоги.Главное', 1, 1, '2021-06-23 11:52:51', '2021-06-23 11:52:51'),
	(8, 'РЕН пятиминутки', 1, 1, '2021-06-23 11:53:11', '2021-06-23 11:53:11'),
	(9, 'РЕН 08:30', 1, 1, '2021-06-23 11:53:30', '2021-06-23 11:53:30'),
	(10, 'РЕН 12:30', 1, 1, '2021-06-23 11:53:43', '2021-06-23 11:53:44'),
	(11, 'РЕН 16:30', 1, 1, '2021-06-23 11:53:59', '2021-06-23 11:53:59'),
	(12, 'РЕН 19:30', 1, 1, '2021-06-23 11:54:12', '2021-06-23 11:54:12'),
	(13, 'РЕН 21:00', 1, 1, '2021-06-23 11:54:25', '2021-06-23 11:54:25'),
	(14, 'РЕН 23:00', 1, 1, '2021-06-23 11:54:38', '2021-06-23 11:54:38'),
	(15, 'РЕН Добров', 1, 1, '2021-06-23 11:54:50', '2021-06-23 11:54:50'),
	(16, 'Вызов пятиминутки', 1, 1, '2021-06-23 11:55:08', '2021-06-23 11:55:08'),
	(17, 'Вызов 12:00', 1, 1, '2021-06-23 11:55:23', '2021-06-23 11:55:23'),
	(18, 'Вызов 16:00', 1, 1, '2021-06-23 11:55:46', '2021-06-23 11:55:46'),
	(19, 'Вызов 19:00', 1, 1, '2021-06-23 11:56:02', '2021-06-23 11:56:02');
/*!40000 ALTER TABLE `metatheme_aethers` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metatheme_aether_plans
CREATE TABLE IF NOT EXISTS `metatheme_aether_plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metatheme_aether_plans: ~12 rows (приблизительно)
/*!40000 ALTER TABLE `metatheme_aether_plans` DISABLE KEYS */;
INSERT INTO `metatheme_aether_plans` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Командировка', 1, 1, '2021-06-23 11:59:10', '2021-06-23 11:59:10'),
	(2, 'Следим', 1, 1, '2021-06-23 11:59:21', '2021-06-23 11:59:21'),
	(3, 'Следим (112)', 1, 1, '2021-06-23 11:59:36', '2021-06-23 11:59:36'),
	(4, 'Разработка', 1, 1, '2021-06-23 11:59:50', '2021-06-23 11:59:50'),
	(5, 'Эпизоды', 1, 1, '2021-06-23 12:00:01', '2021-06-23 12:00:01'),
	(6, 'Исходник', 1, 1, '2021-06-23 12:00:15', '2021-06-23 12:00:15'),
	(7, 'ВМЗ', 1, 1, '2021-06-23 12:00:28', '2021-06-23 12:00:28'),
	(8, 'БЗ+СХ', 1, 1, '2021-06-23 12:00:40', '2021-06-23 12:00:40'),
	(9, 'ВМЗ/БЗ+СХ', 1, 1, '2021-06-23 12:01:00', '2021-06-23 12:01:00'),
	(10, 'Прямо', 1, 1, '2021-06-23 12:01:11', '2021-06-23 12:01:11'),
	(11, 'Сайту', 1, 1, '2021-06-23 12:01:19', '2021-06-23 12:01:19'),
	(12, 'IZ', 1, 1, '2021-06-23 12:01:28', '2021-06-23 12:01:28');
/*!40000 ALTER TABLE `metatheme_aether_plans` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metatheme_inclusions
CREATE TABLE IF NOT EXISTS `metatheme_inclusions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metatheme_inclusions: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `metatheme_inclusions` DISABLE KEYS */;
INSERT INTO `metatheme_inclusions` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'ПУЛ', 1, 1, '2021-06-23 11:45:56', '2021-06-23 11:45:56'),
	(2, 'Трансляция', 1, 1, '2021-06-23 11:46:41', '2021-06-23 11:46:41'),
	(3, 'Дежеро', 1, 1, '2021-06-23 11:46:54', '2021-06-23 11:46:54'),
	(4, 'Телефон', 1, 1, '2021-06-23 11:47:08', '2021-06-23 11:47:08'),
	(5, 'ПССС', 1, 1, '2021-06-23 11:47:23', '2021-06-23 11:47:23'),
	(6, 'Видео', 1, 1, '2021-06-23 11:47:34', '2021-06-23 11:47:34');
/*!40000 ALTER TABLE `metatheme_inclusions` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.metatheme_sections
CREATE TABLE IF NOT EXISTS `metatheme_sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.metatheme_sections: ~24 rows (приблизительно)
/*!40000 ALTER TABLE `metatheme_sections` DISABLE KEYS */;
INSERT INTO `metatheme_sections` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Первые лица, События', 1, 1, '2021-06-23 11:29:38', '2021-06-23 11:29:38'),
	(2, 'Москва', 1, 1, '2021-06-23 11:29:55', '2021-06-23 11:29:56'),
	(3, 'Остальное М', 1, 1, '2021-06-23 11:30:31', '2021-06-23 11:30:31'),
	(4, 'Повестка СПб', 1, 1, '2021-06-23 11:32:54', '2021-06-23 11:32:54'),
	(5, 'Остальное СПб', 1, 1, '2021-06-23 11:33:09', '2021-06-23 11:33:09'),
	(6, 'Эфир Рег', 1, 1, '2021-06-23 11:33:33', '2021-06-23 11:33:33'),
	(7, 'Планы Рег', 1, 1, '2021-06-23 11:33:41', '2021-06-23 11:33:41'),
	(8, 'Разработка Рег', 1, 1, '2021-06-23 11:33:52', '2021-06-23 11:33:52'),
	(9, 'Консервы Рег', 1, 1, '2021-06-23 11:34:05', '2021-06-23 11:34:05'),
	(10, 'Эфир ЗР', 1, 1, '2021-06-23 11:34:24', '2021-06-23 11:34:24'),
	(11, 'Повестка ЗР', 1, 1, '2021-06-23 11:34:44', '2021-06-23 11:34:44'),
	(12, 'Разработка ЗР', 1, 1, '2021-06-23 11:34:53', '2021-06-23 11:34:53'),
	(13, 'Съемки Прод', 1, 1, '2021-06-23 11:35:11', '2021-06-23 11:35:11'),
	(14, 'Консервы Прод', 1, 1, '2021-06-23 11:35:21', '2021-06-23 11:35:21'),
	(15, 'Эфир IZ.TV', 1, 1, '2021-06-23 11:35:38', '2021-06-23 11:35:38'),
	(16, 'Остальное IZ.TV', 1, 1, '2021-06-23 11:36:16', '2021-06-23 11:36:16'),
	(17, 'Повестка 78', 1, 1, '2021-06-23 11:36:52', '2021-06-23 11:36:52'),
	(18, 'Остальное 78', 1, 1, '2021-06-23 11:36:59', '2021-06-23 11:36:59'),
	(19, 'Повестка 112', 1, 1, '2021-06-23 11:37:13', '2021-06-23 11:37:13'),
	(20, 'Остальное 112', 1, 1, '2021-06-23 11:37:22', '2021-06-23 11:37:22'),
	(21, 'Планы Ren.TV', 1, 1, '2021-06-23 11:37:44', '2021-06-23 11:37:44'),
	(22, 'Эфирный план 5 канала', 1, 1, '2021-06-23 11:37:59', '2021-06-23 11:37:59'),
	(23, 'Планы IZ', 1, 1, '2021-06-23 11:38:24', '2021-06-23 11:38:24'),
	(24, 'Планы Газета', 1, 1, '2021-06-23 11:38:41', '2021-06-23 11:38:41');
/*!40000 ALTER TABLE `metatheme_sections` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_administrator
CREATE TABLE IF NOT EXISTS `strapi_administrator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_administrator: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `resetPasswordToken`, `registrationToken`, `isActive`, `blocked`, `preferedLanguage`) VALUES
	(1, 'Admin', '123', NULL, 'admin@admin.ru', '$2a$10$NUZ6xhDbp52DXfVG9EHHFOlwNSkBYguQqTrrrhoBJAdB8pwk/yu0u', NULL, NULL, 1, NULL, 'ru');
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_permission
CREATE TABLE IF NOT EXISTS `strapi_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext,
  `conditions` longtext,
  `role` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=892 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_permission: ~124 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;
INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `properties`, `conditions`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(3, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(4, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(5, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(7, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(8, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(9, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(11, 'plugins::content-manager.explorer.update', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(12, 'plugins::content-manager.explorer.update', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(13, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(15, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(16, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(17, 'plugins::content-manager.explorer.publish', 'application::tech-resource.tech-resource', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(18, 'plugins::upload.read', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(19, 'plugins::upload.assets.create', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(20, 'plugins::upload.assets.update', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(21, 'plugins::upload.assets.download', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(22, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(23, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(25, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(26, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(27, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(29, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(30, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(31, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(33, 'plugins::content-manager.explorer.update', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(34, 'plugins::content-manager.explorer.update', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(35, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(36, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(37, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(38, 'plugins::upload.read', NULL, '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(39, 'plugins::upload.assets.create', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(40, 'plugins::upload.assets.update', NULL, '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(41, 'plugins::upload.assets.download', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(43, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(44, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(46, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(47, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(48, 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '{"fields":["username","email","provider","password","resetPasswordToken","confirmationToken","confirmed","blocked","role"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(49, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(51, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(52, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(53, 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '{"fields":["username","email","provider","password","resetPasswordToken","confirmationToken","confirmed","blocked","role"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(54, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(56, 'plugins::content-manager.explorer.update', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(57, 'plugins::content-manager.explorer.update', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(58, 'plugins::content-manager.explorer.update', 'plugins::users-permissions.user', '{"fields":["username","email","provider","password","resetPasswordToken","confirmationToken","confirmed","blocked","role"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(65, 'plugins::content-type-builder.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(66, 'plugins::email.settings.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(67, 'plugins::upload.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(68, 'plugins::upload.assets.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(69, 'plugins::upload.assets.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(70, 'plugins::upload.assets.download', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(71, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(72, 'plugins::upload.settings.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(73, 'plugins::i18n.locale.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(74, 'plugins::i18n.locale.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(75, 'plugins::i18n.locale.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(76, 'plugins::content-manager.single-types.configure-view', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(77, 'plugins::content-manager.collection-types.configure-view', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(78, 'plugins::i18n.locale.delete', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(79, 'plugins::users-permissions.roles.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(80, 'plugins::users-permissions.roles.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(81, 'plugins::users-permissions.roles.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(82, 'plugins::users-permissions.roles.delete', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(83, 'plugins::users-permissions.providers.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(84, 'plugins::users-permissions.providers.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(85, 'plugins::content-manager.components.configure-layout', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(86, 'plugins::users-permissions.email-templates.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(87, 'plugins::users-permissions.email-templates.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(88, 'plugins::users-permissions.advanced-settings.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(89, 'plugins::users-permissions.advanced-settings.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(90, 'admin::marketplace.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(91, 'admin::marketplace.plugins.install', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(92, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(93, 'admin::webhooks.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(94, 'admin::webhooks.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(95, 'admin::webhooks.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(96, 'admin::webhooks.delete', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(97, 'admin::users.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(98, 'admin::users.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(99, 'admin::users.delete', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(100, 'admin::roles.create', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(101, 'admin::roles.read', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(102, 'admin::roles.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(103, 'admin::roles.delete', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(104, 'admin::users.update', NULL, '{}', '[]', 1, '2021-06-01 07:58:46', '2021-06-01 07:58:46'),
	(207, 'plugins::content-manager.explorer.read', 'application::syslog.syslog', '{"fields":["contentType","action","content","name","author","contentBefore"]}', '[]', 1, '2021-06-09 09:58:08', '2021-06-09 09:58:08'),
	(208, 'plugins::content-manager.explorer.create', 'application::syslog.syslog', '{"fields":["contentType","action","content","name","author","contentBefore"]}', '[]', 1, '2021-06-09 09:58:08', '2021-06-09 09:58:08'),
	(209, 'plugins::content-manager.explorer.update', 'application::syslog.syslog', '{"fields":["contentType","action","content","name","author","contentBefore"]}', '[]', 1, '2021-06-09 09:58:08', '2021-06-09 09:58:08'),
	(256, 'plugins::content-manager.explorer.read', 'application::metatheme-inclusion.metatheme-inclusion', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:44:41', '2021-06-23 11:44:41'),
	(257, 'plugins::content-manager.explorer.create', 'application::metatheme-inclusion.metatheme-inclusion', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:44:41', '2021-06-23 11:44:41'),
	(258, 'plugins::content-manager.explorer.update', 'application::metatheme-inclusion.metatheme-inclusion', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:44:41', '2021-06-23 11:44:41'),
	(267, 'plugins::content-manager.explorer.update', 'application::metatheme-aether.metatheme-aether', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:49:26', '2021-06-23 11:49:26'),
	(268, 'plugins::content-manager.explorer.create', 'application::metatheme-aether.metatheme-aether', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:49:26', '2021-06-23 11:49:26'),
	(276, 'plugins::content-manager.explorer.read', 'application::metatheme-aether.metatheme-aether', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:49:26', '2021-06-23 11:49:26'),
	(279, 'plugins::content-manager.explorer.read', 'application::metatheme-aether-plan.metatheme-aether-plan', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:58:04', '2021-06-23 11:58:04'),
	(280, 'plugins::content-manager.explorer.create', 'application::metatheme-aether-plan.metatheme-aether-plan', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:58:04', '2021-06-23 11:58:04'),
	(281, 'plugins::content-manager.explorer.update', 'application::metatheme-aether-plan.metatheme-aether-plan', '{"fields":["name"]}', '[]', 1, '2021-06-23 11:58:04', '2021-06-23 11:58:04'),
	(306, 'plugins::content-manager.explorer.create', 'application::employee-role.employee-role', '{"fields":["name"]}', '[]', 1, '2021-06-23 12:30:52', '2021-06-23 12:30:52'),
	(307, 'plugins::content-manager.explorer.read', 'application::employee-role.employee-role', '{"fields":["name"]}', '[]', 1, '2021-06-23 12:30:52', '2021-06-23 12:30:52'),
	(308, 'plugins::content-manager.explorer.update', 'application::employee-role.employee-role', '{"fields":["name"]}', '[]', 1, '2021-06-23 12:30:52', '2021-06-23 12:30:52'),
	(321, 'plugins::content-manager.explorer.update', 'application::employee.employee', '{"fields":["name","surname","patronymic","phone","comment","passport","foreign_passport","location","employee_role"]}', '[]', 1, '2021-06-23 12:35:14', '2021-06-23 12:35:14'),
	(322, 'plugins::content-manager.explorer.read', 'application::employee.employee', '{"fields":["name","surname","patronymic","phone","comment","passport","foreign_passport","location","employee_role"]}', '[]', 1, '2021-06-23 12:35:14', '2021-06-23 12:35:14'),
	(323, 'plugins::content-manager.explorer.create', 'application::employee.employee', '{"fields":["name","surname","patronymic","phone","comment","passport","foreign_passport","location","employee_role"]}', '[]', 1, '2021-06-23 12:35:14', '2021-06-23 12:35:14'),
	(360, 'plugins::content-manager.explorer.create', 'application::metatheme-section.metatheme-section', '{"fields":["name","metathemes"]}', '[]', 1, '2021-06-24 12:24:21', '2021-06-24 12:24:21'),
	(362, 'plugins::content-manager.explorer.read', 'application::metatheme-section.metatheme-section', '{"fields":["name","metathemes"]}', '[]', 1, '2021-06-24 12:24:21', '2021-06-24 12:24:21'),
	(364, 'plugins::content-manager.explorer.update', 'application::metatheme-section.metatheme-section', '{"fields":["name","metathemes"]}', '[]', 1, '2021-06-24 12:24:21', '2021-06-24 12:24:21'),
	(876, 'plugins::content-manager.explorer.read', 'application::metatheme.metatheme', '{"fields":["name","date_start","date_end","short_description","description","address","comment_inclusions","comment_aether_plans","metatheme_section","metatheme_inclusions","metatheme_aethers","metatheme_aether_plans","status_coord","status_log","expand_row"]}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(877, 'plugins::content-manager.explorer.create', 'application::metatheme.metatheme', '{"fields":["name","date_start","date_end","short_description","description","address","comment_inclusions","comment_aether_plans","metatheme_section","metatheme_inclusions","metatheme_aethers","metatheme_aether_plans","status_coord","status_log","expand_row"]}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(878, 'plugins::content-manager.explorer.delete', 'application::metatheme-aether-plan.metatheme-aether-plan', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(879, 'plugins::content-manager.explorer.delete', 'application::metatheme-aether.metatheme-aether', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(880, 'plugins::content-manager.explorer.update', 'application::metatheme.metatheme', '{"fields":["name","date_start","date_end","short_description","description","address","comment_inclusions","comment_aether_plans","metatheme_section","metatheme_inclusions","metatheme_aethers","metatheme_aether_plans","status_coord","status_log","expand_row"]}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(881, 'plugins::content-manager.explorer.delete', 'application::employee.employee', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(882, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(883, 'plugins::content-manager.explorer.delete', 'application::metatheme-inclusion.metatheme-inclusion', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(884, 'plugins::content-manager.explorer.delete', 'application::metatheme-section.metatheme-section', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(885, 'plugins::content-manager.explorer.delete', 'application::employee-role.employee-role', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(886, 'plugins::content-manager.explorer.delete', 'application::metatheme.metatheme', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(887, 'plugins::content-manager.explorer.delete', 'application::syslog.syslog', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(888, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(889, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(890, 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07'),
	(891, 'plugins::content-manager.explorer.publish', 'application::tech-resource.tech-resource', '{}', '[]', 1, '2021-07-02 09:35:07', '2021-07-02 09:35:07');
/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_role
CREATE TABLE IF NOT EXISTS `strapi_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_role: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;
INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-06-01 07:58:44', '2021-06-01 07:58:44');
/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_users_roles
CREATE TABLE IF NOT EXISTS `strapi_users_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_users_roles: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_users_roles` DISABLE KEYS */;
INSERT INTO `strapi_users_roles` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `strapi_users_roles` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_webhooks
CREATE TABLE IF NOT EXISTS `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_webhooks: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.syslogs
CREATE TABLE IF NOT EXISTS `syslogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `content` longtext,
  `name` longtext,
  `author` varchar(255) DEFAULT NULL,
  `contentBefore` longtext,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.syslogs: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `syslogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `syslogs` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.tech_resources
CREATE TABLE IF NOT EXISTS `tech_resources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `location` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `comment` longtext,
  `published_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.tech_resources: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tech_resources` DISABLE KEYS */;
INSERT INTO `tech_resources` (`id`, `name`, `type`, `location`, `status`, `comment`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'ТЖК 001', 'стандартный комплект ТЖК', 1, 1, '<p>Комментарий 1</p><p><br></p><p><strong>Жирный</strong></p><p><em>Курсив</em></p><p><u>Подчеркнутый</u></p><p><s>Зачеркнутый</s></p><p><br></p><ol><li>Нумерованный</li><li>Список</li></ol><p><br></p><ul><li>Ненумерованный</li><li>Список</li></ul><p><br></p><p><span style="color: rgb(230, 0, 0);">Цвет шрифта</span></p><p><span style="color: rgb(255, 255, 255); background-color: rgb(0, 71, 178);">Фон и цвет шрифта</span></p>', '2021-06-01 08:16:30', NULL, NULL, '2021-06-01 08:16:30', '2021-06-03 11:41:46'),
	(2, 'ТЖК 002', 'стандартный комплект ТЖК', 2, 2, '<p>Комментарий 2</p>', '2021-06-01 08:53:58', NULL, NULL, '2021-06-01 08:53:58', '2021-06-03 11:13:39'),
	(3, 'ТЖК 003', 'стандартный комплект ТЖК', 3, 3, '<p>Комментарий 3</p>', '2021-06-01 08:54:39', 1, 1, '2021-06-01 08:54:33', '2021-06-03 11:13:42'),
	(4, 'ТЖК 004', 'стандартный комплект ТЖК', 4, 4, '<p>Комментарий 4</p>', '2021-06-01 08:55:17', NULL, NULL, '2021-06-01 08:55:17', '2021-06-03 11:13:46'),
	(5, 'ТЖК 005', 'стандартный комплект ТЖК', 1, 5, '<p>Комментарий 5</p>', '2021-06-01 08:55:34', NULL, NULL, '2021-06-01 08:55:34', '2021-06-03 11:13:49'),
	(6, 'ТЖК 006', 'стандартный комплект ТЖК', 2, 1, '<p>Комментарий 6</p>', '2021-06-01 08:55:56', NULL, NULL, '2021-06-01 08:55:56', '2021-06-03 11:13:53'),
	(7, 'ТЖК 007', 'стандартный комплект ТЖК', 3, 2, '<p>Комментарий 7</p>', '2021-06-01 08:56:32', NULL, NULL, '2021-06-01 08:56:32', '2021-06-03 11:13:55'),
	(8, 'ТЖК 008', 'стандартный комплект ТЖК', 4, 3, '<p>Комментарий 8</p>', '2021-06-01 08:56:58', NULL, NULL, '2021-06-01 08:56:58', '2021-06-03 11:13:58'),
	(9, 'ТЖК 009', 'стандартный комплект ТЖК', 1, 4, '<p>Комментарий 9</p>', '2021-06-01 08:57:24', NULL, NULL, '2021-06-01 08:57:24', '2021-06-03 11:14:00'),
	(10, 'ТЖК 010', 'стандартный комплект ТЖК', 2, 5, '<p>Комментарий 10</p>', '2021-06-01 08:57:50', NULL, NULL, '2021-06-01 08:57:50', '2021-06-03 11:14:03'),
	(11, 'ТЖК 011', 'стандартный комплект ТЖК', 3, 1, '<p>Комментарий 11</p>', '2021-06-01 08:58:15', NULL, NULL, '2021-06-01 08:58:15', '2021-06-03 11:14:06'),
	(12, 'ТЖК 012', 'стандартный комплект ТЖК', 4, 2, '<p>Комментарий 12</p>', '2021-06-03 09:48:46', NULL, NULL, '2021-06-03 09:48:46', '2021-06-03 11:14:09'),
	(13, 'ТЖК 013', 'стандартный комплект ТЖК', 1, 3, '<p>Комментарий 13</p>', '2021-06-03 10:24:49', NULL, NULL, '2021-06-03 10:24:49', '2021-06-03 11:14:11'),
	(14, 'ТЖК 014', 'стандартный комплект ТЖК', 2, 4, '<p>Комментарий 14</p>', '2021-06-03 10:50:10', NULL, NULL, '2021-06-03 10:50:10', '2021-06-03 11:14:41'),
	(15, 'ТЖК 015', 'стандартный комплект ТЖК', 3, 5, '<p>Комментарий 15</p>', '2021-06-03 11:19:18', NULL, NULL, '2021-06-03 11:19:18', '2021-06-03 11:19:18'),
	(16, 'ТЖК 016', 'стандартный комплект ТЖК', 4, 1, '<p>Комментарий 16</p>', '2021-06-03 11:19:52', NULL, NULL, '2021-06-03 11:19:52', '2021-06-03 11:19:52'),
	(17, 'ТЖК 017', 'стандартный комплект ТЖК', 1, 2, '<p>Комментарий 17</p>', '2021-06-03 11:24:19', NULL, NULL, '2021-06-03 11:24:19', '2021-06-03 11:24:19');
/*!40000 ALTER TABLE `tech_resources` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.tech_resource_statuses
CREATE TABLE IF NOT EXISTS `tech_resource_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.tech_resource_statuses: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tech_resource_statuses` DISABLE KEYS */;
INSERT INTO `tech_resource_statuses` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Доступно', 1, 1, '2021-06-01 08:15:22', '2021-06-01 08:15:22'),
	(2, 'Ремонт', 1, 1, '2021-06-01 08:15:28', '2021-06-01 08:15:28'),
	(3, 'Обслуживание', 1, 1, '2021-06-01 08:15:33', '2021-06-01 08:15:33'),
	(4, 'Не доступно', 1, 1, '2021-06-01 08:15:40', '2021-06-01 08:15:40'),
	(5, 'Списан', 1, 1, '2021-06-01 08:15:46', '2021-06-01 08:15:46');
/*!40000 ALTER TABLE `tech_resource_statuses` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.upload_file
CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.upload_file: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.upload_file_morph
CREATE TABLE IF NOT EXISTS `upload_file_morph` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int DEFAULT NULL,
  `related_id` int DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.upload_file_morph: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.users-permissions_permission
CREATE TABLE IF NOT EXISTS `users-permissions_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.users-permissions_permission: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`, `created_by`, `updated_by`) VALUES
	(1, 'application', 'location', 'count', 1, '', 1, NULL, NULL),
	(2, 'application', 'location', 'count', 0, '', 2, NULL, NULL),
	(3, 'application', 'location', 'create', 0, '', 1, NULL, NULL),
	(4, 'application', 'location', 'create', 0, '', 2, NULL, NULL),
	(5, 'application', 'location', 'delete', 0, '', 1, NULL, NULL),
	(6, 'application', 'location', 'delete', 0, '', 2, NULL, NULL),
	(7, 'application', 'location', 'find', 1, '', 1, NULL, NULL),
	(8, 'application', 'location', 'find', 0, '', 2, NULL, NULL),
	(9, 'application', 'location', 'findone', 1, '', 1, NULL, NULL),
	(10, 'application', 'location', 'findone', 0, '', 2, NULL, NULL),
	(11, 'application', 'location', 'update', 0, '', 1, NULL, NULL),
	(12, 'application', 'location', 'update', 0, '', 2, NULL, NULL),
	(25, 'application', 'tech-resource-status', 'count', 1, '', 1, NULL, NULL),
	(26, 'application', 'tech-resource-status', 'count', 0, '', 2, NULL, NULL),
	(27, 'application', 'tech-resource-status', 'create', 0, '', 1, NULL, NULL),
	(28, 'application', 'tech-resource-status', 'create', 0, '', 2, NULL, NULL),
	(29, 'application', 'tech-resource-status', 'delete', 0, '', 2, NULL, NULL),
	(30, 'application', 'tech-resource-status', 'find', 1, '', 1, NULL, NULL),
	(31, 'application', 'tech-resource-status', 'delete', 0, '', 1, NULL, NULL),
	(32, 'application', 'tech-resource-status', 'find', 0, '', 2, NULL, NULL),
	(33, 'application', 'tech-resource-status', 'findone', 1, '', 1, NULL, NULL),
	(34, 'application', 'tech-resource-status', 'findone', 0, '', 2, NULL, NULL),
	(35, 'application', 'tech-resource-status', 'update', 0, '', 2, NULL, NULL),
	(36, 'application', 'tech-resource', 'count', 1, '', 1, NULL, NULL),
	(37, 'application', 'tech-resource', 'count', 0, '', 2, NULL, NULL),
	(38, 'application', 'tech-resource', 'create', 1, '', 1, NULL, NULL),
	(39, 'application', 'tech-resource', 'create', 0, '', 2, NULL, NULL),
	(40, 'application', 'tech-resource', 'delete', 1, '', 1, NULL, NULL),
	(41, 'application', 'tech-resource', 'delete', 0, '', 2, NULL, NULL),
	(42, 'application', 'tech-resource-status', 'update', 0, '', 1, NULL, NULL),
	(43, 'application', 'tech-resource', 'find', 1, '', 1, NULL, NULL),
	(44, 'application', 'tech-resource', 'find', 0, '', 2, NULL, NULL),
	(45, 'application', 'tech-resource', 'findone', 1, '', 1, NULL, NULL),
	(46, 'application', 'tech-resource', 'findone', 0, '', 2, NULL, NULL),
	(47, 'application', 'tech-resource', 'update', 0, '', 2, NULL, NULL),
	(48, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 1, NULL, NULL),
	(49, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 2, NULL, NULL),
	(50, 'content-manager', 'collection-types', 'create', 0, '', 1, NULL, NULL),
	(51, 'content-manager', 'collection-types', 'create', 0, '', 2, NULL, NULL),
	(52, 'content-manager', 'collection-types', 'delete', 0, '', 1, NULL, NULL),
	(53, 'application', 'tech-resource', 'update', 1, '', 1, NULL, NULL),
	(54, 'content-manager', 'collection-types', 'delete', 0, '', 2, NULL, NULL),
	(55, 'content-manager', 'collection-types', 'find', 0, '', 1, NULL, NULL),
	(56, 'content-manager', 'collection-types', 'find', 0, '', 2, NULL, NULL),
	(57, 'content-manager', 'collection-types', 'findone', 0, '', 1, NULL, NULL),
	(58, 'content-manager', 'collection-types', 'findone', 0, '', 2, NULL, NULL),
	(59, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 1, NULL, NULL),
	(60, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 2, NULL, NULL),
	(61, 'content-manager', 'collection-types', 'publish', 0, '', 1, NULL, NULL),
	(62, 'content-manager', 'collection-types', 'publish', 0, '', 2, NULL, NULL),
	(63, 'content-manager', 'collection-types', 'unpublish', 0, '', 1, NULL, NULL),
	(64, 'content-manager', 'collection-types', 'unpublish', 0, '', 2, NULL, NULL),
	(65, 'content-manager', 'collection-types', 'update', 0, '', 1, NULL, NULL),
	(66, 'content-manager', 'collection-types', 'update', 0, '', 2, NULL, NULL),
	(67, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 1, NULL, NULL),
	(68, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 2, NULL, NULL),
	(69, 'content-manager', 'components', 'findcomponents', 0, '', 1, NULL, NULL),
	(70, 'content-manager', 'components', 'findcomponents', 0, '', 2, NULL, NULL),
	(71, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 1, NULL, NULL),
	(72, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 2, NULL, NULL),
	(73, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 1, NULL, NULL),
	(74, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 2, NULL, NULL),
	(75, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 1, NULL, NULL),
	(76, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 2, NULL, NULL),
	(77, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 1, NULL, NULL),
	(78, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 2, NULL, NULL),
	(79, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 2, NULL, NULL),
	(80, 'content-manager', 'relations', 'find', 0, '', 1, NULL, NULL),
	(81, 'content-manager', 'relations', 'find', 0, '', 2, NULL, NULL),
	(82, 'content-manager', 'single-types', 'createorupdate', 0, '', 1, NULL, NULL),
	(83, 'content-manager', 'single-types', 'createorupdate', 0, '', 2, NULL, NULL),
	(84, 'content-manager', 'single-types', 'delete', 0, '', 1, NULL, NULL),
	(85, 'content-manager', 'single-types', 'delete', 0, '', 2, NULL, NULL),
	(86, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 1, NULL, NULL),
	(87, 'content-manager', 'single-types', 'find', 0, '', 1, NULL, NULL),
	(88, 'content-manager', 'single-types', 'find', 0, '', 2, NULL, NULL),
	(89, 'content-manager', 'single-types', 'publish', 0, '', 1, NULL, NULL),
	(90, 'content-manager', 'single-types', 'publish', 0, '', 2, NULL, NULL),
	(91, 'content-manager', 'single-types', 'unpublish', 0, '', 1, NULL, NULL),
	(92, 'content-manager', 'single-types', 'unpublish', 0, '', 2, NULL, NULL),
	(93, 'content-manager', 'uid', 'checkuidavailability', 0, '', 1, NULL, NULL),
	(94, 'content-manager', 'uid', 'generateuid', 0, '', 1, NULL, NULL),
	(95, 'content-manager', 'uid', 'generateuid', 0, '', 2, NULL, NULL),
	(96, 'content-type-builder', 'builder', 'getreservednames', 0, '', 1, NULL, NULL),
	(97, 'content-manager', 'uid', 'checkuidavailability', 0, '', 2, NULL, NULL),
	(98, 'content-type-builder', 'builder', 'getreservednames', 0, '', 2, NULL, NULL),
	(99, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1, NULL, NULL),
	(100, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2, NULL, NULL),
	(101, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1, NULL, NULL),
	(102, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2, NULL, NULL),
	(103, 'content-type-builder', 'components', 'createcomponent', 0, '', 1, NULL, NULL),
	(104, 'content-type-builder', 'components', 'createcomponent', 0, '', 2, NULL, NULL),
	(105, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2, NULL, NULL),
	(106, 'content-type-builder', 'components', 'getcomponent', 0, '', 1, NULL, NULL),
	(107, 'content-type-builder', 'components', 'getcomponent', 0, '', 2, NULL, NULL),
	(108, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1, NULL, NULL),
	(109, 'content-type-builder', 'components', 'getcomponents', 0, '', 1, NULL, NULL),
	(110, 'content-type-builder', 'components', 'getcomponents', 0, '', 2, NULL, NULL),
	(111, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1, NULL, NULL),
	(112, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2, NULL, NULL),
	(113, 'content-type-builder', 'connections', 'getconnections', 0, '', 1, NULL, NULL),
	(114, 'content-type-builder', 'connections', 'getconnections', 0, '', 2, NULL, NULL),
	(115, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1, NULL, NULL),
	(116, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2, NULL, NULL),
	(117, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1, NULL, NULL),
	(118, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2, NULL, NULL),
	(119, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1, NULL, NULL),
	(120, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2, NULL, NULL),
	(121, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1, NULL, NULL),
	(122, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2, NULL, NULL),
	(123, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1, NULL, NULL),
	(124, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2, NULL, NULL),
	(125, 'email', 'email', 'getsettings', 0, '', 2, NULL, NULL),
	(126, 'email', 'email', 'send', 0, '', 1, NULL, NULL),
	(127, 'email', 'email', 'send', 0, '', 2, NULL, NULL),
	(128, 'email', 'email', 'test', 0, '', 1, NULL, NULL),
	(129, 'email', 'email', 'getsettings', 0, '', 1, NULL, NULL),
	(130, 'email', 'email', 'test', 0, '', 2, NULL, NULL),
	(131, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 1, NULL, NULL),
	(132, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 2, NULL, NULL),
	(133, 'i18n', 'iso-locales', 'listisolocales', 0, '', 1, NULL, NULL),
	(134, 'i18n', 'iso-locales', 'listisolocales', 0, '', 2, NULL, NULL),
	(135, 'i18n', 'locales', 'createlocale', 0, '', 1, NULL, NULL),
	(136, 'i18n', 'locales', 'createlocale', 0, '', 2, NULL, NULL),
	(137, 'i18n', 'locales', 'deletelocale', 0, '', 1, NULL, NULL),
	(138, 'i18n', 'locales', 'deletelocale', 0, '', 2, NULL, NULL),
	(139, 'i18n', 'locales', 'listlocales', 0, '', 1, NULL, NULL),
	(140, 'i18n', 'locales', 'listlocales', 0, '', 2, NULL, NULL),
	(141, 'i18n', 'locales', 'updatelocale', 0, '', 1, NULL, NULL),
	(142, 'i18n', 'locales', 'updatelocale', 0, '', 2, NULL, NULL),
	(143, 'upload', 'upload', 'count', 0, '', 1, NULL, NULL),
	(144, 'upload', 'upload', 'destroy', 0, '', 1, NULL, NULL),
	(145, 'upload', 'upload', 'destroy', 0, '', 2, NULL, NULL),
	(146, 'upload', 'upload', 'find', 0, '', 1, NULL, NULL),
	(147, 'upload', 'upload', 'find', 0, '', 2, NULL, NULL),
	(148, 'upload', 'upload', 'findone', 0, '', 1, NULL, NULL),
	(149, 'upload', 'upload', 'findone', 0, '', 2, NULL, NULL),
	(150, 'upload', 'upload', 'count', 0, '', 2, NULL, NULL),
	(151, 'upload', 'upload', 'getsettings', 0, '', 1, NULL, NULL),
	(152, 'upload', 'upload', 'getsettings', 0, '', 2, NULL, NULL),
	(153, 'upload', 'upload', 'search', 0, '', 1, NULL, NULL),
	(154, 'upload', 'upload', 'search', 0, '', 2, NULL, NULL),
	(155, 'upload', 'upload', 'updatesettings', 0, '', 1, NULL, NULL),
	(156, 'upload', 'upload', 'updatesettings', 0, '', 2, NULL, NULL),
	(157, 'upload', 'upload', 'upload', 0, '', 1, NULL, NULL),
	(158, 'upload', 'upload', 'upload', 0, '', 2, NULL, NULL),
	(159, 'users-permissions', 'auth', 'callback', 0, '', 1, NULL, NULL),
	(160, 'users-permissions', 'auth', 'callback', 1, '', 2, NULL, NULL),
	(161, 'users-permissions', 'auth', 'connect', 1, '', 1, NULL, NULL),
	(162, 'users-permissions', 'auth', 'connect', 1, '', 2, NULL, NULL),
	(163, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1, NULL, NULL),
	(164, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2, NULL, NULL),
	(165, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1, NULL, NULL),
	(166, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2, NULL, NULL),
	(167, 'users-permissions', 'auth', 'register', 0, '', 1, NULL, NULL),
	(168, 'users-permissions', 'auth', 'register', 1, '', 2, NULL, NULL),
	(169, 'users-permissions', 'auth', 'resetpassword', 0, '', 1, NULL, NULL),
	(170, 'users-permissions', 'auth', 'resetpassword', 1, '', 2, NULL, NULL),
	(171, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1, NULL, NULL),
	(172, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2, NULL, NULL),
	(173, 'users-permissions', 'user', 'count', 0, '', 1, NULL, NULL),
	(174, 'users-permissions', 'user', 'count', 0, '', 2, NULL, NULL),
	(175, 'users-permissions', 'user', 'create', 0, '', 1, NULL, NULL),
	(176, 'users-permissions', 'user', 'destroy', 0, '', 1, NULL, NULL),
	(177, 'users-permissions', 'user', 'destroy', 0, '', 2, NULL, NULL),
	(178, 'users-permissions', 'user', 'destroyall', 0, '', 1, NULL, NULL),
	(179, 'users-permissions', 'user', 'destroyall', 0, '', 2, NULL, NULL),
	(180, 'users-permissions', 'user', 'find', 0, '', 1, NULL, NULL),
	(181, 'users-permissions', 'user', 'find', 0, '', 2, NULL, NULL),
	(182, 'users-permissions', 'user', 'findone', 0, '', 1, NULL, NULL),
	(183, 'users-permissions', 'user', 'findone', 0, '', 2, NULL, NULL),
	(184, 'users-permissions', 'user', 'create', 0, '', 2, NULL, NULL),
	(185, 'users-permissions', 'user', 'me', 1, '', 1, NULL, NULL),
	(186, 'users-permissions', 'user', 'me', 1, '', 2, NULL, NULL),
	(187, 'users-permissions', 'user', 'update', 0, '', 2, NULL, NULL),
	(188, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1, NULL, NULL),
	(189, 'users-permissions', 'user', 'update', 0, '', 1, NULL, NULL),
	(190, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2, NULL, NULL),
	(191, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1, NULL, NULL),
	(192, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2, NULL, NULL),
	(193, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1, NULL, NULL),
	(194, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2, NULL, NULL),
	(195, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1, NULL, NULL),
	(196, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2, NULL, NULL),
	(197, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1, NULL, NULL),
	(198, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1, NULL, NULL),
	(199, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2, NULL, NULL),
	(200, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2, NULL, NULL),
	(201, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2, NULL, NULL),
	(202, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1, NULL, NULL),
	(203, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2, NULL, NULL),
	(204, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1, NULL, NULL),
	(205, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2, NULL, NULL),
	(206, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1, NULL, NULL),
	(207, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1, NULL, NULL),
	(208, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2, NULL, NULL),
	(209, 'users-permissions', 'userspermissions', 'index', 0, '', 1, NULL, NULL),
	(210, 'users-permissions', 'userspermissions', 'index', 0, '', 2, NULL, NULL),
	(211, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2, NULL, NULL),
	(212, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1, NULL, NULL),
	(213, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2, NULL, NULL),
	(214, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1, NULL, NULL),
	(215, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1, NULL, NULL),
	(216, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2, NULL, NULL),
	(217, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1, NULL, NULL),
	(218, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2, NULL, NULL),
	(219, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1, NULL, NULL),
	(220, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2, NULL, NULL),
	(221, 'application', 'syslog', 'count', 0, '', 2, NULL, NULL),
	(222, 'application', 'syslog', 'delete', 0, '', 1, NULL, NULL),
	(223, 'application', 'syslog', 'create', 0, '', 2, NULL, NULL),
	(224, 'application', 'syslog', 'find', 0, '', 1, NULL, NULL),
	(225, 'application', 'syslog', 'delete', 0, '', 2, NULL, NULL),
	(226, 'application', 'syslog', 'count', 0, '', 1, NULL, NULL),
	(227, 'application', 'syslog', 'findone', 0, '', 1, NULL, NULL),
	(228, 'application', 'syslog', 'find', 0, '', 2, NULL, NULL),
	(229, 'application', 'syslog', 'create', 1, '', 1, NULL, NULL),
	(230, 'application', 'syslog', 'findone', 0, '', 2, NULL, NULL),
	(231, 'application', 'syslog', 'update', 0, '', 1, NULL, NULL),
	(232, 'application', 'syslog', 'update', 0, '', 2, NULL, NULL),
	(233, 'application', 'metatheme-section', 'count', 1, '', 1, NULL, NULL),
	(234, 'application', 'metatheme-section', 'count', 0, '', 2, NULL, NULL),
	(235, 'application', 'metatheme-section', 'create', 0, '', 1, NULL, NULL),
	(236, 'application', 'metatheme-section', 'delete', 0, '', 1, NULL, NULL),
	(237, 'application', 'metatheme-section', 'create', 0, '', 2, NULL, NULL),
	(238, 'application', 'metatheme-section', 'delete', 0, '', 2, NULL, NULL),
	(239, 'application', 'metatheme-section', 'find', 1, '', 1, NULL, NULL),
	(240, 'application', 'metatheme-section', 'find', 0, '', 2, NULL, NULL),
	(241, 'application', 'metatheme-section', 'findone', 1, '', 1, NULL, NULL),
	(242, 'application', 'metatheme-section', 'findone', 0, '', 2, NULL, NULL),
	(243, 'application', 'metatheme-section', 'update', 0, '', 1, NULL, NULL),
	(244, 'application', 'metatheme-section', 'update', 0, '', 2, NULL, NULL),
	(245, 'application', 'metatheme-inclusion', 'count', 1, '', 1, NULL, NULL),
	(246, 'application', 'metatheme-inclusion', 'count', 0, '', 2, NULL, NULL),
	(247, 'application', 'metatheme-inclusion', 'create', 0, '', 2, NULL, NULL),
	(248, 'application', 'metatheme-inclusion', 'create', 0, '', 1, NULL, NULL),
	(249, 'application', 'metatheme-inclusion', 'delete', 0, '', 1, NULL, NULL),
	(250, 'application', 'metatheme-inclusion', 'delete', 0, '', 2, NULL, NULL),
	(251, 'application', 'metatheme-inclusion', 'find', 1, '', 1, NULL, NULL),
	(252, 'application', 'metatheme-inclusion', 'find', 0, '', 2, NULL, NULL),
	(253, 'application', 'metatheme-inclusion', 'findone', 1, '', 1, NULL, NULL),
	(254, 'application', 'metatheme-inclusion', 'findone', 0, '', 2, NULL, NULL),
	(255, 'application', 'metatheme-inclusion', 'update', 0, '', 1, NULL, NULL),
	(256, 'application', 'metatheme-inclusion', 'update', 0, '', 2, NULL, NULL),
	(257, 'application', 'metatheme-aether', 'count', 1, '', 1, NULL, NULL),
	(258, 'application', 'metatheme-aether', 'count', 0, '', 2, NULL, NULL),
	(259, 'application', 'metatheme-aether', 'create', 0, '', 1, NULL, NULL),
	(260, 'application', 'metatheme-aether', 'create', 0, '', 2, NULL, NULL),
	(261, 'application', 'metatheme-aether', 'delete', 0, '', 1, NULL, NULL),
	(262, 'application', 'metatheme-aether', 'delete', 0, '', 2, NULL, NULL),
	(263, 'application', 'metatheme-aether', 'find', 1, '', 1, NULL, NULL),
	(264, 'application', 'metatheme-aether', 'find', 0, '', 2, NULL, NULL),
	(265, 'application', 'metatheme-aether', 'findone', 1, '', 1, NULL, NULL),
	(266, 'application', 'metatheme-aether', 'findone', 0, '', 2, NULL, NULL),
	(267, 'application', 'metatheme-aether', 'update', 0, '', 1, NULL, NULL),
	(268, 'application', 'metatheme-aether', 'update', 0, '', 2, NULL, NULL),
	(269, 'application', 'metatheme-aether-plan', 'count', 1, '', 1, NULL, NULL),
	(270, 'application', 'metatheme-aether-plan', 'count', 0, '', 2, NULL, NULL),
	(271, 'application', 'metatheme-aether-plan', 'create', 0, '', 2, NULL, NULL),
	(272, 'application', 'metatheme-aether-plan', 'delete', 0, '', 2, NULL, NULL),
	(273, 'application', 'metatheme-aether-plan', 'find', 1, '', 1, NULL, NULL),
	(274, 'application', 'metatheme-aether-plan', 'delete', 0, '', 1, NULL, NULL),
	(275, 'application', 'metatheme-aether-plan', 'create', 0, '', 1, NULL, NULL),
	(276, 'application', 'metatheme-aether-plan', 'find', 0, '', 2, NULL, NULL),
	(277, 'application', 'metatheme-aether-plan', 'findone', 1, '', 1, NULL, NULL),
	(278, 'application', 'metatheme-aether-plan', 'findone', 0, '', 2, NULL, NULL),
	(279, 'application', 'metatheme-aether-plan', 'update', 0, '', 1, NULL, NULL),
	(280, 'application', 'metatheme-aether-plan', 'update', 0, '', 2, NULL, NULL),
	(281, 'application', 'employee', 'count', 1, '', 1, NULL, NULL),
	(282, 'application', 'employee', 'count', 0, '', 2, NULL, NULL),
	(283, 'application', 'employee', 'create', 0, '', 1, NULL, NULL),
	(284, 'application', 'employee', 'create', 0, '', 2, NULL, NULL),
	(285, 'application', 'employee', 'delete', 0, '', 1, NULL, NULL),
	(286, 'application', 'employee', 'delete', 0, '', 2, NULL, NULL),
	(287, 'application', 'employee', 'find', 1, '', 1, NULL, NULL),
	(288, 'application', 'employee', 'find', 0, '', 2, NULL, NULL),
	(289, 'application', 'employee', 'findone', 1, '', 1, NULL, NULL),
	(290, 'application', 'employee', 'findone', 0, '', 2, NULL, NULL),
	(291, 'application', 'employee', 'update', 0, '', 1, NULL, NULL),
	(292, 'application', 'employee', 'update', 0, '', 2, NULL, NULL),
	(293, 'application', 'employee-role', 'count', 1, '', 1, NULL, NULL),
	(294, 'application', 'employee-role', 'count', 0, '', 2, NULL, NULL),
	(295, 'application', 'employee-role', 'create', 0, '', 1, NULL, NULL),
	(296, 'application', 'employee-role', 'delete', 0, '', 1, NULL, NULL),
	(297, 'application', 'employee-role', 'delete', 0, '', 2, NULL, NULL),
	(298, 'application', 'employee-role', 'find', 1, '', 1, NULL, NULL),
	(299, 'application', 'employee-role', 'find', 0, '', 2, NULL, NULL),
	(300, 'application', 'employee-role', 'create', 0, '', 2, NULL, NULL),
	(301, 'application', 'employee-role', 'findone', 1, '', 1, NULL, NULL),
	(302, 'application', 'employee-role', 'findone', 0, '', 2, NULL, NULL),
	(303, 'application', 'employee-role', 'update', 0, '', 1, NULL, NULL),
	(304, 'application', 'employee-role', 'update', 0, '', 2, NULL, NULL),
	(305, 'application', 'metatheme', 'count', 1, '', 1, NULL, NULL),
	(306, 'application', 'metatheme', 'count', 0, '', 2, NULL, NULL),
	(307, 'application', 'metatheme', 'create', 1, '', 1, NULL, NULL),
	(308, 'application', 'metatheme', 'delete', 1, '', 1, NULL, NULL),
	(309, 'application', 'metatheme', 'create', 0, '', 2, NULL, NULL),
	(310, 'application', 'metatheme', 'delete', 0, '', 2, NULL, NULL),
	(311, 'application', 'metatheme', 'find', 1, '', 1, NULL, NULL),
	(312, 'application', 'metatheme', 'find', 0, '', 2, NULL, NULL),
	(313, 'application', 'metatheme', 'findone', 1, '', 1, NULL, NULL),
	(314, 'application', 'metatheme', 'findone', 0, '', 2, NULL, NULL),
	(315, 'application', 'metatheme', 'update', 1, '', 1, NULL, NULL),
	(316, 'application', 'metatheme', 'update', 0, '', 2, NULL, NULL);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.users-permissions_role
CREATE TABLE IF NOT EXISTS `users-permissions_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.users-permissions_role: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`, `created_by`, `updated_by`) VALUES
	(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', NULL, NULL),
	(2, 'Public', 'Default role given to unauthenticated user.', 'public', NULL, NULL);
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.users-permissions_user
CREATE TABLE IF NOT EXISTS `users-permissions_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.users-permissions_user: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmationToken`, `confirmed`, `blocked`, `role`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'user1@user1.ru', 'user1@user1.ru', 'local', '$2a$10$znfFGmUKzh21ZyoBb29cceXRlo9nZVcH0BF7yLQqGlP2IwObc4L9S', NULL, NULL, 1, 0, 1, 1, 1, '2021-06-01 08:13:28', '2021-06-01 08:13:28');
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
