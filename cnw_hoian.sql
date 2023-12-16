-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 16, 2023 lúc 07:33 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cnw_hoian`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `IDUser` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`IDUser`, `Username`, `Password`) VALUES
('0001', 'admin1', 'admin1'),
('0002', 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album`
--

CREATE TABLE `album` (
  `ID_Detail` varchar(20) NOT NULL,
  `ID_Image` varchar(20) NOT NULL,
  `Image` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `album`
--

INSERT INTO `album` (`ID_Detail`, `ID_Image`, `Image`, `Description`) VALUES
('1', '1', 'https://i.pinimg.com/564x/a6/15/b8/a615b84356d2f3321c0dfb860d155b95.jpg', ''),
('8', '10', 'https://th.bing.com/th/id/OIP.3E-XxeQ39wIleNf0fWgyawHaFj?rs=1&pid=ImgDetMain', ''),
('9', '11', 'https://ticotravel.com.vn/wp-content/uploads/2022/06/taxi-Hoi-An-4.jpg', ''),
('10', '12', 'https://vi.seatrekvietnam.com/wp-content/uploads/2018/02/xich-lo-hoi-an.jpg', ''),
('11', '13', 'https://danangtravelcar.com.vn/wp-content/uploads/2022/08/trai-nghiem-thue-xe-dap-hoi-an-dao-pho-co-dung-phong-cach-1-1.jpg', ''),
('12', '14', 'https://asianwaytravel.com/wp-content/uploads/2018/10/Hoi-An-Travel-Phung-Hung-Old-House-Asianwaytravel.jpg', ''),
('18', '15', 'https://th.bing.com/th/id/R.14f7147ed17ffe74d452e6e0dafa502a?rik=enmUdD4QOyaSJw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-oZ7lyemccps%2fUZSNgAOr18I%2fAAAAAAAAAG8%2fJ9LU3yE0XU0%2fs1600%2fcau%2bchua.JPG&ehk=xsFxEUW4nSAUaVqqQrHWg%2bgCIl%2fPon7V5lTJxlQkb3M%3d&risl=&pid=ImgRaw&r=0', ''),
('19', '16', 'https://hoianonline.com/product_images/uploaded_images/tran-family-chapel-02.jpeg', ''),
('2', '2', 'https://i.pinimg.com/564x/2b/10/dd/2b10dde1e76debb56f75ac53b3da6588.jpg', ''),
('3', '3', 'https://i.pinimg.com/564x/35/39/61/35396199fff7382163b91d103dfd9372.jpg', ''),
('3', '4', 'https://i.pinimg.com/564x/3a/81/60/3a8160a862c3b150e654ba00dd6ed093.jpg', ''),
('3', '5', 'https://i.pinimg.com/564x/3d/bb/b0/3dbbb0bc27483957cff5bad02f6cba5c.jpg', ''),
('4', '6', 'https://i.pinimg.com/564x/de/3c/6e/de3c6e0c731149aaebd42ef19dae5e12.jpg', ''),
('5', '7', 'https://media.mia.vn/uploads/blog-du-lich/tong-hop-kinh-nghiem-di-ninh-binh-bang-tau-hoa-1640408623.jpg', ''),
('6', '8', 'https://www.asiauniquetravel.com/travel-blog/wp-content/uploads/2020/04/Dragon-Sapa-Express-2-436x300.jpg', ''),
('7', '9', 'https://tapchigiaothong.qltns.mediacdn.vn/zoom/600_315/tapchigiaothong.vn/files/duc.anh/2016/09/07/20160901172930-o-to-cu3_bglqjpg-0845.jpg', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalogue`
--

CREATE TABLE `catalogue` (
  `ID_Catalogue` varchar(20) NOT NULL,
  `Name_Catalogue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalogue`
--

INSERT INTO `catalogue` (`ID_Catalogue`, `Name_Catalogue`) VALUES
('1', 'Introduction'),
('2', 'Transportation'),
('3', 'Location'),
('4', 'Cuisine'),
('5', 'Accomodation');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_catalogue`
--

CREATE TABLE `detail_catalogue` (
  `ID_Catalogue` varchar(20) NOT NULL,
  `ID_Detail` varchar(20) NOT NULL,
  `Title` text NOT NULL,
  `Name` text NOT NULL,
  `Content` text NOT NULL,
  `Other` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_catalogue`
--

INSERT INTO `detail_catalogue` (`ID_Catalogue`, `ID_Detail`, `Title`, `Name`, `Content`, `Other`) VALUES
('1', '1', 'General ', '', 'Hoi An Ancient Town is an old town located in the lower section of Thu Bon River, belonging to the coastal plain of Quang Nam Province, Vietnam, about 30 km south of Da Nang city.\r\nHoi An is a city in Quang Nam Province with many ancient streets built since the 16th century and still exist almost intact today. In Western historical documents, Hoi An is called Faifo. Hoi An Ancient Town is recognized as a UNESCO World Heritage Site since 1999. This is a destination that attracts many tourists from Da Nang - Hoi An.', ''),
('2', '10', 'How to travel in Hoi An', 'Cyclo', 'Touring the ancient town by cyclo is an interesting and memorable travel experience that you should try. If you want, you can catch a cyclo at Tran Phu or Phan Chau Chinh street, the price is around 150,000 VND/vehicle/hour.', ''),
('2', '11', 'How to travel in Hoi An', 'Bicycles', 'This is an ideal choice for you to stroll around and explore the peaceful beauty of Hoi An ancient town. Some hotels offer free bicycles for guests, or you can rent one for only 40,000 VND/day.', ''),
('3', '12', 'Ancient houses', 'Phung Hung ancient house', 'The house belonged to the wealthiest merchant in Hoi An at that time, known as the largest and tallest house in the area. The house was entirely built of high-quality ironwood and precious wood, featuring traditional architecture and reflecting a rather affluent lifestyle.', 'tọa lạc tại 111'),
('3', '13', 'Ancient houses', 'Tan Ky ancient house', 'The ancient house is extremely famous in Hoi An, attracting tourists to stop by for sightseeing and check-in. Over the centuries, even though the historic flood of 1964, the house remains intact. Tan Ky Ancient House is a combination of Vietnamese, Chinese, and Japanese architectural styles in each detail. Every detail in the house is built with extreme care and sophistication, making it a popular destination for many tourists.', ''),
('3', '14', 'Ancient houses', 'Duc An ancient house', 'This is an oriental-style house in Hoi An. The special feature of the ancient house of Duc An is the use of kieng kieng wood - a type of wood only found in Quang Nam. Not only is it attractive for its serene beauty, but this wooden house also preserves many items, booksâ¦ with a layout that evokes a bygone era.', ''),
('3', '15', 'The ancient assembly halls are famous in the old town of Hoi An', 'Quang Dong Assembly Hall', 'Located right in the center of Hoi Anâs old town, the Quang Dong Assembly Hall is highly regarded. The assembly hall was originally a place for business meetings, built by a Quang Dong Chinese merchant, so it features distinctive Chinese architecture. The building is an exquisite combination of wood and stone, with delicate dragon and lion motifs carved.', ''),
('3', '16', 'The ancient assembly halls are famous in the old town of Hoi An', 'Trieu Chau Assembly Hall', 'also known as Ong Bon Pagoda. The architecture is intricate, with decorative motifs based on folklore, especially with raised patterns made of porcelain that create a unique feature of the Trieu Chau Assembly Hall.', ''),
('3', '17', 'The ancient assembly halls are famous in the old town of Hoi An', 'Phuc Kien Assembly Hall', 'known as the largest and most beautiful assembly hall in the tourist area of Hoi An. After the three-door gate, there is a large garden with a miniature mountain and a statue of a carp jumping over the dragon gate. When visiting the Phuc Kien Assembly Hall, donât forget to visit the main area of the temple to worship the Holy Mother Thien Hau, Lady Sinh Thai, and 12 Lady Má»¥. In addition, in the back hall, visitors can light large incense sticks, often hung with a piece of paper with information to pray for health and wealth.', ''),
('3', '18', 'Japanese Bridge', '', 'When visiting Hoi Anâs old town, you must stop by the Japanese Bridge - a unique check-in location here. The bridge stands out with its wooden columns, painted and intricately carved, and most notably built on a soft, curved stone bridge. The Japanese Bridge is the highlight of Hoi An, having stood for 400 years and still standing tall, spanning a quiet branch of the Thu Bon River. In the past, this was a bustling trading port, where the prominent architectural styles of Vietnam and East Asian cultures such as China, Korea, and Japan were prominent. At night, when the Japanese Bridge is lit up, its reflection shimmers on the waterâs surface, shining brightly amidst the bustle of Hoi Anâs streets.', ''),
('3', '19', 'Tran Family Chapel', '', 'The Tran Family Chapel is a typical example of the ancestral chapels of ancient Vietnamese people. After 200 years of wind and rain, the Tran family chapel still retains its ancient architecture. The chapel was built and decorated very artistically, carefully following feng shui principles with a harmonious combination of Vietnamese, Japanese, and Chinese architecture. Another highlight of the Tran family chapel is the 1,500 m2 garden, surrounded by high walls, lush greenery, and a hundred-year-old persimmon tree.', ''),
('1', '2', 'Culture', '', 'Hoi An is also famous for its unique traditional festivals such as the village throne ceremony, the commemoration of the ancestors of the profession, the commemoration of religious saints, and folk games such as ho khoan, ho gia gao, and bai choi...\r\nNot only can you immerse yourself in the simple beauty of the ancient town, but you can also discover the intersection of Eastern cultures from Japan, China, and Vietnam. Because Hoi An was originally a bustling and crowded trading port that existed under the Nguyen dynasty about 200 years ago, the trade between Vietnam and other countries (Japan, China, â¦) has created a multicultural and colorful Hoi An that still exists today.', ''),
('3', '20', 'Hoi An Market', '', 'Which is located in Hoi An, Vietnam, is one of the top 7 culinary paradises in the world, according to Lonelyplanet magazine. \r\n\r\nThe market is in good company with Tsukiji Fish Market in Tokyo, Japan; Borough Market in London, England; La Pescheria in Sicily, Italy; La Boqueria in Barcelona, Spain; Mercado Central in Santiago, Chile; and New World Mall in New York, USA.\r\n\r\nThe most attractive feature of this market is its food section. Countless stalls selling local delicacies are lined up next to each other, not only delicious but also affordable. Therefore, this is a must-visit destination on your Hoi An tour!', ''),
('3', '21', 'The Hoi An Handicraft Workshop', '', 'The Hoi An Handicraft Workshop is a place that preserves and develops 12 traditional Vietnamese crafts, including carpentry, pottery, lanterns, weaving, embroidery, tailoring, bamboo knitting, bamboo weaving, palm-leaf conical hat making, lacquerware, and wood carving. The exquisitely crafted handmade products from skilled artisans leave a special impression on visitors, making them even more proud and respectful of the Vietnamese people.', ''),
('1', '3', 'Time to visit', '', 'The best time to visit Hoi An Ancient Town is from February to April every year because the weather is cool and pleasant during this time of spring, with little rain and mild sunshine, which is very suitable for tourists to visit and explore.', ''),
('2', '4', 'How to travel to Hoi An', 'By plane', 'To get to Hoi An the fastest, you take a flight to Da Nang airport as it is the closest airport to Hoi An.', ''),
('2', '5', 'How to travel to Hoi An', 'By train', 'You can choose to take a train to Da Nang station.', ''),
('2', '6', 'How to travel to Hoi An', 'By bus', 'If you want to save more money, you can choose the bus of reputable bus companies.', ''),
('2', '7', 'How to travel to Hoi An', 'Personal vehicles', 'If you want to have an active trip, you can choose to ride a motorbike or car. Hoi An is about 30km from Da Nang, the road is flat and easy to travel.', ''),
('2', '8', 'How to travel in Hoi An', 'Motobike', 'Personal vehicles are your preferred choice for a self-guided tour of Hoi An ancient town according to your preference.', ''),
('2', '9', 'How to travel in Hoi An', 'Taxi', 'If you are not familiar with the area and do not want to spend time finding your way, then a taxi is the ideal choice for traveling to tourist destinations in Hoi An.', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID_Image`),
  ADD KEY `ID_Detail` (`ID_Detail`);

--
-- Chỉ mục cho bảng `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`ID_Catalogue`);

--
-- Chỉ mục cho bảng `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD PRIMARY KEY (`ID_Detail`),
  ADD KEY `ID_Catalogue` (`ID_Catalogue`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`ID_Detail`) REFERENCES `detail_catalogue` (`ID_Detail`);

--
-- Các ràng buộc cho bảng `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD CONSTRAINT `detail_catalogue_ibfk_1` FOREIGN KEY (`ID_Catalogue`) REFERENCES `catalogue` (`ID_Catalogue`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
