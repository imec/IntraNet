/**************
		@
		Tabs Navigation
		Victor
		@
***********/
	
	function resetTabs(){
        $("#miTabContent > div").hide(); //Hide all content
        $("#miTab a").attr("id",""); //Reset id's      
    }

    var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab

    (function(){
        $("#miTabContent > div").hide(); // Initially hide all content
        $("#miTab li:first a").attr("id","current"); // Activate first tab
        $("#miTabContent > div:first").fadeIn(); // Show first tab content
        
        $("#miTab a").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("id") == "current"){ //detection for current tab
             return       
            }
            else{             
            resetTabs();
            $(this).attr("id","current"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            }
        });

        for (i = 1; i <= $("#miTab li").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
    })()
	
	
/**************
		@
		Calendar DatePicker
		Victor
		@
***********/
	$(function(){
			window.prettyPrint && prettyPrint();
			$('#dp1').datepicker({
				format: 'mm-dd-yyyy'
			});
			$('#dp2').datepicker({
				format: 'mm-dd-yyyy'
			});
			$('#dp3').datepicker();
			$('#dp3').datepicker();
			$('#dpYears').datepicker();
			$('#dpMonths').datepicker();
			
			
			var startDate = new Date(2012,1,20);
			var endDate = new Date(2012,1,25);
			$('#dp4').datepicker()
				.on('changeDate', function(ev){
					if (ev.date.valueOf() > endDate.valueOf()){
						$('#alert').show().find('strong').text('The start date can not be greater then the end date');
					} else {
						$('#alert').hide();
						startDate = new Date(ev.date);
						$('#startDate').text($('#dp4').data('date'));
					}
					$('#dp4').datepicker('hide');
				});
			$('#dp5').datepicker()
				.on('changeDate', function(ev){
					if (ev.date.valueOf() < startDate.valueOf()){
						$('#alert').show().find('strong').text('The end date can not be less then the start date');
					} else {
						$('#alert').hide();
						endDate = new Date(ev.date);
						$('#endDate').text($('#dp5').data('date'));
					}
					$('#dp5').datepicker('hide');
				});
		});
		
		