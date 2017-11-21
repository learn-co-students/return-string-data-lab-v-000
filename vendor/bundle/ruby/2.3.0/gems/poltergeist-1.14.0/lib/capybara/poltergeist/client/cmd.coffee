class Poltergeist.Cmd
  constructor: (@owner, @id, @name, @args)->
    @_response_sent = false
  sendResponse: (response) ->
    errors = @browser.currentPage.errors
    @browser.currentPage.clearErrors()

    if errors.length > 0 && @browser.js_errors
      @sendError(new Poltergeist.JavascriptError(errors))
    else
      @owner.sendResponse(@id, response) unless @_response_sent
      @_response_sent = true

  sendError: (errors) ->
    @owner.sendError(@id, errors) unless @_response_sent
    @_response_sent = true

  run: (@browser) ->
    try
      @browser.runCommand(this)
    catch error
      if error instanceof Poltergeist.Error
        @sendError(error)
      else
        @sendError(new Poltergeist.BrowserError(error.toString(), error.stack))

