-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2022 lúc 06:26 AM
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
(25, 'Can add classes', 7, 'add_classes'),
(26, 'Can change classes', 7, 'change_classes'),
(27, 'Can delete classes', 7, 'delete_classes'),
(28, 'Can view classes', 7, 'view_classes'),
(29, 'Can add classroom', 8, 'add_classroom'),
(30, 'Can change classroom', 8, 'change_classroom'),
(31, 'Can delete classroom', 8, 'delete_classroom'),
(32, 'Can view classroom', 8, 'view_classroom'),
(33, 'Can add stream', 9, 'add_stream'),
(34, 'Can change stream', 9, 'change_stream'),
(35, 'Can delete stream', 9, 'delete_stream'),
(36, 'Can view stream', 9, 'view_stream'),
(37, 'Can add student', 10, 'add_student'),
(38, 'Can change student', 10, 'change_student'),
(39, 'Can delete student', 10, 'delete_student'),
(40, 'Can view student', 10, 'view_student'),
(41, 'Can add teacher', 11, 'add_teacher'),
(42, 'Can change teacher', 11, 'change_teacher'),
(43, 'Can delete teacher', 11, 'delete_teacher'),
(44, 'Can view teacher', 11, 'view_teacher'),
(45, 'Can add submits', 12, 'add_submits'),
(46, 'Can change submits', 12, 'change_submits'),
(47, 'Can delete submits', 12, 'delete_submits'),
(48, 'Can view submits', 12, 'view_submits'),
(49, 'Can add sections', 13, 'add_sections'),
(50, 'Can change sections', 13, 'change_sections'),
(51, 'Can delete sections', 13, 'delete_sections'),
(52, 'Can view sections', 13, 'view_sections'),
(53, 'Can add resources', 14, 'add_resources'),
(54, 'Can change resources', 14, 'change_resources'),
(55, 'Can delete resources', 14, 'delete_resources'),
(56, 'Can view resources', 14, 'view_resources'),
(57, 'Can add joins', 15, 'add_joins'),
(58, 'Can change joins', 15, 'change_joins'),
(59, 'Can delete joins', 15, 'delete_joins'),
(60, 'Can view joins', 15, 'view_joins'),
(61, 'Can add assignments', 16, 'add_assignments'),
(62, 'Can change assignments', 16, 'change_assignments'),
(63, 'Can delete assignments', 16, 'delete_assignments'),
(64, 'Can view assignments', 16, 'view_assignments'),
(65, 'Can add authentication', 17, 'add_authentication'),
(66, 'Can change authentication', 17, 'change_authentication'),
(67, 'Can delete authentication', 17, 'delete_authentication'),
(68, 'Can view authentication', 17, 'view_authentication'),
(69, 'Can add user', 18, 'add_user'),
(70, 'Can change user', 18, 'change_user'),
(71, 'Can delete user', 18, 'delete_user'),
(72, 'Can view user', 18, 'view_user');

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
-- Cấu trúc bảng cho bảng `classroom_assignments`
--

