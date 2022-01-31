CSON = require 'cson'
fs = require 'fs'
l2 = CSON.requireCSONFile "langs/langs_2.cson"
l3 = CSON.requireCSONFile "langs/langs_3.cson"
l4 = CSON.requireCSONFile "langs/langs_4.cson" 

createWidget = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + encodeURIComponent(lang.lang) + "-" + encodeURIComponent(lang.color) + "?style\=flat&logo=" + \
    (if lang.logo then lang.logo + "&logoColor\=white" else "data:image/png;base64," + lang.b64) + ")](" + lang.link + ") "

renderList = (list) ->
    str = ""
    str += createWidget lang for lang in list
    str

renderMd = (list2,list3,list4) ->
    """\#\#\# Hi there 👋
    
    ![Metrics](https://github.com/TheGhostOfInky/TheGhostOfInky/blob/main/github-metrics.svg)

    | Langauges table| |
    |-|-|
    |Programming Languages I'm good at:|None (I'm a noob :p)|
    |Programming Languages I'm ok at:|#{renderList list2}|
    |Programming Languages I'm dipping my toes into:|#{renderList list3}|
    |Data/Markup/Stylesheet Languages I'm familiar with:|#{renderList list4}|
    """
    
writeFile = ->
    fs.writeFile("README.md",renderMd(l2,l3,l4),(err)-> console.log err if err)

do writeFile