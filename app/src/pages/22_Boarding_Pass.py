import streamlit as st
import requests
from modules.nav import SideBarLinks

SideBarLinks()

if 'successful_execution' not in st.session_state:
    st.session_state['successful_execution'] = False
  
st.write("# Get boarding pass")

with st.form("add_change_form"):
  st.write("Please enter all fields")
  passengerID = st.text_input("Passenger ID")
  flightID = st.text_input("Flight ID")
  seatID = st.text_input("Seat Number")

  submitted = st.form_submit_button("Submit")
  if submitted: 
    if not passengerID.isdigit():
      st.warning("Please enter a valid numeric Passenger ID.")
    else:
      passenger_id = int(passengerID)

    if not flightID.isdigit():
      st.warning("Please enter a valid numeric Flight ID.")
    else:
      flight_id = int(flightID)
  
    if not seatID.isdigit():
      st.warning("Please enter a valid numeric Seat Number.")
    else:
      seat_id = int(seatID)
    

    try:
      response = requests.get(f"http://api:4000/pm/boarding_pass/{passenger_id}/{flight_id}/{seat_id}")

      if response.status_code == 200:
        data = response.json()
      
        st.write('Flight ID: ', data[0]['FlightNumber'])
        st.write('Seat Number:', data[0]['SeatNumber'])
        st.write( 'Departure Time: ', data[0]['DepartureTime'])
        st.write('Arrival Time: ', data[0]['ArrivalTime'])

        st.write('#### View boarding pass here:')
        st.link_button(data[0]['BoardingPass'], data[0]['BoardingPass'])
              
        st.session_state['flight_id'] = flight_id
        st.session_state['seat_id'] = seat_id
        st.session_state['class_name'] = data[0]['Class']
        st.session_state['successful_execution'] = True

      else:
        st.warning("Booking not found, please check flight ID or seat number")
    except Exception as e:
      st.error("Error connecting. Try again later")
 


if st.session_state['successful_execution'] == True:
  with st.form("seat_change_form"): 
    flight_id = st.session_state['flight_id']
    seat_id = st.session_state['seat_id']
    class_original = st.session_state['class_name']

    st.write('You are in', class_original, 'class')
    
    class_name = st.text_input("Which class would you like to move to? (First, Premium Economy, Business, Economy)")

    submitted = st.form_submit_button("Submit")
    if submitted:
      check = True
      if class_name != "Economy" or class_name != "Premium Economy" or class_name != "Business" or class_name != "First":
        st.warning("Please enter a valid class name")
        check = False
      
      if check:
        if class_name == class_original:
          st.warning('You are already in that class!')
        else:
          try:
            response_seat_change = requests.put(f"http://api:4000/flight_information/seatChange/{seat_id}/{flight_id}/{class_name}")
                

            if response_seat_change.status_code == 200:
              st.success("Booking updated!")
            else:
              st.error("Booking not updated")
          except Exception as e:
            st.error("Error connecting. Try again later")