CREATE TABLE `classroom_assignments` (
  `assignment_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `deadline_date` datetime(6) DEFAULT NULL,
  `textbox` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `section_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_assignments`
--

INSERT INTO `classroom_assignments` (`assignment_id`, `file`, `created_date`, `deadline_date`, `textbox`, `title`, `section_id_id`) VALUES
(1, 'Session5.3_Chuliu.pdf', '2022-06-24 04:25:26.665670', '2022-06-27 00:00:00.000000', 'Làm bài tập thuật toán chuliu', 'Nội dung Chương 1: Đại cương về đồ thị', 1),
(2, 'HW6_Ranking.pdf', '2022-06-24 04:25:26.799754', '2022-06-30 00:00:00.000000', 'Làm bài xếp hạng đồ thị', 'Nội dung bài tập tuần 1: Lập trình biểu diễn đồ thị', 2),
(3, 'HW3.pdf', '2022-06-24 04:25:26.896457', '2022-06-28 00:00:00.000000', 'Hoàn thành bài tập trong file đính kèm', 'Nội dung Chương 2: Tính liên thông đồ thị', 3),
(4, 'HW2.pdf', '2022-06-24 04:25:27.130180', '2022-06-28 00:00:00.000000', 'Hoàn thành bài tập viết tay trong file đính kèm', 'Nội dung bài tập tuần 2: Bài tập viết tay - Kiểm tra chu trình và đồ thị phân đôi', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_authentication`
--

CREATE TABLE `classroom_authentication` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
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

--
-- Đang đổ dữ liệu cho bảng `classroom_classes`
--

INSERT INTO `classroom_classes` (`class_id`, `name`, `semester`, `stream_id_id`) VALUES
(1, 'Lý thuyết đồ thị nhóm 1', 'HK1 2021-2022', 1),
(2, 'Lý thuyết đồ thị nhóm 2', 'HK1 2021-2022', 1),
(3, 'Mạng máy tính', 'HK2 2021-2022', 2),
(4, 'Cơ sở dữ liệu', 'HK2 2021-2022', 3);

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

--
-- Đang đổ dữ liệu cho bảng `classroom_classroom`
--

INSERT INTO `classroom_classroom` (`room_id`, `subject`, `code`, `semester`, `created_date`, `teacher_id_id`) VALUES
(1, 'CT178 Lý thuyết đồ thị nhóm 1', 'ab178', 'HK1 2021-2022', '2022-06-24 04:25:24.309281', 1),
(2, 'CT178 Lý thuyết đồ thị nhóm 2', 'ct178', 'HK1 2021-2022', '2022-06-24 04:25:24.387961', 1),
(3, 'CT112 Mạng máy tính ', '32wzq', 'HK2 2021-2022', '2022-06-24 04:25:24.427603', 2),
(4, 'CT180 Cơ sở dữ liệu', '165htg', 'HK2 2021-2022', '2022-06-24 04:25:24.649014', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_joins`
--

CREATE TABLE `classroom_joins` (
  `id` int(11) NOT NULL,
  `room_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_joins`
--

INSERT INTO `classroom_joins` (`id`, `room_id_id`, `student_id_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_resources`
--

CREATE TABLE `classroom_resources` (
  `resource_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `textbox` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `section_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_resources`
--

INSERT INTO `classroom_resources` (`resource_id`, `title`, `created_date`, `textbox`, `file`, `section_id_id`) VALUES
(1, 'Slide bài giảng lý thuyết đồ thị', '2022-06-24 04:25:27.848274', 'Giáo trình học lý thuyết đồ thị trong học kỳ này', 'giaotrinhlythuyetdothi.pdf', 1),
(2, 'Slide bài giảng lý thuyết đồ thị', '2022-06-24 04:25:27.960519', 'Giáo trình học lý thuyết đồ thị trong học kỳ này', 'giaotrinhlythuyetdothi.pdf', 2),
(3, 'Giáo trình môn mạng máy tính', '2022-06-24 04:25:28.165974', 'giáo trình mạng máy tính', 'slidemangmaytinh.pdf', 5),
(4, 'Slide cơ sở dữ liệu', '2022-06-24 04:25:28.282732', 'Giáo trình học cơ sở dữ liệu trong học kỳ này', 'slidecosodulieu.pdf', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_sections`
--

CREATE TABLE `classroom_sections` (
  `section_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `room_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_sections`
--

INSERT INTO `classroom_sections` (`section_id`, `title`, `created_date`, `room_id_id`) VALUES
(1, 'Nội dung Chương 1: Đại cương về đồ thị', '2022-06-24 04:25:25.618555', 1),
(2, 'Nội dung bài tập tuần 1: Lập trình biểu diễn đồ thị', '2022-06-24 04:25:25.873421', 1),
(3, 'Nội dung Chương 2: Tính liên thông đồ thị', '2022-06-24 04:25:26.248243', 2),
(4, 'Nội dung bài tập tuần 2: Bài tập viết tay - Kiểm tra chu trình và đồ thị phân đôi', '2022-06-24 04:25:26.301721', 2),
(5, 'Ôn tập giữa kì và lịch thi mạng máy tính ', '2022-06-24 04:25:26.361038', 3),
(6, 'Slide lý thuyết chương 5: Tầng mạng', '2022-06-24 04:25:26.407786', 3),
(7, 'Bài giảng chương 4 - Ngôn ngữ hỏi SQL', '2022-06-24 04:25:26.448951', 4),
(8, 'Thực hành bài tập chương 4 ', '2022-06-24 04:25:26.518602', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom_stream`
--

CREATE TABLE `classroom_stream` (
  `stream_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_stream`
--

INSERT INTO `classroom_stream` (`stream_id`, `name`) VALUES
(1, 'Ôn tập cuối kỳ Lý thuyết đồ thị'),
(2, 'Hướng dẫn thực hành Mạng máy tính buổi 2'),
(3, 'Bài tập SQL');

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
  `class_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_student`
--

INSERT INTO `classroom_student` (`student_id`, `first_name`, `last_name`, `email`, `roll_no`, `username`, `class_id_id`) VALUES
(1, 'Trần', 'Thanh Trúc', 'tructructhanh03@gmail.com', 'B1812392', 'B1812392', 1),
(2, 'Dương', 'Vy', 'vyduong162@gmail.com', 'B1805734', 'B1805734', 1),
(3, 'Phạm', 'Vy', 'vypham10272000@gmail.com', 'B1801234', 'B1801234', 1),
(4, 'Nguyễn', 'Hữu Đăng', 'nguyenhuudang0206@gmail.com', 'B1806001', 'B1806001', 2),
(5, 'Nguyễn', 'Hưng', 'quochungst1311@gmail.com', 'B1806002', 'B1806002', 3),
(6, 'Nguyễn', 'Linh', 'nguyenvanlinh060700@gmail.com', 'B1806003', 'B1806003', 3),
(7, 'Nguyễn', 'Thanh', 'nguyendinhthanh27120@gmail.com', 'B1806004', 'B1806004', 4),
(8, 'Vũ', 'Long', 'vngoclong.vnl@gmail.com', 'B1806005', 'B1806005', 4);

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

--
-- Đang đổ dữ liệu cho bảng `classroom_submits`
--

INSERT INTO `classroom_submits` (`id`, `submitted_on`, `status`, `file`, `assignment_id_id`, `student_id_id`) VALUES
(1, 1, 1, 'trucchuliu.pdf', 1, 1),
(2, 1, 1, 'duongvyHW6.pdf', 2, 2),
(3, 0, 0, '', 3, 4);

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
  `stream_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom_teacher`
--

INSERT INTO `classroom_teacher` (`teacher_id`, `first_name`, `last_name`, `email`, `username`, `stream_id_id`) VALUES
(1, 'Võ', 'Trí Thức', 'thuc33@gmail.com', '002112', 1),
(2, 'Lâm', 'Nhựt Khang', 'khang123@gmail.com', '002213', 2),
(3, 'Trương', 'Quốc Định', 'quocdinh22@gmail.com', '003314', 3),
(4, 'Phạm', 'Xuân Hiền', 'phamhien12@gmail.com', '009212', 1),
(5, 'Phạm', 'Ngọc Quyền', 'quyen0309@gmail.com', '030913', 3);

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
(16, 'classroom', 'assignments'),
(17, 'classroom', 'authentication'),
(7, 'classroom', 'classes'),
(8, 'classroom', 'classroom'),
(15, 'classroom', 'joins'),
(14, 'classroom', 'resources'),
(13, 'classroom', 'sections'),
(9, 'classroom', 'stream'),
(10, 'classroom', 'student'),
(12, 'classroom', 'submits'),
(11, 'classroom', 'teacher'),
(18, 'classroom', 'user'),
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
(1, 'contenttypes', '0001_initial', '2022-06-24 04:23:13.878043'),
(2, 'auth', '0001_initial', '2022-06-24 04:23:15.550574'),
(3, 'admin', '0001_initial', '2022-06-24 04:23:23.784344'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-24 04:23:25.591923'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-24 04:23:25.732458'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-24 04:23:26.439967'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-24 04:23:27.596485'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-24 04:23:27.885701'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-24 04:23:28.033229'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-24 04:23:29.241657'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-24 04:23:29.307937'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-24 04:23:29.390544'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-24 04:23:29.625966'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-24 04:23:29.783464'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-24 04:23:30.140850'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-24 04:23:30.459207'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-24 04:23:31.053618'),
(18, 'classroom', '0001_initial', '2022-06-24 04:23:39.247601'),
(19, 'classroom', '0002_auto_20220622_1602', '2022-06-24 04:23:51.762828'),
(20, 'classroom', '0003_authentication_user', '2022-06-24 04:23:52.415493'),
(21, 'classroom', '0004_auto_20220623_1311', '2022-06-24 04:23:53.374818'),
(22, 'classroom', '0005_auto_20220623_1314', '2022-06-24 04:23:53.636112'),
(23, 'classroom', '0006_auto_20220623_1322', '2022-06-24 04:23:53.792828'),
(24, 'classroom', '0007_auto_20220623_1332', '2022-06-24 04:23:54.552377'),
(25, 'classroom', '0008_auto_20220624_1122', '2022-06-24 04:23:54.852644'),
(26, 'sessions', '0001_initial', '2022-06-24 04:23:55.372904');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `temporary_user`
--

CREATE TABLE `temporary_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

INSERT INTO `temporary_user` (`id`, `username`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, 'ThanhNguyen', 'qsczsemko@gmail.com', 'Nguyễn', 'Thanh', 'thanhhe113'),
(2, 'ThanhNguyen', 'qsczsemko@gmail.com', 'Nguyễn', 'Thanh', 'thanhhe113'),
(3, 'Thanh', 'qsczsemko@gmail.com', 'Nguyễn', 'Thanh', 'thanhhe113');


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
-- Chỉ mục cho bảng `classroom_assignments`
--
ALTER TABLE `classroom_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `classroom_assignment_section_id_id_2db98d88_fk_classroom` (`section_id_id`);

--
-- Chỉ mục cho bảng `classroom_authentication`
--
ALTER TABLE `classroom_authentication`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `classroom_submits_student_id_id_7775c4be_fk_classroom` (`student_id_id`),
  ADD KEY `classroom_submits_assignment_id_id_3a42f3b7_fk_classroom` (`assignment_id_id`);

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
-- Chỉ mục cho bảng `temporary_user`
--
ALTER TABLE `temporary_user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
-- AUTO_INCREMENT cho bảng `classroom_authentication`
--
ALTER TABLE `classroom_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classroom_joins`
--
ALTER TABLE `classroom_joins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `classroom_submits`
--
ALTER TABLE `classroom_submits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `temporary_user`
--
ALTER TABLE `temporary_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Các ràng buộc cho bảng `classroom_assignments`
--
ALTER TABLE `classroom_assignments`
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
  ADD CONSTRAINT `classroom_submits_assignment_id_id_3a42f3b7_fk_classroom` FOREIGN KEY (`assignment_id_id`) REFERENCES `classroom_assignments` (`assignment_id`),
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
