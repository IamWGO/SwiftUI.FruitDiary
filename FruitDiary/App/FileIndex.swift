//
//  FileIndex.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-21.
//

/*
 About APP
 ------------------------
 1. Force protrait orientation
 2. Show weekly calendar
 3. Show half screen popup when add/update eaten fruit amout
 4. Request EntryList API when add/update eaten fruit amout
 5. Request FruitList API just when app loaded
 6. App has no locally store.
 
 
>Model
    >>WeekDaysModel.swift : weekly calendar
    >>FruitModel.swift : Fruit list resqest/response/mapView
    >>EntryModel.swift : Entry list request/Response/MapView
>View
    >>FruitDiary
        >>>DashboardView.swift : Landing Page / call DailyFruitView.swift
        >>>DailyFruitView.swift : Add new entry button / add new eaten fruit amount / call FruitEatenListView.swift
        >>>FruitEatenFormView.swift : Half view for eaten fruit form
        >>>AboutView.swift : App information
        >>>FruitEatenListView.swift : Daily fruit list
    >> ShareView
        >>>ButtonWithText.swift : Text button
        >>>HalfSheetView.swift : Half sheet view
        >>>TabSlideBarView.swift : sliderbar menu button
        >>>IconButton.swift : Icon button
    >> WeeklyCalendar
        >>>WeeklyCalendaerHeaderView.swift : Previous and next icon
        >>>WeeklyCalendarView.swift : Weekly calendar
    >>ContentView.swift : call DashboardView.swift
>ViewModel
    >>WeekCalendarViewModel.swift : View model for calendar
    >>DailyFruitViewModel.swift : View model for API and all process
>Utility
    >>Storage
        >>>UserDefaultManager.swift : For locally storeage
        >>>StorageKey.swift : locally storeage keys
    >>APIs
        >>>AlmofireManager.swift : AlmofireConfig
        >>>ServiceAPI.swift : API GET/POST/DELETE
        >>>URLUtility.swift : All URLs for the project
        >>>ErrorStruct.swift : Error
        >>>JsonService.swift : Decode and Encode Structure <-> Json data (For locally storeage)
    >>Modifier
        >>>Modifier.swift : Style for UI
    >>Extension
        >>>Date+Extension.swift
    >>Constant : Constant Values for the project
    >>Device : Check Device


*/
