-- ============================================================
-- CSE 204 - Group Project Assignment 2
-- SaaS Monthly Subscription Database
-- ============================================================
-- Changes from Assignment 1:
--   - Added ALTER TABLE DROP during normalization (Item 3 fix)
--   - Bundling: plan <-> service is now M:N via plan_service
--   - payment_method table for storing credit card info
--   - 5 UI queries as requested by the customer
-- ============================================================

-- ============================================================
-- DELIVERABLE 1: Unnormalized (UNF) Table with Example Data
-- (Same as Assignment 1 — 32 data items, 38 rows)
-- ============================================================

CREATE TABLE unf (
    ServiceName VARCHAR(50) NOT NULL,
    ServiceCategory VARCHAR(30),
    ServiceWebsite VARCHAR(80),
    CompanyID INT,
    CompanyName VARCHAR(50),
    CompanyCountry VARCHAR(30),
    PlanName VARCHAR(50) NOT NULL,
    PlanTier VARCHAR(20),
    MonthlyPrice DECIMAL(6,2),
    AnnualDiscount INT,
    MaxUsers INT,
    StorageLimit VARCHAR(20),
    SupportLevel VARCHAR(30),
    APIAccess VARCHAR(5),
    PrioritySupport VARCHAR(5),
    CustomBranding VARCHAR(5),
    AdvancedAnalytics VARCHAR(5),
    CollaborationTools VARCHAR(5),
    OfflineAccess VARCHAR(5),
    MaxProjects INT,
    UserName VARCHAR(30) NOT NULL,
    UserEmail VARCHAR(60),
    UserPhone VARCHAR(20),
    UserCountry VARCHAR(30),
    SubscriptionStartDate DATE,
    SubscriptionStatus VARCHAR(20),
    BillingCycle VARCHAR(20),
    AutoRenew VARCHAR(5),
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(6,2),
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(20),
    PRIMARY KEY (PlanName, UserName, PaymentDate)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- omerk: ChatGPT Plus (3mo), Gemini Advanced (1mo), M365 Personal (2mo), Canva Pro (1mo)
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 20.00, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-10-01', 20.00, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-11-01', 20.00, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Gemini', 'AI Assistant', 'https://gemini.google.com', 2, 'Google', 'USA', 'Gemini Advanced', 'Standard', 19.99, 0, 1, '2 TB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'No', '2025-10-01', 19.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Personal', 'Standard', 6.99, 17, 1, '1 TB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'Yes', '2025-08-01', 6.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Personal', 'Standard', 6.99, 17, 1, '1 TB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'No', '2025-09-01', 6.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Canva', 'Design', 'https://www.canva.com', 6, 'Canva Pty Ltd', 'Australia', 'Canva Pro', 'Standard', 12.99, 17, 1, '1 TB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 999, 'omerk', 'omerk@email.com', '+90 532 111 2233', 'Turkey', '2025-11-01', 'Active', 'Monthly', 'No', '2025-11-01', 12.99, 'Credit Card', 'Completed');

-- ayse_d: ChatGPT Plus (2mo), Spotify Premium (1mo)
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'ayse_d', 'ayse.d@email.com', '+90 505 222 3344', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'Yes', '2025-10-01', 20.00, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'ayse_d', 'ayse.d@email.com', '+90 505 222 3344', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'No', '2025-11-01', 20.00, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'ayse_d', 'ayse.d@email.com', '+90 505 222 3344', 'Turkey', '2025-11-01', 'Active', 'Monthly', 'No', '2025-11-01', 10.99, 'Credit Card', 'Completed');

-- john_s: M365 Personal (3mo), Spotify Family (2mo), Canva Pro (1mo), ChatGPT Team (1mo)
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Personal', 'Standard', 6.99, 17, 1, '1 TB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-07-01', 6.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Personal', 'Standard', 6.99, 17, 1, '1 TB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-08-01', 6.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Personal', 'Standard', 6.99, 17, 1, '1 TB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 6.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Family', 'Pro', 16.99, 0, 6, '15 GB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 1, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 16.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Family', 'Pro', 16.99, 0, 6, '15 GB', 'Email', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 1, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-09-01', 'Active', 'Monthly', 'No', '2025-10-01', 16.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Canva', 'Design', 'https://www.canva.com', 6, 'Canva Pty Ltd', 'Australia', 'Canva Pro', 'Standard', 12.99, 17, 1, '1 TB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 999, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-10-01', 'Active', 'Monthly', 'No', '2025-10-01', 12.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Team', 'Pro', 25.00, 17, 10, '200 GB', 'Priority Email', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'No', 50, 'john_s', 'john.s@email.com', '+1 212 555 0101', 'USA', '2025-11-01', 'Active', 'Monthly', 'No', '2025-11-01', 25.00, 'Credit Card', 'Completed');

