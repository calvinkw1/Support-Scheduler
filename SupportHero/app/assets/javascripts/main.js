// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  
// this function doesn't work initially after getting to the edit shift
// only works after refreshing the edit shift page
  $(".shift_user_id").change(function() {
    $("tbody").empty();
      var index = $("#shift_user_id")[0].selectedIndex,
          name = $("#shift_user_id")[0][index].value;
      $.ajax({
        url: '/getShifts',
        method: 'GET',
        data: {
          name: name
        },
        success: function(data) {
          console.log(data);
          for (var i = 0; i < data.length; i++) {
            var html;
            html += "<tr>";
            html += "<td><input type='radio' name='shift' id=" + data[i].id + "></td>";
            html += "<td>" + data[i].id + "</td>";
            html += "<td>" + data[i].date + "</td>";
            html += "<td>" + data[i].user_id + "</td>";
            html += "<td>" + data[i].avail + "</td>";
            html += "<td>" + data[i].weekend + "</td>";
            html += "<td>" + data[i].holiday + "</td>";
            html += "</tr>";
            $("tbody").append(html);
            html = "";
          }
        }
      }
    );
  });

  $("#swap").click(function(e) {
    e.preventDefault();
    var user = $("#user").text();
    var origShiftID = $("#origShiftID").text();
    var newShiftID = $("input[type='radio'][name='shift']:checked[id]").attr('id');
    $.ajax({
      url: '/swapShifts',
      method: 'POST',
      data: {
        user: user,
        origShiftID: origShiftID,
        newShiftID: newShiftID
      },
      success: function(data) {
        alert("Shift swapped!");
        location.href = '/shifts';
      }
    });
  });

});