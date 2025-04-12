import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# All Your Booked Flights")
passenger_id_input = st.text_input("Enter Passenger ID:")

if st.button("Get Booked Flights"):
    if not passenger_id_input.isdigit():
        st.warning("Please enter a valid numeric Passenger ID.")
    else:
        passenger_id = int(passenger_id_input)
    try:
        response = requests.get(f"http://api:4000/pm/flight_numbers/{passenger_id}")

        if response.status_code == 200:
            data = response.json()
            if data:
                flight_numbers = [item['FlightNumber'] for item in data]
                st.header(f"Passenger {passenger_id} has booked the following flights:")
                for number in flight_numbers:
                    st.write(f"Flight Number: {number}")
                
                    try:
                        response2 = requests.get(f"http://api:4000/flight_information/flight_route/{number}")
                        if response2.status_code == 200:
                            flight_route = response2.json()
                            
                            if flight_route:
                                arrival_airport = flight_route[0].get("ArrivalAirportCode")
                                departure_airport = flight_route[0].get("DepartureAirportCode")
                                st.write(f"  - Departure Airport: {departure_airport}")
                                st.write(f"  - Arrival Airport: {arrival_airport}")
                            else:
                                st.write("  - Flight route details not available.")
                        else:
                            st.error(f"Failed to fetch flight route for Flight {number}.")
                    except Exception as e:
                        st.error("Unable to find flight route. Try Again")

            else:
                st.warning("No booked flights found for this passenger.")
        else:
            st.error("Failed to fetch data.")
    except Exception as e:
        st.error("Unable to find flights. Try Again")

