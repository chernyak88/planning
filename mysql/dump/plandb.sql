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
DROP DATABASE IF EXISTS `plandb`;
CREATE DATABASE IF NOT EXISTS `plandb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plandb`;

-- Дамп структуры для таблица plandb.core_store
DROP TABLE IF EXISTS `core_store`;
CREATE TABLE IF NOT EXISTS `core_store` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
	(17, 'plugin_content_manager_configuration_content_types::application::servicelog.servicelog', '{"uid":"application::servicelog.servicelog","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"ContentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ContentType","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author","searchable":false,"sortable":false}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","contentType","action","name"],"editRelations":[],"edit":[[{"name":"contentType","size":6},{"name":"action","size":6}],[{"name":"author","size":12}],[{"name":"content","size":12}],[{"name":"name","size":6}]]}}', 'object', '', ''),
	(18, 'plugin_content_manager_configuration_content_types::application::location.location', '{"uid":"application::location.location","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"name","size":6}]]}}', 'object', '', ''),
	(19, 'plugin_content_manager_configuration_content_types::application::tech-resource.tech-resource', '{"uid":"application::tech-resource.tech-resource","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"location":{"edit":{"label":"Location","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Location","searchable":true,"sortable":true}},"status":{"edit":{"label":"Status","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Status","searchable":true,"sortable":true}},"comment":{"edit":{"label":"Comment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comment","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","type","location"],"editRelations":["location","status"],"edit":[[{"name":"name","size":6},{"name":"type","size":6}],[{"name":"comment","size":12}]]}}', 'object', '', ''),
	(20, 'plugin_content_manager_configuration_content_types::strapi::permission', '{"uid":"strapi::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"Properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}', 'object', '', ''),
	(21, 'plugin_content_manager_configuration_content_types::application::tech-resource-status.tech-resource-status', '{"uid":"application::tech-resource-status.tech-resource-status","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"name","size":6}]]}}', 'object', '', ''),
	(22, 'plugin_content_manager_configuration_content_types::strapi::user', '{"uid":"strapi::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"PreferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreferedLanguage","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}', 'object', '', ''),
	(23, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}', 'object', '', ''),
	(24, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', '', ''),
	(25, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"editRelations":["role"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4}]]}}', 'object', '', ''),
	(26, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', '', ''),
	(27, 'plugin_content_manager_configuration_content_types::strapi::role', '{"uid":"strapi::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}', 'object', '', ''),
	(28, 'plugin_content_manager_configuration_content_types::plugins::i18n.locale', '{"uid":"plugins::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","created_at"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', '', ''),
	(29, 'plugin_i18n_default_locale', '"en"', 'string', '', ''),
	(30, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}', 'object', '', ''),
	(31, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', '', ''),
	(32, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null}}', 'object', '', '');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.i18n_locales
DROP TABLE IF EXISTS `i18n_locales`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.i18n_locales: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `i18n_locales` DISABLE KEYS */;
INSERT INTO `i18n_locales` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'English (en)', 'en', NULL, NULL, '2021-06-01 07:58:38', '2021-06-01 07:58:38');
/*!40000 ALTER TABLE `i18n_locales` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.locations
DROP TABLE IF EXISTS `locations`;
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

-- Дамп структуры для таблица plandb.servicelogs
DROP TABLE IF EXISTS `servicelogs`;
CREATE TABLE IF NOT EXISTS `servicelogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `author` longtext,
  `content` longtext,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.servicelogs: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `servicelogs` DISABLE KEYS */;
