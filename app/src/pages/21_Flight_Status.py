import requests
import streamlit as st
from modules.nav import SideBarLinks

SideBarLinks()

st.title("Passenger Dashboard")

passenger_id = st.text_input("Enter Passenger ID:")

if passenger_id and not passenger_id.isdigit():
    st.warning("Please enter a valid passenger ID.")

elif passenger_id:
    try:
        data = requests.get(f"http://api:4000/pm/flight_information/{passenger_id}").json()
        
        if data:
            st.subheader("Booked Flights")
            display = []
            mapping = {}

            for flight in data:
                num = flight.get("FlightNumber")
                info = f"Flight {num} from {flight.get('DepartureAirportCode')} to {flight.get('ArrivalAirportCode')} on {flight.get('DepartureDate')}"
                display.append(info)
                mapping[info] = num
        
        selected_flight = st.selectbox("Select a flight to view metrics:", display)
        selected_num = mapping[selected_flight]

        if st.button("See status for selected flight."):
            try:
                data = requests.get(f"http://api:4000/pm/flight_statuses/{selected_num}").json()

                if data:
                    flight_info = data[0]
                    flight_num = flight_info.get("FlightNumber")
                    status = next((k for k, v in flight_info.items() if k != "FlightNumber" and v == 1))
                    st.write(f"Flight {flight_num}: {status}")
                else:
                    st.warning("Flight status not available for selected flight.")
            except:
                st.error(f"Unable to retrieve flight status. Please try again.")
            
        if st.button("See airport metrics for selected flight."):
            try:
                data = requests.get(f"http://api:4000/z/flights/{selected_num}/airport-metrics").json()

                if data:
                    airport_data = data[0]
                    disrupted = "Disrupted" if airport_data.get("Disrupted") == 1 else "Normal Operations"
                    st.write(f"Airport: {airport_data.get('Code')} | Status: {disrupted} | Security Wait Time: {airport_data.get('SecurityWaitTime')} minutes")
                else:
                    st.warning("Airport metrics not available for selected flight.")
    
            except:
                st.error(f"Unable to retrieve airport metrics. Please try again.")
    
    except:
        st.error("Unable to fetch flight information. Please try again.")