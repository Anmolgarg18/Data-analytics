use ola
select * from bookings


-- 1 reterive all successfull bookings also create view
create view successful_bookings AS
select * from bookings where Booking_Status ='success'

-- 2 fetch the average ride distance each vehicle type over all booking(cancel,success)
create view avg_ride_distance As
select Vehicle_Type,avg(Ride_Distance) from bookings group by Vehicle_Type

-- 3 count the total number of rides cancelled by customer
create view total_no_ride_cancel_customer As
select count(Booking_ID) from bookings where Canceled_Rides_by_Customer !="null"

-- 4 list the top 5 customers who booked the highest number of rides
create view top_five_customers As
select Customer_ID,count(Booking_ID) as total_booking from bookings group by Customer_ID order by total_booking desc LIMIT 5

-- 5 get the number of rides cancelled by the driver due to personal issue and car related issue
create view cancel_by_driver_personal_reason As
select count(Booking_ID) from bookings where Canceled_Rides_by_Driver ='Personal & Car related issue'

-- 6 find the min and max number of driver rating for prime_sedan
create view prime_sedan_max_min_ratings As
select max(Driver_Ratings) as Max_rating,min(Driver_Ratings) as Min_rating from bookings where Vehicle_Type="Prime Sedan"

-- 7 retrieve all the rides where payment mode is upi
create view rides_pay_UPI as
select * from bookings where Payment_Method="UPI"

-- 8 find avg customer rating per vehicle type
create view customer_rating_per_vehicle_type As
select Vehicle_Type,avg(Customer_Rating) as avg_rating from bookings group by Vehicle_Type

-- 9 calculate the total booking value of yhe successfully completed
create view total_value_booking As
select sum(Booking_Value) from bookings where Booking_Status="Success"

-- 10 mention all incomplete rides with their reason
create view all_incomplete_rides_reason
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides="Yes"