import streamlit as st
from modules.nav import SideBarLinks
import requests
import datetime

SideBarLinks()

st.title("Search for flights")
st.write("Enter a flight number to search for a specific flight or enter in parameters to search for a flight")
st.write("If searching with parameters please specify a route and a date then the others are optional")
st.write("You cannot search for flights leaving today")

col1, col2 = st.columns([1, 2])

with col1:
    flight_number = st.text_input("Enter a flight number")
    date = st.date_input("Flight Date")

    try:
        response = requests.get("http://api:4000/z/all_airlines")
        if response.status_code == 200:
            airlines_data = response.json()
            airline_names = [airline['Name'] for airline in airlines_data]
        else:
            st.error("Failed to fetch airlines from the server.")
            airline_names = []
    except Exception as e:
        st.error(f"Error fetching airlines. Try again later {e}")
        airline_names = []

    airline = st.selectbox("Airline", ["Select an Airline"] + airline_names)
    price = st.text_input("Enter the price maximum")

    search_clicked = st.button("Search")

with col2:
    col3, col4 = st.columns(2)
    with col3:
        try:
            response = requests.get("http://api:4000/z/all_airports")
            if response.status_code == 200:
                airports_data = response.json()
                airport_codes = [airport['Code'] for airport in airports_data]
            else:
                st.error("Failed to fetch airports from the server.")
                airport_codes = []
        except Exception as e:
            st.error("Error fetching airports. Try again later")
            airport_codes = []

        departure_code = st.selectbox("From", ["Select an Airport"] + airport_codes)

    with col4:
        arrival_code = st.selectbox("To", ["Select an Airport"] + airport_codes)

    if search_clicked:
        if flight_number:
            try:
                response = requests.get(f"http://api:4000/flight_information/all_info/{flight_number}")
                
                if response.status_code == 200:
                    data = response.json()
                    if data:
                        st.success("Flight found:")
                        departure_datetime = data.get("DepartureDateTime", "")
                        formatted_datetime = (
                            datetime.datetime.fromisoformat(departure_datetime).strftime("%Y-%m-%d %H:%M")
                        )

                        st.header(f"Flight from {data.get('DepartureAirportCode', 'N/A')} to {data.get('ArrivalAirportCode', 'N/A')}")
                        st.write(f"**Airline:** {data.get('Name', 'N/A')}")
                        st.write(f"**Departure Date & Time:** {formatted_datetime}")
                        st.write(f"**Price:** ${data.get('Price', 'N/A')}")
                    else:
                        st.warning("No flight found with that number.")
                else:
                    st.error("Flight not found or server error.")
            except Exception as e:
                st.error("Error occurred")
        else:
            params = {
                "from": departure_code,
                "to": arrival_code
            }

            if date != datetime.date.today():
                params["date"] = date.strftime("%Y-%m-%d")
            
            if price:
                params["max_price"] = int(price)
            
            if airline != "Select an Airline":
                params["airline"] = airline

            response = requests.get("http://api:4000/f/search", params=params)

            if response.status_code == 200:
                flights = response.json()

                if flights:
                    allinfo = []
                    for flight in flights:
                        flight_num = flight.get("FlightNumber")
                        if flight_num:
                            detail_response = requests.get(f"http://api:4000/flight_information/all_info/{flight_num}")
                            if detail_response.status_code == 200:
                                allinfo.append(detail_response.json())

                    if allinfo:
                        st.success("Matching Flights:")
                        for flight_data in allinfo:
                            departure_datetime = flight_data.get("DepartureDateTime")
                            formatted_datetime = (
                                datetime.datetime.fromisoformat(departure_datetime).strftime("%Y-%m-%d %H:%M")
                            )

                            st.header(f"Flight from {flight_data.get('DepartureAirportCode')} to {flight_data.get('ArrivalAirportCode')}")
                            st.write(f"**Airline:** {flight_data.get('Name')}")
                            st.write(f"**Departure Date & Time:** {formatted_datetime}")
                            st.write(f"**Price:** ${flight_data.get('Price')}")
                    else:
                        st.warning("No detailed info found for flights.")
                else:
                    st.warning("No flights found for those filters.")
            else:
                st.error("Error fetching flights.")
