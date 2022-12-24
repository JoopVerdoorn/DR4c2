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

	//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);
        dc.drawLine(0, 90,  218, 90);
        dc.drawLine(109, 24,  109, 158);

        //! Top horizontal divider
        dc.drawLine(15, 25, 195, 25);	
                        
        //! Bottom horizontal divider
        dc.drawLine(15, 158, 195, 158);

		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
 		
		//! Show clock with current time in top
		var myTime = Toybox.System.getClockTime(); 
    	var strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		dc.drawText(109, -4, Graphics.FONT_NUMBER_MILD, strTime, Graphics.TEXT_JUSTIFY_CENTER);

		for (var i = 1; i < 5; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"059,062,065,010,071,066,033");
	       	} else if ( i == 2 ) {	//!upper row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"160,062,170,115,071,153,033");
	       	} else if ( i == 3 ) {  //!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"059,113,065,010,121,066,145");
	       	} else if ( i == 4 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"160,113,170,115,121,153,145");
	       	}     	
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(83, 163, 49, 14);
		dc.fillRectangle(132, 167, 3, 7);
		
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 84 + pwr*0.5  ;
		var Endstatuspwrbr = 46 - pwr*0.5 ;
		dc.fillRectangle(Startstatuspwrbr, 165, Endstatuspwrbr, 10);
	   
	}

}