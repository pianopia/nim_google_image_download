import system, os, json
import docopt

# Help Document
var doc = """
Usage:
  gid <action> [[<content>],[<tag>]] [-t | --tag] [-k <keyword>| --keyword <keyword>]

Options:
  <action>    ToDo Action
  <content>   ToDo Content
  <tag>       ToDo Task Tag
  -t --tag    ToDo Tag Option
"""

let url_domain = "https://www.google.com/search?q="
let url_option = "&espv=2&biw=1366&bih=667&site=webhp&source=lnms&tbm=isch&sa=X&ei=XosDVaCXD8TasATItgE&ved=0CAcQ_AUoAg"


when isMainModule:
  #Format the object in readable format
  proc format_object(object: seq[]):
    formatted_object = {}
    formatted_object['image_format'] = object['ity']
    formatted_object['image_height'] = object['oh']
    formatted_object['image_width'] = object['ow']
    formatted_object['image_link'] = object['ou']
    formatted_object['image_description'] = object['pt']
    formatted_object['image_host'] = object['rh']
    formatted_object['image_source'] = object['ru']
    formatted_object['image_thumbnail_url'] = object['tu']
    return formatted_object

  proc main() = 
    let
      args = docopt(doc, version = "0.0.1")
      action: string = $args["<action>"]
      content: string = $args["content"]
      tag: string = $args["<tag>"]
      isTag: bool = if args["--tag"]: true else: false
