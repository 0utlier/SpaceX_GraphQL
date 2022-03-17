# SpaceXLaunches [WithIn3TakeHome]

## Information
XCODE VERSION: 12.4
ENGINEER: JD Leonard
PROJECT: iOS Developer: Code Assessment

## Description

SpaceXLaunches' downloads data from a GraphQL database [https://api.spacex.land/graphql/], displaying the specific details when the given launch is selected. If the filter option is selected, the table contents are reordered in specified fashion (i.e. sort by name, filter by year). The button that specifies the current filter works as a reset button, and the order button helps to swap between ascending and descending order.

ViewController.swift maintains the opening calls to ensure data is produced, so that the Table can present proper information and details. It provides the delegate and data source.

FilterViewController.m maintains the control of the filter options available to the user 
and provides the delegate and data source of both the NSTableView and the QLPreviewPanel Class.

DAO.m is the Data Access Object, which is accessible to all other files in a singleton form, ensuring the same object is handed around, obtaining the same values for properties.

Schema.json, API.swift, and Query.graphql files are all as per Apollo, which was used to download and parse the information form GraphQL 

## Future Updates and Improvements
Icon for Application
More options to filter on
Adding images. Holding images to download
Preferences for specific details on tableview row
Adjusting of row height
Option to type year range, or specific strings to search for in details, name or other options
Option to type amount of rows desired

## Runtime

Once the download is complete, observe how the standard communication of "Loading..." is in place to protext the user from frustration or improper expectation.
Selecting "Filter" button opens up page to view the options for filtering. The "Year" button specifically opens up a pop up for selecting years.
Selecting "Order" button changes the order from ascending to descending, dependent on filter.
The top left button presents the current filter unless there is none, and works as a RESET filter button when current filter exists.
Selecting the row will present the details for specific launch.

### Build
iOS 13 SDK or later

### Runtime
iOS 13 or later

### THANK YOU
Thanks to everyone's patience and looking forward to feedback regarding this project.
Have a nice rest of your week
