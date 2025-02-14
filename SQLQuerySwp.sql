create database swp201c
use swp201c
CREATE TABLE Roles (
    role_id INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY is equivalent to AUTO_INCREMENT
    role_name VARCHAR(50) NOT NULL, -- Use VARCHAR instead of ENUM
    CONSTRAINT CHK_role_name CHECK (role_name IN ('admin', 'customer', 'owner')) -- Constraint to ensure valid values
);

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY, -- Fix duplication of the INT keyword
    email VARCHAR(100) NOT NULL UNIQUE, -- Ensure email is unique
    password VARCHAR(255) NOT NULL, -- Password cannot be null
    role_id INT NOT NULL, -- Link to the Roles table
    phone_number VARCHAR(15), -- Phone number is optional
    full_name VARCHAR(100),
    date_of_birth DATE,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id) -- Set foreign key
);
select * from Users

select * from Roles

select * from Rooms

select * from Requests

select * from Positions

select * from wishlist_room

INSERT INTO Users (email, password, role_id, phone_number, full_name, date_of_birth, entity_state, image)
VALUES ('son@gmail.com', '5gFWsMvjkyMhiv+GskHTBd46Ivw=', 2, '1234567890', 'John Doe', '1990-01-01', 1, 'image_path_here');

ALTER TABLE Users
ADD entity_state TINYINT NOT NULL

ALTER TABLE Users
ADD image VARCHAR(255) null

INSERT INTO Roles (role_name) 
VALUES ('admin'), ('customer'), ('owner');

UPDATE Users SET phone_number='1234567899', full_name='John Doe', date_of_birth='1990-01-01'  WHERE email = 'son@gmail.com';
UPDATE Users SET password='5gFWsMvjkyMhiv+GskHTBd46Ivw+' WHERE email = 'son@gmail.com';

CREATE TABLE Information (
    user_id INT PRIMARY KEY, -- Primary key, also a foreign key
    CCCD  NVARCHAR(255) NOT NULL, -- National ID
    issue_date DATE NOT NULL, -- ngày cấp
    place_of_issue NVARCHAR(255) NOT NULL, -- nơi cấp
    permanent_address NVARCHAR(255) NOT NULL, -- địa chỉ ở
    CONSTRAINT FK_Information_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);
-- bảng yêu cầu 
CREATE TABLE Requests (
    request_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    content NVARCHAR(MAX) NOT NULL -- Request content
);
-- vị trí 
CREATE TABLE Positions (
    position_id INT IDENTITY(1,1) PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- bảng phòng 
CREATE TABLE Rooms (
    room_id INT IDENTITY(1,1) PRIMARY KEY, 
    room_name VARCHAR(100) NOT NULL, 
    description VARCHAR(MAX),
    price FLOAT NOT NULL, 
    status TINYINT NOT NULL, 
    position_id INT NOT NULL, 
    user_id INT NOT NULL,
    request_id INT NOT NULL, -- Foreign key to the Requests table
    CONSTRAINT CHK_status CHECK (status IN (1, 2)), -- 1: Available, 2: Booked
    FOREIGN KEY (position_id) REFERENCES Positions(position_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (request_id) REFERENCES Requests(request_id)
);
-- đặt phòng 
CREATE TABLE Booking (
    booking_id INT IDENTITY(1,1) PRIMARY KEY, 
    user_id INT NOT NULL, 
    room_id INT NOT NULL, 
    start_date DATE NOT NULL, -- ngày bắt đầu 
    months INT NOT NULL CHECK (months > 0), -- số tháng 
    end_date AS DATEADD(MONTH, months, start_date) PERSISTED, -- ngày kết thúc
    status TINYINT NOT NULL CHECK (status IN (0, 1, 2)), -- 0: xác nhận , 1: đang chờ , 2: hủy
    FOREIGN KEY (user_id) REFERENCES Users(user_id), 
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- phê duyệt 
CREATE TABLE Approval (
    approval_id INT IDENTITY(1,1),  -- Auto-increment primary key
    request_id INT NOT NULL,         -- Link to the Requests table
    user_id INT NOT NULL,            -- Link to the Users table
    status VARCHAR(50) NOT NULL,     -- Approval status
    approval_date DATETIME DEFAULT GETDATE(), -- Approval date, default is current time
    CONSTRAINT PK_Approval PRIMARY KEY (approval_id, request_id, user_id),  -- Composite primary key
    FOREIGN KEY (request_id) REFERENCES Requests(request_id),  -- Foreign key to the Requests table
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Foreign key to the Users table
);

-- hợp đồng 
CREATE TABLE Contract (
    contract_id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment ID
    booking_id INT NOT NULL, -- Link to the Booking table
    tenant_id INT NOT NULL, -- Tenant (link to Users table)
    landlord_id INT NOT NULL, -- Landlord (link to Users table)
    creation_date DATETIME DEFAULT GETDATE(), -- Contract creation date, default is current time
    content VARCHAR(MAX) NOT NULL, -- Contract content
status TINYINT NOT NULL CHECK (status IN (0, 1, 2)), -- 0: Active, 1: Canceled, 2: Expired
    request_id INT NOT NULL, -- Link to the Requests table
    CONSTRAINT CHK_Contract_Status CHECK (status IN (0, 1, 2)), -- Constraint to check valid status
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id), -- Foreign key linked to Booking table
    FOREIGN KEY (tenant_id) REFERENCES Users(user_id), -- Foreign key linked to tenant
    FOREIGN KEY (landlord_id) REFERENCES Users(user_id), -- Foreign key linked to landlord
    FOREIGN KEY (request_id) REFERENCES Requests(request_id) -- Foreign key linked to the Requests table
);
-- tin nhắn 
CREATE TABLE Message (
    message_id INT IDENTITY(1,1) PRIMARY KEY,      -- Auto-increment ID for the message
    sender_id INT NOT NULL,                         -- Sender ID, links to the Users table
    receiver_id INT NOT NULL,                       -- Receiver ID, links to the Users table
    content NVARCHAR(MAX) NOT NULL,                 -- Message content
    sent_time DATETIME DEFAULT GETDATE(),           -- Message sent time
    FOREIGN KEY (sender_id) REFERENCES Users(user_id), -- Foreign key to the Users table
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id) -- Foreign key to the Users table
);

CREATE TABLE Feedback (
    feedback_id INT IDENTITY(1,1) PRIMARY KEY,    -- Auto-increment ID for feedback
    user_id INT NOT NULL,                          -- User ID, links to the Users table
    room_id INT NOT NULL,                          -- Room ID, links to the Rooms table
    content NVARCHAR(MAX) NOT NULL,                -- Feedback content
    rating TINYINT NOT NULL,                       -- Rating (e.g., 1 to 5 scale)
    creation_date DATETIME DEFAULT GETDATE(),      -- Feedback creation date
    request_id INT NOT NULL,                       -- Link to the Requests table
    FOREIGN KEY (user_id) REFERENCES Users(user_id), -- Foreign key to the Users table
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id), -- Foreign key to the Rooms table
    FOREIGN KEY (request_id) REFERENCES Requests(request_id) -- Foreign key to the Requests table
);


