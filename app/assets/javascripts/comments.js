//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
commentsApp = angular.module('commentsApp', []);

commentsApp.factory('CommentsFactory', function ($http) {
    return{
        getComments:function (postid, callback) {
            $http({method:'GET', url:'/posts/' + postid + '/comments'}).
                success(callback).
                error(function (data, status, headers, config) {
                });
        },
        addComment:function (postid, params, callback) {
            $http({method:'post', url:'/posts/' + postid + '/comments', data:  params }).
                success(callback).
                error(function (data, status, headers, config) {
                    callback();
                });

        }
    }
});

commentsApp.controller('CommentsController', function($scope, CommentsFactory) {
    $scope.newComment = {commenter:"", text:""};
    $scope.comments = [
        {commenter:"itay", body:"greate post"},
        {commenter:"koby", body:"lousy post"}
    ];
    var postid = $("#postid").text().trim();
    CommentsFactory.getComments(postid, function(data){
        $scope.comments = data;
    });

    $scope.addComment = function () {
        $("#ajaxloader").fadeIn();
        $("#undisplaybleDiv").fadeIn();
        var postid = $("#postid").text().trim();
        CommentsFactory.addComment(postid, {commenter: $scope.newComment.commenter,
            comment: $scope.newComment.text}, function(){
            $("#ajaxloader").fadeOut();
            $("#undisplaybleDiv").fadeOut();
            $scope.comments.push({commenter:$scope.newComment.commenter, body:$scope.newComment.text});
            $scope.newComment.text = '';
            $scope.newComment.commenter = '';

        });

    };


});