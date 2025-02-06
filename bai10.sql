-- cau 2:
SELECT 
    CONCAT(p.FullName, ' (', YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth), ') - ', d.FullName) AS AppointmentInfo,
    a.AppointmentDate,
    mr.Diagnosis
FROM patients p
JOIN appointments a ON p.PatientID = a.PatientID
JOIN doctors d ON a.DoctorID = d.DoctorID
JOIN medicalrecords mr ON a.PatientID = mr.PatientID AND a.DoctorID = mr.DoctorID
ORDER BY a.AppointmentDate ASC;
-- cau 3:
SELECT 
    p.FullName AS PatientName,
    YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth) AS AgeAtAppointment,
    a.AppointmentDate,
    CASE 
        WHEN (YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth)) > 50 THEN 'Nguy cơ cao'
        WHEN (YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth)) BETWEEN 30 AND 50 THEN 'Nguy cơ trung bình'
        ELSE 'Nguy cơ thấp'
    END AS RiskLevel
FROM patients p
JOIN appointments a ON p.PatientID = a.PatientID
ORDER BY a.AppointmentDate ASC;
-- cau 4:
-- xoa du lieu
DELETE a
FROM appointments a
JOIN patients p ON a.PatientID = p.PatientID
JOIN doctors d ON a.DoctorID = d.DoctorID
WHERE (YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth)) > 30
AND d.Specialization IN ('Noi Tong Quat', 'Chan Thuong Chinh Hinh');
-- hien thi danh sach
SELECT 
    p.FullName AS PatientName,
    d.Specialization,
    YEAR(a.AppointmentDate) - YEAR(p.DateOfBirth) AS AgeAtAppointment
FROM patients p
JOIN appointments a ON p.PatientID = a.PatientID
JOIN doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate ASC;

