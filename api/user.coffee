config = require '../config'
auth = require '../lib/auth'
userTable = require '../models/user'

module.exports = (app) ->
  app.get '/user/friends', auth.tokenAuth, getFriends
  app.get '/user/:id', auth.tokenAuth, getById

getById = (req, res) ->
  userId = req.params.id

  userTable.getById userId, (user) =>
    if user
      res.header "Content-Type", "application/json"
      res.send(user)
    else
      res.status(404).send()

getFriends = (req, res) ->
  userId = res.locals.user.ioweyouId

  userTable.getFriends userId, (friends) =>
    if friends
      res.header "Content-Type", "application/json"
      res.send(friends)
    else
      res.status(404).send()