-- elena_r: Gemini Business (2mo), M365 Business (1mo)
INSERT INTO unf VALUES ('Gemini', 'AI Assistant', 'https://gemini.google.com', 2, 'Google', 'USA', 'Gemini Business', 'Pro', 30.00, 20, 50, '5 TB', 'Phone + Email', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 100, 'elena_r', 'elena.r@email.com', '+49 170 555 6677', 'Germany', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 30.00, 'Bank Transfer', 'Completed');
INSERT INTO unf VALUES ('Gemini', 'AI Assistant', 'https://gemini.google.com', 2, 'Google', 'USA', 'Gemini Business', 'Pro', 30.00, 20, 50, '5 TB', 'Phone + Email', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 100, 'elena_r', 'elena.r@email.com', '+49 170 555 6677', 'Germany', '2025-09-01', 'Active', 'Monthly', 'No', '2025-10-01', 30.00, 'Bank Transfer', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Business', 'Pro', 12.50, 20, 300, '1 TB', 'Phone + Email', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 999, 'elena_r', 'elena.r@email.com', '+49 170 555 6677', 'Germany', '2025-10-01', 'Active', 'Monthly', 'No', '2025-10-01', 12.50, 'Bank Transfer', 'Completed');

-- mehmet_y: Spotify Premium (3mo), Notion Business (2mo)
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'mehmet_y', 'mehmet.y@email.com', '+90 542 333 4455', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'Yes', '2025-08-01', 10.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'mehmet_y', 'mehmet.y@email.com', '+90 542 333 4455', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 10.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'mehmet_y', 'mehmet.y@email.com', '+90 542 333 4455', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'Yes', '2025-10-01', 10.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Notion', 'Productivity', 'https://www.notion.so', 5, 'Notion Labs', 'USA', 'Notion Business', 'Pro', 18.00, 20, 100, '100 GB', 'Priority Email', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 500, 'mehmet_y', 'mehmet.y@email.com', '+90 542 333 4455', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'Yes', '2025-10-01', 18.00, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Notion', 'Productivity', 'https://www.notion.so', 5, 'Notion Labs', 'USA', 'Notion Business', 'Pro', 18.00, 20, 100, '100 GB', 'Priority Email', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 500, 'mehmet_y', 'mehmet.y@email.com', '+90 542 333 4455', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'No', '2025-11-01', 18.00, 'Credit Card', 'Completed');

-- burak_t: ChatGPT Enterprise (2mo), M365 Enterprise (3mo), Notion Enterprise (1mo)
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Enterprise', 'Ultra', 60.00, 20, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'Yes', '2025-08-01', 60.00, 'Invoice', 'Completed');
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Enterprise', 'Ultra', 60.00, 20, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-08-01', 'Active', 'Monthly', 'No', '2025-09-01', 60.00, 'Invoice', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Enterprise', 'Ultra', 57.00, 20, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-07-01', 57.00, 'Invoice', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Enterprise', 'Ultra', 57.00, 20, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-08-01', 57.00, 'Invoice', 'Completed');
INSERT INTO unf VALUES ('Microsoft 365', 'Productivity', 'https://www.microsoft.com/365', 3, 'Microsoft', 'USA', 'M365 Enterprise', 'Ultra', 57.00, 20, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-07-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 57.00, 'Invoice', 'Completed');
INSERT INTO unf VALUES ('Notion', 'Productivity', 'https://www.notion.so', 5, 'Notion Labs', 'USA', 'Notion Enterprise', 'Ultra', 25.00, 25, 9999, 'Unlimited', 'Dedicated Manager', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 9999, 'burak_t', 'burak.t@bigcorp.com', '+90 555 666 7788', 'Turkey', '2025-09-01', 'Active', 'Monthly', 'No', '2025-09-01', 25.00, 'Invoice', 'Completed');

