HttpUtils = require '../utils/http-utils'
ApiKitBase = require '../utils/base'

class MockPatchHandler extends HttpUtils
  resolve: (req, res, methodInfo) ->
    @negotiateContentType req, res, methodInfo
    @negotiateAcceptType req, res, methodInfo

class PatchHandler extends ApiKitBase
  constructor: (@apiPath, @context, @resources) ->

  resolve: (uriTemplate, handler) =>
    template = "#{@apiPath}#{uriTemplate}"

    @context.patch template, (req, res) =>
      methodInfo = @methodLookup @resources, 'patch', uriTemplate
      @negotiateContentType req, res, methodInfo
      @negotiateAcceptType req, res, methodInfo, handler

exports.MockHandler = MockPatchHandler
exports.Handler = PatchHandler
