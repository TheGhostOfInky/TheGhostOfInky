CSON = require 'cson'
fs = require 'fs'
l1 = CSON.requireCSONFile "langs/langs_1.cson"
l2 = CSON.requireCSONFile "langs/langs_2.cson"

createWidget = (lang) ->
    "[![" + lang.lang + "](https://img.shields.io/badge/" + encodeURIComponent(lang.lang) + \
    "-" + encodeURIComponent(lang.color) + "?style=flat&logo=" + \
    (if lang.logo then lang.logo + "&logoColor=white" else "data:image/svg%2bxml;base64," + \
     Buffer.from(lang.svg).toString("base64")) + ")](" + lang.link + ")"

renderList = (list) ->
    list.map(createWidget).join(" ")

renderMd = (list1,list2) ->
    """\#\#\# Hi there 👋
    
    ![Metrics](https://github.com/TheGhostOfInky/TheGhostOfInky/blob/main/github-metrics.svg)

    | Langauge experience table| |
    |-|-|
    |Languages I'm comfortable with:|#{renderList list1}|
    |Languages I'm dipping my toes into:|#{renderList list2}|
    """
    
writeFile = ->
    fs.writeFileSync("./README.md",renderMd(l1,l2),{encoding: "utf-8"})

do writeFile