-- zeynep_k: Spotify Premium (2mo)
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'zeynep_k', 'zeynep.k@email.com', '+90 533 444 5566', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'Yes', '2025-10-01', 10.99, 'Credit Card', 'Completed');
INSERT INTO unf VALUES ('Spotify', 'Music Streaming', 'https://www.spotify.com', 4, 'Spotify AB', 'Sweden', 'Spotify Premium', 'Standard', 10.99, 0, 1, '10 GB', 'Email', 'No', 'No', 'No', 'No', 'No', 'Yes', 1, 'zeynep_k', 'zeynep.k@email.com', '+90 533 444 5566', 'Turkey', '2025-10-01', 'Active', 'Monthly', 'No', '2025-11-01', 10.99, 'Credit Card', 'Completed');

-- ali_c: ChatGPT Plus (1mo)
INSERT INTO unf VALUES ('ChatGPT', 'AI Assistant', 'https://chat.openai.com', 1, 'OpenAI', 'USA', 'ChatGPT Plus', 'Standard', 20.00, 0, 1, '50 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 5, 'ali_c', 'ali.c@email.com', '+90 544 777 8899', 'Turkey', '2025-11-01', 'Active', 'Monthly', 'No', '2025-11-01', 20.00, 'Credit Card', 'Completed');

-- sarah_m: Gemini Advanced (1mo), Notion Plus (2mo), Canva Pro (1mo)
INSERT INTO unf VALUES ('Gemini', 'AI Assistant', 'https://gemini.google.com', 2, 'Google', 'USA', 'Gemini Advanced', 'Standard', 19.99, 0, 1, '2 TB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 10, 'sarah_m', 'sarah.m@email.com', '+1 415 555 0202', 'USA', '2025-11-01', 'Active', 'Monthly', 'No', '2025-11-01', 19.99, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Notion', 'Productivity', 'https://www.notion.so', 5, 'Notion Labs', 'USA', 'Notion Plus', 'Standard', 10.00, 20, 1, '20 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 20, 'sarah_m', 'sarah.m@email.com', '+1 415 555 0202', 'USA', '2025-09-01', 'Active', 'Monthly', 'Yes', '2025-09-01', 10.00, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Notion', 'Productivity', 'https://www.notion.so', 5, 'Notion Labs', 'USA', 'Notion Plus', 'Standard', 10.00, 20, 1, '20 GB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 20, 'sarah_m', 'sarah.m@email.com', '+1 415 555 0202', 'USA', '2025-09-01', 'Active', 'Monthly', 'No', '2025-10-01', 10.00, 'PayPal', 'Completed');
INSERT INTO unf VALUES ('Canva', 'Design', 'https://www.canva.com', 6, 'Canva Pty Ltd', 'Australia', 'Canva Pro', 'Standard', 12.99, 17, 1, '1 TB', 'Email', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 999, 'sarah_m', 'sarah.m@email.com', '+1 415 555 0202', 'USA', '2025-10-01', 'Active', 'Monthly', 'No', '2025-10-01', 12.99, 'PayPal', 'Completed');


-- ============================================================
-- DELIVERABLE 3: Normalization with ALTER TABLE DROP
-- (Item 3 fix: dropping columns from UNF as we normalize)
-- ============================================================

-- -----------------------------------------------
-- Table 1: company
-- -----------------------------------------------
CREATE TABLE company (
    CompanyID INT NOT NULL PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL,
    CompanyCountry VARCHAR(30),
    UNIQUE (CompanyName)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO company (CompanyID, CompanyName, CompanyCountry)
SELECT DISTINCT CompanyID, CompanyName, CompanyCountry
FROM unf;

ALTER TABLE unf DROP CompanyName;
ALTER TABLE unf DROP CompanyCountry;

-- -----------------------------------------------
-- Table 2: service
-- -----------------------------------------------
CREATE TABLE service (
    ServiceID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(50) NOT NULL,
    ServiceCategory VARCHAR(30),
    ServiceWebsite VARCHAR(80),
    CompanyID INT NOT NULL,
    UNIQUE (ServiceName),
    FOREIGN KEY (CompanyID) REFERENCES company(CompanyID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO service (ServiceName, ServiceCategory, ServiceWebsite, CompanyID)
SELECT DISTINCT u.ServiceName, u.ServiceCategory, u.ServiceWebsite, u.CompanyID
FROM unf u;

ALTER TABLE unf DROP ServiceCategory;
ALTER TABLE unf DROP ServiceWebsite;
ALTER TABLE unf DROP CompanyID;

-- -----------------------------------------------
-- Table 3: plan (no ServiceID — bundling handled by plan_service)
-- -----------------------------------------------
CREATE TABLE plan (
    PlanID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PlanName VARCHAR(50) NOT NULL,
    PlanTier VARCHAR(20),
    MonthlyPrice DECIMAL(6,2),
    AnnualDiscount INT,
    MaxUsers INT,
    StorageLimit VARCHAR(20),
    SupportLevel VARCHAR(30),
    MaxProjects INT,
    UNIQUE (PlanName)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO plan (PlanName, PlanTier, MonthlyPrice, AnnualDiscount, MaxUsers, StorageLimit, SupportLevel, MaxProjects)
SELECT DISTINCT u.PlanName, u.PlanTier, u.MonthlyPrice, u.AnnualDiscount, u.MaxUsers, u.StorageLimit, u.SupportLevel, u.MaxProjects
FROM unf u;

ALTER TABLE unf DROP PlanTier;
ALTER TABLE unf DROP MonthlyPrice;
ALTER TABLE unf DROP AnnualDiscount;
ALTER TABLE unf DROP MaxUsers;
ALTER TABLE unf DROP StorageLimit;
ALTER TABLE unf DROP SupportLevel;
ALTER TABLE unf DROP MaxProjects;

-- -----------------------------------------------
-- Table 4: plan_service (NEW — M:N for bundling)
-- A plan can bundle multiple services
-- -----------------------------------------------
CREATE TABLE plan_service (
    PlanID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (PlanID, ServiceID),
    FOREIGN KEY (PlanID) REFERENCES plan(PlanID),
    FOREIGN KEY (ServiceID) REFERENCES service(ServiceID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Populate from UNF: each plan currently maps to one service
INSERT INTO plan_service (PlanID, ServiceID)
SELECT DISTINCT p.PlanID, s.ServiceID
FROM unf u
JOIN plan p ON u.PlanName = p.PlanName
JOIN service s ON u.ServiceName = s.ServiceName;

ALTER TABLE unf DROP ServiceName;

-- -----------------------------------------------
-- Table 5: feature
-- -----------------------------------------------
CREATE TABLE feature (
    FeatureID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FeatureName VARCHAR(30) NOT NULL,
    UNIQUE (FeatureName)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO feature (FeatureName) VALUES
('API Access'),
('Priority Support'),
('Custom Branding'),
('Advanced Analytics'),
('Collaboration Tools'),
('Offline Access');

-- -----------------------------------------------
-- Table 6: plan_feature (M:N: Plan <-> Feature)
-- Using subqueries for FeatureID (no hardcoded values)
-- -----------------------------------------------
CREATE TABLE plan_feature (
    PlanID INT NOT NULL,
    FeatureID INT NOT NULL,
    PRIMARY KEY (PlanID, FeatureID),
    FOREIGN KEY (PlanID) REFERENCES plan(PlanID),
    FOREIGN KEY (FeatureID) REFERENCES feature(FeatureID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'API Access')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.APIAccess = 'Yes';

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'Priority Support')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.PrioritySupport = 'Yes';

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'Custom Branding')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.CustomBranding = 'Yes';

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'Advanced Analytics')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.AdvancedAnalytics = 'Yes';

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'Collaboration Tools')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.CollaborationTools = 'Yes';

INSERT INTO plan_feature (PlanID, FeatureID)
SELECT DISTINCT p.PlanID, (SELECT FeatureID FROM feature WHERE FeatureName = 'Offline Access')
FROM unf u JOIN plan p ON u.PlanName = p.PlanName WHERE u.OfflineAccess = 'Yes';

ALTER TABLE unf DROP APIAccess;
ALTER TABLE unf DROP PrioritySupport;
ALTER TABLE unf DROP CustomBranding;
ALTER TABLE unf DROP AdvancedAnalytics;
ALTER TABLE unf DROP CollaborationTools;
ALTER TABLE unf DROP OfflineAccess;

-- -----------------------------------------------
-- Table 7: user
-- -----------------------------------------------
CREATE TABLE `user` (
    UserID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(30) NOT NULL,
    UserEmail VARCHAR(60),
    UserPhone VARCHAR(20),
    UserCountry VARCHAR(30),
    UNIQUE (UserName)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `user` (UserName, UserEmail, UserPhone, UserCountry)
SELECT DISTINCT UserName, UserEmail, UserPhone, UserCountry
FROM unf;

ALTER TABLE unf DROP UserEmail;
ALTER TABLE unf DROP UserPhone;
ALTER TABLE unf DROP UserCountry;

-- -----------------------------------------------
-- Table 8: payment_method (NEW — for storing credit cards)
-- -----------------------------------------------
CREATE TABLE payment_method (
    PaymentMethodID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    CardType VARCHAR(20),
    CardNumber VARCHAR(20),
    CardHolderName VARCHAR(60),
    ExpiryDate DATE,
    FOREIGN KEY (UserID) REFERENCES `user`(UserID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Sample credit card data for users
INSERT INTO payment_method (UserID, CardType, CardNumber, CardHolderName, ExpiryDate) VALUES
((SELECT UserID FROM `user` WHERE UserName = 'omerk'), 'Visa', '****-****-****-1234', 'Omer K', '2027-06-01'),
((SELECT UserID FROM `user` WHERE UserName = 'ayse_d'), 'Mastercard', '****-****-****-5678', 'Ayse D', '2028-03-01'),
((SELECT UserID FROM `user` WHERE UserName = 'john_s'), 'Visa', '****-****-****-9012', 'John S', '2027-12-01'),
((SELECT UserID FROM `user` WHERE UserName = 'john_s'), 'Mastercard', '****-****-****-3456', 'John S', '2028-09-01'),
((SELECT UserID FROM `user` WHERE UserName = 'elena_r'), 'Visa', '****-****-****-7890', 'Elena R', '2027-08-01'),
((SELECT UserID FROM `user` WHERE UserName = 'mehmet_y'), 'Mastercard', '****-****-****-2345', 'Mehmet Y', '2028-01-01'),
((SELECT UserID FROM `user` WHERE UserName = 'burak_t'), 'Visa', '****-****-****-6789', 'Burak T', '2027-11-01'),
((SELECT UserID FROM `user` WHERE UserName = 'zeynep_k'), 'Visa', '****-****-****-0123', 'Zeynep K', '2028-05-01'),
((SELECT UserID FROM `user` WHERE UserName = 'ali_c'), 'Mastercard', '****-****-****-4567', 'Ali C', '2027-10-01'),
((SELECT UserID FROM `user` WHERE UserName = 'sarah_m'), 'Visa', '****-****-****-8901', 'Sarah M', '2028-07-01');

-- -----------------------------------------------
-- Table 9: subscription
-- -----------------------------------------------
CREATE TABLE subscription (
    SubscriptionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PlanID INT NOT NULL,
    SubscriptionStartDate DATE,
    SubscriptionStatus VARCHAR(20),
    BillingCycle VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES `user`(UserID),
    FOREIGN KEY (PlanID) REFERENCES plan(PlanID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO subscription (UserID, PlanID, SubscriptionStartDate, SubscriptionStatus, BillingCycle)
SELECT DISTINCT us.UserID, p.PlanID, u.SubscriptionStartDate, u.SubscriptionStatus, u.BillingCycle
FROM unf u
JOIN `user` us ON u.UserName = us.UserName
JOIN plan p ON u.PlanName = p.PlanName;

ALTER TABLE unf DROP SubscriptionStartDate;
ALTER TABLE unf DROP SubscriptionStatus;
ALTER TABLE unf DROP BillingCycle;

-- -----------------------------------------------
-- Table 10: payment
-- -----------------------------------------------
CREATE TABLE payment (
    PaymentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubscriptionID INT NOT NULL,
    PaymentDate DATE,
    PaymentAmount DECIMAL(6,2),
    PaymentMethodID INT,
    PaymentStatus VARCHAR(20),
    AutoRenew VARCHAR(5),
    FOREIGN KEY (SubscriptionID) REFERENCES subscription(SubscriptionID),
    FOREIGN KEY (PaymentMethodID) REFERENCES payment_method(PaymentMethodID)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO payment (SubscriptionID, PaymentDate, PaymentAmount, PaymentStatus, AutoRenew)
SELECT s.SubscriptionID, u.PaymentDate, u.PaymentAmount, u.PaymentStatus, u.AutoRenew
FROM unf u
JOIN `user` us ON u.UserName = us.UserName
JOIN plan p ON u.PlanName = p.PlanName
JOIN subscription s ON s.UserID = us.UserID AND s.PlanID = p.PlanID;

-- Link payments to credit cards where PaymentMethod was 'Credit Card'
UPDATE payment pay
JOIN subscription sub ON pay.SubscriptionID = sub.SubscriptionID
JOIN `user` u ON sub.UserID = u.UserID
JOIN payment_method pm ON pm.UserID = u.UserID
SET pay.PaymentMethodID = pm.PaymentMethodID
WHERE pay.PaymentMethodID IS NULL
AND pm.PaymentMethodID = (SELECT MIN(PaymentMethodID) FROM payment_method WHERE UserID = u.UserID);

-- The UNF table now only has the linking columns left
-- (PlanName, UserName, PaymentDate) which is essentially the payment record key


-- ============================================================
-- DELIVERABLE 4: Confirmation View
-- ============================================================

CREATE VIEW confirmation_view AS
SELECT 
    sv.ServiceName,
    sv.ServiceCategory,
    sv.ServiceWebsite,
    c.CompanyID,
    c.CompanyName,
    c.CompanyCountry,
    p.PlanName,
    p.PlanTier,
    p.MonthlyPrice,
    p.AnnualDiscount,
    p.MaxUsers,
    p.StorageLimit,
    p.SupportLevel,
    CASE WHEN pf_api.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS APIAccess,
    CASE WHEN pf_pri.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS PrioritySupport,
    CASE WHEN pf_brand.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS CustomBranding,
    CASE WHEN pf_analytics.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS AdvancedAnalytics,
    CASE WHEN pf_collab.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS CollaborationTools,
    CASE WHEN pf_offline.FeatureID IS NOT NULL THEN 'Yes' ELSE 'No' END AS OfflineAccess,
    p.MaxProjects,
    u.UserName,
    u.UserEmail,
    u.UserPhone,
    u.UserCountry,
    sub.SubscriptionStartDate,
    sub.SubscriptionStatus,
    sub.BillingCycle,
    pay.AutoRenew,
    pay.PaymentDate,
    pay.PaymentAmount,
    COALESCE(pm.CardType, 'Other') AS PaymentMethod,
    pay.PaymentStatus
FROM payment pay
JOIN subscription sub ON pay.SubscriptionID = sub.SubscriptionID
JOIN `user` u ON sub.UserID = u.UserID
JOIN plan p ON sub.PlanID = p.PlanID
JOIN plan_service ps ON p.PlanID = ps.PlanID
JOIN service sv ON ps.ServiceID = sv.ServiceID
JOIN company c ON sv.CompanyID = c.CompanyID
LEFT JOIN payment_method pm ON pay.PaymentMethodID = pm.PaymentMethodID
LEFT JOIN plan_feature pf_api ON p.PlanID = pf_api.PlanID AND pf_api.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'API Access')
LEFT JOIN plan_feature pf_pri ON p.PlanID = pf_pri.PlanID AND pf_pri.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'Priority Support')
LEFT JOIN plan_feature pf_brand ON p.PlanID = pf_brand.PlanID AND pf_brand.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'Custom Branding')
LEFT JOIN plan_feature pf_analytics ON p.PlanID = pf_analytics.PlanID AND pf_analytics.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'Advanced Analytics')
LEFT JOIN plan_feature pf_collab ON p.PlanID = pf_collab.PlanID AND pf_collab.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'Collaboration Tools')
LEFT JOIN plan_feature pf_offline ON p.PlanID = pf_offline.PlanID AND pf_offline.FeatureID = (SELECT FeatureID FROM feature WHERE FeatureName = 'Offline Access')
ORDER BY sv.ServiceName, p.PlanName, u.UserName, pay.PaymentDate;


-- ============================================================
-- CUSTOMER REQUESTED UI QUERIES
-- ============================================================

-- -----------------------------------------------
-- Query 1: List all users who have subscribed to a 
--          plan that has a certain feature
--          (Example: 'API Access')
-- -----------------------------------------------
SELECT DISTINCT u.UserID, u.UserName, u.UserEmail, p.PlanName, f.FeatureName
FROM `user` u
JOIN subscription sub ON u.UserID = sub.UserID
JOIN plan p ON sub.PlanID = p.PlanID
JOIN plan_feature pf ON p.PlanID = pf.PlanID
JOIN feature f ON pf.FeatureID = f.FeatureID
WHERE f.FeatureName = 'API Access'
ORDER BY u.UserName;

-- -----------------------------------------------
-- Query 2: Show the different services and for each,
--          the maximum, minimum and average price
-- -----------------------------------------------
SELECT 
    sv.ServiceName,
    MAX(p.MonthlyPrice) AS MaxPrice,
    MIN(p.MonthlyPrice) AS MinPrice,
    ROUND(AVG(p.MonthlyPrice), 2) AS AvgPrice
FROM service sv
JOIN plan_service ps ON sv.ServiceID = ps.ServiceID
JOIN plan p ON ps.PlanID = p.PlanID
GROUP BY sv.ServiceName
ORDER BY sv.ServiceName;

-- -----------------------------------------------
-- Query 3: Change the monthly price for a plan
--          (Example: ChatGPT Plus from 20.00 to 22.00)
-- -----------------------------------------------
UPDATE plan
SET MonthlyPrice = 22.00
WHERE PlanName = 'ChatGPT Plus';

-- -----------------------------------------------
-- Query 4: Add a new credit card for a customer
--          (Example: adding a new Visa card for omerk)
-- -----------------------------------------------
INSERT INTO payment_method (UserID, CardType, CardNumber, CardHolderName, ExpiryDate)
VALUES (
    (SELECT UserID FROM `user` WHERE UserName = 'omerk'),
    'Mastercard',
    '****-****-****-9999',
    'Omer K',
    '2029-01-01'
);

-- -----------------------------------------------
-- Query 5: Remove a service for a company and all 
--          plans in which it appears
--          (Example: removing 'Canva' service)
-- -----------------------------------------------
-- First, delete payments for subscriptions of Canva plans
DELETE pay FROM payment pay
JOIN subscription sub ON pay.SubscriptionID = sub.SubscriptionID
JOIN plan p ON sub.PlanID = p.PlanID
JOIN plan_service ps ON p.PlanID = ps.PlanID
JOIN service sv ON ps.ServiceID = sv.ServiceID
WHERE sv.ServiceName = 'Canva';

-- Second, delete subscriptions for Canva plans
DELETE sub FROM subscription sub
JOIN plan p ON sub.PlanID = p.PlanID
JOIN plan_service ps ON p.PlanID = ps.PlanID
JOIN service sv ON ps.ServiceID = sv.ServiceID
WHERE sv.ServiceName = 'Canva';

-- Third, delete plan_feature entries for Canva plans
DELETE pf FROM plan_feature pf
JOIN plan p ON pf.PlanID = p.PlanID
JOIN plan_service ps ON p.PlanID = ps.PlanID
JOIN service sv ON ps.ServiceID = sv.ServiceID
WHERE sv.ServiceName = 'Canva';

-- Fourth, delete plan_service entries for Canva
DELETE ps FROM plan_service ps
JOIN service sv ON ps.ServiceID = sv.ServiceID
WHERE sv.ServiceName = 'Canva';

-- Fifth, delete the plans that were linked to Canva
DELETE p FROM plan p
WHERE p.PlanID NOT IN (SELECT PlanID FROM plan_service);

-- Finally, delete the Canva service itself
DELETE FROM service WHERE ServiceName = 'Canva';

-- ============================================================
-- END OF ASSIGNMENT 2 SQL
-- ============================================================
