#Scrape oilprice.com for WTI price data
$HTML= Invoke-RestMethod 'https://oilprice.com/'
$HTML -match '<td class="value">(?<price>.*) <i class' >$null
$WTI = $Matches.price
$HTML -match '<td class="change_percent">(?<increase>.*)%</td>' >$null
$PercentChange = $Matches.increase

#Notify if percent change is above threshold
$PercentThreshold = 0
$PercentChangeJustNum = $PercentChange.SubString(1)
if($PercentChangeJustNum -gt $PercentThreshold){

                [reflection.assembly]::loadwithpartialname('System.Windows.Forms')

                [reflection.assembly]::loadwithpartialname('System.Drawing')

                $notify = new-object system.windows.forms.notifyicon

                $notify.icon = [System.Drawing.SystemIcons]::Information

                $notify.visible = $true

                $notify.showballoontip(10,'WTI Price',"Price: $" + $WTI + " / Change: " + $PercentChange + "%",[system.windows.forms.tooltipicon]::None)

}