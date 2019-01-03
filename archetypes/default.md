---
title: "{{ replace .Name "-" " " | title }}"
author: rogier
type: post
date: {{ .Date }}
url: /weblog/2019/01/01/{{ replace .Name "-" " " | title }}
commentFolder: {{ replace .Name "-" " " | title }}
categories:
- Wereld trip 2019
tags:
- Nieuw Zeeland
resources:
- src: x.jpg
  title: Mr X
  params:
    banner: true
    imagegallery: false
- src: y.jpg
  title: Mr Y
  params:
    banner: false
    imagegallery: true
draft: true
---

