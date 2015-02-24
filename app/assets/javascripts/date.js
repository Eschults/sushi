function month(date) {
  // Tue Feb 24 2015 01:00:00 GMT+0100 (CET)
  if(date.slice(4, 7) == "Jan") {
    return "01";
  } else if(date.slice(4, 7) == "Feb") {
    return "02";
  } else if(date.slice(4, 7) == "Mar") {
    return "03";
  } else if(date.slice(4, 7) == "Apr") {
    return "04";
  } else if(date.slice(4, 7) == "May") {
    return "05";
  } else if(date.slice(4, 7) == "Jun") {
    return "06";
  } else if(date.slice(4, 7) == "Jul") {
    return "07";
  } else if(date.slice(4, 7) == "Aug") {
    return "08";
  } else if(date.slice(4, 7) == "Sep") {
    return "09";
  } else if(date.slice(4, 7) == "Oct") {
    return "10";
  } else if(date.slice(4, 7) == "Nov") {
    return "11";
  } else if(date.slice(4, 7) == "Dec") {
    return "12";
  }
}

function year(date) {
  // Tue Feb 24 2015 01:00:00 GMT+0100 (CET)
  return date.slice(11, 15);
}

function day(date) {
  // Tue Feb 24 2015 01:00:00 GMT+0100 (CET)
  return date.slice(8, 10);
}

function hour(date) {
  // Tue Feb 24 2015 01:00:00 GMT+0100 (CET)
  return date.slice(16, 18);
}

function setDeliveryDate() {
  $('#order_pickup_date').on('change', function() {
    var pickupDate = Date.parse($(this).val().slice(6, 10) + '-' + $(this).val().slice(3, 5) + '-' + $(this).val().slice(0, 2));
    var deliveryDate = pickupDate + 2 * 86400000;
    deliveryDate = new Date(deliveryDate).toString();
    deliveryYear = year(deliveryDate);
    deliveryMonth = month(deliveryDate);
    deliveryDay = day(deliveryDate);
    deliveryDate = deliveryDay + "/" + deliveryMonth + "/" +deliveryYear;
    deliveryDateJs = deliveryYear + "-" + deliveryMonth + "-" +deliveryDay;
    $('#order_delivery_date').val(deliveryDate);
  })
}

function setStartDates() {
  if(parseInt(hour(new Date().toString())) <= 16) {
    $('#order_pickup_date').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true,
      clearBtn: true,
      language: 'fr',
      multidate: false,
      todayHighlight: true,
      startDate: new Date()
    })
    $('#order_delivery_date').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true,
      clearBtn: true,
      language: 'fr',
      multidate: false,
      todayHighlight: true,
      startDate: new Date(new Date().getTime() + 86400000 * 2)
    })
  } else {
    $('#order_pickup_date').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true,
      clearBtn: true,
      language: 'fr',
      multidate: false,
      todayHighlight: true,
      startDate: new Date(new Date().getTime() + 86400000 * 1)
    })
    $('#order_delivery_date').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true,
      clearBtn: true,
      language: 'fr',
      multidate: false,
      todayHighlight: true,
      startDate: new Date(new Date().getTime() + 86400000 * 2)
    })
  }
}

function checkDeliveryDate() {
  $('#order_delivery_date').on('change', function() {
    var pickupValue = $('#order_pickup_date').val();
    var pickupDate = Date.parse(pickupValue.slice(6, 10) + '-' + pickupValue.slice(3, 5) + '-' + pickupValue.slice(0, 2));
    var deliveryDate = Date.parse($(this).val().slice(6, 10) + '-' + $(this).val().slice(3, 5) + '-' + $(this).val().slice(0, 2));
    if(deliveryDate - pickupDate < 86400000 * 2) {
      $('span').removeClass("hidden");
      $(this).parent().addClass('has-error');
      $('#submit').addClass('disabled');
    } else {
      $('span').addClass("hidden");
      $(this).parent().removeClass('has-error');
      $('#submit').removeClass('disabled');
    }
  })
}