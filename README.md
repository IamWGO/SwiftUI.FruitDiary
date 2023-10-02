# FruitDiary

The existing entries should be presented through a list of some sort and a specific entry should
be viewable through a detail view. Each row in the entries list should present the date of the
entry, the number of fruits and the total number of vitamins in the eaten fruits that date.


## About APP
 1. Force protrait orientation
 2. Show weekly calendar
 3. Show half screen popup when add/update eaten fruit amout
 4. Request EntryList API when add/update eaten fruit amout
 5. Request FruitList API just when app loaded
 6. The app will load data from locally storage and will request API when add/update data.
 
 ## File Index
### Model
    WeekDaysModel.swift : weekly calendar
    FruitModel.swift : Fruit list resqest/response/mapView
    EntryModel.swift : Entry list request/Response/MapView
### View
    #FruitDiary
        DashboardView.swift : Landing Page / call DailyFruitView.swift
        DailyFruitView.swift : Add new entry button / add new eaten fruit amount / call FruitEatenListView.swift
        FruitEatenFormView.swift : Half view for eaten fruit form
        AboutView.swift : App information
        FruitEatenListView.swift : Daily fruit list
    #ShareView
        ButtonWithText.swift : Text button
        HalfSheetView.swift : Half sheet view
        TabSlideBarView.swift : sliderbar menu button
        IconButton.swift : Icon button
    #WeeklyCalendar
        WeeklyCalendaerHeaderView.swift : Previous and next icon
        WeeklyCalendarView.swift : Weekly calendar
    ContentView.swift : call DashboardView.swif
### ViewModel
    WeekCalendarViewModel.swift : View model for calendar
    DailyFruitViewModel.swift : View model for API and all process
### Utility
    #Storage<br />
        UserDefaultManager.swift : For locally storeage
        StorageKey.swift : locally storeage keys
    #APIs<br />
        AlmofireManager.swift : AlmofireConfig
        ServiceAPI.swift : API GET/POST/DELETE
        URLUtility.swift : All URLs for the project
        ErrorStruct.swift : API Error 
        JsonService.swift : Decode and Encode Structure <-> Json data (For locally storeage)
    #Modifier<br />
        Modifier.swift : Style for UI
    #Extension
        Date+Extension.swift
    Constant : Constant Values for the project
    Device : Check Device

## Screenshots
<kbd>
  <img src="https://raw.githubusercontent.com/waleerat/GitHub-Photos-Shared/main/WeeklyCalendar/05.png" width="40%" height="40%"> 

|
<img src="https://raw.githubusercontent.com/waleerat/GitHub-Photos-Shared/main/WeeklyCalendar/02.png"  width="40%" height="40%"> |
<img src="https://raw.githubusercontent.com/waleerat/GitHub-Photos-Shared/main/WeeklyCalendar/01.png"  width="40%" height="40%"> 


<img src="https://raw.githubusercontent.com/waleerat/GitHub-Photos-Shared/main/WeeklyCalendar/03.png" width="40%" height="40%"> |
<img src="https://raw.githubusercontent.com/waleerat/GitHub-Photos-Shared/main/WeeklyCalendar/04.png"  width="40%" height="40%"> 
  </kbd>


 