INSERT INTO `servicelogs` (`id`, `contentType`, `action`, `author`, `content`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(37, 'techresource', 'create', '{"session":{},"_passport":{"instance":{"_key":"passport","_strategies":{"session":{"name":"session"},"local":{"_usernameField":"email","_passwordField":"password","name":"local"}},"_serializers":[],"_deserializers":[],"_infoTransformers":[],"_framework":{},"_userProperty":"user","_sm":{"_key":"passport"},"strategies":{}}},"user":{"id":1,"username":"user1@user1.ru","email":"user1@user1.ru","provider":"local","password":"$2a$10$znfFGmUKzh21ZyoBb29cceXRlo9nZVcH0BF7yLQqGlP2IwObc4L9S","resetPasswordToken":null,"confirmationToken":null,"confirmed":true,"blocked":false,"role":{"id":1,"name":"Authenticated","description":"Default role given to authenticated user.","type":"authenticated","created_by":null,"updated_by":null},"created_by":1,"updated_by":1,"created_at":"2021-06-01T08:13:28.000Z","updated_at":"2021-06-01T08:13:28.000Z"}}', '{"id":17,"name":"ТЖК 017","type":"стандартный комплект ТЖК","location":{"id":1,"name":"Москва","created_by":1,"updated_by":1,"created_at":"2021-06-01T08:14:50.000Z","updated_at":"2021-06-01T08:14:50.000Z"},"status":{"id":2,"name":"Ремонт","created_by":1,"updated_by":1,"created_at":"2021-06-01T08:15:28.000Z","updated_at":"2021-06-01T08:15:28.000Z"},"comment":"<p>Комментарий 17</p>","published_at":"2021-06-03T11:24:19.000Z","created_by":null,"updated_by":null,"created_at":"2021-06-03T11:24:19.000Z","updated_at":"2021-06-03T11:24:19.000Z"}', 'ТЖК 017', NULL, NULL, '2021-06-03 11:24:19', '2021-06-03 11:24:19');
/*!40000 ALTER TABLE `servicelogs` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_administrator
DROP TABLE IF EXISTS `strapi_administrator`;
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
	(1, 'Admin', '123', NULL, 'admin@admin.ru', '$2a$10$NUZ6xhDbp52DXfVG9EHHFOlwNSkBYguQqTrrrhoBJAdB8pwk/yu0u', NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_permission
DROP TABLE IF EXISTS `strapi_permission`;
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы plandb.strapi_permission: ~104 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;
INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `properties`, `conditions`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(2, 'plugins::content-manager.explorer.create', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(3, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(4, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(5, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(6, 'plugins::content-manager.explorer.read', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(7, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(8, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(9, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(10, 'plugins::content-manager.explorer.update', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(11, 'plugins::content-manager.explorer.update', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(12, 'plugins::content-manager.explorer.update', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(13, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(14, 'plugins::content-manager.explorer.delete', 'application::servicelog.servicelog', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(15, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(16, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(17, 'plugins::content-manager.explorer.publish', 'application::tech-resource.tech-resource', '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(18, 'plugins::upload.read', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(19, 'plugins::upload.assets.create', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(20, 'plugins::upload.assets.update', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(21, 'plugins::upload.assets.download', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(22, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 2, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(23, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(24, 'plugins::content-manager.explorer.create', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(25, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(26, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(27, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(28, 'plugins::content-manager.explorer.read', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(29, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(30, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(31, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(32, 'plugins::content-manager.explorer.update', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(33, 'plugins::content-manager.explorer.update', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(34, 'plugins::content-manager.explorer.update', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(35, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(36, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(37, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(38, 'plugins::upload.read', NULL, '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(39, 'plugins::upload.assets.create', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(40, 'plugins::upload.assets.update', NULL, '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(41, 'plugins::upload.assets.download', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(42, 'plugins::content-manager.explorer.delete', 'application::servicelog.servicelog', '{}', '["admin::is-creator"]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(43, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 3, '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(44, 'plugins::content-manager.explorer.create', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(45, 'plugins::content-manager.explorer.create', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(46, 'plugins::content-manager.explorer.create', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(47, 'plugins::content-manager.explorer.create', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(48, 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '{"fields":["username","email","provider","password","resetPasswordToken","confirmationToken","confirmed","blocked","role"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(49, 'plugins::content-manager.explorer.read', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(50, 'plugins::content-manager.explorer.read', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(51, 'plugins::content-manager.explorer.read', 'application::tech-resource-status.tech-resource-status', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(52, 'plugins::content-manager.explorer.read', 'application::tech-resource.tech-resource', '{"fields":["name","type","location","status","comment"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(53, 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '{"fields":["username","email","provider","password","resetPasswordToken","confirmationToken","confirmed","blocked","role"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(54, 'plugins::content-manager.explorer.update', 'application::location.location', '{"fields":["name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
	(55, 'plugins::content-manager.explorer.update', 'application::servicelog.servicelog', '{"fields":["contentType","action","author","content","name"]}', '[]', 1, '2021-06-01 07:58:45', '2021-06-01 07:58:45'),
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
	(195, 'plugins::content-manager.explorer.delete', 'application::tech-resource.tech-resource', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53'),
	(196, 'plugins::content-manager.explorer.delete', 'application::tech-resource-status.tech-resource-status', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53'),
	(197, 'plugins::content-manager.explorer.delete', 'application::servicelog.servicelog', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53'),
	(198, 'plugins::content-manager.explorer.delete', 'application::location.location', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53'),
	(199, 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53'),
	(200, 'plugins::content-manager.explorer.publish', 'application::tech-resource.tech-resource', '{}', '[]', 1, '2021-06-03 10:44:53', '2021-06-03 10:44:53');
/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_role
DROP TABLE IF EXISTS `strapi_role`;
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

-- Дамп данных таблицы plandb.strapi_role: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;
INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-06-01 07:58:44', '2021-06-01 07:58:44'),
	(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-06-01 07:58:44', '2021-06-01 07:58:44');
/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.strapi_users_roles
DROP TABLE IF EXISTS `strapi_users_roles`;
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
DROP TABLE IF EXISTS `strapi_webhooks`;
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

-- Дамп структуры для таблица plandb.tech_resources
DROP TABLE IF EXISTS `tech_resources`;
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

-- Дамп данных таблицы plandb.tech_resources: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `tech_resources` DISABLE KEYS */;
INSERT INTO `tech_resources` (`id`, `name`, `type`, `location`, `status`, `comment`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'ТЖК 001', 'стандартный комплект ТЖК', 1, 1, '<p>Комментарий 1</p><p>тест</p><p><br></p><p><strong>Жирный</strong></p><p><em>Курсив</em></p><p><u>Подчеркнутый</u></p><p><s>Зачеркнутый</s></p><p><br></p><p class="ql-align-center">По центру</p><ol><li>Нумерованный</li><li>Список</li></ol><p><br></p><ul><li>Ненумерованный</li><li>Список</li></ul><p><br></p><p><span style="color: rgb(230, 0, 0);">Цвет шрифта</span></p><p><span style="color: rgb(255, 255, 255); background-color: rgb(0, 71, 178);">Фон и цвет шрифта</span></p>', '2021-06-01 08:16:30', NULL, NULL, '2021-06-01 08:16:30', '2021-06-03 11:13:24'),
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
DROP TABLE IF EXISTS `tech_resource_statuses`;
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
DROP TABLE IF EXISTS `upload_file`;
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
DROP TABLE IF EXISTS `upload_file_morph`;
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
DROP TABLE IF EXISTS `users-permissions_permission`;
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
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
	(13, 'application', 'servicelog', 'count', 0, '', 1, NULL, NULL),
	(14, 'application', 'servicelog', 'create', 0, '', 1, NULL, NULL),
	(15, 'application', 'servicelog', 'create', 0, '', 2, NULL, NULL),
	(16, 'application', 'servicelog', 'delete', 0, '', 1, NULL, NULL),
	(17, 'application', 'servicelog', 'delete', 0, '', 2, NULL, NULL),
	(18, 'application', 'servicelog', 'find', 0, '', 1, NULL, NULL),
	(19, 'application', 'servicelog', 'find', 0, '', 2, NULL, NULL),
	(20, 'application', 'servicelog', 'count', 0, '', 2, NULL, NULL),
	(21, 'application', 'servicelog', 'findone', 0, '', 1, NULL, NULL),
	(22, 'application', 'servicelog', 'findone', 0, '', 2, NULL, NULL),
	(23, 'application', 'servicelog', 'update', 0, '', 1, NULL, NULL),
	(24, 'application', 'servicelog', 'update', 0, '', 2, NULL, NULL),
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
	(220, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2, NULL, NULL);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;

-- Дамп структуры для таблица plandb.users-permissions_role
DROP TABLE IF EXISTS `users-permissions_role`;
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
DROP TABLE IF EXISTS `users-permissions_user`;
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