CREATE TABLE wishlist_room (
    user_id INT,
    room_id INT,
    PRIMARY KEY (user_id, room_id), -- Composite primary key
    FOREIGN KEY (user_id) REFERENCES Users(user_id), -- Foreign key to the Users table
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) -- Foreign key to the Room table
);

CREATE TABLE RoomAppointment (
    appointment_id INT IDENTITY(1,1),    -- Auto-increment ID for appointment_id
    user_id INT NOT NULL,                 -- Link to the Users table
    room_id INT NOT NULL,                 -- Link to the Rooms table
    view_date DATE NOT NULL,              -- Date of the room viewing appointment
    status TINYINT NOT NULL DEFAULT 0,    -- Appointment status
    CONSTRAINT CHK_Status_Appointment CHECK (status IN (0, 1, 2)
	)); -- Status constraint with a unique name

	INSERT INTO Users (email, password, role_id, phone_number, full_name, date_of_birth, entity_state, image) 
VALUES ('son1@gmail.com', 'X7go4gtqh8JLr47GlaiSIh8zvwY=', 2, '0123456789', 'Nguyen Van A', '1990-05-15', 1,'default_user.jpg');

UPDATE Users
SET role_id=3
WHERE email = 'son1@gmail.com';

ALTER TABLE Rooms 
ADD image VARCHAR(255);

INSERT INTO Rooms (room_name, description, price, status, position_id, user_id, request_id)
VALUES 
    ('Deluxe Room', 'A spacious deluxe room with a beautiful view.', 150.00, 1, 1, 1, 1),
    ('Standard Room', 'A comfortable standard room with basic amenities.', 100.00, 1, 2, 2, 2),
    ('Executive Suite', 'An executive suite with a separate living area.', 200.00, 2, 3, 3, 3);

INSERT INTO Positions (position_name)
VALUES 
    ('City Center'),
    ('Suburban Area'),
    ('Near Airport');

INSERT INTO Requests (content)
VALUES 
    ('Request for a deluxe room with a view.'),
    ('Request for a standard room with basic amenities.'),
    ('Request for an executive suite with a separate living area.');

INSERT INTO Users (email, password, role_id, phone_number, full_name, date_of_birth, entity_state, image)
VALUES 
    ('user1@gmail.com', 'password123', 2, '0123456789', 'Nguyen Van A', '1990-05-15', 1, 'default_user.jpg'),
    ('user2@gmail.com', 'password456', 2, '0987654321', 'Tran Thi B', '1985-10-20', 1, 'default_user.jpg'),
    ('user3@gmail.com', 'password789', 2, '0369852147', 'Le Van C', '1995-03-25', 1, 'default_user.jpg');

INSERT INTO Rooms (room_name, description, price, status, position_id, user_id, request_id)
VALUES 
    ('Deluxe Room', 'A spacious deluxe room with a beautiful view.', 150.00, 1, 1, 13, 1),
    ('Standard Room', 'A comfortable standard room with basic amenities.', 100.00, 1, 2, 14, 2),
    ('Executive Suite', 'An executive suite with a separate living area.', 200.00, 2, 3, 15, 3);

DELETE FROM Rooms

INSERT INTO Rooms (room_name, description, price, status, position_id, user_id, request_id, image)  
VALUES  
    ('Deluxe Room', 'A spacious deluxe room with a beautiful view.', 150.00, 1, 1, 13, 1, 'images/deluxe_room.jpg'),  
    ('Standard Room', 'A comfortable standard room with basic amenities.', 100.00, 1, 2, 14, 2, 'images/standard_room.jpg'),  
    ('Executive Suite', 'An executive suite with a separate living area.', 200.00, 2, 3, 15, 3, 'images/executive_suite.jpg');

INSERT INTO wishlist_room (user_id, room_id) VALUES (10, 6)
DELETE FROM wishlist_room