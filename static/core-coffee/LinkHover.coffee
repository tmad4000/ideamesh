# makes nodes "selectable"
define [], () ->

  class LinkHover extends Backbone.View

    constructor: (@options) ->
      super()

    init: (instances) ->

      _.extend this, Backbone.Events

      @graphView = instances['GraphView']
      @linkFilter = @graphView.getLinkFilter()
      @graphModel = instances['GraphModel']
      @dataProvider = instances["local/WikiNetsDataProvider"]
      @topBarCreate = instances['local/TopBarCreate']

      # div = d3.select("#maingraph").append("div")   
      #     .style("position", "absolute")       
      #     .style("text-align", "center")
      #     .style("padding", "2px")
      #     .style("background", "lightsteelblue")
      #     .style("border", "0px")
      #     .style("border-radius", "8px")
      #     .style("font-size", "9px")
      #     .style("opacity", 0)

      # @graphView.on "enter:node:mouseover", (d) =>
      #     div.transition()        
      #         .duration(200)      
      #         .style("opacity", .9)
      #     div.html("Expand"+ "<br/>")  
      #         .style("left", (d3.event.pageX) + "px")     
      #         .style("top", (d3.event.pageY + 8) + "px")

      @graphView.on "enter:node:mouseover", (d) =>
        $('#expand-button'+@graphModel.get("nodeHash")(d)).show()

      @graphView.on "enter:node:mouseout", (d) =>
        $('#expand-button'+@graphModel.get("nodeHash")(d)).hide()

      @graphView.on "enter:node:rect:click", (d) =>
        @expandSelection(d)

      @graphView.on "enter:link:mouseover", (d) =>
        #console.log d
        if not @topBarCreate.buildingLink
          $('#toplink-instructions').replaceWith('<span id="toplink-instructions" style="color:black; font-size:20px">' + 'Click to select: <b>' + d.source.name+" - "+d.name+" - "+d.target.name+ '</b></span>')

      @graphView.on "enter:link:mouseout", (d) =>
        if not @topBarCreate.buildingLink
          $('#toplink-instructions').replaceWith('<span id="toplink-instructions" style="color:black; font-size:20px"></span>')

    expandSelection: (d) =>
      @dataProvider.getLinkedNodes [d], (nodes) =>
          _.each nodes, (node) =>
            @graphModel.putNode node if @dataProvider.nodeFilter node
