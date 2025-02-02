create Database ola;
use ola;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings As
SELECT * FROM bookiings
WHERE Booking_Status ='Success';

SELECT * FROM Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW Ride_Distance_For_Each_Vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
As avg_distance FROM bookiings 
GROUP BY Vehicle_Type;

SELECT * FROM Ride_Distance_For_Each_Vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW Cancelled_Rides As
SELECT COUNT(*) FROM bookiings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM Cancelled_Rides;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookiings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers; 

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Cancelled_by_Drivers_Due_To_P_C_related_Issues As
SELECT COUNT(*) AS cancelrs_rides
FROM bookiings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_Cancelled_by_Drivers_Due_To_P_C_related_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookiings Where Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW Payment_Was_Made_Using_UPI As
SELECT * FROM bookiings
WHERE 	Payment_Method ='UPI';
	
SELECT * FROM Payment_Was_Made_Using_UPI;

#8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Cust_Rating_Per_Vehicle_Type As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookiings
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Cust_Rating_Per_Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value As
SELECT SUM(Booking_Value) As total_successful_ride_value
FROM bookiings
WHERE Booking_Status = 'Successful';

SELECT * FROM total_successful_ride_value;

#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides
FROM bookiings
WHERE Incomplete_Rides =' Yes';

SELECT * FROM Incomplete_Rides_Reason;