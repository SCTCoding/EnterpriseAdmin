--
--  AppDelegate.applescript
--  Policy Helper
--
--  Created by S on 5/27/19.
--  Copyright © 2019 SCTCoding. All rights reserved.
--

script AppDelegate
    property parent : class "NSObject"
    
    property WindowTitle : missing value ## Window Title
    
    property PolicyBasicAction : missing value ## Policy action reminder
    
    property CustomizationDescription_1 : missing value ## Descriptor 1
    
    property CustomizationDescription_2 : missing value ## Descriptor 2
    
    property CustomizationDescription_3 : missing value ## Descriptor 3
    
    property CustomizationDescription_4 : missing value ## Descriptor 4
    
    property CustomizationDescription_5 : missing value ## Descriptor 5
    
    property select1 : missing value ## Checkbox 1
    
    property select2 : missing value ## Checkbox 2
    
    property select3 : missing value ## Checkbox 3
    
    property select4 : missing value ## Checkbox 4
    
    property select5 : missing value ## Checkbox 5
    
    property select1value : missing value ## Select State 1
    
    property select2value : missing value ## Select State 2
    
    property select3value : missing value ## Select State 3
    
    property select4value : missing value ## Select State 4
    
    property select5value : missing value ## Select State 5
    
    -- IBOutlets
    property theWindow : missing value
    
    on applicationWillFinishLaunching_(aNotification)
        -- Insert code here to initialize your application before any files are opened
        
        ## Check if the plist exists. If it doesn't quit.
        set plistcheck to do shell script "if [[ -f \"/private/tmp/com.sctcoding.policyhelper.plist\" ]]; then echo \"TRUE\"; else echo \"FALSE\"; fi;"
        
        if plistcheck is "FALSE" then
            quit
        end if
        
        ## Force to front
        tell me to activate
        
        ## Set the window title
        set titleofwindow to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist WindowTitle"
        set the stringValue of WindowTitle to titleofwindow
        
        ## Set the default policy action reminder
        set defaultaction to do shell script "PolicyBasicAction=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist PolicyBasicAction); echo $PolicyBasicAction"
        set the stringValue of PolicyBasicAction to defaultaction
        
        ## Set the item status variables based on the plist.
        set custom1status to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Custom1State"
        
        set custom2status to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Custom2State"
        
        set custom3status to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Custom3State"
        
        set custom4status to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Custom4State"
        
        set custom5status to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Custom5State"
        
        ## For each item check if false. If so then disable item. if not enable time and set item description from plist.
        if custom1status is "FALSE" then
            tell select1 to setEnabled_(false)
            tell CustomizationDescription_1 to setEnabled_(false)
            else
            tell select1 to setEnabled_(true)
            tell CustomizationDescription_1 to setEnabled_(true)
            set description1 to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Customization1"
            set the stringValue of CustomizationDescription_1 to description1
        end if
        
        if custom2status is "FALSE" then
            tell select2 to setEnabled_(false)
            tell CustomizationDescription_2 to setEnabled_(false)
            else
            tell select2 to setEnabled_(true)
            tell CustomizationDescription_2 to setEnabled_(true)
            set description2 to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Customization2"
            set the stringValue of CustomizationDescription_2 to description2
        end if
        
        if custom3status is "FALSE" then
            tell select3 to setEnabled_(false)
            tell CustomizationDescription_3 to setEnabled_(false)
            else
            tell select3 to setEnabled_(true)
            tell CustomizationDescription_3 to setEnabled_(true)
            set description3 to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Customization3"
            set the stringValue of CustomizationDescription_3 to description3
        end if
        
        if custom4status is "FALSE" then
            tell select4 to setEnabled_(false)
            tell CustomizationDescription_4 to setEnabled_(false)
            else
            tell select4 to setEnabled_(true)
            tell CustomizationDescription_4 to setEnabled_(true)
            set description4 to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Customization4"
            set the stringValue of CustomizationDescription_4 to description4
        end if
        
        if custom5status is "FALSE" then
            tell select5 to setEnabled_(false)
            tell CustomizationDescription_5 to setEnabled_(false)
            else
            tell select5 to setEnabled_(true)
            tell CustomizationDescription_5 to setEnabled_(true)
            set description5 to do shell script "defaults read /private/tmp/com.sctcoding.policyhelper.plist Customization5"
            set the stringValue of CustomizationDescription_5 to description5
        end if
        
        
    end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
        -- Insert code here to do any housekeeping before your application quits
        
        ## Make sure that the plist is removed at termination.
        do shell script "if [[ -f \"/private/tmp/com.sctcoding.policyhelper.plist\" ]]; then rm /private/tmp/com.sctcoding.policyhelper.plist; fi;"
        
        return current application's NSTerminateNow
    end applicationShouldTerminate_
    
    ## Check for each check box. If there write the values into the the shell script with the trigger from the plist.
    on customize_(sender)
        
        ## Check for and setup the shell script.
        do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); if [[ ! -f \"/private/tmp/policyHelper_$pname.sh\" ]]; then touch /private/tmp/policyHelper_$pname.sh; echo \"#! /bin/bash\" > /private/tmp/policyHelper_$pname.sh; else rm /private/tmp/policyHelper_$pname.sh; touch /private/tmp/policyHelper_$pname.sh; echo \"#! /bin/bash\" > /private/tmp/policyHelper_$pname.sh; fi;"
        
        set select1value to (select1's state())
        if select1value is 1 then
            do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); trigger1=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist trigger1); echo \"jamf policy -trigger $trigger1\" >> /private/tmp/policyHelper_$pname.sh"
        end if
        
        set select2value to (select2's state())
        if select2value is 1 then
            do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); trigger2=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist trigger2); echo \"jamf policy -trigger $trigger2\" >> /private/tmp/policyHelper_$pname.sh"
        end if
        
        set select3value to (select3's state())
        if select3value is 1 then
            do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); trigger3=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist trigger3); echo \"jamf policy -trigger $trigger3\" >> /private/tmp/policyHelper_$pname.sh"
        end if
        
        set select4value to (select4's state())
        if select4value is 1 then
            do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); trigger4=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist trigger4); echo \"jamf policy -trigger $trigger4\" >> /private/tmp/policyHelper_$pname.sh"
        end if
        
        set select5value to (select5's state())
        if select5value is 1 then
            do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); trigger5=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist trigger5); echo \"jamf policy -trigger $trigger5\" >> /private/tmp/policyHelper_$pname.sh"
        end if
        
        ## Write the auto-delete at the end of the shell script.
        do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); echo \"rm /private/tmp/policyHelper_$pname.sh\" >> /private/tmp/policyHelper_$pname.sh"
        
        ## Make executable so JAMF can run it.
        do shell script "pname=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name); chmod +x /private/tmp/policyHelper_$pname.sh"
        quit
    end customize_
    
    on nocustomize_(sender)
        ## If don't customize selected quit.
        quit
    end nocustomize_
    
end script
