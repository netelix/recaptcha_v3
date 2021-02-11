GlobalVariable =
  typeof GlobalVariable != "undefined"
    ? GlobalVariable
    : {
        onDefined: function(variable_name, action) {
          if (typeof eval("window." + variable_name) === "undefined") {
            setTimeout(function() {
              GlobalVariable.onDefined(variable_name, action);
            }, 5000);
          } else {
            action();
          }
        }
      };
