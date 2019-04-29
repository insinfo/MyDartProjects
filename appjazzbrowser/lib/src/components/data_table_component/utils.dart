class Utils {
  static String truncate(String value, int truncateAt) {
    if (value == null) {
      return value;
    }
    //int truncateAt = value.length-1;
    String elepsis = "..."; //define your variable truncation elipsis here
    String truncated = "";

    if (value.length > truncateAt) {
      truncated = value.substring(0, truncateAt - elepsis.length) + elepsis;
    } else {
      truncated = value;
    }
    return truncated;
  }

  /*To use it just:
addEventForChild(parent, 'click', '.child', function(childElement){
  console.log('Woo click!', childElement)
})*/
  static void addEventForChild(parent, eventName, childSelector, cb) {
    parent.addEventListener(eventName, (event) {
      var clickedElement = event.target,
          matchingChild = clickedElement.closest(childSelector);
      if (matchingChild) {
        cb(matchingChild);
      }
    });
  }
}
