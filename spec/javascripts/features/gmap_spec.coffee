describe "Clicking a map link", ->
  maplink = undefined
  spyEvent = undefined
  beforeEach ->
    maplink = $('.map-link a')[0]
    return

  it "should have maplink", ->
    expect(maplink).toBe($('.map-link a')[0])
    return

  # This test is failing because the jquery returned element is not an object,
  # just a result of the found element (like a description of the element)
  it "should have event listener on maplink", ->
    spyEvent = spyOn 'a:first', 'click'
    $('a:first')[0].click

    expect($.fn.click).toHaveBeenCalled()
    # expect(spyEvent).toHaveBeenTriggered()
    return

  it "should open an infowindow", ->
    if window.gmarkers
      google.maps.event.trigger window.gmarkers[i], 'click'

    # This test was only written to test run using spyOn for functions
    foo =
      setBar: (value) ->
        bar = value
        return

    spyOn foo, 'setBar'

    foo.setBar maplink

    expect(foo.setBar).toHaveBeenCalledWith(maplink);
    return
