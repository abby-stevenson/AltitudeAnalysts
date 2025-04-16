# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home")
    ##icon="🏠"


def AboutPageNav():
    st.sidebar.page_link("pages/40_About.py", label="About")
    ##icon="🧠"


#### ------------------------ Travel Agent Role ------------------------
def TravelAgentHome():
    st.sidebar.page_link(
        "pages/00_Travel_Agent_Home.py", label="Travel Agent Home")
    ##icon="👤"


def SearchForFlights():
    st.sidebar.page_link(
        "pages/01_Travel_Agent_Search_Flights.py", label="Search for Flights")
    ##icon="🏦"


def AddPassenger():
    st.sidebar.page_link("pages/03_Add_Passenger.py", label="Add Passenger")

def CustomerFlights():
    st.sidebar.page_link("pages/04_Customer_Flights.py", label="View Flights Customers Have Been Booked Onto")



## ------------------------ Airline Manager Role ------------------------
def AirlineManagerHome():
    st.sidebar.page_link(
        "pages/10_Airline_Manager.py", label="Airline Manager Home")

def FlightStats():
    st.sidebar.page_link("pages/11_Flight_Stats.py", label="Your Airlines Flight Statistics")


def AddFlights():
    st.sidebar.page_link("pages/12_Add_Flights.py", label="Add Flights")


def RemoveFlights():
    st.sidebar.page_link("pages/13_Remove_Flights.py", label="Remove Flights")


#### ------------------------ Passenger Role ------------------------
def PassengerHome():
    st.sidebar.page_link("pages/20_Passenger_Home.py", label="Passenger Home")

def FlightStatus():
    st.sidebar.page_link("pages/21_Flight_Status.py", label="See Status and Airport Metrics For Your Flight")
    
def BoardingPass():
    st.sidebar.page_link("pages/22_Boarding_Pass.py", label="Access Boarding Pass and Change Class")

def BookedFlights():
    st.sidebar.page_link("pages/23_Booked_Flights.py", label="See All Your Booked Flights")


#### ------------------------ Airport Manager Role ------------------------
def AirportManagerHome():
    st.sidebar.page_link("pages/30_Airport_Manager.py", label="Airport Manager Home")

def FlightStatsTerminal():
    st.sidebar.page_link("pages/31_Flight_Stats_Terminal.py", label="See All The Flights Departing From A Specific Terminal")
    
def Businesses():
    st.sidebar.page_link("pages/32_Businesses.py", label="Manage Businesses Operating in Your Airport")

def MonitorFlights():
    st.sidebar.page_link("pages/33_Monitor_Flights.py", label="Monitor and Update Flight Information")


# --------------------------------Links Function -----------------------------------------------
def SideBarLinks(show_home=False):
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/logo.png", width=500)

    # If there is no logged in user, redirect to the Home (Landing) page
    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
        st.switch_page("Home.py")

    if show_home or not (st.session_state["authenticated"]):
        # Show the Home page link (the landing page)
        #Shows the home button if about is clicked striaght from the home page 
        HomeNav()

    # Show the other page navigators depending on the users' role.
    if st.session_state["authenticated"]:

        # Show World Bank Link and Map Demo Link if the user is a political strategy advisor role.
        if st.session_state["role"] == "Travel_Agent":
            TravelAgentHome()
            SearchForFlights()
            AddPassenger()
            CustomerFlights()

        # If the user role is usaid worker, show the Api Testing page
        if st.session_state["role"] == "Airline_Manager":
            AirlineManagerHome()
            FlightStats()
            AddFlights()
            RemoveFlights()

        # If the user is an administrator, give them access to the administrator pages
        if st.session_state["role"] == "Passenger":
            PassengerHome()
            FlightStatus()
            BoardingPass()
            BookedFlights()

        if st.session_state["role"] == "Airport_Manager":
            AirportManagerHome()
            FlightStatsTerminal()
            Businesses()
            MonitorFlights()


    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")

    