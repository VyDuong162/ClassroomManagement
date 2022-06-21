-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2022 lúc 09:43 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `classroommgr`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add joins', 7, 'add_joins'),
(26, 'Can change joins', 7, 'change_joins'),
(27, 'Can delete joins', 7, 'delete_joins'),
(28, 'Can view joins', 7, 'view_joins'),
(29, 'Can add submits', 8, 'add_submits'),
(30, 'Can change submits', 8, 'change_submits'),
(31, 'Can delete submits', 8, 'delete_submits'),
(32, 'Can view submits', 8, 'view_submits'),
(33, 'Can add classroom', 9, 'add_classroom'),
(34, 'Can change classroom', 9, 'change_classroom'),
(35, 'Can delete classroom', 9, 'delete_classroom'),
(36, 'Can view classroom', 9, 'view_classroom'),
(37, 'Can add assignment', 10, 'add_assignment'),
(38, 'Can change assignment', 10, 'change_assignment'),
(39, 'Can delete assignment', 10, 'delete_assignment'),
(40, 'Can view assignment', 10, 'view_assignment'),
(41, 'Can add sections', 11, 'add_sections'),
(42, 'Can change sections', 11, 'change_sections'),
(43, 'Can delete sections', 11, 'delete_sections'),
(44, 'Can view sections', 11, 'view_sections'),
(45, 'Can add resources', 12, 'add_resources'),
(46, 'Can change resources', 12, 'change_resources'),
(47, 'Can delete resources', 12, 'delete_resources'),
(48, 'Can view resources', 12, 'view_resources'),
(49, 'Can add teacher', 13, 'add_teacher'),
(50, 'Can change teacher', 13, 'change_teacher'),
(51, 'Can delete teacher', 13, 'delete_teacher'),
(52, 'Can view teacher', 13, 'view_teacher'),
(53, 'Can add student', 14, 'add_student'),
(54, 'Can change student', 14, 'change_student'),
(55, 'Can delete student', 14, 'delete_student'),
(56, 'Can view student', 14, 'view_student'),
(57, 'Can add classes', 15, 'add_classes'),
(58, 'Can change classes', 15, 'change_classes'),
(59, 'Can delete classes', 15, 'delete_classes'),
(60, 'Can view classes', 15, 'view_classes'),
(61, 'Can add stream', 16, 'add_stream'),
(62, 'Can change stream', 16, 'change_stream'),
(63, 'Can delete stream', 16, 'delete_stream'),
(64, 'Can view stream', 16, 'view_stream');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_assignment`
--

CREATE TABLE `classroom_assignment` (
  `Assignment_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `deadline_date` datetime(6) DEFAULT NULL,
  `textbox` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `section_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_classes`
--

