import core, types, utils, strutils, strformat, json, chronicles

proc storeBookmark*(url: string, name: string) =
  let payload = %* [{"url": url, "name": name}]
  #TODO use the response to get the URL
  let resp = callPrivateRPC("browsers_storeBookmark", payload)
  debug "Response", resp

proc updateBookmark*(ogUrl: string, url: string, name: string) =
  let payload = %* [ogUrl, {"url": url, "name": name}]
  discard callPrivateRPC("browsers_updateBookmark", payload)

proc getBookmarks*(): string =
  let payload = %* []
  result = callPrivateRPC("browsers_getBookmarks", payload)

proc deleteBookmark*(url: string) =
  let payload = %* [url]
  discard callPrivateRPC("browsers_deleteBookmark", payload)
