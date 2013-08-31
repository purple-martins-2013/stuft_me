describe "HoverVotes", ->
  beforeEach ->
    loadFixtures "plate_index"
    new HoverVoteable('.photo')

  it "adds class show-votes and shows vote text when we hover over index plate", ->
    photo = $(".index-photo")
    photo.trigger('mouseover')
    expect(photo).toHaveClass("show-votes")
    expect(photo.find("h2")).toHaveText("35 Votes")  

  it "removes class show-votes and removes vote text when the mouse leaves the plate", ->
    photo = $(".index-photo")
    $('.index-photo').trigger('mouseleave')
    expect(photo).not.toHaveClass("show-votes")
    expect(photo.find("h2").length).toBe 0
    
