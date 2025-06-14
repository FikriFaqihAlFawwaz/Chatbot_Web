-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 06:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_message` text DEFAULT NULL,
  `bot_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `prompt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `user_id`, `user_message`, `bot_response`, `created_at`, `prompt`) VALUES
(17, 5, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-02 09:56:52', 'halo'),
(18, 5, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-02 10:01:56', 'anjay'),
(19, 5, 'where is indonesia', 'Indonesia is a country located in Southeast Asia and Oceania. It is an archipelago, consisting of more than 17,504 islands, of which about 6,000 are inhabited.\n\nIndonesia is situated between the Indian Ocean and the Pacific Ocean, and it is bordered by several countries:\n\n* To the north\n* Papua New Guinea to the east\n* East Timor to the southeast\n* Malaysia to the northwest\n* Singapore to the north (separated by the Strait of Johor)\n\nIndonesia is the world\'s largest archipelago, spanning more than 5,120 kilometers (3,180 miles) from northwest to southeast. Its total land area is approximately 1,904,569 square kilometers (735,358 square miles).\n\nThe country\'s geographical location has made it a strategic hub for trade and commerce between Asia, Europe, and the Pacific.\n\nHere\'s a rough outline of Indonesia\'s location:\n\n* Latitude: 6° north to 11° south\n* Longitude: 95° east to 141° east\n\nSome of the most well-known islands in the archipelago include:\n\n* Java (home to more than half of the country\'s population)\n* Sumatra\n* Bali\n* Kalimantan (Indonesian Borneo)\n* Sulawesi\n* Papua (formerly known as Irian Jaya)\n\nThe capital city of Indonesia is located on the island of Java.', '2025-06-02 10:09:05', 'anjay'),
(20, 5, 'buatkan saya skripsi tentang deteksi penyakit', 'Here is a potential thesis on disease detection:\n\n**Title:** \"Development of a Machine Learning-Based System for Early Detection of Diabetes Mellitus Using Electronic Health Records\"\n\n**Background:** Diabetes Mellitus (DM) is a chronic and debilitating disease that can lead to serious complications if left undiagnosed or untreated. Early detection of DM is crucial for preventing complications and improving patient outcomes. Electronic Health Records (EHRs) contain a wealth of information that can be leveraged for disease detection. Machine learning (ML) algorithms have shown promise in detecting diseases from EHRs.**\n\n**Research Questions:**\n\n1. Can a machine learning-based approach be developed to detect diabetes mellitus using electronic health records?\n2. How accurate is the developed system in detecting diabetes mellitus compared to traditional methods?\n3. What are the most important features in the EHRs that contribute to the detection of diabetes mellitus?\n\n**Objectives:**\n\n1. To develop a machine learning-based system for early detection of diabetes mellitus using electronic health records.\n2. To evaluate the performance of the developed system in detecting diabetes mellitus compared to traditional methods.\n3. To identify the most important features in the EHRs that contribute to the detection of diabetes mellitus.\n\n**Methodology:**\n\n1. Data Collection: EHRs of a hospital or clinic will be collected, including demographic information, medical history, laboratory test results, and medication lists.\n2. Data Preprocessing: The collected data will be cleaned, transformed, and formatted into a suitable format for ML algorithms.\n3. Feature Selection: Relevant features will be selected from the preprocessed data using techniques such as correlation analysis and recursive feature elimination.\n4. Model Development: A machine learning model will be developed using supervised learning techniques, such as logistic regression, decision trees, random forests, and support vector machines.\n5. Model Evaluation: The developed model will be evaluated using metrics such as accuracy, sensitivity, specificity, and area under the receiver operating characteristic curve (AUC-ROC).\n\n**Expected Outcomes:**\n\n1. A machine learning-based system for early detection of diabetes mellitus using electronic health records.\n2. A comprehensive evaluation of the developed system in detecting diabetes mellitus compared to traditional methods.\n3. Identification of the most important features in the EHRs that contribute to the detection of diabetes mellitus.\n\n**Significance:**\n\n1. The developed system can help healthcare providers to detect diabetes mellitus early, improving patient outcomes and reducing healthcare costs.\n2. The system can be integrated into existing EHR systems, making it a valuable tool for healthcare providers.\n3. The study can contribute to the development of more accurate and efficient disease detection systems using machine learning and EHRs.**\n\n**Timeline:**\n\n* Literature review: 2 weeks\n* Data collection and preprocessing: 4 weeks\n* Feature selection and model development: 8 weeks\n* Model evaluation and testing: 8 weeks\n* Finalizing the thesis: 4 weeks\n\n**Resources:**\n\n* Access to EHRs of a hospital or clinic\n* Machine learning software and tools (e.g., Python, TensorFlow, PyTorch)\n* High-performance computing resources (e.g., GPU, cluster)\n* Literature and online resources for research and reference\n\nThis is just a sample thesis proposal, and you should adjust it according to your needs and interests. Good luck with your thesis!', '2025-06-02 10:15:01', 'anjay'),
(21, 5, 'hello', 'Hello there! How can I help you today?\n', '2025-06-03 05:13:56', 'chatt'),
(22, 5, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-03 05:14:04', 'chatt'),
(23, 6, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-03 12:12:45', 'chattt'),
(24, 6, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-03 12:13:12', 'chatt'),
(25, 5, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-11 02:12:33', 'CH'),
(26, 5, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-11 02:38:55', 'chatt'),
(27, 7, 'hello', 'Hello! It\'s nice to meet you. Is there something I can help you with, or would you like to chat?', '2025-06-11 03:04:19', 'chat'),
(28, 5, 'halo', 'Halo!\n\nAre you a fan of the popular video game franchise? Do you have a favorite game in the series, or a favorite character like Master Chief or Cortana?\n\nLet\'s chat about Halo!', '2025-06-14 03:51:40', 'alo'),
(29, 5, 'who is you', 'I am LLaMA, an AI assistant developed by Meta AI that can understand and respond to human input in a conversational manner. I\'m not a human, but a computer program designed to simulate conversation, answer questions, and even generate text based on the input I receive.\n\nI don\'t have a personal identity, emotions, or consciousness like humans do. My purpose is to assist, provide information, and help with tasks to the best of my abilities based on my knowledge and training.\n\nSo, I\'m not \"you\" or anyone else, but rather a computer program designed to help and interact with humans in a helpful and informative way.', '2025-06-14 03:51:48', 'alo');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_files`
--

