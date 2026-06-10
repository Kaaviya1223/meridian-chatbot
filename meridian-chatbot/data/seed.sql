CREATE TABLE programmes (
    id INTEGER PRIMARY KEY,
    name TEXT,
    level TEXT,
    duration TEXT,
    fees_per_sem REAL,
    intake TEXT,
    min_requirement TEXT
);

CREATE TABLE applicants (
    ref_no TEXT PRIMARY KEY,
    name TEXT,
    programme TEXT,
    status TEXT,
    payment_status TEXT,
    intake TEXT
);

INSERT INTO programmes VALUES
(1, 'Bachelor of Computer Science', 'Degree', '3 years', 8500, 'February, July', 'SPM 5 credits including Maths'),
(2, 'Bachelor of Software Engineering', 'Degree', '3 years', 8500, 'February, July', 'SPM 5 credits including Maths'),
(3, 'Bachelor of Information Technology', 'Degree', '3 years', 8000, 'February, July', 'SPM 5 credits'),
(4, 'Bachelor of Business Administration', 'Degree', '3 years', 7500, 'February, July', 'SPM 5 credits'),
(5, 'Bachelor of Accounting', 'Degree', '3 years', 7500, 'February, July', 'SPM 5 credits including Maths'),
(6, 'Bachelor of Marketing', 'Degree', '3 years', 7500, 'February, July', 'SPM 5 credits'),
(7, 'Bachelor of Psychology', 'Degree', '3 years', 8000, 'February, July', 'SPM 5 credits'),
(8, 'Bachelor of Mass Communication', 'Degree', '3 years', 7800, 'February, July', 'SPM 5 credits'),
(9, 'Diploma in Computer Science', 'Diploma', '2.5 years', 5500, 'February, July, October', 'SPM 3 credits'),
(10, 'Diploma in Business Studies', 'Diploma', '2.5 years', 5000, 'February, July, October', 'SPM 3 credits'),
(11, 'Diploma in Accounting', 'Diploma', '2.5 years', 5000, 'February, July, October', 'SPM 3 credits including Maths'),
(12, 'Foundation in Science', 'Foundation', '1 year', 4500, 'February, July', 'SPM 5 credits including Science and Maths'),
(13, 'Foundation in Arts', 'Foundation', '1 year', 4200, 'February, July', 'SPM 5 credits'),
(14, 'Pre-University Programme', 'Pre-U', '1.5 years', 4000, 'February, July, October', 'SPM 3 credits');

INSERT INTO applicants VALUES
('MUM2601', 'Ahmad Fariz bin Zulkifli', 'Bachelor of Computer Science', 'Accepted', 'Paid', 'July 2026'),
('MUM2602', 'Priya Nadarajan', 'Bachelor of Psychology', 'Pending Review', 'Unpaid', 'July 2026'),
('MUM2603', 'Lim Wei Jian', 'Diploma in Computer Science', 'Accepted', 'Paid', 'July 2026'),
('MUM2604', 'Nurul Aisyah binti Razali', 'Foundation in Science', 'Conditional Offer', 'Unpaid', 'July 2026'),
('MUM2605', 'Kevin Raj Selvam', 'Bachelor of Software Engineering', 'Accepted', 'Paid', 'July 2026'),
('MUM2606', 'Tan Shu Ying', 'Bachelor of Accounting', 'Pending Documents', 'Unpaid', 'February 2027'),
('MUM2607', 'Muhammad Haziq bin Roslan', 'Bachelor of Business Administration', 'Accepted', 'Paid', 'July 2026'),
('MUM2608', 'Lavanya Krishnan', 'Diploma in Business Studies', 'Under Review', 'Unpaid', 'July 2026'),
('MUM2609', 'Chong Zhi Hao', 'Bachelor of Mass Communication', 'Accepted', 'Paid', 'July 2026'),
('MUM2610', 'Siti Hajar binti Othman', 'Foundation in Arts', 'Conditional Offer', 'Unpaid', 'July 2026'),
('MUM2611', 'Arjun Pillai', 'Bachelor of Marketing', 'Pending Review', 'Unpaid', 'February 2027'),
('MUM2612', 'Wong Mei Ling', 'Bachelor of Information Technology', 'Accepted', 'Paid', 'July 2026'),
('MUM2613', 'Izzatul Husna binti Hamid', 'Pre-University Programme', 'Accepted', 'Paid', 'July 2026'),
('MUM2614', 'Darren Loke Jun Hao', 'Diploma in Accounting', 'Pending Documents', 'Unpaid', 'February 2027'),
('MUM2615', 'Kavitha Subramaniam', 'Bachelor of Computer Science', 'Under Review', 'Unpaid', 'July 2026');