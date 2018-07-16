document.addEventListener("turbolinks:load", function() {
  var sectionDropdown = document.getElementById('section');
  var makerDropdown = document.getElementById('maker');
  var modelDropdown = document.getElementById('model');
  var gradeDropdown = document.getElementById('grade');

  if (sectionDropdown) {
    sectionDropdown.selectedIndex = "0";
    sectionDropdown.addEventListener('change', function() {
      var url = constructURL(['section'], [sectionDropdown.value], ['make']);
      dropDownChange(sectionDropdown, makerDropdown, url);
    });
  }

  if (makerDropdown) {
    makerDropdown.addEventListener('change', function() {
      var url = constructURL(['section', 'make'], [sectionDropdown.value, makerDropdown.value], ['model']);
      dropDownChange(makerDropdown, modelDropdown, url);
    });
  }

  if (modelDropdown) {
    modelDropdown.addEventListener('change', function() {
      var button = document.getElementById('search_1');
      button.setAttribute('disabled', true)
      if (modelDropdown.value) {
        button.removeAttribute('disabled');
      }
    });
  }

  if (gradeDropdown) {
    gradeDropdown.addEventListener('change', function() {
      var button = document.getElementById('search_2');
      button.setAttribute('disabled', true)
      if (gradeDropdown.value) {
        button.removeAttribute('disabled');
      }
    });
  }
});

var constructURL = function(keys, values, attributes) {
  var url = '/api/query?model=machine';
  for (var i = 0; i < keys.length; i++) {
    if (values[i] === 'all') {
      keys[i] = '';
      values[i] = '';
    }
  }
  url += '&' + 'keys=' + keys.join();
  url += '&' + 'values=' + values.join();
  url += '&' + 'attributes=' + attributes.join();

  return url;
};

var dropDownChange = function(el1, el2, url) {
  el2.setAttribute('disabled', true);
  el2.length = 0;

  if (el1.value) {
    ajaxRequest(el2, url);
  }
};

var ajaxRequest = function(el, url) {
  var request = new XMLHttpRequest();
  request.open('GET', url, true);

  request.onload = function() {
    ajaxOnload(el, request);
  }

  request.onerror = function() {
    // There was a connection error of some sort
    console.log('Connection error');
  };

  request.send();
};

var ajaxOnload = function(el, request) {
  if (request.status >= 200 && request.status < 400) {
    // Success
    var resp = request.responseText;
    var data = JSON.parse(resp);

    addOptionToDropdown(el, ['', '']);
    addOptionToDropdown(el, ['All', 'all']);

    for (var i = 0; i < data.length; i++) {
      addOptionToDropdown(el, data[i]);
    }

    el.removeAttribute('disabled');
  } else {
    // We reached our target server, but it returned an error
    console.log('Error');
  }
};

var addOptionToDropdown = function(el, data) {
  var option = document.createElement('option');
  if (typeof data === 'object') {
    option.value = data[1];
    option.text = data[0];
  } else {
    option.value = data;
    option.text = data.charAt(0).toUpperCase() + data.slice(1);
  }
  el.add(option);
};
