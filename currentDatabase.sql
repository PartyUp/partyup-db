BEGIN TRANSACTION;
CREATE TABLE `zone_group` (
	`zone_group_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL UNIQUE
);
CREATE TABLE "zone" (
	`zone_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	INTEGER NOT NULL UNIQUE,
	`zone_group_fk`	INTEGER NOT NULL
);
CREATE TABLE `vendor_user` (
	`vendor_user_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`user_fk`	INTEGER NOT NULL,
	`admin_level`	INTEGER NOT NULL
);
CREATE TABLE `vendor_tag` (
	`vendor_tag_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`tag_fk`	INTEGER NOT NULL,
	`vendor_fk`	INTEGER NOT NULL
);
CREATE TABLE `vendor_location_user` (
	`vendor_location_user_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`user_fk`	INTEGER NOT NULL,
	`admin_level`	INTEGER NOT NULL
);
CREATE TABLE "vendor_location" (
	`vendor_location_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL,
	`zone_fk`	INTEGER NOT NULL,
	`yelp_business_id`	TEXT UNIQUE,
	`long_description`	TEXT
);
CREATE TABLE "vendor" (
	`vendor_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL UNIQUE,
	`create_date_time`	TEXT NOT NULL,
	`test_vendor`	INTEGER NOT NULL
);
CREATE TABLE `user_party_user` (
	`user_party_user_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`party_fk`	INTEGER NOT NULL,
	`user_fk`	INTEGER NOT NULL,
	`paid`	INTEGER NOT NULL
);
CREATE TABLE `user_party_option` (
	`user_party_option_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`user_party_fk`	INTEGER NOT NULL,
	`party_option_fk`	INTEGER NOT NULL
);
CREATE TABLE `user_party_chat` (
	`user_party_chat_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`party_fk`	INTEGER NOT NULL,
	`user_fk`	INTEGER NOT NULL,
	`message`	TEXT NOT NULL,
	`create_date_time`	TEXT NOT NULL
);
CREATE TABLE "user_party" (
	`user_party_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`create_user_fk`	INTEGER NOT NULL,
	`party_fk`	INTEGER,
	`funded`	INTEGER NOT NULL,
	`cancelled`	INTEGER NOT NULL,
	`description`	TEXT NOT NULL,
	`start_date_time`	TEXT
);
CREATE TABLE `user_friend` (
	`user_friend_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`user_fk`	INTEGER NOT NULL,
	`user_friend_fk`	INTEGER NOT NULL
);
CREATE TABLE "user_chat" (
	`user_chat_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`send_user_fk`	INTEGER NOT NULL,
	`receive_user_fk`	INTEGER NOT NULL,
	`message`	TEXT NOT NULL,
	`create_date_time`	TEXT NOT NULL
);
CREATE TABLE `user` (
	`user_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`username`	TEXT NOT NULL UNIQUE,
	`password`	TEXT NOT NULL,
	`refer_user_fk`	INTEGER NOT NULL,
	`first_name`	TEXT NOT NULL,
	`last_name`	TEXT NOT NULL,
	`home_zone_fk`	INTEGER
);
CREATE TABLE `tag_group_line` (
	`tag_group_line_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`tag_group_fk`	INTEGER NOT NULL,
	`tag_fk`	INTEGER NOT NULL
);
CREATE TABLE "tag_group" (
	`tag_group_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	INTEGER NOT NULL UNIQUE,
	`age_required`	INTEGER
);
CREATE TABLE `tag` (
	`tag_pk`	INTEGER NOT NULL UNIQUE,
	`description`	TEXT NOT NULL UNIQUE,
	PRIMARY KEY(tag_pk)
);
CREATE TABLE `party_tag` (
	`party_tag_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`party_fk`	INTEGER NOT NULL,
	`tag_fk`	INTEGER NOT NULL
);
CREATE TABLE `party_option_group` (
	`party_option_group_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL,
	`max_selected`	INTEGER NOT NULL,
	`min_selected`	INTEGER NOT NULL,
	`allow_duplicates`	INTEGER NOT NULL,
	`party_fk`	INTEGER NOT NULL
);
CREATE TABLE "party_option" (
	`party_option_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL,
	`party_option_group_fk`	INTEGER NOT NULL,
	`tag_fk`	INTEGER
);
CREATE TABLE "party_addon" (
	`party_addon_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL,
	`price`	REAL NOT NULL,
	`user_specific`	INTEGER NOT NULL,
	`tag_fk`	INTEGER NOT NULL
);
CREATE TABLE "party" (
	`party_pk`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`description`	TEXT NOT NULL,
	`vendor_fk`	INTEGER NOT NULL,
	`expected_tip`	INTEGER NOT NULL,
	`base_price`	REAL NOT NULL,
	`is_price_per_person`	INTEGER NOT NULL,
	`max_people`	INTEGER NOT NULL,
	`min_people`	INTEGER NOT NULL
);
COMMIT;
