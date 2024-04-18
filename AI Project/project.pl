/* Facts about medical facilities */
hospital('Hospital A', 'New York', 50, 20).
hospital('Hospital B', 'Los Angeles', 70, 30).
hospital('Hospital C', 'Chicago', 60, 25).
hospital('Hospital D', 'Houston', 80, 40).
hospital('Hospital E', 'Miami', 60, 15).
hospital('Hospital F', 'San Francisco', 90, 45).
hospital('Hospital G', 'Seattle', 65, 20).
hospital('Hospital H', 'Boston', 55, 25).
hospital('Hospital I', 'Atlanta', 75, 35).
hospital('Hospital J', 'Dallas', 70, 30).

/* Facts about medical specialties */
specialty('Cardiology').
specialty('Neurology').
specialty('Orthopedics').
specialty('Pediatrics').
specialty('Oncology').
specialty('Dermatology').
specialty('Gynecology').
specialty('Urology').
specialty('Ophthalmology').
specialty('Psychiatry').

/* Facts about doctors */
doctor('Dr. Smith', 'Hospital A', 'Cardiology').
doctor('Dr. Johnson', 'Hospital B', 'Neurology').
doctor('Dr. Williams', 'Hospital C', 'Orthopedics').
doctor('Dr. Brown', 'Hospital D', 'Pediatrics').
doctor('Dr. Martinez', 'Hospital E', 'Oncology').
doctor('Dr. Miller', 'Hospital F', 'Dermatology').
doctor('Dr. Lee', 'Hospital G', 'Gynecology').
doctor('Dr. Patel', 'Hospital H', 'Urology').
doctor('Dr. Nguyen', 'Hospital I', 'Ophthalmology').
doctor('Dr. Garcia', 'Hospital J', 'Psychiatry').

/* Rules for finding hospitals by specialty */
find_hospital_by_specialty(Specialty, Hospital, City, BedsAvailable, DoctorsAvailable) :-
    doctor(Doctor, Hospital, Specialty),
    hospital(Hospital, City, BedsTotal, BedsOccupied),
    BedsAvailable is BedsTotal - BedsOccupied,
    findall(Doctor, doctor(Doctor, Hospital, Specialty), Doctors),
    length(Doctors, DoctorsAvailable).

/* Example usage */
?- find_hospital_by_specialty('Dermatology', Hospital, City, BedsAvailable, DoctorsAvailable).
