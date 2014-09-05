HTMLWidgets.widget({
  name: "datamaps",
  type: "output",
  renderValue: function(el, payload){
    el.innerHTML = ""
    payload.element = el
    if (payload.geographyConfig.dataUrl){
      console.log('attaching dataUrl')
      payload.geographyConfig.dataUrl = HTMLWidgets.getAttachmentUrl('dataUrl', 1)
      console.log(HTMLWidgets.getAttachmentUrl('dataUrl', 1))
    }
    var map = new Datamap(payload)
  }
})
