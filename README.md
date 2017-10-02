# cablist
-interfaces are used to improve testability and abstraction. ViewInterface, ControllerInterface, ModelInterface. MVC implemented.  
-filter taxis by active, inactive status - in both map and list views. in map, the active cars use red color and inactive cars use green color. in list view, there is inactive, active label for each taxi. green is used to denote active taxi in both list and map views for consistency.  
-implemented count of taxis of each state, in top tab in list view  
-pull to refresh implemented in list view  
-works in landscape and portrait mode - auto layout in storyboard and code is done.  
-no network, nil response error handling done  
-unit testing is done for Controller-View interaction, Controller-Model interaction, and Network Manager functionality. Press Cmd+u for running unit tests.  
