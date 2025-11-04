-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 04, 2025 at 05:51 PM
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
-- Database: `event_calendar`
--

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `prize` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competition`
--

INSERT INTO `competition` (`id`, `name`, `prize`) VALUES
(1, 'FIFA Club World Cup', 125000000),
(2, 'Champions League', 50000000),
(3, 'The NBA', 80000000),
(4, 'FIVB Volleyball World Championship', 100000000);

-- --------------------------------------------------------

--
-- Table structure for table `competition_stage`
--

CREATE TABLE `competition_stage` (
  `id` int(11) NOT NULL,
  `competition_foreignkey` int(11) NOT NULL,
  `stage_foreignkey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competition_stage`
--

INSERT INTO `competition_stage` (`id`, `competition_foreignkey`, `stage_foreignkey`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 7),
(4, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`) VALUES
(1, 'Austria', 'AUT'),
(2, 'Spain', 'ESP'),
(3, 'United Kingdom', 'GBR'),
(4, 'United States', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `country_foreignkey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`id`, `name`, `country_foreignkey`) VALUES
(1, 'Premier League', 3),
(2, 'La Liga', 2),
(3, 'Austrian Volleyball League', 1),
(4, 'The NBA', 4);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `home_score` tinyint(4) NOT NULL,
  `away_score` tinyint(4) NOT NULL,
  `ejections` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `home_score`, `away_score`, `ejections`) VALUES
(1, 0, 1, 1),
(2, 3, 1, 0),
(3, 7, 1, 0),
(4, 104, 113, 5);

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `id` int(11) NOT NULL,
  `season` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`id`, `season`) VALUES
(1, '24/25'),
(2, '25/26'),
(3, '26/27');

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`id`, `name`, `icon`) VALUES
(1, 'Football', '../assets/sport-icons/football.png'),
(2, 'Basketball', '../assets/sport-icons/basketball.png'),
(3, 'Volleyball', '../assets/sport-icons/volleyball.png');

-- --------------------------------------------------------

--
-- Table structure for table `sport_event`
--

CREATE TABLE `sport_event` (
  `id` int(11) NOT NULL,
  `current_status` enum('TBD','Upcomming','Live','Finished') NOT NULL DEFAULT 'TBD',
  `sport_season_foreignkey` int(11) NOT NULL,
  `competition_stage_foreignkey` int(11) NOT NULL,
  `venue_foreignkey` int(11) NOT NULL,
  `home_team_foreignkey` int(11) NOT NULL,
  `away_team_foreignkey` int(11) NOT NULL,
  `result_foreignkey` int(11) DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `game_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport_event`
--

INSERT INTO `sport_event` (`id`, `current_status`, `sport_season_foreignkey`, `competition_stage_foreignkey`, `venue_foreignkey`, `home_team_foreignkey`, `away_team_foreignkey`, `result_foreignkey`, `event_date`, `event_time`, `game_notes`) VALUES
(1, 'TBD', 1, 1, 3, 1, 2, NULL, '2025-11-11', '19:00:00', NULL),
(2, 'TBD', 1, 2, 3, 10, 11, NULL, '2025-11-12', '17:00:00', NULL),
(3, 'TBD', 2, 3, 4, 4, 5, NULL, '2025-11-17', '19:30:00', NULL),
(4, 'TBD', 3, 4, 2, 7, 8, NULL, '2025-11-19', '12:00:00', NULL),
(5, 'TBD', 2, 3, 4, 6, 5, NULL, '2025-11-22', '23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sport_season`
--

CREATE TABLE `sport_season` (
  `id` int(11) NOT NULL,
  `sport_foreignkey` int(11) NOT NULL,
  `season_foreignkey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport_season`
--

INSERT INTO `sport_season` (`id`, `sport_foreignkey`, `season_foreignkey`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `id` int(11) NOT NULL,
  `stage` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`id`, `stage`) VALUES
(1, 'Groups'),
(2, 'Top 16'),
(3, 'Top 8'),
(4, 'Quarter Finals'),
(5, 'Semi Finals'),
(6, 'Finals'),
(7, 'League Match');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `league_foreignkey` int(11) NOT NULL,
  `league_position` tinyint(3) UNSIGNED NOT NULL,
  `information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `logo`, `league_foreignkey`, `league_position`, `information`) VALUES
(1, 'Chelsea F.C.', '../assets/football-team-icons/chelsea_icon.png', 1, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(2, 'Manchester United F.C.', '../assets/football-team-icons/manchester_united_icon.png', 1, 4, 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
(3, 'Liverpool F.C.', '../assets/football-team-icons/liverpool_icon.png', 1, 2, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'Los Angeles Lakers', '../assets/basketball-team-icons/los_angeles_lakers_icon.png', 4, 1, 'Lorem ipsum dolor sit amet.'),
(5, 'Miami Heat', '../assets/basketball-team-icons/miami_heat_icon.png', 4, 5, 'Ut enim ad minim veniam.'),
(6, 'Trail Blazers', '../assets/basketball-team-icons/trail_blazers_icon.png', 4, 12, 'Dolore eu fugiat nulla pariatur.'),
(7, 'TJ Sokol Wien', '../assets/volleyball-team-icons/tj_sokol_wien_icon.png', 3, 1, 'Quis nostrud exercitation ullamco laboris.'),
(8, 'TSV Hartberg', '../assets/volleyball-team-icons/tsv_hartberg_icon.png', 3, 3, 'Quis nostrud exercitation ullamco laboris.'),
(9, 'SG Union Bisamberg', '../assets/volleyball-team-icons/sg_union_bisamberg_icon.png', 3, 6, 'Quis nostrud exercitation ullamco laboris.'),
(10, 'FC Barcelona', '../assets/football-team-icons/barcelona_icon.png', 2, 3, 'Quis nostrud exercitation ullamco laboris.'),
(11, 'Real Madrid CF', '../assets/football-team-icons/real_madrid_icon.png', 2, 2, 'Quis nostrud exercitation ullamco laboris.'),
(12, 'Villarreal CF', '../assets/football-team-icons/villarreal_icon.png', 2, 1, 'Quis nostrud exercitation ullamco laboris.');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `country_foreignkey` int(11) NOT NULL,
  `built` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `name`, `country_foreignkey`, `built`) VALUES
(1, 'Santiago Bernabéu', 2, 1947),
(2, 'Wiener Stadthalle', 1, 1958),
(3, 'Stamford Bridge', 3, 1877),
(4, 'Ball Arena', 4, 1999);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competition_stage`
--
ALTER TABLE `competition_stage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stage_foreignkey` (`stage_foreignkey`),
  ADD KEY `competition_foreignkey` (`competition_foreignkey`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_foreignkey` (`country_foreignkey`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sport_event`
--
ALTER TABLE `sport_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `away_team_foreignkey` (`away_team_foreignkey`),
  ADD KEY `home_team_foreignkey` (`home_team_foreignkey`),
  ADD KEY `result_foreignkey` (`result_foreignkey`),
  ADD KEY `venue_foreignkey` (`venue_foreignkey`),
  ADD KEY `sport_season_foreignkey` (`sport_season_foreignkey`),
  ADD KEY `competition_stage_foreignkey` (`competition_stage_foreignkey`);

--
-- Indexes for table `sport_season`
--
ALTER TABLE `sport_season`
  ADD PRIMARY KEY (`id`),
  ADD KEY `season_foreignkey` (`season_foreignkey`),
  ADD KEY `sport_foreignkey` (`sport_foreignkey`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_foreignkey` (`league_foreignkey`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_foreignkey` (`country_foreignkey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `competition_stage`
--
ALTER TABLE `competition_stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `season`
--
ALTER TABLE `season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sport`
--
ALTER TABLE `sport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sport_event`
--
ALTER TABLE `sport_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sport_season`
--
ALTER TABLE `sport_season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competition_stage`
--
ALTER TABLE `competition_stage`
  ADD CONSTRAINT `competition_stage_ibfk_1` FOREIGN KEY (`stage_foreignkey`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `competition_stage_ibfk_2` FOREIGN KEY (`competition_foreignkey`) REFERENCES `competition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_ibfk_1` FOREIGN KEY (`country_foreignkey`) REFERENCES `country` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sport_event`
--
ALTER TABLE `sport_event`
  ADD CONSTRAINT `sport_event_ibfk_1` FOREIGN KEY (`away_team_foreignkey`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_event_ibfk_2` FOREIGN KEY (`home_team_foreignkey`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_event_ibfk_3` FOREIGN KEY (`result_foreignkey`) REFERENCES `result` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_event_ibfk_4` FOREIGN KEY (`venue_foreignkey`) REFERENCES `venue` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_event_ibfk_5` FOREIGN KEY (`sport_season_foreignkey`) REFERENCES `sport_season` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_event_ibfk_6` FOREIGN KEY (`competition_stage_foreignkey`) REFERENCES `competition_stage` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sport_season`
--
ALTER TABLE `sport_season`
  ADD CONSTRAINT `sport_season_ibfk_1` FOREIGN KEY (`season_foreignkey`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sport_season_ibfk_2` FOREIGN KEY (`sport_foreignkey`) REFERENCES `sport` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`league_foreignkey`) REFERENCES `league` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`country_foreignkey`) REFERENCES `country` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
