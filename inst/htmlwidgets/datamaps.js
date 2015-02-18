HTMLWidgets.widget({
  name: "datamaps",
  type: "output",
  renderValue: function(el, x){
    el.innerHTML = ""
    x.element = el
    var map = new Datamap(x)
  }
})
