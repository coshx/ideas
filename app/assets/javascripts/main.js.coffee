window.Ideas ||= {}
Ideas.App = angular.module('Ideas', ['ngResource', 'rails', 'ui.keypress'])
App = Ideas.App
Ideas.index = 0

#$(document).on 'page:load', ->
  #angular.bootstrap($("html"), ['Ideas'])
  #pusher.unsubscribe("ideas_channel");

$ ->
  angular.bootstrap($("html"), ['Ideas'])
  #$(document).trigger "page:load"

window.getAdmin = (admin) ->
  Ideas.currentAdmin = admin

App.factory "Comment", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/comments"
    name: "comment"
]

App.factory "Idea", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/ideas"
    name: "idea"
]

App.filter "timeFormat", ->
  (time) ->
    if time?
      moment(time, "YYYY-MM-DDTHH:mm:ss Z").calendar()

App.controller "IdeasListCtrl", ["$scope", "$rootScope", "$http", "Idea", "Comment", ($scope, $rootScope, $http, Idea, Comment) ->
  $scope.newIdea = {}
  $scope.newIdea.tags = []
  channel = pusher.subscribe('ideas_channel')
  
  channel.bind 'idea_changed', (object) ->
    if Ideas.unsubscribeIdea == object.id
      Ideas.unsubscribeIdea = {}
    else
      if object.data.admin.id != Ideas.currentAdmin.id
        if $scope.ideas      
          idea = _.findWhere($scope.ideas, {id: object.id})      
          if idea?
            index = $scope.ideas.indexOf idea
            $scope.$apply ->
              $scope.ideas[index] = object.data
          if !idea?
            $scope.$apply ->
              $scope.ideas.push(object.data)
        else if $scope.idea      
          idea = $scope.idea if $scope.idea.id == object.id
        $scope.$apply ->
          $scope.idea = object.data
          idea = object.data 
      
  $scope.vote = (idea) ->
    Ideas.unsubscribeIdea = idea.id
    if idea.voted == true
      idea.voted = false
      idea.upvotes = idea.upvotes - 1
    else
      idea.voted = true
      idea.upvotes = idea.upvotes + 1
    if Ideas.currentAdmin
      data = {id: idea.id}
      $http
        method: 'POST'
        url: "/api/votes/"
        data: data
    else
      #Turbolinks.visit("/login-first")
  $scope.changeStatus = (idea, status) ->
    ideaId = idea.id
    statusId = status.id
    idea.status = status
    $scope.showStatusesIdea = 0
    $http
      method: 'POST'
      url: "/api/ideas/#{ideaId}/change_status/#{statusId}"

  $scope.showStatusesFor = (idea) ->
    if $scope.showStatusesIdea == idea.id
      $scope.showStatusesIdea = 0
    else
      $scope.showStatusesIdea = idea.id

  $scope.createIdea = (idea) ->
    idea.upvotes = 0
    idea.voted = false
    idea.admin = Ideas.currentAdmin
    idea.tags
    $scope.ideas.unshift(idea)
    Ideas.globalScope.showNewIdea = false
    $scope.newIdea = {}
    new Idea(idea).create().then (i) ->
      #$scope.ideas.unshift(idea)
      #Ideas.globalScope.showNewIdea = false
      $scope.newIdea = {}

  $scope.comment = (idea, commentText) ->
    Ideas.unsubscribeIdea = idea
    comment =
      text: commentText
      idea_id: idea.id
    new Comment(comment).create().then (c) ->
      comment.id = c.id
      comment.created_at = c.createdAt
      $scope.commentText = ""
    comment.admin = Ideas.currentAdmin
    comment.admin_id = Ideas.currentAdmin.id
    now = new Date().getTime()
    #comment.created_at = moment(now).format("YYYY-MM-DDTHH:mm:ss Z")
    idea.comments.unshift(comment)

  $scope.removeComment = (idea, comment) ->
    Ideas.unsubscribeIdea = idea  
    new Comment(comment).delete().then ->
     idea.comments.splice(idea.comments.indexOf(comment), 1)
  $scope.getTags = (str, tags) ->
    console.log "TRIGGER!"
    if str 
      if str.lastIndexOf("#") < str.lastIndexOf(" ") && str.lastIndexOf("#") > 0
        tagTitle = str.substring(str.lastIndexOf("#")+1,str.lastIndexOf(" "))
        tag = {title: tagTitle}
        $scope.newIdea.title = str.replace("##{tagTitle} ", "") 
        console.log str
        if tags.indexOf(tag) < 0 
          tags.push(tag)
  $scope.removeTag = (tags, tag) ->
    tags.splice(tags.indexOf(tag), 1)
]
App.controller "GlobalCtrl", ["$scope", "$rootScope", "$http", "Idea", "Comment", ($scope, $rootScope, $http, Idea, Comment) ->
  Ideas.globalScope = $scope
  $scope.currentAdmin = Ideas.currentAdmin

  $scope.toggleNewIdea = ->
    if window.location.pathname == "/"
      $scope.showNewIdea=!!!$scope.showNewIdea
      console.log "just open", $scope.showNewIdea
      if $scope.showNewIdea
        setTimeout ->
          $(".new-idea input").focus()
        , 100
    else
      Turbolinks.visit("/new")
      setTimeout ->
        $(".new-idea input").focus()
      , 300

]