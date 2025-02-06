USE ss5;	
-- Tạo bảng Guests
CREATE TABLE Guests (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Gender ENUM('Nam', 'Nu')
);

-- Tạo bảng Rooms
CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType ENUM('Standard', 'Deluxe', 'Suite') NOT NULL,
    PricePerNight DECIMAL(10, 2) NOT NULL,
    Status ENUM('Available', 'Occupied', 'Reserved') NOT NULL
);

-- Tạo bảng Bookings
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT NOT NULL,
    RoomID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
-- Chèn dữ liệu vào bảng Guests
INSERT INTO Guests (FullName, PhoneNumber, Email, Gender)
VALUES
    ('Nguyen Van A', '0901234567', 'nguyenvana@example.com', 'Nam'),
    ('Tran Thi B', '0912345678', 'tranthib@example.com', 'Nu'),
    ('Pham Van C', '0923456789', NULL, 'Nam'),
    ('Le Thi D', '0934567890', 'lethid@example.com', 'Nu');

-- Chèn dữ liệu vào bảng Rooms
INSERT INTO Rooms (RoomNumber, RoomType, PricePerNight, Status)
VALUES
    ('101', 'Standard', 500000, 'Available'),
    ('102', 'Deluxe', 1000000, 'Available'),
    ('201', 'Suite', 2000000, 'Available'),
    ('103', 'Deluxe', 1000000, 'Occupied'), 
    ('104', 'Standard', 500000, 'Reserved'); 

-- Chèn dữ liệu vào bảng Bookings
INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, TotalPrice)
VALUES
    (1, 2, '2025-01-10', '2025-01-12', 2000000), 
    (2, 3, '2025-01-15', '2025-01-18', 6000000), 
    (3, 1, '2025-01-20', '2025-01-22', 1000000), 
    (4, 2, '2025-01-18', '2025-01-20', 2000000), 
    (1, 1, '2025-01-23', '2025-01-25', 1000000); 

-- 2
SELECT g.FullName, g.Email,r.RoomType,b.CheckInDate
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
JOIN rooms r ON b.RoomID = r.RoomID
WHERE r.RoomType = 'Deluxe'
  AND b.CheckInDate BETWEEN '2025-01-01' AND '2025-01-31'
ORDER BY b.CheckInDate ASC
LIMIT 5;
-- 3
SELECT r.RoomNumber, r.RoomType,g.GuestID
FROM rooms r
JOIN bookings b ON r.RoomID = b.RoomID
JOIN guests g ON b.GuestID = g.GuestID
WHERE g.Email IS NOT NULL
ORDER BY r.RoomType ASC, r.RoomNumber ASC
LIMIT 5;
-- 4
SELECT g.FullName, g.Email, g.PhoneNumber
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
WHERE g.Gender != 'Nữ'  
GROUP BY g.GuestID
HAVING COUNT(*) >= 2;
-- 5
SELECT g.FullName, g.PhoneNumber, r.RoomType,r.PricePerNight
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
JOIN rooms r ON b.RoomID = r.RoomID
WHERE r.PricePerNight >= 1000000
AND g.PhoneNumber != '0901234567';
