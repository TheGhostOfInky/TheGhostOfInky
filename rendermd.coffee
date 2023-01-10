CSON = require 'cson'
fs = require 'fs'
l2 = CSON.requireCSONFile "langs/langs_2.cson"
l3 = CSON.requireCSONFile "langs/langs_3.cson"

createWidget = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + encodeURIComponent(lang.lang) + "-" + encodeURIComponent(lang.color) + "?style\=flat&logo=" + \
    (if lang.logo then lang.logo + "&logoColor\=white" else "data:image/svg%2bxml;base64," + Buffer.from(lang.svg).toString("base64")) + ")](" + lang.link + ") "

renderList = (list) ->
    str = ""
    str += createWidget lang for lang in list
    str

renderMd = (list2,list3,list4) ->
    """\#\#\# Hi there 👋
    
    ![Metrics](https://github.com/TheGhostOfInky/TheGhostOfInky/blob/main/github-metrics.svg)

    | Langauges table| |
    |-|-|
    |Languages I'm good at:|None (I'm a noob :p)|
    |Languages I'm ok at:|#{renderList list2}|
    |Languages I'm dipping my toes into:|#{renderList list3}|
    """
    
writeFile = ->
    fs.writeFile("README.md",renderMd(l2,l3),(err)-> console.log err if err)

do writeFile