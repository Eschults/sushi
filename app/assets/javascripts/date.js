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

function setDeliveryDate() {
  $('#order_pickup_date').on('change', function() {
    var pickupDate = Date.parse($(this).val());
    var deliveryDate = pickupDate + 2 * 86400000;
    deliveryDate = new Date(deliveryDate).toString();
    deliveryYear = year(deliveryDate);
    deliveryMonth = month(deliveryDate);
    deliveryDay = day(deliveryDate);
    deliveryDate = deliveryYear + "-" + deliveryMonth + "-" +deliveryDay;
    $('#order_delivery_date').val(deliveryDate);
    $('#order_delivery_date').attr('min', deliveryDate);
  })
}