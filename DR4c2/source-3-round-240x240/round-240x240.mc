using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

//! inherit from the view that contains the commonlogic
class DeviceView extends PowerView {
	var myTime;
	var strTime;

	//! it's good practice to always have an initialize, make sure to call your parent class here!
    function initialize() {
        PowerView.initialize();
    }

	function onUpdate(dc) {
		//! call the parent function in order to execute the logic of the parent
		PowerView.onUpdate(dc);
                
		//! Conditions for showing the demoscreen       
        if (uShowDemo == false) {
        	if (licenseOK == false && jTimertime > 900)  {
        		uShowDemo = true;        		
        	}
        }

	   //! Check whether demoscreen is showed or the metrics 
	   if (uShowDemo == false ) {

		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

        dc.drawLine(0, 120,  240, 120);
        dc.drawLine(120, 29,  120, 214);

        //! Bottom horizontal divider
        dc.drawLine(45, 214, 195, 214);

        //! Top horizontal divider
        dc.drawLine(33, 29, 207, 29);	

		//! Display metrics
        dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);

		//! Show number of laps or clock with current time in top
		myTime = Toybox.System.getClockTime(); 
	    strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		if (uMilClockAltern == 0) {		
			dc.drawText(120, -4, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		}

		for (var i = 1; i < 5; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"062,085,072,012,099,073,041");
	       	} else if ( i == 2 ) {	//!upper row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"173,085,182,123,099,167,041");
	       	} else if ( i == 3 ) {  //!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"062,153,072,012,145,073,199");
	       	} else if ( i == 4 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"173,153,182,123,167,167,199");
	       	}    	       	 	
		}
		
		if (jTimertime == 0) {
	    	if (ID0 != 3624 and ID0 != 3588 and ID0 != 3762 and ID0 != 3761 and ID0 != 3757 and ID0 != 3758 and ID0 != 3759 and ID0 != 3799 and ID0 != 4042) {
		    	dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
				dc.drawText(120, 102, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		    }
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(92, 219, 54, 15);
		dc.fillRectangle(146, 222, 3, 8);
		
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 94 + pwr*0.5  ;
		var Endstatuspwrbr = 50 - pwr*0.5 ;
		dc.fillRectangle(Startstatuspwrbr, 221, Endstatuspwrbr, 11);	
		
	   } else {
	   //! Display demo screen
		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
	
		if (licenseOK == true) {
      		dc.drawText(120, 40, Graphics.FONT_XTINY, "DR4c2", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      		dc.drawText(120, 70, Graphics.FONT_XTINY, "Version " + appversion, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(120, 120, Graphics.FONT_TINY, "Registered !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(81, 160, Graphics.FONT_XTINY, "License code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(180, 160, Graphics.FONT_XTINY, mtest, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		} else {
      		dc.drawText(120, 33, Graphics.FONT_XTINY, "License needed !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      		dc.drawText(120, 63, Graphics.FONT_XTINY, "Run is recorded though", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 105, Graphics.FONT_MEDIUM, "ID 0: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 98, Graphics.FONT_NUMBER_MEDIUM, ID0, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 145, Graphics.FONT_MEDIUM, "ID 1: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 138, Graphics.FONT_NUMBER_MEDIUM, ID1, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 185, Graphics.FONT_MEDIUM, "ID 2: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 178, Graphics.FONT_NUMBER_MEDIUM, ID2, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(120, 215, Graphics.FONT_XTINY, "Version " + appversion, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      	}
	   }
	   
	}

}