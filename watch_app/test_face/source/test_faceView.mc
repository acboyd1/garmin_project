import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Time;

//Current imports being used
using Toybox.Time.Gregorian as Date;
using  Toybox.System as System;

class test_faceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        // //Get and set battery info
        // var systemInfo = System.getSystemStats();
        // var batteryString = Lang.format("$1$%", [systemInfo.battery]);
        // var view2 = View.findDrawableById("Battery") as Text;
        // view2.setText(batteryString);
        
        // //given clock time
        // var clockTime = System.getClockTime();
        // var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        // var view3 = View.findDrawableById("TimeLabel") as Text;
        // view3.setText(timeString);

        //Test writing functions for each call to time, hr, date, etc.
        setDate();
        setBattery();
        //setGraph();
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() as Void {
    }

    // USE THIS. Not important in simulation but bigtime for personal watch development
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates / While sleep, updates once per minute
    function onEnterSleep() as Void {
    }

    //----------------------------------------------------------------------------------------------------//
    
    private function setDate() {
        var date = Date.info(Time.now(), Time.FORMAT_SHORT);
        var dateString = Lang.format("$1$|$2$|$3$", [date.month, date.day, date.year]);
        var dateDisplay = View.findDrawableById("Date") as Text;
        dateDisplay.setText(dateString);
    }

    private function setBattery() {
        //returns a float
        var batteryInfo = System.getSystemStats().battery;
        var batteryDisplay = View.findDrawableById("Battery") as Text;
        batteryDisplay.setText(batteryInfo.format("%d") + "%");
    }
    
    // private function setGraph() {
    //     var image = Graphics.Picture.loadResource(GraphPhoto);
    //     var imageWidth = image.getWidth();
    //     var imageHeight = image.getHeight();
    //     var x = (dc.getWidth() - imageWidth) / 2;
    //     var y = (dc.getHeight() - imageHeight) / 2;
    //     dc.drawPicture(x, y, image);
    // }

    // private function drawGraph(dc) {
    //     var heartRateData = Application.getApp().getProperty("mHeartRateData");
    //     var maxHeartRate = getMaxValue(heartRateData);

    //     dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
    //     dc.clear();

    //     var graphWidth = dc.getWidth() - 10; // Leave some space for margins
    //     var graphHeight = dc.getHeight() - 10;
    //     var xScale = graphWidth / (heartRateData.size() - 1);
    //     var yScale = graphHeight / maxHeartRate;

    //     for (var i = 1; i < heartRateData.size(); i++) {
    //         var x1 = (i - 1) * xScale + 5; // +5 for left margin
    //         var y1 = graphHeight - heartRateData[i - 1] * yScale + 5; // +5 for bottom margin
    //         var x2 = i * xScale + 5;
    //         var y2 = graphHeight - heartRateData[i] * yScale + 5;

    //         dc.drawLine(x1, y1, x2, y2);
    //     }
    // }

    // private function getMaxValue(array) {
    //     var max = array[0];
    //     for (var i = 1; i < array.size(); i++) {
    //         if (array[i] > max) {
    //             max = array[i];
    //         }
    //     }
    //     return max;
    // }

}
