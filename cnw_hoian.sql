-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 07:30 PM
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
-- Database: `cnw_hoian`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `IDUser` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`IDUser`, `Username`, `Password`) VALUES
('0001', 'admin1', 'admin1'),
('0002', 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `ID_Detail` varchar(20) NOT NULL,
  `ID_Image` varchar(20) NOT NULL,
  `Image` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album`
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
('22', '17', 'https://cdn.tgdd.vn/2020/07/CookRecipe/GalleryStep/thanh-pham-421.jpg', ''),
('23', '18', 'https://www.desidakaar.com/wp-content/uploads/2020/01/cao-lau-vietnamese-food.jpg', ''),
('24', '19', 'https://dailytravelvietnam.com/vi/images/2019/08/nuoc-mot-hoi-an-685x750.jpg', ''),
('2', '2', 'https://i.pinimg.com/564x/2b/10/dd/2b10dde1e76debb56f75ac53b3da6588.jpg', ''),
('25', '20', 'https://phunuketnoi.com/wp-content/uploads/2022/02/che-bap-hoi-an-4554.jpg', ''),
('26', '21', 'https://statics.vinpearl.com/banh-uot-thit-nuong-hoi-an-2_1632554955.jpg', ''),
('27', '22', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/02/phong-nghi-horizon-homestay-hoi-an-vntrip-e1517903887299.jpg', ''),
('28', '24', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/02/tue-tam-homestay-gia-re-hoi-an-vntrip-e1517904181405.jpg', ''),
('29', '25', 'https://cf.bstatic.com/xdata/images/hotel/square200/441949517.webp?k=7575a4e29e8e54a7ee907efa4edbfbc1c4d203bb48ce314c80ecc4586eb62e23&o=', ''),
('30', '26', 'data:image/jpeg;base64,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', ''),
('3', '3', 'https://i.pinimg.com/564x/35/39/61/35396199fff7382163b91d103dfd9372.jpg', ''),
('3', '4', 'https://i.pinimg.com/564x/3a/81/60/3a8160a862c3b150e654ba00dd6ed093.jpg', ''),
('3', '5', 'https://i.pinimg.com/564x/3d/bb/b0/3dbbb0bc27483957cff5bad02f6cba5c.jpg', ''),
('4', '6', 'https://i.pinimg.com/564x/de/3c/6e/de3c6e0c731149aaebd42ef19dae5e12.jpg', ''),
('5', '7', 'https://media.mia.vn/uploads/blog-du-lich/tong-hop-kinh-nghiem-di-ninh-binh-bang-tau-hoa-1640408623.jpg', ''),
('6', '8', 'https://www.asiauniquetravel.com/travel-blog/wp-content/uploads/2020/04/Dragon-Sapa-Express-2-436x300.jpg', ''),
('7', '9', 'https://tapchigiaothong.qltns.mediacdn.vn/zoom/600_315/tapchigiaothong.vn/files/duc.anh/2016/09/07/20160901172930-o-to-cu3_bglqjpg-0845.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `catalogue`
--

CREATE TABLE `catalogue` (
  `ID_Catalogue` varchar(20) NOT NULL,
  `Name_Catalogue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catalogue`
--

INSERT INTO `catalogue` (`ID_Catalogue`, `Name_Catalogue`) VALUES
('1', 'Introduction'),
('2', 'Transportation'),
('3', 'Location'),
('4', 'Cuisine'),
('5', 'Accomodation');

-- --------------------------------------------------------

--
-- Table structure for table `detail_catalogue`
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
-- Dumping data for table `detail_catalogue`
--

INSERT INTO `detail_catalogue` (`ID_Catalogue`, `ID_Detail`, `Title`, `Name`, `Content`, `Other`) VALUES
('1', '1', 'General ', '', 'Hoi An Ancient Town is an old town located in the lower section of Thu Bon River, belonging to the coastal plain of Quang Nam Province, Vietnam, about 30 km south of Da Nang city.\r\nHoi An is a city in Quang Nam Province with many ancient streets built since the 16th century and still exist almost intact today. In Western historical documents, Hoi An is called Faifo. Hoi An Ancient Town is recognized as a UNESCO World Heritage Site since 1999. This is a destination that attracts many tourists from Da Nang - Hoi An.', ''),
('2', '10', 'How to travel in Hoi An', 'Cyclo', 'Touring the ancient town by cyclo is an interesting and memorable travel experience that you should try. If you want, you can catch a cyclo at Tran Phu or Phan Chau Chinh street, the price is around 150,000 VND/vehicle/hour.', ''),
('2', '11', 'How to travel in Hoi An', 'Bicycles', 'This is an ideal choice for you to stroll around and explore the peaceful beauty of Hoi An ancient town. Some hotels offer free bicycles for guests, or you can rent one for only 40,000 VND/day.', ''),
('3', '12', 'Ancient houses', 'Phung Hung ancient house', 'The house belonged to the wealthiest merchant in Hoi An at that time, known as the largest and tallest house in the area. The house was entirely built of high-quality ironwood and precious wood, featuring traditional architecture and reflecting a rather affluent lifestyle.', ''),
('3', '13', 'Ancient houses', 'Tan Ky ancient house', 'The ancient house is extremely famous in Hoi An, attracting tourists to stop by for sightseeing and check-in. Over the centuries, even though the historic flood of 1964, the house remains intact. Tan Ky Ancient House is a combination of Vietnamese, Chinese, and Japanese architectural styles in each detail. Every detail in the house is built with extreme care and sophistication, making it a popular destination for many tourists.', ''),
('3', '14', 'Ancient houses', 'Duc An ancient house', 'This is an oriental-style house in Hoi An. The special feature of the ancient house of Duc An is the use of kieng kieng wood - a type of wood only found in Quang Nam. Not only is it attractive for its serene beauty, but this wooden house also preserves many items, booksâ¦ with a layout that evokes a bygone era.', ''),
('3', '15', 'The ancient assembly halls are famous in the old town of Hoi An', 'Quang Dong Assembly Hall', 'Located right in the center of Hoi An old town, the Quang Dong Assembly Hall is highly regarded. The assembly hall was originally a place for business meetings, built by a Quang Dong Chinese merchant, so it features distinctive Chinese architecture. The building is an exquisite combination of wood and stone, with delicate dragon and lion motifs carved.', ''),
('3', '16', 'The ancient assembly halls are famous in the old town of Hoi An', 'Trieu Chau Assembly Hall', 'also known as Ong Bon Pagoda. The architecture is intricate, with decorative motifs based on folklore, especially with raised patterns made of porcelain that create a unique feature of the Trieu Chau Assembly Hall.', ''),
('3', '17', 'The ancient assembly halls are famous in the old town of Hoi An', 'Phuc Kien Assembly Hall', 'known as the largest and most beautiful assembly hall in the tourist area of Hoi An. After the three-door gate, there is a large garden with a miniature mountain and a statue of a carp jumping over the dragon gate. When visiting the Phuc Kien Assembly Hall, donât forget to visit the main area of the temple to worship the Holy Mother Thien Hau, Lady Sinh Thai, and 12 Lady Má»¥. In addition, in the back hall, visitors can light large incense sticks, often hung with a piece of paper with information to pray for health and wealth.', ''),
('3', '18', 'Japanese Bridge', '', 'When visiting Hoi An old town, you must stop by the Japanese Bridge - a unique check-in location here. The bridge stands out with its wooden columns, painted and intricately carved, and most notably built on a soft, curved stone bridge. The Japanese Bridge is the highlight of Hoi An, having stood for 400 years and still standing tall, spanning a quiet branch of the Thu Bon River. In the past, this was a bustling trading port, where the prominent architectural styles of Vietnam and East Asian cultures such as China, Korea, and Japan were prominent. At night, when the Japanese Bridge is lit up, its reflection shimmers on the water surface, shining brightly amidst the bustle of Hoi An streets.', ''),
('3', '19', 'Tran Family Chapel', '', 'The Tran Family Chapel is a typical example of the ancestral chapels of ancient Vietnamese people. After 200 years of wind and rain, the Tran family chapel still retains its ancient architecture. The chapel was built and decorated very artistically, carefully following feng shui principles with a harmonious combination of Vietnamese, Japanese, and Chinese architecture. Another highlight of the Tran family chapel is the 1,500 m2 garden, surrounded by high walls, lush greenery, and a hundred-year-old persimmon tree.', ''),
('1', '2', 'Culture', '', 'Hoi An is also famous for its unique traditional festivals such as the village throne ceremony, the commemoration of the ancestors of the profession, the commemoration of religious saints, and folk games such as ho khoan, ho gia gao, and bai choi...\r\nNot only can you immerse yourself in the simple beauty of the ancient town, but you can also discover the intersection of Eastern cultures from Japan, China, and Vietnam. Because Hoi An was originally a bustling and crowded trading port that existed under the Nguyen dynasty about 200 years ago, the trade between Vietnam and other countries (Japan, China, â¦) has created a multicultural and colorful Hoi An that still exists today.', ''),
('3', '20', 'Hoi An Market', '', 'Which is located in Hoi An, Vietnam, is one of the top 7 culinary paradises in the world, according to Lonelyplanet magazine. \r\n\r\nThe market is in good company with Tsukiji Fish Market in Tokyo, Japan; Borough Market in London, England; La Pescheria in Sicily, Italy; La Boqueria in Barcelona, Spain; Mercado Central in Santiago, Chile; and New World Mall in New York, USA.\r\n\r\nThe most attractive feature of this market is its food section. Countless stalls selling local delicacies are lined up next to each other, not only delicious but also affordable. Therefore, this is a must-visit destination on your Hoi An tour!', ''),
('3', '21', 'The Hoi An Handicraft Workshop', '', 'The Hoi An Handicraft Workshop is a place that preserves and develops 12 traditional Vietnamese crafts, including carpentry, pottery, lanterns, weaving, embroidery, tailoring, bamboo knitting, bamboo weaving, palm-leaf conical hat making, lacquerware, and wood carving. The exquisitely crafted handmade products from skilled artisans leave a special impression on visitors, making them even more proud and respectful of the Vietnamese people.', ''),
('4', '22', 'Are you hungry?', 'Hoi An Chicken Rice', 'Com Ga is a Vietnamese dish that is quite familiar to the locals. However, the Com Ga in Hoi An has a unique and distinctive flavor. The dish consists of delicious rice, served with chicken, onions, Tra  Que herbs, and sour papaya. A bowl of rich soup on the side makes the dish even more appetizing.', 'Com ga Ba Buoi, 26 Phan Chau Trinh streetCom ga Ba Huong, Sica alley'),
('4', '23', 'Are you hungry?', 'Cao Lau', 'Cao Lau is a type of noodles in Quang Nam, Vietnam. It is considered a specialty dish of Hoi An city. This noodle dish has yellow noodles, served with shrimp, pork, fresh vegetables and very little broth. The yellow noodles are made from flour mixed with ash from a local plant.', 'Cao Lau Thanh, 26 Thai Phien street\r\nCao Lau Hoi An Ba Be, 19 Tran Phu street'),
('4', '24', 'Are you thirsty?', 'Mot herbal drink', 'Mot drink is made from various natural herbs that is very famous in Hoi An. It is known as a drink that most tourists cannot miss when visiting the old town. Mot drink is made from many types of healthy herbs which combine and become a very good taste.', '150 Tran Phu'),
('4', '25', 'Are you thirsty?', 'Corn sweet soup', 'Hoi An Corn sweet soup is a traditional dessert of the ancient town of Hoi An. This sweet soup is made from sweet glutinous corn, fresh and fragrant, combined with rock sugar and ginger. Hoi An Corn sweet soup has a distinctive flavor, grainy, rich and creamy from corn and coconut milk.', '6/6 Phan Chu Trinh'),
('4', '26', 'Are you hungry?', 'Grilled pork rolls', 'Grilled pork wrapped in rice paper Hoi An is a traditional dish consisting of pork marinated with lemongrass, fish sauce, soy sauce, sugar, garlic and cashew oil, then grilled over charcoal for aroma and crispiness. The grilled pork is wrapped with rice paper, rice noodles, fresh vegetables, green banana and dipped with a special sauce.', '31 Tieu La'),
('5', '27', 'Homestay', 'Horizon Homestay', 'Horizon Homestay Hoi An features modern architecture and each room has a balcony overlooking the garden. Here, you will find tea tables and chairs set up, where you can enjoy a cup of coffee or tea and breathe in the fresh, cool air of the garden. Not only that, but the services provided here are also of high quality. The homestay offers free parking and bicycles for visitors who want to explore nearby areas.', ''),
('5', '28', 'Homestay', 'Tue Tam Homestay', 'This homestay is located on Nguyen Truong To street in the heart of Hoi An Old Quarter. It is built with a combination of classic and modern styles, and is fully equipped with amenities. Therefore, this place always brings satisfaction to those who stay here.', ''),
('5', '29', 'Hotel', 'Hoi An Golden Holiday Hotel and Spa', 'Hoi An Golden Holiday Hotel & Spa is located just a 5-minute drive from An Bang Beach and Hoi An city center. The hotel offers affordable rooms with flat-screen TVs', ''),
('1', '3', 'Time to visit', '', 'The best time to visit Hoi An Ancient Town is from February to April every year because the weather is cool and pleasant during this time of spring, with little rain and mild sunshine, which is very suitable for tourists to visit and explore.', ''),
('5', '30', 'Villa', 'December Hoi An Villa', 'December Hoi An Villa is located in Hoi An city, 2.5 km from Hoi An Historical Museum. The villa provides free bicycles for guests, free private parking, an outdoor swimming pool, and a garden. If you need more information about this villa, please let me know.', ''),
('2', '4', 'How to travel to Hoi An', 'By plane', 'To get to Hoi An the fastest, you take a flight to Da Nang airport as it is the closest airport to Hoi An.', ''),
('2', '5', 'How to travel to Hoi An', 'By train', 'You can choose to take a train to Da Nang station.', ''),
('2', '6', 'How to travel to Hoi An', 'By bus', 'If you want to save more money, you can choose the bus of reputable bus companies.', ''),
('2', '7', 'How to travel to Hoi An', 'Personal vehicles', 'If you want to have an active trip, you can choose to ride a motorbike or car. Hoi An is about 30km from Da Nang, the road is flat and easy to travel.', ''),
('2', '8', 'How to travel in Hoi An', 'Motobike', 'Personal vehicles are your preferred choice for a self-guided tour of Hoi An ancient town according to your preference.', ''),
('2', '9', 'How to travel in Hoi An', 'Taxi', 'If you are not familiar with the area and do not want to spend time finding your way, then a taxi is the ideal choice for traveling to tourist destinations in Hoi An.', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID_Image`),
  ADD KEY `ID_Detail` (`ID_Detail`);

--
-- Indexes for table `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`ID_Catalogue`);

--
-- Indexes for table `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD PRIMARY KEY (`ID_Detail`),
  ADD KEY `ID_Catalogue` (`ID_Catalogue`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`ID_Detail`) REFERENCES `detail_catalogue` (`ID_Detail`);

--
-- Constraints for table `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD CONSTRAINT `detail_catalogue_ibfk_1` FOREIGN KEY (`ID_Catalogue`) REFERENCES `catalogue` (`ID_Catalogue`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
