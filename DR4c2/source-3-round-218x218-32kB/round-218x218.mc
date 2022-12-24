using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

//! inherit from the view that contains the commonlogic
class DeviceView extends PowerView {
	
	//! it's good practice to always have an initialize, make sure to call your parent class here!
    function initialize() {
        PowerView.initialize();
    }

	function onUpdate(dc) {
		//! call the parent function in order to execute the logic of the parent
		PowerView.onUpdate(dc);

	//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);
        dc.drawLine(0, 109,  218, 109);
        dc.drawLine(109, 29,  109, 191);

        //! Top horizontal divider
        dc.drawLine(30, 27, 188, 27);	
                        
        //! Bottom horizontal divider
        dc.drawLine(33, 191, 185, 191);

		//! Display metrics
		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
 		
		//! Show clock with current time in top
		var myTime = Toybox.System.getClockTime(); 
    	var strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		dc.drawText(108, -4, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		
		for (var i = 1; i < 5; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"059,079,065,010,089,066,040");
	       	} else if ( i == 2 ) {	//!upper row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"162,079,170,115,089,153,040");
	       	} else if ( i == 3 ) {  //!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"059,137,065,010,147,066,175");
	       	} else if ( i == 4 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"162,137,170,115,147,153,175");
	       	}     	
		}

		if (jTimertime == 0) {
	    	if (uShowRedClock == true) {
		    	dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
				dc.drawText(109, 93, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		    }
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(84, 197, 49, 14);
		dc.fillRectangle(133, 200, 3, 7);
		
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 85 + pwr*0.5  ;
		var Endstatuspwrbr = 45 - pwr*0.5 ;
		dc.fillRectangle(Startstatuspwrbr, 199, Endstatuspwrbr, 10);	
   
	}

}