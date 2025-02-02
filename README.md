# OLA-Data-Analysis-Project


## Project Overview

This project involves a comprehensive analysis of Ola ride data to extract meaningful insights and trends. The analysis is divided into two main sections:

SQL Analysis: Addressing specific queries to understand ride patterns, customer behavior, and operational metrics.
Power BI Visualization: Creating interactive dashboards to visualize key performance indicators and trends.

## SQL Analysis

The following SQL queries were executed to address specific business questions:

1. **Retrieve all successful bookings**:
   ```sql
   SELECT * FROM rides WHERE booking_status = 'Successful';
   ```
2. **Find the average ride distance for each vehicle type**:
   ```sql
   SELECT vehicle_type, AVG(ride_distance) AS average_distance
   FROM rides
   GROUP BY vehicle_type;
   ```
3. **Get the total number of cancelled rides by customers**:
   ```sql
   SELECT COUNT(*) AS customer_cancelled_rides
   FROM rides
   WHERE booking_status = 'Cancelled' AND cancelled_by = 'Customer';
   ```
4. **List the top 5 customers who booked the highest number of rides**:
   ```sql
   SELECT customer_id, COUNT(*) AS ride_count
   FROM rides
   GROUP BY customer_id
   ORDER BY ride_count DESC
   LIMIT 5;
   ```
5. **Get the number of rides cancelled by drivers due to personal and car-related issues**:
   ```sql
   SELECT COUNT(*) AS driver_cancelled_rides
   FROM rides
   WHERE booking_status = 'Cancelled' AND cancelled_by = 'Driver' AND (cancellation_reason = 'Personal' OR cancellation_reason = 'Car-related');
   ```
6. **Find the maximum and minimum driver ratings for Prime Sedan bookings**:
   ```sql
   SELECT MAX(driver_rating) AS max_rating, MIN(driver_rating) AS min_rating
   FROM rides
   WHERE vehicle_type = 'Prime Sedan';
   ```
7. **Retrieve all rides where payment was made using UPI**:
   ```sql
   SELECT * FROM rides WHERE payment_method = 'UPI';
   ```
8. **Find the average customer rating per vehicle type**:
   ```sql
   SELECT vehicle_type, AVG(customer_rating) AS average_rating
   FROM rides
   GROUP BY vehicle_type;
   ```
9. **Calculate the total booking value of rides completed successfully**:
   ```sql
   SELECT SUM(booking_value) AS total_successful_booking_value
   FROM rides
   WHERE booking_status = 'Successful';
   ```
10. **List all incomplete rides along with the reason**:
    ```sql
    SELECT * FROM rides WHERE booking_status = 'Incomplete';
    ```

## Power BI Analysis

The insights derived from the SQL analysis were visualized using Power BI dashboards to provide a comprehensive view of the data:

1. **Ride Volume Over Time**: A line chart displaying the number of rides over a specified period, highlighting trends and peak times.
2. **Booking Status Breakdown**: A pie chart showing the distribution of booking statuses (e.g., Successful, Cancelled, Incomplete).
3. **Top 5 Vehicle Types by Ride Distance**: A bar chart ranking vehicle types based on the total ride distance covered.
4. **Average Customer Ratings by Vehicle Type**: A bar chart illustrating the average customer ratings for each vehicle type.
5. **Cancelled Rides Reasons**: A bar chart categorizing the reasons for ride cancellations by both customers and drivers.
6. **Revenue by Payment Method**: A bar chart showing the total booking value segmented by different payment methods.
7. **Top 5 Customers by Total Booking Value**: A bar chart identifying the top customers based on their total spending.
8. **Ride Distance Distribution Per Day**: A box plot displaying the distribution of ride distances for each day of the week.
9. **Driver Ratings Distribution**: A histogram showing the distribution of driver ratings across all rides.
10. **Customer vs. Driver Ratings**: A scatter plot comparing customer and driver ratings to identify any correlations.

## Conclusion

This analysis provides valuable insights into Ola's operations, including ride volumes, customer preferences, cancellation patterns, and payment methods. The combination of SQL queries and Power BI visualizations offers a comprehensive understanding of the data, enabling informed decision-making to enhance service quality and customer satisfaction.

For a detailed view of the analysis and interactive dashboards, please refer to the associated Power BI report and SQL scripts in this repository. 
