db = require '../db'

module.exports =
  getUserApiToken: (uid, next) ->
    getUserApiToken(uid, next)
  getUserFieldValue: (uid, next) ->
    getUserFieldValue(uid, next)
  getUserData: (uid, next) ->
    getUserData(uid, next)
  setUserData: (uid, userData, next) ->
    setUserData(uid, userData, next)
  getUserApiToken: (uid, next) ->
    getUserApiToken(uid, next)
  getUserId: (uid, next) ->
    getUserId(uid, next)


getUserFieldValue = (uid, field, next) ->
  db.redis.get uid, (error, reply) ->
    if not error
      user = JSON.parse(reply)
      next(user[field])
    else
      next(false)


getUserData = (uid, next) ->
  db.redis.get uid, (error, reply) ->
    if not error
      next(JSON.parse(reply))
    else
      next(false)

setUserData = (uid, userData, next) ->
  db.redis.set uid, JSON.stringify(userData)
  next()


getUserApiToken = (uid, next) ->
  getUserFieldValue(uid, 'apiToken', next)


getUserId = (uid, next) ->
  getUserFieldValue(uid, 'id', next)