INSERT INTO `uploaded_files` (`id`, `user_id`, `filename`, `filepath`, `uploaded_at`) VALUES
(1, 5, 'MSU Application Form - International Student - (1).pdf', 'uploads\\MSU Application Form - International Student - (1).pdf', '2025-06-11 09:19:40'),
(2, NULL, 'MSU Application Form - International Student - (1).pdf', 'uploads\\MSU Application Form - International Student - (1).pdf', '2025-06-11 09:23:51'),
(3, NULL, '2.0 MSU Acknowledge form (2).pdf', 'uploads\\2.0 MSU Acknowledge form (2).pdf', '2025-06-11 09:24:27'),
(4, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:26:21'),
(5, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:29:54'),
(6, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:34:33'),
(7, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:34:44'),
(8, 5, '2.0 MSU Acknowledge form.pdf', 'uploads\\2.0 MSU Acknowledge form.pdf', '2025-06-11 09:34:52'),
(9, 5, '2.0 MSU Acknowledge form.pdf', 'uploads\\2.0 MSU Acknowledge form.pdf', '2025-06-11 09:35:03'),
(10, 5, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 09:35:16'),
(11, 5, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 09:38:11'),
(12, 5, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 09:40:58'),
(13, 5, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 09:43:37'),
(14, 5, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:44:51'),
(15, 5, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:45:25'),
(16, 6, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:46:23'),
(17, NULL, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:48:58'),
(18, 5, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:49:14'),
(19, 5, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:49:32'),
(20, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:49:47'),
(21, NULL, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:56:44'),
(22, 5, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:58:09'),
(23, NULL, 'SKRIPSI Fatimah Aria Utami-min.pdf', 'uploads\\SKRIPSI Fatimah Aria Utami-min.pdf', '2025-06-11 09:59:13'),
(24, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-11 09:59:37'),
(25, 5, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 10:03:22'),
(26, 7, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 10:04:37'),
(27, 7, '[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', 'uploads\\[Bangkit 2024 Batch 2] Final Transcript - M129B4KY1504.pdf', '2025-06-11 10:05:51'),
(28, 5, 'ANGGA PENGESAHAN.pdf', 'uploads\\ANGGA PENGESAHAN.pdf', '2025-06-14 10:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `name`) VALUES
(5, 'fikrifaqiha@gmail.com', 'pbkdf2:sha256:260000$gI0IjMr6G8vTyH9u$15bd9fb14dc5391377c6fcc4696034a2ca047ee7887b5fc8cff8c5a26977c781', '2025-04-21 07:56:25', ''),
(6, 'fikss@gmail.com', 'pbkdf2:sha256:260000$H86gQvpmSL8uBoTv$de733006c4d2950a2fca65c3f01a9bcaae81a4fa541b423ed9b6d6035dd76ee0', '2025-05-13 11:37:46', ''),
(7, 'coba@123', 'pbkdf2:sha256:260000$t7kuQKGEoHhQ8paA$1c162b6318df65141fde6670039d4526cbf3ecd10fb490bfb0bb6dba7b391b2f', '2025-06-11 03:04:04', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
