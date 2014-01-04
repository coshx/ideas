window.Ideas ||= {}
Ideas.App = angular.module('Ideas', ['ngResource', 'rails'])
App = Ideas.App

$(document).on 'page:load', ->
  angular.bootstrap($("html"), ['Ideas'])

$ ->
  $(document).trigger "page:load"

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
  
  $scope.vote = (idea) ->
    if Ideas.currentAdmin
      data = {id: idea.id}
      $http
        method: 'POST'
        url: "/api/votes/"
        data: data
      .success( (result) ->
        if result.destroyed
          idea.upvotes = idea.upvotes - 1
          idea.voted = false
        else
          idea.upvotes = idea.upvotes + 1
          idea.voted = true
      )
    else
      #Turbolinks.visit("/login-first")

  $scope.createIdea = (idea) ->
    new Idea(idea).create().then (idea) ->
      $scope.ideas.unshift(idea)
      Ideas.globalScope.showNewIdea = false
      $scope.newIdea = {}

  $scope.comment = (idea, commentText) ->
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
    new Comment(comment).delete().then ->
     idea.comments.splice(idea.comments.indexOf(comment), 1)

]

App.controller "GlobalCtrl", ["$scope", "$rootScope", "$http", "Idea", "Comment", ($scope, $rootScope, $http, Idea, Comment) ->
  Ideas.globalScope = $scope
  $scope.currentAdmin = Ideas.currentAdmin

  $scope.toggleNewIdea = ->
    $scope.showNewIdea=!!!$scope.showNewIdea
    if $scope.showNewIdea
      setTimeout ->
        $(".new-idea input").focus()
      , 100
]