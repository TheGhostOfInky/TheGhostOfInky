CSON = require 'cson'
fs = require 'fs'
l2 = CSON.requireCSONFile("langs\\langs_2.cson") 
l3 = CSON.requireCSONFile("langs\\langs_3.cson") 

createWidget = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + lang.lang + "-%23" + lang.color.substring(1) + "?style\=flat&logo=" + lang.logo + "&logoColor\=white)](" + lang.link + ") "

createWidgetname = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + lang.name + "-%23" + lang.color.substring(1) + "?style\=flat&logo=" + lang.logo + "&logoColor\=white)](" + lang.link + ") "

createWidgetnameB64 = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + lang.name + "-%23" + lang.color.substring(1) + "?style\=flat&logo=data:image/png;base64," + lang.b64 + ")](" + lang.link + ") "

createWidgetB64 = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + lang.lang + "-%23" + lang.color.substring(1) + "?style\=flat&logo=data:image/png;base64," + lang.b64 + ")](" + lang.link + ") "

renderList = (list) ->
    str = ""
    for lang in list
        if lang.name and lang.b64
            str += createWidgetnameB64 lang
        else if lang.name
            str += createWidgetname lang
        else if lang.logo
            str += createWidget lang
        else
            str += createWidgetB64 lang
    str

renderMd = (list2,list3) ->
    """\#\#\# Hi there 👋
    
    ![Metrics](https://github.com/TheGhostOfInky/TheGhostOfInky/blob/main/github-metrics.svg)

    | Langauges table| |
    |-|-|
    |Languages I'm good at:|None (I'm a noob :p)|
    |Languages I'm ok at:|#{list2}|
    |Languages I'm dipping my toes into:|#{list3}|

"""
writeFile = ->
    list2 = renderList l2
    list3 = renderList l3
    text = renderMd list2,list3
    fs.writeFile("README.md",text,(err)-> console.log err if err)

do writeFile