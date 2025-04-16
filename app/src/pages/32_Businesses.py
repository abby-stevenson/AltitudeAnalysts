import requests
import streamlit as st
from modules.nav import SideBarLinks

SideBarLinks()

st.title("Airport Business Management")

st.subheader("View All Businesses")

airport_code = st.text_input("Enter Airport Code")

if airport_code:
    try:
        response = requests.get("http://api:4000/z/airport/businesses")
        if response.status_code == 200:
            data = response.json()
            businesses = [a for a in data if a["AirportCode"] == airport_code]

            if businesses:
                st.write(f"All Businesses at {airport_code} Airport:")
                for b in businesses:
                    st.write(f" ID: {b['Id']}, Name: {b['Name']}, Type: {b['Type']}, Status: {'Closed' if b['OpenOrClose'] == 0 else 'Open'}")
            else:
                st.warning("No business found for this airport.")
        else:
            st.error(f"Could not fetch business data. Status code: {response.status_code}, Message: {response.text}")
    except Exception as e:
        st.error(f"Unable to find airport business data. Error: {e}")
                

st.subheader("Add a New Business")

with st.form("add_business_form"):
    add_id = st.text_input("Business ID")
    add_name = st.text_input("Business Name")
    add_type = st.text_input("Business Type")
    add_submit = st.form_submit_button("Add Business")

    if add_submit:
        if add_id and add_name and add_type and airport_code:
            try:
                response = requests.post(
                    f"http://api:4000/z/airport/{airport_code}/add-business",
                    json={"Id": add_id, "Name": add_name, "Type": add_type}
                )
                if response.status_code == 200:
                    st.success("Business successfully added!")
                else:
                    st.error("Error. Could not add business.")
            except:
                st.error("Unable to add business. Please try again.")
        else:
            st.warning("Please fill in all fields.")

st.subheader("Delete a Business")

with st.form("delete_business_form"):
    business_id = st.text_input("Business ID")

    if st.form_submit_button("Delete Business"):
        if business_id and airport_code:
            try:
                response = requests.get(f"http://api:4000/z/airport/businesses")
                if response.status_code == 200:
                    all_businesses = response.json()
                    matched = [b for b in all_businesses if str(b["Id"]) == business_id and b["AirportCode"] == airport_code]

                    if not matched:
                        st.error("Business does not exist for the provided airport.")
                    elif matched[0]["OpenOrClose"] == 1:
                        st.warning("Business is still open. Cannot proceed with deletion.")
                    else:
                        delete_response = requests.delete(f"http://api:4000/z/airport/{business_id}/delete-business")
                        if delete_response.status_code == 200:
                            st.success("Business successfully deleted.")
                        else:
                            st.error("Unable to delete business.")
                else:
                    st.error("Could not fetch businesses.")
            except:
                st.error("Unable to delete business.")
        else:
            st.warning("Please enter both Business ID and Airport Code.")