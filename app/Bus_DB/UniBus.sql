--
-- File generated with SQLiteStudio v3.4.3 on Thu Mar 2 18:11:37 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Bus_Stop
CREATE TABLE IF NOT EXISTS Bus_Stop (bus_stop_id TEXT (10, 10) UNIQUE PRIMARY KEY NOT NULL, bus_stop_name TEXT UNIQUE NOT NULL, bus_stop_longitude REAL NOT NULL, bus_stop_latitude REAL NOT NULL);

-- Table: bus_times
CREATE TABLE IF NOT EXISTS bus_times (bus_stop_id TEXT (10, 10) REFERENCES Bus_Stop (bus_stop_id) NOT NULL, bus_time_id TEXT (10, 10) PRIMARY KEY NOT NULL, time TEXT NOT NULL);

-- Table: landmarks
CREATE TABLE IF NOT EXISTS landmarks (landmark_id TEXT (10, 10) PRIMARY KEY NOT NULL, landmark_longitude TEXT NOT NULL ON CONFLICT ROLLBACK, landmark_latitude TEXT NOT NULL ON CONFLICT ROLLBACK, landmark_name TEXT NOT NULL);

-- Table: University_Building
CREATE TABLE IF NOT EXISTS University_Building (university_building_id TEXT (10, 10) PRIMARY KEY NOT NULL, university_building_name TEXT UNIQUE NOT NULL DEFAULT PO1, university_building_longitude TEXT NOT NULL, university_building_latitude TEXT NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
