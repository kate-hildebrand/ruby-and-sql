# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

#create a salesperson and 2 contacts 
michael = Salesperson.find_by({"first_name" => "Michael"})
jeff_bezos = Contact.find_by({"last_name" => "Bezos"})
tim_cook = Contact.find_by({"last_name" => "Cook"})

# create a new activity
activity = Activity.new
activity["salesperson_id"] = michael["id"]
activity["contact_id"] = tim_cook["id"]
activity["note"] = "Cold outreach email"
activity.save

activity = Activity.new
activity["salesperson_id"] = michael["id"]
activity["contact_id"] = tim_cook["id"]
activity["note"] = "Invite to brunch"
activity.save

activity = Activity.new
activity["salesperson_id"] = michael["id"]
activity["contact_id"] = jeff_bezos ["id"]
activity["note"] = "Sponsor Michael's Kids"
activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

michaels_and_cooks_activities = Activity.where({"salesperson_id" => michael["id"],"contact_id" => tim_cook["id"]})

puts "Activities between Michael and Tim Cook:"
for activity in michaels_and_cooks_activities
    puts "- #{activity["note"]}"
end



# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
