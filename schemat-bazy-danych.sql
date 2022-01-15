-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: requestexchangerate
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apikey`
--

DROP TABLE IF EXISTS `apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apikey` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apikey`
--

LOCK TABLES `apikey` WRITE;
/*!40000 ALTER TABLE `apikey` DISABLE KEYS */;
INSERT INTO `apikey` VALUES (1,'rHqqvw+DGatv2HIWjHufU/z4ek8UfE69k9Bm8WpBMSM='),(2,'MVG2zdOsfUG5kBj3H1wAbPGGNNj5tWzYidkrpBon0/U='),(3,'uwzzu9Y4DzMkGFXDbBr2Gr3tm5vhM+ueyXlq2e4wS2g='),(4,'xFaZv+mrGvEgY9a4ZxVA32+p0HXgOkhcODFH/5xL+hg='),(5,'V0kTp5zbjbRgn4rgOg9NCA4wr199aPjtDioPO32NaXY='),(6,'O67c0RDUHJohjwIUOg1pJh9LkoYX1Y+cA7ouusswRXw=');
/*!40000 ALTER TABLE `apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchangerate`
--

DROP TABLE IF EXISTS `exchangerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchangerate` (
  `ExchangeRateId` char(36) NOT NULL,
  `Date` date NOT NULL,
  `Value` decimal(15,4) NOT NULL,
  `RequestId` char(36) NOT NULL,
  PRIMARY KEY (`ExchangeRateId`),
  KEY `fk_ExchangeRate_Request_idx` (`RequestId`),
  CONSTRAINT `fk_ExchangeRate_Request` FOREIGN KEY (`RequestId`) REFERENCES `request` (`RequestId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchangerate`
--

LOCK TABLES `exchangerate` WRITE;
/*!40000 ALTER TABLE `exchangerate` DISABLE KEYS */;
INSERT INTO `exchangerate` VALUES ('03e91478-5608-4132-a753-d494dafce00a','2021-12-13',4.3900,'f98e4d74-0f68-4aac-89fd-047f1aaca6b1'),('03e91478-5608-4132-a753-d494dafce00b','2021-12-14',4.3901,'f98e4d74-0f68-4aac-89fd-047f1aaca6b1'),('03e91478-5608-4132-a753-d494dafce00c','2021-12-15',4.3902,'f98e4d74-0f68-4aac-89fd-047f1aaca6b1'),('03e91478-5608-4132-a753-d494dafce00d','2021-12-16',4.3903,'f98e4d74-0f68-4aac-89fd-047f1aaca6b1'),('03e91478-5608-4132-a753-d494dafce00e','2021-12-17',4.3904,'f98e4d74-0f68-4aac-89fd-047f1aaca6b1'),('08d9d5ec-18d5-444b-830d-73b9ac65bf0f','2021-06-01',4.4661,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-495b-8034-31621433f8af','2021-06-02',4.4653,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-49af-8cfd-4cc510734097','2021-06-03',4.4520,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-49d1-897c-50b64ae881ef','2021-06-04',4.4703,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4c5b-847e-271712a018bd','2021-06-07',4.4662,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4c82-824d-e9e92e6c6629','2021-06-08',4.4698,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4ca0-8074-f27b1528405a','2021-06-09',4.4560,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4cdb-8649-61179c228e47','2021-06-10',4.4818,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4d0c-88fe-19c6d520cd3a','2021-06-11',4.4695,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4d2c-8719-d85e64445472','2021-06-14',4.5152,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4d4c-8402-d774ba3ffd2f','2021-06-15',4.5235,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4d67-8b9b-9776ed1903f0','2021-06-16',4.5166,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4d81-85e3-b5c668d67d1f','2021-06-17',4.5375,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4da0-8865-4b6082b71cef','2021-06-18',4.5492,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4dba-8896-d7482837adaf','2021-06-21',4.5329,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4dd9-80e9-88e6bad46ca5','2021-06-22',4.5328,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4df8-81e8-a4d33172f7ae','2021-06-23',4.5227,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4e1d-8ad1-52dc64f37bd4','2021-06-24',4.5245,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18dd-4e3e-8bec-2ce37c5f3c1b','2021-06-25',4.5132,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18de-45b2-8eec-71896cdb65c2','2021-06-28',4.5070,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18de-462f-8ece-12cce64e84cf','2021-06-29',4.5193,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-18de-4677-8225-5da0a69ab612','2021-06-30',4.5201,'08d9d5ec-18c0-4691-8ec4-86011fdcb0c7'),('08d9d5ec-62e4-4753-84b7-1dda2308e1e6','2018-12-31',0.2325,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4ae8-89ef-60be7eaa984a','2019-01-02',0.2328,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4b37-8e76-ec515c81e296','2019-01-03',0.2327,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4b68-839b-153d6fc2cf65','2019-01-04',0.2328,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4b91-893d-21fbb1b8f7aa','2019-01-07',0.2331,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4bb7-8e04-93ce0c2418d7','2019-01-08',0.2323,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4bdc-8d72-b616d9dc5fc6','2019-01-09',0.2327,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4c04-8095-adfd49e48f6b','2019-01-10',0.2328,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4c28-877b-f0773435f239','2019-01-11',0.2327,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4c4f-8073-5e101e6e8a2a','2019-01-14',0.2330,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4ce6-806f-4bf6d4301d5a','2019-01-15',0.2329,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4d74-80d5-40380207300e','2019-01-16',0.2332,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4db4-8b2e-d51ddc114ce2','2019-01-17',0.2335,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4dea-8fda-4209396f6207','2019-01-18',0.2329,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4e21-83e0-21ce40dbb563','2019-01-21',0.2330,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4e50-8d53-86bdf5cba4e2','2019-01-22',0.2335,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4e78-87e9-f80f125adadc','2019-01-23',0.2332,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4e9f-827c-36e78f5baeff','2019-01-24',0.2332,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4ec2-84b5-54294eafd032','2019-01-25',0.2330,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e4-4f65-8e5d-e2325634611d','2019-01-28',0.2333,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e5-402a-810a-787a5683bd29','2019-01-29',0.2327,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e5-42de-845f-841d809aa583','2019-01-30',0.2331,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e5-4317-86cd-0bee943526cc','2019-01-31',0.2340,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ec-62e5-433c-84f4-88a6fb1e9206','2019-02-01',0.2340,'08d9d5ec-62e3-47a4-877b-827edd8f00d7'),('08d9d5ef-128e-4fe7-84c5-c26cbb111489','2013-12-31',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-45c3-88e3-efbd40a9b15f','2014-01-02',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4619-8138-b91c6e72374b','2014-01-03',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-46af-817b-1a4e5f9097d1','2014-01-06',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4a3c-822c-8e4b3dd5d3c0','2014-01-07',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4a6d-81e4-e73f367c2ffa','2014-01-08',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4a99-8e3c-1dded0e293ba','2014-01-09',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4ad1-8d12-16c1b138b457','2014-01-10',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4afb-8f9e-f939676597d1','2014-01-13',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4b2f-80a9-666a7eb6ee24','2014-01-14',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4b5a-80e0-0c5b927595e3','2014-01-15',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4b7a-8746-2511de98c7d2','2014-01-16',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4b9b-8b11-2b8d7c7f5d77','2014-01-17',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4bc0-86f1-3eb5306526f2','2014-01-20',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4be4-8a98-ec30ac091481','2014-01-21',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4c0a-804e-a84b721b530c','2014-01-22',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4c2f-8e1d-c6c6881bb8af','2014-01-23',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4c58-8206-0ff264cc0684','2014-01-24',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4c7d-87c5-6cef1731d003','2014-01-27',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4c9c-848a-99513a45d5fa','2014-01-28',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4cc2-80ba-373d287dbbb8','2014-01-29',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4ce1-8286-bb1668eaf9fc','2014-01-30',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4d06-81d0-dc22ee4ecd1a','2014-01-31',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4d25-85db-8d9f4f985206','2014-02-03',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4d43-8bd3-3234de03062b','2014-02-04',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4d6a-8826-824d05532a39','2014-02-05',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4d94-82e2-b6d1753a17be','2014-02-06',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4dbc-80de-7422f828aac5','2014-02-07',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4dde-8a8f-6e358e803592','2014-02-10',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4e05-8de6-e328ec8bf34e','2014-02-11',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4e25-8ad0-41f9386d0dfd','2014-02-12',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4e48-8b61-9929fced2271','2014-02-13',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4e66-8fe9-0f63d25f621a','2014-02-14',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4e89-8658-52f51d93452c','2014-02-17',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4ebb-833b-9fa02eb0d611','2014-02-18',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4edf-83f7-1d145fe2852c','2014-02-19',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4efe-8045-bbe25230f2e6','2014-02-20',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4f26-8f14-e7c644fbe0c5','2014-02-21',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4f4b-86a1-4b1f6416b19f','2014-02-24',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4f69-8e38-70f65f696939','2014-02-25',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4f8c-880b-cf75adb3c8db','2014-02-26',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4faa-8e4e-7f95901b85b5','2014-02-27',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-1296-4fcd-8493-0ceb5b400681','2014-02-28',0.5113,'08d9d5ef-127e-4855-8334-d31d5bdb62d3'),('08d9d5ef-c4ba-40e1-84a9-c4ea870427ec','2016-07-08',0.2258,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4368-87d0-d846676e0a5c','2016-07-11',0.2262,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-43b0-81f0-38380551e294','2016-07-12',0.2264,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-43d0-8ab2-1e28254128bb','2016-07-13',0.2270,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-43e9-8d53-5f56a6308c6c','2016-07-14',0.2267,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4404-85c2-eb0938a4d619','2016-07-15',0.2268,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-441a-80ee-493f9ce2db1a','2016-07-18',0.2283,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4436-8d90-d6a7fa6df4cd','2016-07-19',0.2287,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-444d-8a86-9aa91fd9db7c','2016-07-20',0.2285,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4468-858d-0045c41eeda3','2016-07-21',0.2289,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4485-8594-0ba1e161c50d','2016-07-22',0.2296,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-449e-8d29-f33a48eeadd8','2016-07-25',0.2295,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-44b4-88c7-45f8f674c433','2016-07-26',0.2292,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-44cc-80b3-924dce2603c1','2016-07-27',0.2287,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-44ee-854e-609c48498d00','2016-07-28',0.2292,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4512-833c-df294cbdb027','2016-07-29',0.2292,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-452d-8ade-160a929bcbba','2016-08-01',0.2298,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4549-8a3d-7dadaa08f55c','2016-08-02',0.2313,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4560-89bd-86e5cc8a5465','2016-08-03',0.2319,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4579-891f-e736e74e3917','2016-08-04',0.2329,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5ef-c4ba-4590-879c-4d254cad3d73','2016-08-05',0.2334,'08d9d5ef-c4b9-498e-829d-e61b1d0fb154'),('08d9d5f0-100a-4aa7-8d6a-8e70ca1aa21a','2021-12-31',3.1938,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4af0-8104-2c1f5a891333','2022-01-03',3.1827,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4b22-8b61-c1ad61e682d8','2022-01-04',3.1753,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4b47-8614-6baedb310098','2022-01-05',3.1715,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4b7c-8731-52dad13157a5','2022-01-06',3.1565,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4bb0-8998-8f294575f0c7','2022-01-07',3.1652,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4be5-8240-185304072d9f','2022-01-10',3.1642,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4c2e-8abe-7747a7ad68a4','2022-01-11',3.1711,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-100a-4c54-8952-731c7f675278','2022-01-12',3.1806,'08d9d5f0-100a-49ed-8625-3cedd0b3dc32'),('08d9d5f0-c46b-4831-84a0-ddcd93165a98','2020-09-07',0.1238,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4a60-82e0-b2f4638a358e','2020-09-08',0.1240,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4c73-80d6-63ba63911b76','2020-09-09',0.1241,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4d11-8bad-4a9e92744d0a','2020-09-10',0.1234,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4d3b-8828-6ad415fdcf1b','2020-09-11',0.1234,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4d62-8f29-288e569f945d','2020-09-14',0.1235,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4d81-8afd-107dbc26c444','2020-09-15',0.1242,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4dae-802b-0c90a86a6448','2020-09-16',0.1246,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4dd4-85f6-f630a1bc517b','2020-09-17',0.1252,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4dfc-83f8-e38a4b2825e6','2020-09-18',0.1248,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4e1e-8403-34315e12f8fe','2020-09-21',0.1250,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4e6b-8bd8-1059c57ee4db','2020-09-22',0.1257,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4e8d-8a39-b7c10683c50a','2020-09-23',0.1259,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4ec0-8c3f-5ac0f868f98c','2020-09-24',0.1257,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4ee4-8c21-7d42e6d0118d','2020-09-25',0.1259,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f0b-8238-5622a9131e3b','2020-09-28',0.1258,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f30-8ba1-e230cbd87289','2020-09-29',0.1253,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f4f-8fcd-242036f3dd9e','2020-09-30',0.1254,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f61-8dd0-50e7308a1eb9','2020-10-01',0.1253,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f7e-84a0-a6678b4347ff','2020-10-02',0.1255,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4f8e-8420-a64b5182ced7','2020-10-05',0.1248,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4fa1-8ef2-c90c9930c4d1','2020-10-06',0.1248,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4fb1-88e5-7bc8fce865c6','2020-10-07',0.1251,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4fc4-8efd-50f49dad77ee','2020-10-08',0.1252,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4fd4-842e-3c6c380f111c','2020-10-09',0.1265,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4fe7-8b38-9e332b2d4de3','2020-10-12',0.1257,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46b-4ff7-867e-6c50efb107a5','2020-10-13',0.1260,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-400a-8e4f-9d0281277f22','2020-10-14',0.1264,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-4034-8010-504644faa92b','2020-10-15',0.1270,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-405e-8d2b-1d544ee4a423','2020-10-16',0.1272,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-4081-8730-a3f5167ad040','2020-10-19',0.1270,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-40a6-8db4-622a001f57ae','2020-10-20',0.1267,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-40b9-83e3-2985a3debfda','2020-10-21',0.1268,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-40cd-8154-4406f50ca7ef','2020-10-22',0.1266,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-40dd-8a94-cc35046b4361','2020-10-23',0.1263,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-40f4-8b62-f37dba77d307','2020-10-26',0.1260,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f0-c46c-4106-8900-c2fbb7d509a9','2020-10-27',0.1260,'08d9d5f0-c46b-47b3-8c5e-331e3019f662'),('08d9d5f1-2667-4747-8ccb-ae315794515c','2017-04-28',1.7849,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-2667-4775-86f0-f0af2330fab5','2017-05-02',1.7882,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-2667-478b-858b-411640116678','2017-05-03',1.7958,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-2667-47a8-8f3f-0922917744c8','2017-05-04',1.7895,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-2667-47c9-81de-a6d91a9a9238','2017-05-05',1.7939,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-2667-47fc-8859-f98c41c5e04c','2017-05-08',1.7975,'08d9d5f1-2667-4697-8e5b-7b42ee109ab7'),('08d9d5f1-8ea6-4865-8d58-0f009cbb45b7','2017-04-28',4.2224,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f1-8ea6-48cb-8b8f-0f1e8a55d02b','2017-05-02',4.2088,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f1-8ea6-48fb-8784-b07dcd5f3bf1','2017-05-03',4.1913,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f1-8ea6-4918-8b44-481ec3310ea8','2017-05-04',4.2107,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f1-8ea6-4933-86b4-db74d951f79e','2017-05-05',4.2173,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f1-8ea6-496c-8696-44c1d334f654','2017-05-08',4.2011,'08d9d5f1-8ea6-480b-8fac-b40d28d1cd48'),('08d9d5f5-07f7-4962-8ab8-dcd42f2f75eb','2003-05-07',0.4607,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-426b-8e03-e3e031bf7170','2003-05-08',0.4627,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-431a-8cd7-09aae1dcc8cd','2003-05-09',0.4597,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-43a4-817f-39949b1660c2','2003-05-12',0.4593,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4a78-83ca-99fe3fc5ea10','2003-05-13',0.4609,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4aaa-85ef-528b4dfe6d62','2003-05-14',0.4623,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4ad4-8327-2414eeff3581','2003-05-15',0.4615,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4b13-83c5-07604c601440','2003-05-16',0.4587,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4b47-8043-2f0c074986a4','2003-05-19',0.4607,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4b6d-86f6-4f294791fbcc','2003-05-20',0.4610,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4b90-8ef2-d37aa7d7f2c2','2003-05-21',0.4585,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4bb3-8ee1-efc4e2430dde','2003-05-22',0.4634,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4bd9-814e-4f6acb9d5fc2','2003-05-23',0.4641,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4bfc-8307-2b22c9551e79','2003-05-26',0.4658,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4c22-8f0b-8bae50b60fba','2003-05-27',0.4647,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4c46-8674-572da672c5d5','2003-05-28',0.4671,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4c70-8c46-b86b62180a6a','2003-05-29',0.4667,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4c99-8626-3e5d00016442','2003-05-30',0.4651,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4cbc-894b-befa31267e46','2003-06-02',0.4613,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4cde-8eb8-d5ebb556483f','2003-06-03',0.4602,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4cff-8c78-47217040c4c4','2003-06-04',0.4526,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4d21-8b5f-09766dcbcb76','2003-06-05',0.4581,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4d44-8e3e-c42e38f179d7','2003-06-06',0.4663,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4d67-8673-dbc80aaed1c5','2003-06-09',0.4605,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4d89-8cc2-b902949c3504','2003-06-10',0.4557,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4ded-8f83-edfe23f56909','2003-06-11',0.4582,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d5f5-0800-4e18-899e-23046eb1be43','2003-06-12',0.4556,'08d9d5f5-07e4-4782-89d6-b20ad7701920'),('08d9d6d4-f31b-4ddf-8723-61dd346d805a','2011-10-13',0.7285,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4cb2-8de8-33a722cd57d6','2011-10-14',0.7243,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4d17-8f4a-3dbfeb06143d','2011-10-17',0.7259,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4d3e-8536-4b3397e94eea','2011-10-18',0.7312,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4f99-8b69-6389041995b2','2011-10-19',0.7232,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4fc0-8bef-ee8349095776','2011-10-20',0.7243,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f321-4fe1-87df-f542d3a7ec19','2011-10-21',0.7247,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-4014-8497-9385fe23d51a','2011-10-24',0.7217,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-4036-8719-7cbc70baa1f4','2011-10-25',0.7185,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-4056-8ffc-97abb4c93b25','2011-10-26',0.7180,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-4076-8c28-78dae011c804','2011-10-27',0.7124,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-4094-8eb5-5a70f6e46e1c','2011-10-28',0.7062,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d4-f322-40b3-84c2-4318f0894362','2011-10-31',0.7142,'08d9d6d4-f30d-4127-88f5-b4042c790d89'),('08d9d6d6-5f88-44db-8f64-755e7d7a865c','2011-04-29',0.6729,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-45d4-879e-ab6b55cde7ca','2011-05-02',0.6740,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-4669-8305-934371747528','2011-05-03',0.6766,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-46c3-8d0c-a007ec3cf182','2011-05-04',0.6720,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-4708-8308-8e9dd758995d','2011-05-05',0.6750,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-4741-83ab-7e6ffc0a2c7c','2011-05-06',0.6896,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-477d-8202-938744772715','2011-05-09',0.6946,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d6-5f89-47b3-8fc1-2b9c8ba60339','2011-05-10',0.6965,'08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31'),('08d9d6d7-8f5c-486c-8374-5cd9daaa086b','2015-10-13',0.8792,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4dde-8d79-d7fccb670e24','2015-10-14',0.8764,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4e2b-8354-fd44bbe0d60c','2015-10-15',0.8742,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4e5c-8263-42bc740ce398','2015-10-16',0.8803,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4e91-8097-0b2c18756d15','2015-10-19',0.8824,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4eb6-8c5a-0b1b8547b73b','2015-10-20',0.8793,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4ee1-8d91-940a6236ad06','2015-10-21',0.8807,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4f04-83f4-ee3865b8452f','2015-10-22',0.8839,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4f2b-8ab4-468cef7e3b3c','2015-10-23',0.9022,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4f4c-8ec4-e2962f66b11f','2015-10-26',0.9082,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4f74-86fd-bb7153d31b9f','2015-10-27',0.9041,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4f91-8ee0-7cac9572e8df','2015-10-28',0.9021,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4fb4-8ad4-184fd8bfe519','2015-10-29',0.9149,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-8f5c-4fd8-8e9d-d28f6669a109','2015-10-30',0.9077,'08d9d6d7-8f5a-42d6-87d8-3eb18dd29819'),('08d9d6d7-aae7-45f9-8c4f-b0c8f7c593cf','2015-10-13',0.6576,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-467f-86af-71ae0a3d3f53','2015-10-14',0.6501,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-46a7-83e4-081c248f87a5','2015-10-15',0.6466,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-4700-8c33-241bb944f62d','2015-10-16',0.6475,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-4747-862c-f61fede037db','2015-10-19',0.6456,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-476b-8975-42f32be415f8','2015-10-20',0.6464,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-4783-84c6-7f112356d81c','2015-10-21',0.6473,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-47ae-88c9-75ee2d847a87','2015-10-22',0.6465,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-47c2-8648-9ffe81e727f6','2015-10-23',0.6492,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-47db-8240-7da839992b7e','2015-10-26',0.6524,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-47f4-8d13-77ef08526a0d','2015-10-27',0.6522,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-4810-8dd5-7f159d135618','2015-10-28',0.6539,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-4823-8b80-044b64881a3c','2015-10-29',0.6557,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6d7-aae7-483c-841e-0513c126ad62','2015-10-30',0.6519,'08d9d6d7-aae7-455e-8381-aaa4f3770f00'),('08d9d6df-1854-42c2-87b6-ebb53e74665a','2015-10-13',0.1765,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4984-8867-624daa84fd1f','2015-10-14',0.1750,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-49db-8bf3-fc3ec1c31577','2015-10-15',0.1749,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4a0e-819a-c2b173716d9f','2015-10-16',0.1736,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4c88-8352-c7e194e0cd67','2015-10-19',0.1727,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4cbe-8acb-a0d6fb02ba0d','2015-10-20',0.1731,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4cf6-879e-4f9ac16413c2','2015-10-21',0.1719,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4d33-8bb4-d638fd76a73c','2015-10-22',0.1707,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4d57-8106-5d2fdfa6533d','2015-10-23',0.1692,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4d76-8dba-d77c5969c113','2015-10-26',0.1683,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4d9b-84e2-ca847db879f3','2015-10-27',0.1681,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4dc3-8c6d-cc218c9aa675','2015-10-28',0.1688,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4de1-8050-dfbd784efc32','2015-10-29',0.1678,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-185c-4e03-8dc1-efbd3587718d','2015-10-30',0.1684,'08d9d6df-1849-4e10-89e6-771d432ca7ae'),('08d9d6df-2155-45ba-8ad7-23efba7ca365','2015-10-13',5.6672,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4614-83b9-f2c8e968359e','2015-10-14',5.7129,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-464c-8201-e8496dfea828','2015-10-15',5.7173,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4674-8cf6-ff0e730faac5','2015-10-16',5.7617,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4692-8d4d-8b7da1d6a6a7','2015-10-19',5.7902,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-46ab-874e-6438b7c64c52','2015-10-20',5.7761,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-46c1-8270-9528d41b6ca9','2015-10-21',5.8181,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-46d9-8c28-6770cd4c3209','2015-10-22',5.8585,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-46f1-8cd9-4d6c24da766f','2015-10-23',5.9105,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4708-8787-2958c38688cb','2015-10-26',5.9407,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4728-8a36-9a61624febdb','2015-10-27',5.9494,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4741-8ca7-1975455a9b36','2015-10-28',5.9238,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-475b-8f37-5fad78d9d807','2015-10-29',5.9577,'08d9d6df-2155-451c-8eb0-b7a11ab4b171'),('08d9d6df-2155-4772-8913-171aae530386','2015-10-30',5.9376,'08d9d6df-2155-451c-8eb0-b7a11ab4b171');
/*!40000 ALTER TABLE `exchangerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `RequestId` char(36) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `BaseCurrency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QuotedCurrency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RequestDate` date NOT NULL,
  PRIMARY KEY (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES ('08d9d5ec-18c0-4691-8ec4-86011fdcb0c7','2021-06-01','2021-06-30','EUR','PLN','2022-05-01'),('08d9d5ec-62e3-47a4-877b-827edd8f00d7','2019-01-01','2019-02-01','PLN','EUR','2022-05-01'),('08d9d5ef-127e-4855-8334-d31d5bdb62d3','2014-01-01','2014-03-02','BGN','EUR','2022-01-12'),('08d9d5ef-c4b9-498e-829d-e61b1d0fb154','2016-07-08','2016-08-05','PLN','EUR','2022-05-01'),('08d9d5f0-100a-49ed-8625-3cedd0b3dc32','2022-01-01','2022-01-12','CAD','PLN','2022-05-01'),('08d9d5f0-c46b-47b3-8c5e-331e3019f662','2020-09-07','2020-10-27','CNY','EUR','2022-05-01'),('08d9d5f1-2667-4697-8e5b-7b42ee109ab7','2017-05-01','2017-05-08','PLN','CNY','2022-05-01'),('08d9d5f1-8ea6-480b-8fac-b40d28d1cd48','2017-05-01','2017-05-08','EUR','PLN','2022-01-12'),('08d9d5f5-07e4-4782-89d6-b20ad7701920','2003-05-07','2003-06-12','PLN','NZD','2022-01-12'),('08d9d6d4-f30d-4127-88f5-b4042c790d89','2011-10-13','2011-10-31','USD','EUR','2022-01-13'),('08d9d6d6-5f86-4bf4-8fe7-0e37ac8cef31','2011-05-01','2011-05-10','USD','EUR','2022-01-13'),('08d9d6d7-8f5a-42d6-87d8-3eb18dd29819','2015-10-13','2015-10-31','USD','EUR','2022-01-13'),('08d9d6d7-aae7-455e-8381-aaa4f3770f00','2015-10-13','2015-10-31','USD','GBP','2022-01-13'),('08d9d6df-1849-4e10-89e6-771d432ca7ae','2015-10-13','2015-10-31','PLN','GBP','2022-01-13'),('08d9d6df-2155-451c-8eb0-b7a11ab4b171','2015-10-13','2015-10-31','GBP','PLN','2022-01-13'),('24fd81f8-d58a-4bcc-9f35-dc6cd5641906','2021-12-20','2022-01-07','EUR','PLN','2022-01-08'),('261e1685-cf26-494c-b17c-3546e65f5620','2021-11-01','2021-12-01','PLN','USD','2022-01-04'),('a3c1880c-674c-4d18-8f91-5d3608a2c937','2021-08-18','2021-09-14','CZK','EUR','2021-09-20'),('f98e4d74-0f68-4aac-89fd-047f1aaca6b1','2021-12-13','2021-12-17','EUR','PLN','2022-01-08'),('f98e4d74-0f68-4aac-89fd-047f1aaca6b6','2021-07-01','2022-07-31','PLN','CZK','2021-10-21');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-14 16:44:23