CREATE TABLE `classroom_classes` (
  `class_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `stream_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_classroom`
--

CREATE TABLE `classroom_classroom` (
  `room_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `teacher_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_joins`
--

CREATE TABLE `classroom_joins` (
  `id` int(11) NOT NULL,
  `room_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_resources`
--

CREATE TABLE `classroom_resources` (
  `resource_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `textbox` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `section_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_sections`
--

CREATE TABLE `classroom_sections` (
  `section_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `room_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_stream`
--

CREATE TABLE `classroom_stream` (
  `stream_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_student`
--

CREATE TABLE `classroom_student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `roll_no` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `class_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_submits`
--

CREATE TABLE `classroom_submits` (
  `id` int(11) NOT NULL,
  `submitted_on` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `file` varchar(100) NOT NULL,
  `assignment_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_teacher`
--

CREATE TABLE `classroom_teacher` (
  `teacher_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `stream_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'classroom', 'assignment'),
(15, 'classroom', 'classes'),
(9, 'classroom', 'classroom'),
(7, 'classroom', 'joins'),
(12, 'classroom', 'resources'),
(11, 'classroom', 'sections'),
(16, 'classroom', 'stream'),
(14, 'classroom', 'student'),
(8, 'classroom', 'submits'),
(13, 'classroom', 'teacher'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-21 05:43:34.815054'),
(2, 'auth', '0001_initial', '2022-06-21 05:43:37.043091'),
(3, 'admin', '0001_initial', '2022-06-21 05:43:45.171825'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-21 05:43:47.594873'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-21 05:43:47.664746'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-21 05:43:48.903204'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-21 05:43:50.626650'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-21 05:43:50.827019'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-21 05:43:50.875972'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-21 05:43:51.898650'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-21 05:43:51.926492'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-21 05:43:51.962711'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-21 05:43:52.142769'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-21 05:43:52.335339'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-21 05:43:52.508858'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-21 05:43:52.571330'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-21 05:43:52.703509'),
(18, 'sessions', '0001_initial', '2022-06-21 05:43:52.987202'),
(19, 'classroom', '0001_initial', '2022-06-21 07:35:51.791982');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `classroom_assignment`
--
ALTER TABLE `classroom_assignment`
  ADD PRIMARY KEY (`Assignment_id`),
  ADD KEY `classroom_assignment_section_id_id_2db98d88_fk_classroom` (`section_id_id`);

--
-- Chỉ mục cho bảng `classroom_classes`
--
ALTER TABLE `classroom_classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `classroom_classes_stream_id_id_2dd134ed_fk_classroom` (`stream_id_id`);

--
-- Chỉ mục cho bảng `classroom_classroom`
--
ALTER TABLE `classroom_classroom`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `classroom_classroom_teacher_id_id_119a9515_fk_classroom` (`teacher_id_id`);

--
-- Chỉ mục cho bảng `classroom_joins`
--
ALTER TABLE `classroom_joins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_joins_room_id_id_5589c7a3_fk_classroom` (`room_id_id`),
  ADD KEY `classroom_joins_student_id_id_9f87ebd7_fk_classroom` (`student_id_id`);

--
-- Chỉ mục cho bảng `classroom_resources`
--
ALTER TABLE `classroom_resources`
  ADD PRIMARY KEY (`resource_id`),
  ADD KEY `classroom_resources_section_id_id_6a16a000_fk_classroom` (`section_id_id`);

--
-- Chỉ mục cho bảng `classroom_sections`
--
ALTER TABLE `classroom_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `classroom_sections_room_id_id_91b0eec0_fk_classroom` (`room_id_id`);

--
-- Chỉ mục cho bảng `classroom_stream`
--
ALTER TABLE `classroom_stream`
  ADD PRIMARY KEY (`stream_id`);

--
-- Chỉ mục cho bảng `classroom_student`
--
ALTER TABLE `classroom_student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `classroom_student_class_id_id_feb9b73a_fk_classroom` (`class_id_id`);

--
-- Chỉ mục cho bảng `classroom_submits`
--
ALTER TABLE `classroom_submits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_submits_assignment_id_id_3a42f3b7_fk_classroom` (`assignment_id_id`),
  ADD KEY `classroom_submits_student_id_id_7775c4be_fk_classroom` (`student_id_id`);

--
-- Chỉ mục cho bảng `classroom_teacher`
--
ALTER TABLE `classroom_teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `classroom_teacher_stream_id_id_563c0cfa_fk_classroom` (`stream_id_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classroom_joins`
--
ALTER TABLE `classroom_joins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classroom_submits`
--
ALTER TABLE `classroom_submits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `classroom_assignment`
--
ALTER TABLE `classroom_assignment`
  ADD CONSTRAINT `classroom_assignment_section_id_id_2db98d88_fk_classroom` FOREIGN KEY (`section_id_id`) REFERENCES `classroom_sections` (`section_id`);

--
-- Các ràng buộc cho bảng `classroom_classes`
--
ALTER TABLE `classroom_classes`
  ADD CONSTRAINT `classroom_classes_stream_id_id_2dd134ed_fk_classroom` FOREIGN KEY (`stream_id_id`) REFERENCES `classroom_stream` (`stream_id`);

--
-- Các ràng buộc cho bảng `classroom_classroom`
--
ALTER TABLE `classroom_classroom`
  ADD CONSTRAINT `classroom_classroom_teacher_id_id_119a9515_fk_classroom` FOREIGN KEY (`teacher_id_id`) REFERENCES `classroom_teacher` (`teacher_id`);

--
-- Các ràng buộc cho bảng `classroom_joins`
--
ALTER TABLE `classroom_joins`
  ADD CONSTRAINT `classroom_joins_room_id_id_5589c7a3_fk_classroom` FOREIGN KEY (`room_id_id`) REFERENCES `classroom_classroom` (`room_id`),
  ADD CONSTRAINT `classroom_joins_student_id_id_9f87ebd7_fk_classroom` FOREIGN KEY (`student_id_id`) REFERENCES `classroom_student` (`student_id`);

--
-- Các ràng buộc cho bảng `classroom_resources`
--
ALTER TABLE `classroom_resources`
  ADD CONSTRAINT `classroom_resources_section_id_id_6a16a000_fk_classroom` FOREIGN KEY (`section_id_id`) REFERENCES `classroom_sections` (`section_id`);

--
-- Các ràng buộc cho bảng `classroom_sections`
--
ALTER TABLE `classroom_sections`
  ADD CONSTRAINT `classroom_sections_room_id_id_91b0eec0_fk_classroom` FOREIGN KEY (`room_id_id`) REFERENCES `classroom_classroom` (`room_id`);

--
-- Các ràng buộc cho bảng `classroom_student`
--
ALTER TABLE `classroom_student`
  ADD CONSTRAINT `classroom_student_class_id_id_feb9b73a_fk_classroom` FOREIGN KEY (`class_id_id`) REFERENCES `classroom_classes` (`class_id`);

--
-- Các ràng buộc cho bảng `classroom_submits`
--
ALTER TABLE `classroom_submits`
  ADD CONSTRAINT `classroom_submits_assignment_id_id_3a42f3b7_fk_classroom` FOREIGN KEY (`assignment_id_id`) REFERENCES `classroom_assignment` (`Assignment_id`),
  ADD CONSTRAINT `classroom_submits_student_id_id_7775c4be_fk_classroom` FOREIGN KEY (`student_id_id`) REFERENCES `classroom_student` (`student_id`);

--
-- Các ràng buộc cho bảng `classroom_teacher`
--
ALTER TABLE `classroom_teacher`
  ADD CONSTRAINT `classroom_teacher_stream_id_id_563c0cfa_fk_classroom` FOREIGN KEY (`stream_id_id`) REFERENCES `classroom_stream` (`stream_id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
