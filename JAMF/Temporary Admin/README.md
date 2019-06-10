## Purpose
This script as a policy will grant the current user admin privileges for 20 minutes, or until they click finished. The value can be changed by adjusting the time timeout value. The script locks the HUD to keep the user from closing the window. It is best practice to have the policy verify that the user is not admin after running. Best bet is to have the policy trigger a SmartGroup or something else so that the user can be checked for admin rights post script.

## Beware
The script is hard to kill, but if the user forces the machine down without clicking finsh admin rights will be retained. This is where your policy follow up needs to come in. It is unlikely that a user will trigger this, but a crash or some other event might.
